Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4366F25CC50;
	Tue, 24 Jun 2025 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758665; cv=none; b=ucPEunZ2vQtgjxtmpCD3rGUV8tSMVpLA5fwN93g/HZF00p/rXsi5FgwmOO9ZtKm+u6bQTOPDLpAsJuGFQzaG/aDSX5LjkLqzDNN19rIM1EkRujvpJNprOZwlWwvopOdQ+IMu9CqMVpYuZwAqw4C1D2ON42bWPnXcwisUfO7xqT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758665; c=relaxed/simple;
	bh=1b+26mTU5xl+064eAkD56PwvuJZxQrAwnIdxvfU7ddc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qu8Mpriuy/3GXpvsCHJPQPN48vNHXxOyI2cOyKrnXg6OglufotH3lYYwccreBxrABOJzAXrpJjwDG56XOTobVnyL0d9DO208Q7TqPMgsfqnkNaNRcXgKkvXOPL5yannjyOnsasg2N2kJJYaPcWe0RDXEvW0IQ+s8Tju8rrvZZr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWHuXmwf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWHuXmwf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD52C4CEEE;
	Tue, 24 Jun 2025 09:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750758664;
	bh=1b+26mTU5xl+064eAkD56PwvuJZxQrAwnIdxvfU7ddc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SWHuXmwfC/tw2R1495jtLqMvq8YJ9GTw7zOkIQZCOa86NbuHwxOJCcIjnsfrhBJ5a
	 PVGHBAzEJQ89cMba0Y3aUUkt4r9FI2QTZQ8KgMGFWBnBO1ICRUrKsU7M1Gad3KHm3C
	 G/UdnyahVNm+gYz6MM8wJCVTCLrlXmS1p9GYTp6cYkiVAmx/xbvKe6BVoz+lacfhpQ
	 Y2yqGiirGWNumulQQzR9NiQa8mkzLQ7tb50EOKKbkEtUmqjlCIJToDHM6Hwe3HxClQ
	 HXkKabZfiAmCKEOLYMITtlMQA6QOubivGzbgqPekvX34zQQN4NptS86SxaO66/pKDK
	 eP8ducGtQPHHg==
Date: Tue, 24 Jun 2025 11:50:49 +0200
From: Christian Brauner <brauner@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, rientjes@google.com, 
	corbet@lwn.net, rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, 
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, bhelgaas@google.com, 
	wagi@kernel.org, djeffery@redhat.com, stuart.w.hayes@gmail.com, ptyadav@amazon.de
Subject: Re: [RFC v2 10/16] luo: luo_ioctl: add ioctl interface
Message-ID: <20250624-akzeptabel-angreifbar-9095f4717ca4@brauner>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-11-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250515182322.117840-11-pasha.tatashin@soleen.com>

