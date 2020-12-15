# How do I allocate memory to work as swap space in an Amazon EC2 instance by using a swap file?

https://aws.amazon.com/premiumsupport/knowledge-center/ec2-memory-swap-file/

*Last updated: 2020-01-15*

I want to allocate memory to work as a swap file in an Amazon Elastic Compute Cloud (Amazon EC2) instance. How do I do that?

## Short Description

When physical RAM is already in use, Amazon EC2 instances use swap space as a short-term replacement for physical RAM.

Contents of RAM that aren't in active use or that aren't needed as urgently as other data or instructions can be temporarily paged to a swap file. This frees up RAM for more immediate use.

You can also create swap space on a partition. For more information, see [How do I allocate memory to work as swap space on an Amazon EC2 instance using a partition on my hard drive?](https://aws.amazon.com/premiumsupport/knowledge-center/ec2-memory-partition-hard-drive/)

**Note:** It's a best practice to create swap space only on ephemeral storage instance store volumes.

## Resolution

**Calculate the swap space size**

As a general rule, calculate swap space according to the following:

| **Amount of physical RAM**                | **Recommended swap space**                     |
| ----------------------------------------- | ---------------------------------------------- |
| 2 GB of RAM or less                       | 2x the amount of RAM but never less than 32 MB |
| More than 2 GB of RAM but less than 32 GB | 4 GB + (RAM – 2 GB)                            |
| 32 GB of RAM or more                      | 1x the amount of RAM                           |

**Note:** Swap space should never be less than 32 MB.

**Create a swap file**

\1.  Use the **dd** command to create a swap file on the root file system. In the command, **bs** is the block size and **count** is the number of blocks. The size of the swap file is the block size option multiplied by the count option in the **dd** command. Adjust these values to determine the desired swap file size.

The block size you specify should be less than the available memory on the instance or you receive a "memory exhausted" error.

In this example **dd** command, the swap file is 4 GB (128 MB x 32):  

```plainText
$ sudo dd if=/dev/zero of=/swapfile bs=128M count=32
```

\2.  Update the read and write permissions for the swap file:

```plainText
$ sudo chmod 600 /swapfile
```

\3.  Set up a Linux swap area:

```plainText
$ sudo mkswap /swapfile
```

\4.  Make the swap file available for immediate use by adding the swap file to swap space:  

```plainText
$ sudo swapon /swapfile
```

\5.  Verify that the procedure was successful:

```plainText
$ sudo swapon -s
```

\6.  Enable the swap file at boot time by editing the **/etc/fstab** file.

Open the file in the editor:

```plainText
$ sudo vi /etc/fstab
```

Add the following new line at the end of the file, save the file, and then exit:

```plainText
/swapfile swap swap defaults 0 0
```