On Thu, May 15, 2025 at 06:23:14PM +0000, Pasha Tatashin wrote:
> Introduce the user-space interface for the Live Update Orchestrator
> via ioctl commands, enabling external control over the live update
> process and management of preserved resources.
> 
> Create a misc character device at /dev/liveupdate. Access
> to this device requires the CAP_SYS_ADMIN capability.
> 
> A new UAPI header, <uapi/linux/liveupdate.h>, defines the necessary
> structures. The magic number is registered in
> Documentation/userspace-api/ioctl/ioctl-number.rst.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  .../userspace-api/ioctl/ioctl-number.rst      |   1 +
>  drivers/misc/liveupdate/Makefile              |   1 +
>  drivers/misc/liveupdate/luo_ioctl.c           | 199 ++++++++++++
>  include/linux/liveupdate.h                    |  34 +-
>  include/uapi/linux/liveupdate.h               | 300 ++++++++++++++++++
>  5 files changed, 502 insertions(+), 33 deletions(-)
>  create mode 100644 drivers/misc/liveupdate/luo_ioctl.c
>  create mode 100644 include/uapi/linux/liveupdate.h
> 
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index 7a1409ecc238..279c124048f2 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -375,6 +375,7 @@ Code  Seq#    Include File                                           Comments
>  0xB8  01-02  uapi/misc/mrvl_cn10k_dpi.h                              Marvell CN10K DPI driver
>  0xB8  all    uapi/linux/mshv.h                                       Microsoft Hyper-V /dev/mshv driver
>                                                                       <mailto:linux-hyperv@vger.kernel.org>
> +0xBA  all    uapi/linux/liveupdate.h                                 <mailto:Pasha Tatashin <pasha.tatashin@soleen.com>
>  0xC0  00-0F  linux/usb/iowarrior.h
>  0xCA  00-0F  uapi/misc/cxl.h                                         Dead since 6.15
>  0xCA  10-2F  uapi/misc/ocxl.h
> diff --git a/drivers/misc/liveupdate/Makefile b/drivers/misc/liveupdate/Makefile
> index b4cdd162574f..7a0cd08919c9 100644
> --- a/drivers/misc/liveupdate/Makefile
> +++ b/drivers/misc/liveupdate/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +obj-y					+= luo_ioctl.o
>  obj-y					+= luo_core.o
>  obj-y					+= luo_files.o
>  obj-y					+= luo_subsystems.o
> diff --git a/drivers/misc/liveupdate/luo_ioctl.c b/drivers/misc/liveupdate/luo_ioctl.c
> new file mode 100644
> index 000000000000..76c687ff650b
> --- /dev/null
> +++ b/drivers/misc/liveupdate/luo_ioctl.c
> @@ -0,0 +1,199 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright (c) 2025, Google LLC.
> + * Pasha Tatashin <pasha.tatashin@soleen.com>
> + */
> +
> +/**
> + * DOC: LUO ioctl Interface
> + *
> + * The IOCTL user-space control interface for the LUO subsystem.
> + * It registers a misc character device, typically found at ``/dev/liveupdate``,
> + * which allows privileged userspace applications (requiring %CAP_SYS_ADMIN) to
> + * manage and monitor the LUO state machine and associated resources like
> + * preservable file descriptors.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/errno.h>
> +#include <linux/file.h>
> +#include <linux/fs.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/uaccess.h>
> +#include <uapi/linux/liveupdate.h>
> +#include "luo_internal.h"
> +
> +static int luo_ioctl_fd_preserve(struct liveupdate_fd *luo_fd)
> +{
> +	struct file *file;
> +	int ret;
> +
> +	file = fget(luo_fd->fd);
> +	if (!file) {
> +		pr_err("Bad file descriptor\n");
> +		return -EBADF;
> +	}
> +
> +	ret = luo_register_file(&luo_fd->token, file);
> +	if (ret)
> +		fput(file);
> +
> +	return ret;
> +}
> +
> +static int luo_ioctl_fd_unpreserve(u64 token)
> +{
> +	return luo_unregister_file(token);
> +}
> +
> +static int luo_ioctl_fd_restore(struct liveupdate_fd *luo_fd)
> +{
> +	struct file *file;
> +	int ret;
> +	int fd;
> +
> +	fd = get_unused_fd_flags(O_CLOEXEC);
> +	if (fd < 0) {
> +		pr_err("Failed to allocate new fd: %d\n", fd);
> +		return fd;
> +	}
> +
> +	ret = luo_retrieve_file(luo_fd->token, &file);
> +	if (ret < 0) {
> +		put_unused_fd(fd);
> +
> +		return ret;
> +	}
> +
> +	fd_install(fd, file);
> +	luo_fd->fd = fd;
> +
> +	return 0;
> +}
> +
> +static int luo_open(struct inode *inodep, struct file *filep)
> +{
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EACCES;
> +
> +	if (filep->f_flags & O_EXCL)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static long luo_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
> +{
> +	void __user *argp = (void __user *)arg;
> +	struct liveupdate_fd luo_fd;
> +	enum liveupdate_state state;
> +	int ret = 0;
> +	u64 token;
> +
> +	if (_IOC_TYPE(cmd) != LIVEUPDATE_IOCTL_TYPE)
> +		return -ENOTTY;
> +
> +	switch (cmd) {
> +	case LIVEUPDATE_IOCTL_GET_STATE:
> +		state = READ_ONCE(luo_state);
> +		if (copy_to_user(argp, &state, sizeof(luo_state)))
> +			ret = -EFAULT;
> +		break;
> +
> +	case LIVEUPDATE_IOCTL_EVENT_PREPARE:
> +		ret = luo_prepare();
> +		break;
> +
> +	case LIVEUPDATE_IOCTL_EVENT_FREEZE:
> +		ret = luo_freeze();
> +		break;
> +
> +	case LIVEUPDATE_IOCTL_EVENT_FINISH:
> +		ret = luo_finish();
> +		break;
> +
> +	case LIVEUPDATE_IOCTL_EVENT_CANCEL:
> +		ret = luo_cancel();
> +		break;
> +
> +	case LIVEUPDATE_IOCTL_FD_PRESERVE:
> +		if (copy_from_user(&luo_fd, argp, sizeof(luo_fd))) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		ret = luo_ioctl_fd_preserve(&luo_fd);
> +		if (!ret && copy_to_user(argp, &luo_fd, sizeof(luo_fd)))
> +			ret = -EFAULT;
> +		break;
> +
> +	case LIVEUPDATE_IOCTL_FD_UNPRESERVE:
> +		if (copy_from_user(&token, argp, sizeof(u64))) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		ret = luo_ioctl_fd_unpreserve(token);
> +		break;
> +
> +	case LIVEUPDATE_IOCTL_FD_RESTORE:
> +		if (copy_from_user(&luo_fd, argp, sizeof(luo_fd))) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		ret = luo_ioctl_fd_restore(&luo_fd);
> +		if (!ret && copy_to_user(argp, &luo_fd, sizeof(luo_fd)))
> +			ret = -EFAULT;
> +		break;
> +
> +	default:
> +		pr_warn("ioctl: unknown command nr: 0x%x\n", _IOC_NR(cmd));
> +		ret = -ENOTTY;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct file_operations fops = {
> +	.owner          = THIS_MODULE,
> +	.open           = luo_open,
> +	.unlocked_ioctl = luo_ioctl,
> +};
> +
> +static struct miscdevice liveupdate_miscdev = {
> +	.minor = MISC_DYNAMIC_MINOR,
> +	.name  = "liveupdate",
> +	.fops  = &fops,
> +};

I'm not sure why people are so in love with character device based apis.
It's terrible. It glues everything to devtmpfs which isn't namespacable
in any way. It's terrible to delegate and extremely restrictive in terms
of extensiblity if you need additional device entries (aka the loop
driver folly).

One stupid question: I probably have asked this before and just swapped
out that I a) asked this already and b) received an explanation. But why
isn't this a singleton simple in-memory filesystem with a flat
hierarchy?

mount -t kexecfs kexecfs /kexecfs

So userspace mounts kexecfs (or the kernel does it automagically) and
then to add fds into that thing you do the following:

linkat(fd_my_anon_inode_memfd, "", -EBADF, "kexecfs/my_serialized_memfd", AT_EMPTY_PATH)

which will serialize the fd_my_anon_inode_memfd. You can also do this
with ioctls on the kexecfs filesystem of course.

The advantages are:

* implement your own lookup permission
* you're able to use ls -al /kexecfs to see all the things that you
  serialized in there trivially
* you're free to turn this into a multi-instance thing so that you can
  serialize things per-service for example
* it's naturally hierarchical integrating with systemd a lot more easily
* profit from fs apis like unlink() and so on to remove entries getting
  rid of at least complex ioctl()ing for the basic use-cases

> +
> +static int __init liveupdate_init(void)
> +{
> +	int err;
> +
> +	err = misc_register(&liveupdate_miscdev);
> +	if (err < 0) {
> +		pr_err("Failed to register misc device '%s': %d\n",
> +		       liveupdate_miscdev.name, err);
> +	}
> +
> +	return err;
> +}
> +module_init(liveupdate_init);
> +
> +static void __exit liveupdate_exit(void)
> +{
> +	misc_deregister(&liveupdate_miscdev);
> +}
> +module_exit(liveupdate_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Pasha Tatashin");
> +MODULE_DESCRIPTION("Live Update Orchestrator");
> +MODULE_VERSION("0.1");
> diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
> index 7afe0aac5ce4..ff4f2ab5c673 100644
> --- a/include/linux/liveupdate.h
> +++ b/include/linux/liveupdate.h
> @@ -10,6 +10,7 @@
>  #include <linux/bug.h>
>  #include <linux/types.h>
>  #include <linux/list.h>
> +#include <uapi/linux/liveupdate.h>
>  
>  /**
>   * enum liveupdate_event - Events that trigger live update callbacks.
> @@ -53,39 +54,6 @@ enum liveupdate_event {
>  	LIVEUPDATE_CANCEL,
>  };
>  
> -/**
> - * enum liveupdate_state - Defines the possible states of the live update
> - * orchestrator.
> - * @LIVEUPDATE_STATE_NORMAL:         Default state, no live update in progress.
> - * @LIVEUPDATE_STATE_PREPARED:       Live update is prepared for reboot; the
> - *                                   LIVEUPDATE_PREPARE callbacks have completed
> - *                                   successfully.
> - *                                   Devices might operate in a limited state
> - *                                   for example the participating devices might
> - *                                   not be allowed to unbind, and also the
> - *                                   setting up of new DMA mappings might be
> - *                                   disabled in this state.
> - * @LIVEUPDATE_STATE_FROZEN:         The final reboot event
> - *                                   (%LIVEUPDATE_FREEZE) has been sent, and the
> - *                                   system is performing its final state saving
> - *                                   within the "blackout window". User
> - *                                   workloads must be suspended. The actual
> - *                                   reboot (kexec) into the next kernel is
> - *                                   imminent.
> - * @LIVEUPDATE_STATE_UPDATED:        The system has rebooted into the next
> - *                                   kernel via live update the system is now
> - *                                   running the next kernel, awaiting the
> - *                                   finish event.
> - *
> - * These states track the progress and outcome of a live update operation.
> - */
> -enum liveupdate_state  {
> -	LIVEUPDATE_STATE_NORMAL = 0,
> -	LIVEUPDATE_STATE_PREPARED = 1,
> -	LIVEUPDATE_STATE_FROZEN = 2,
> -	LIVEUPDATE_STATE_UPDATED = 3,
> -};
> -
>  /* Forward declaration needed if definition isn't included */
>  struct file;
>  
> diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
> new file mode 100644
> index 000000000000..c673d08a29ea
> --- /dev/null
> +++ b/include/uapi/linux/liveupdate.h
> @@ -0,0 +1,300 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +
> +/*
> + * Userspace interface for /dev/liveupdate
> + * Live Update Orchestrator
> + *
> + * Copyright (c) 2025, Google LLC.
> + * Pasha Tatashin <pasha.tatashin@soleen.com>
> + */
> +
> +#ifndef _UAPI_LIVEUPDATE_H
> +#define _UAPI_LIVEUPDATE_H
> +
> +#include <linux/ioctl.h>
> +#include <linux/types.h>
> +
> +/**
> + * enum liveupdate_state - Defines the possible states of the live update
> + * orchestrator.
> + * @LIVEUPDATE_STATE_NORMAL:         Default state, no live update in progress.
> + * @LIVEUPDATE_STATE_PREPARED:       Live update is prepared for reboot; the
> + *                                   LIVEUPDATE_PREPARE callbacks have completed
> + *                                   successfully.
> + *                                   Devices might operate in a limited state
> + *                                   for example the participating devices might
> + *                                   not be allowed to unbind, and also the
> + *                                   setting up of new DMA mappings might be
> + *                                   disabled in this state.
> + * @LIVEUPDATE_STATE_FROZEN:         The final reboot event
> + *                                   (%LIVEUPDATE_FREEZE) has been sent, and the
> + *                                   system is performing its final state saving
> + *                                   within the "blackout window". User
> + *                                   workloads must be suspended. The actual
> + *                                   reboot (kexec) into the next kernel is
> + *                                   imminent.
> + * @LIVEUPDATE_STATE_UPDATED:        The system has rebooted into the next
> + *                                   kernel via live update the system is now
> + *                                   running the next kernel, awaiting the
> + *                                   finish event.
> + *
> + * These states track the progress and outcome of a live update operation.
> + */
> +enum liveupdate_state  {
> +	LIVEUPDATE_STATE_NORMAL = 0,
> +	LIVEUPDATE_STATE_PREPARED = 1,
> +	LIVEUPDATE_STATE_FROZEN = 2,
> +	LIVEUPDATE_STATE_UPDATED = 3,
> +};
> +
> +/**
> + * struct liveupdate_fd - Holds parameters for preserving and restoring file
> + * descriptors across live update.
> + * @fd:    Input for %LIVEUPDATE_IOCTL_FD_PRESERVE: The user-space file
> + *         descriptor to be preserved.
> + *         Output for %LIVEUPDATE_IOCTL_FD_RESTORE: The new file descriptor
> + *         representing the fully restored kernel resource.
> + * @flags: Unused, reserved for future expansion, must be set to 0.
> + * @token: Output for %LIVEUPDATE_IOCTL_FD_PRESERVE: An opaque, unique token
> + *         generated by the kernel representing the successfully preserved
> + *         resource state.
> + *         Input for %LIVEUPDATE_IOCTL_FD_RESTORE: The token previously
> + *         returned by the preserve ioctl for the resource to be restored.
> + *
> + * This structure is used as the argument for the %LIVEUPDATE_IOCTL_FD_PRESERVE
> + * and %LIVEUPDATE_IOCTL_FD_RESTORE ioctls. These ioctls allow specific types
> + * of file descriptors (for example memfd, kvm, iommufd, and VFIO) to have their
> + * underlying kernel state preserved across a live update cycle.
> + *
> + * To preserve an FD, user space passes this struct to
> + * %LIVEUPDATE_IOCTL_FD_PRESERVE with the @fd field set. On success, the
> + * kernel populates the @token field.
> + *
> + * After the live update transition, user space passes the struct populated with
> + * the *same* @token to %LIVEUPDATE_IOCTL_FD_RESTORE. The kernel uses the @token
> + * to find the preserved state and, on success, populates the @fd field with a
> + * new file descriptor referring to the fully restored resource.
> + */
> +struct liveupdate_fd {
> +	int		fd;
> +	__u32		flags;
> +	__u64		token;
> +};
> +
> +/* The ioctl type, documented in ioctl-number.rst */
> +#define LIVEUPDATE_IOCTL_TYPE		0xBA
> +
> +/**
> + * LIVEUPDATE_IOCTL_FD_PRESERVE - Validate and initiate preservation for a file
> + * descriptor.
> + *
> + * Argument: Pointer to &struct liveupdate_fd.
> + *
> + * User sets the @fd field identifying the file descriptor to preserve
> + * (e.g., memfd, kvm, iommufd, VFIO). The kernel validates if this FD type
> + * and its dependencies are supported for preservation. If validation passes,
> + * the kernel marks the FD internally and *initiates the process* of preparing
> + * its state for saving. The actual snapshotting of the state typically occurs
> + * during the subsequent %LIVEUPDATE_IOCTL_EVENT_PREPARE execution phase, though
> + * some finalization might occur during %LIVEUPDATE_IOCTL_EVENT_FREEZE.
> + * On successful validation and initiation, the kernel populates the @token
> + * field with an opaque identifier representing the resource being preserved.
> + * This token confirms the FD is targeted for preservation and is required for
> + * the subsequent %LIVEUPDATE_IOCTL_FD_RESTORE call after the live update. This
> + * is an I/O read/write operation.
> + *
> + * Return: 0 on success (validation passed, preservation initiated), negative
> + * error code on failure (e.g., unsupported FD type, dependency issue,
> + * validation failed).
> + */
> +#define LIVEUPDATE_IOCTL_FD_PRESERVE					\
> +	_IOWR(LIVEUPDATE_IOCTL_TYPE, 0x00, struct liveupdate_fd)
> +
> +/**
> + * LIVEUPDATE_IOCTL_FD_UNPRESERVE - Remove a file descriptor from the
> + * preservation list.
> + *
> + * Argument: Pointer to __u64 token.
> + *
> + * Allows user space to explicitly remove a file descriptor from the set of
> + * items marked as potentially preservable. User space provides a pointer to the
> + * __u64 @token that was previously returned by a successful
> + * %LIVEUPDATE_IOCTL_FD_PRESERVE call (potentially from a prior, possibly
> + * cancelled, live update attempt). The kernel reads the token value from the
> + * provided user-space address.
> + *
> + * On success, the kernel removes the corresponding entry (identified by the
> + * token value read from the user pointer) from its internal preservation list.
> + * The provided @token (representing the now-removed entry) becomes invalid
> + * after this call.
> + *
> + * This operation can only be called when the live update orchestrator is in the
> + *  %LIVEUPDATE_STATE_NORMAL state.**
> + *
> + * This is an I/O write operation (_IOW), signifying the kernel reads data (the
> + * token) from the user-provided pointer.
> + *
> + * Return: 0 on success, negative error code on failure (e.g., -EBUSY or -EINVAL
> + * if not in %LIVEUPDATE_STATE_NORMAL, bad address provided, invalid token value
> + * read, token not found).
> + */
> +#define LIVEUPDATE_IOCTL_FD_UNPRESERVE					\
> +	_IOW(LIVEUPDATE_IOCTL_TYPE, 0x01, __u64)
> +
> +/**
> + * LIVEUPDATE_IOCTL_FD_RESTORE - Restore a previously preserved file descriptor.
> + *
> + * Argument: Pointer to &struct liveupdate_fd.
> + *
> + * User sets the @token field to the value obtained from a successful
> + * %LIVEUPDATE_IOCTL_FD_PRESERVE call before the live update. On success,
> + * the kernel restores the state (saved during the PREPARE/FREEZE phases)
> + * associated with the token and populates the @fd field with a new file
> + * descriptor referencing the restored resource in the current (new) kernel.
> + * This operation must be performed *before* signaling completion via
> + * %LIVEUPDATE_IOCTL_EVENT_FINISH. This is an I/O read/write operation.
> + *
> + * Return: 0 on success, negative error code on failure (e.g., invalid token).
> + */
> +#define LIVEUPDATE_IOCTL_FD_RESTORE					\
> +	_IOWR(LIVEUPDATE_IOCTL_TYPE, 0x02, struct liveupdate_fd)
> +
> +/**
> + * LIVEUPDATE_IOCTL_GET_STATE - Query the current state of the live update
> + * orchestrator.
> + *
> + * Argument: Pointer to &enum liveupdate_state.
> + *
> + * The kernel fills the enum value pointed to by the argument with the current
> + * state of the live update subsystem. Possible states are:
> + *
> + * - %LIVEUPDATE_STATE_NORMAL:   Default state; no live update operation is
> + *                               currently in progress.
> + * - %LIVEUPDATE_STATE_PREPARED: The preparation phase (triggered by
> + *                               %LIVEUPDATE_IOCTL_EVENT_PREPARE) has completed
> + *                               successfully. The system is ready for the
> + *                               reboot transition initiated by
> + *                               %LIVEUPDATE_IOCTL_EVENT_FREEZE. Note that some
> + *                               device operations (e.g., unbinding, new DMA
> + *                               mappings) might be restricted in this state.
> + * - %LIVEUPDATE_STATE_UPDATED:  The system has successfully rebooted into the
> + *                               new kernel via live update. It is now running
> + *                               the new kernel code and is awaiting the
> + *                               completion signal from user space via
> + *                               %LIVEUPDATE_IOCTL_EVENT_FINISH after
> + *                               restoration tasks are done.
> + *
> + * See the definition of &enum liveupdate_state for more details on each state.
> + * This is an I/O read operation (kernel writes to the user-provided pointer).
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +#define LIVEUPDATE_IOCTL_GET_STATE					\
> +	_IOR(LIVEUPDATE_IOCTL_TYPE, 0x03, enum liveupdate_state)
> +
> +/**
> + * LIVEUPDATE_IOCTL_EVENT_PREPARE - Initiate preparation phase and trigger state
> + * saving.
> + *
> + * Argument: None.
> + *
> + * Initiates the live update preparation phase. This action corresponds to
> + * the internal %LIVEUPDATE_PREPARE kernel event and can also be triggered
> + * by writing '1' to ``/sys/kernel/liveupdate/prepare``. This typically
> + * triggers the main state saving process for items marked via the PRESERVE
> + * ioctls. This occurs *before* the main "blackout window", while user
> + * applications (e.g., VMs) may still be running. Kernel subsystems
> + * receiving the %LIVEUPDATE_PREPARE event should serialize necessary state.
> + * This command does not transfer data.
> + *
> + * Return: 0 on success, negative error code on failure. Transitions state
> + * towards %LIVEUPDATE_STATE_PREPARED on success.
> + */
> +#define LIVEUPDATE_IOCTL_EVENT_PREPARE					\
> +	_IO(LIVEUPDATE_IOCTL_TYPE, 0x04)
> +
> +/**
> + * LIVEUPDATE_IOCTL_EVENT_FREEZE - Notify subsystems of imminent reboot
> + * transition.
> + *
> + * Argument: None.
> + *
> + * Notifies the live update subsystem and associated components that the kernel
> + * is about to execute the final reboot transition into the new kernel (e.g.,
> + * via kexec). This action triggers the internal %LIVEUPDATE_FREEZE kernel
> + * event. This event provides subsystems a final, brief opportunity (within the
> + * "blackout window") to save critical state or perform last-moment quiescing.
> + * Any remaining or deferred state saving for items marked via the PRESERVE
> + * ioctls typically occurs in response to the %LIVEUPDATE_FREEZE event.
> + *
> + * This ioctl should only be called when the system is in the
> + * %LIVEUPDATE_STATE_PREPARED state. This command does not transfer data.
> + *
> + * Return: 0 if the notification is successfully processed by the kernel (but
> + * reboot follows). Returns a negative error code if the notification fails
> + * or if the system is not in the %LIVEUPDATE_STATE_PREPARED state.
> + */
> +#define LIVEUPDATE_IOCTL_EVENT_FREEZE					\
> +	_IO(LIVEUPDATE_IOCTL_TYPE, 0x05)
> +
> +/**
> + * LIVEUPDATE_IOCTL_EVENT_CANCEL - Cancel the live update preparation phase.
> + *
> + * Argument: None.
> + *
> + * Notifies the live update subsystem to abort the preparation sequence
> + * potentially initiated by %LIVEUPDATE_IOCTL_EVENT_PREPARE. This action
> + * typically corresponds to the internal %LIVEUPDATE_CANCEL kernel event,
> + * which might also be triggered automatically if the PREPARE stage fails
> + * internally.
> + *
> + * When triggered, subsystems receiving the %LIVEUPDATE_CANCEL event should
> + * revert any state changes or actions taken specifically for the aborted
> + * prepare phase (e.g., discard partially serialized state). The kernel
> + * releases resources allocated specifically for this *aborted preparation
> + * attempt*.
> + *
> + * This operation cancels the current *attempt* to prepare for a live update
> + * but does **not** remove previously validated items from the internal list
> + * of potentially preservable resources. Consequently, preservation tokens
> + * previously generated by successful %LIVEUPDATE_IOCTL_FD_PRESERVE or calls
> + * generally **remain valid** as identifiers for those potentially preservable
> + * resources. However, since the system state returns towards
> + * %LIVEUPDATE_STATE_NORMAL, user space must initiate a new live update sequence
> + * (starting with %LIVEUPDATE_IOCTL_EVENT_PREPARE) to proceed with an update
> + * using these (or other) tokens.
> + *
> + * This command does not transfer data. Kernel callbacks for the
> + * %LIVEUPDATE_CANCEL event must not fail.
> + *
> + * Return: 0 on success, negative error code on failure. Transitions state back
> + * towards %LIVEUPDATE_STATE_NORMAL on success.
> + */
> +#define LIVEUPDATE_IOCTL_EVENT_CANCEL					\
> +	_IO(LIVEUPDATE_IOCTL_TYPE, 0x06)
> +
> +/**
> + * LIVEUPDATE_IOCTL_EVENT_FINISH - Signal restoration completion and trigger
> + * cleanup.
> + *
> + * Argument: None.
> + *
> + * Signals that user space has completed all necessary restoration actions in
> + * the new kernel (after a live update reboot). This action corresponds to the
> + * internal %LIVEUPDATE_FINISH kernel event and may also be triggerable via
> + * sysfs (e.g., writing '1' to ``/sys/kernel/liveupdate/finish``)
> + * Calling this ioctl triggers the cleanup phase: any resources that were
> + * successfully preserved but were *not* subsequently restored (reclaimed) via
> + * the RESTORE ioctls will have their preserved state discarded and associated
> + * kernel resources released. Involved devices may be reset. All desired
> + * restorations *must* be completed *before* this. Kernel callbacks for the
> + * %LIVEUPDATE_FINISH event must not fail. Successfully completing this phase
> + * transitions the system state from %LIVEUPDATE_STATE_UPDATED back to
> + * %LIVEUPDATE_STATE_NORMAL. This command does not transfer data.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +#define LIVEUPDATE_IOCTL_EVENT_FINISH					\
> +	_IO(LIVEUPDATE_IOCTL_TYPE, 0x07)
> +
> +#endif /* _UAPI_LIVEUPDATE_H */
> -- 
> 2.49.0.1101.gccaa498523-goog
> 
