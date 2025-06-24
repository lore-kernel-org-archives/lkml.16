Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE9215853B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775317; cv=none; b=bajH07Bs7Exyks9dayNCo7TDs1pF+Oom9di3RlpLDT7i18Qwnnh9TlwIXalmRjYsyXpuPnfROKikxGgwNaGj+jqMbv3nNAcPUI1VXgEf8Ol158uGyacDPCAS4+rbqkJyHFsNV5c15P8h+KFVqZUhPH/rMdrpoP/zi1/T38oVijo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775317; c=relaxed/simple;
	bh=mTYvJfN2xuWQsVAHTwNShzkisvw8P0xI6BmLshD2djA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVUf2MBcLLZ4xDMorcns+cNR//doOcwsExzGSJRna5AcM2TDiew8UG6rbyRJvTMR7VEnIP78DbWRoz35t/mxAVQDAu/VRSq5yDL8s44FgdS8yYRJ85gKwyrzA+PezTkoud9pGarnzzVOrnWyV80gzqYYI685nzIgJF90XopAPGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=YYRQ4ebm; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="YYRQ4ebm"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a44b3526e6so5773981cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750775314; x=1751380114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDewiSmD4MwwrX0+a8LW2QGw9oFX/YyFBm3ct0LvRo0=;
        b=YYRQ4ebmBl9pg0Fuufraid4TmzLnDb+ukaZXvRSLDrP+WKIrxXo7tdqt0y6bgzrkJz
         iBkRQyawmJneP97BEwgNq8WRF1s1ymPyqGMIZdlCKHQp0LY0tXe7MmmIXIW38DGWrVlP
         pQdTmM9wArDqnmjL7WPFeUJfSEFM16zgaANIiJ5NnCXGmdoWEK2qDlzobliqBvpI+1g0
         Ooxjt/SF60vFDwwIUcugRRFS+FHAq0JCrYAGSxe1tz+7UVje2yk8xhe6g+8M4HjY85hv
         iIeSjN3lBWyKRplmPCv1cTDvwMWbfldYvtYIlESxsfO4oOlVD4iArkgVmtUVOp3vej0z
         GH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775314; x=1751380114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDewiSmD4MwwrX0+a8LW2QGw9oFX/YyFBm3ct0LvRo0=;
        b=KdeeJQRFr2iT5fuOA+HU5zssrzgj7b4/W9cRL079G+dXZz5U3H1Iud+xAnkUcLJD74
         zSXQ07gJ9p47YJUPS1HN5ZqQZCI8NdXORdORPuuz0U+dXMwwzFfPnKJiALPmfyZsk8Bs
         88zTGG4lI0UMFfdbfWdHJ1MqbWqj3rpD4EifQh7l+9RsWFO3EsevvjBXWeTJOgVyQKHs
         4g2YIYTnagf3PTRFR0r2AWv7E2OlC+yDNUm6xSCSDRRcjTvXshMh9X0Y2LNCpvg9ts0B
         2vqTQbj7iJdq3IdjdfDff6MPeBd7ARRcpO8dOid+dSNuT6I6iHuM7J+X47H3dBe++jF5
         2LMw==
X-Forwarded-Encrypted: i=1; AJvYcCXVkOUX71iviVKs7waV/1B9K/uPLosiC3Akfs6kiruiS0G2TdJTbkW2vQ2YnEAtlScPRtIQFwOaNJHMqCg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo2Moi5cIJFSEtJBU+Yy45/L0g+qz26rL/Lw+RdEeGwXRhRHMA
	DCCBLCk5eXCQPjPHXHg7VvrieQX2aOe+xdo8048kXklBOhlLbPEigwy2uNjYBUBZvZmBZUE2wlN
	oksgyHWa/owjdW4rfT2ijAr8Zcnsiv7rtEBt/3gIbKg==
X-Gm-Gg: ASbGnctvY3/Nnl3L/ASta6uE7D8pMAwnaXKSuPK8peoou4aHoKZ9/LWUYDfk1Yx3v3X
	2THSM6L7OHTszmR2KKc4mW7h6Y3SWPGzUKX6krJPXEwDmz7/m7nBEtCgojVRB7XCChgGffRYcaR
	qU7SxT3gGX4+Fb1mijYy6hpgWKBw74nWhmm4G1q+Fvzrf23QVjTgU=
X-Google-Smtp-Source: AGHT+IGFEQhzykPbe/44QRJkdNddUzd4cfvP60odxaU1YoPeESZ4f1vixxl/WUpJLfMlzvla3CLnCoyoFqQUs9WlBsk=
X-Received: by 2002:ac8:5849:0:b0:4a1:3b18:598a with SMTP id
 d75a77b69052e-4a77a1fed3dmr258991591cf.5.1750775313494; Tue, 24 Jun 2025
 07:28:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-11-pasha.tatashin@soleen.com> <20250624-akzeptabel-angreifbar-9095f4717ca4@brauner>
In-Reply-To: <20250624-akzeptabel-angreifbar-9095f4717ca4@brauner>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 24 Jun 2025 10:27:56 -0400
X-Gm-Features: AX0GCFtlnh5qP7763PBCjBm3puXOqOkkcghSRVKRQ0u-_lovPxMsol3pu7S1kPY
Message-ID: <CA+CK2bBu4ex9O5kPcR7++DVg3RM8ZWg3BCpcc6CboJ=aG8mVmQ@mail.gmail.com>
Subject: Re: [RFC v2 10/16] luo: luo_ioctl: add ioctl interface
To: Christian Brauner <brauner@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 5:51=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Thu, May 15, 2025 at 06:23:14PM +0000, Pasha Tatashin wrote:
> > Introduce the user-space interface for the Live Update Orchestrator
> > via ioctl commands, enabling external control over the live update
> > process and management of preserved resources.
> >
> > Create a misc character device at /dev/liveupdate. Access
> > to this device requires the CAP_SYS_ADMIN capability.
> >
> > A new UAPI header, <uapi/linux/liveupdate.h>, defines the necessary
> > structures. The magic number is registered in
> > Documentation/userspace-api/ioctl/ioctl-number.rst.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  .../userspace-api/ioctl/ioctl-number.rst      |   1 +
> >  drivers/misc/liveupdate/Makefile              |   1 +
> >  drivers/misc/liveupdate/luo_ioctl.c           | 199 ++++++++++++
> >  include/linux/liveupdate.h                    |  34 +-
> >  include/uapi/linux/liveupdate.h               | 300 ++++++++++++++++++
> >  5 files changed, 502 insertions(+), 33 deletions(-)
> >  create mode 100644 drivers/misc/liveupdate/luo_ioctl.c
> >  create mode 100644 include/uapi/linux/liveupdate.h
> >
> > diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Docum=
entation/userspace-api/ioctl/ioctl-number.rst
> > index 7a1409ecc238..279c124048f2 100644
> > --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> > +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> > @@ -375,6 +375,7 @@ Code  Seq#    Include File                         =
                  Comments
> >  0xB8  01-02  uapi/misc/mrvl_cn10k_dpi.h                              M=
arvell CN10K DPI driver
> >  0xB8  all    uapi/linux/mshv.h                                       M=
icrosoft Hyper-V /dev/mshv driver
> >                                                                       <=
mailto:linux-hyperv@vger.kernel.org>
> > +0xBA  all    uapi/linux/liveupdate.h                                 <=
mailto:Pasha Tatashin <pasha.tatashin@soleen.com>
> >  0xC0  00-0F  linux/usb/iowarrior.h
> >  0xCA  00-0F  uapi/misc/cxl.h                                         D=
ead since 6.15
> >  0xCA  10-2F  uapi/misc/ocxl.h
> > diff --git a/drivers/misc/liveupdate/Makefile b/drivers/misc/liveupdate=
/Makefile
> > index b4cdd162574f..7a0cd08919c9 100644
> > --- a/drivers/misc/liveupdate/Makefile
> > +++ b/drivers/misc/liveupdate/Makefile
> > @@ -1,4 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > +obj-y                                        +=3D luo_ioctl.o
> >  obj-y                                        +=3D luo_core.o
> >  obj-y                                        +=3D luo_files.o
> >  obj-y                                        +=3D luo_subsystems.o
> > diff --git a/drivers/misc/liveupdate/luo_ioctl.c b/drivers/misc/liveupd=
ate/luo_ioctl.c
> > new file mode 100644
> > index 000000000000..76c687ff650b
> > --- /dev/null
> > +++ b/drivers/misc/liveupdate/luo_ioctl.c
> > @@ -0,0 +1,199 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/*
> > + * Copyright (c) 2025, Google LLC.
> > + * Pasha Tatashin <pasha.tatashin@soleen.com>
> > + */
> > +
> > +/**
> > + * DOC: LUO ioctl Interface
> > + *
> > + * The IOCTL user-space control interface for the LUO subsystem.
> > + * It registers a misc character device, typically found at ``/dev/liv=
eupdate``,
> > + * which allows privileged userspace applications (requiring %CAP_SYS_=
ADMIN) to
> > + * manage and monitor the LUO state machine and associated resources l=
ike
> > + * preservable file descriptors.
> > + */
> > +
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > +
> > +#include <linux/errno.h>
> > +#include <linux/file.h>
> > +#include <linux/fs.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/miscdevice.h>
> > +#include <linux/module.h>
> > +#include <linux/uaccess.h>
> > +#include <uapi/linux/liveupdate.h>
> > +#include "luo_internal.h"
> > +
> > +static int luo_ioctl_fd_preserve(struct liveupdate_fd *luo_fd)
> > +{
> > +     struct file *file;
> > +     int ret;
> > +
> > +     file =3D fget(luo_fd->fd);
> > +     if (!file) {
> > +             pr_err("Bad file descriptor\n");
> > +             return -EBADF;
> > +     }
> > +
> > +     ret =3D luo_register_file(&luo_fd->token, file);
> > +     if (ret)
> > +             fput(file);
> > +
> > +     return ret;
> > +}
> > +
> > +static int luo_ioctl_fd_unpreserve(u64 token)
> > +{
> > +     return luo_unregister_file(token);
> > +}
> > +
> > +static int luo_ioctl_fd_restore(struct liveupdate_fd *luo_fd)
> > +{
> > +     struct file *file;
> > +     int ret;
> > +     int fd;
> > +
> > +     fd =3D get_unused_fd_flags(O_CLOEXEC);
> > +     if (fd < 0) {
> > +             pr_err("Failed to allocate new fd: %d\n", fd);
> > +             return fd;
> > +     }
> > +
> > +     ret =3D luo_retrieve_file(luo_fd->token, &file);
> > +     if (ret < 0) {
> > +             put_unused_fd(fd);
> > +
> > +             return ret;
> > +     }
> > +
> > +     fd_install(fd, file);
> > +     luo_fd->fd =3D fd;
> > +
> > +     return 0;
> > +}
> > +
> > +static int luo_open(struct inode *inodep, struct file *filep)
> > +{
> > +     if (!capable(CAP_SYS_ADMIN))
> > +             return -EACCES;
> > +
> > +     if (filep->f_flags & O_EXCL)
> > +             return -EINVAL;
> > +
> > +     return 0;
> > +}
> > +
> > +static long luo_ioctl(struct file *filep, unsigned int cmd, unsigned l=
ong arg)
> > +{
> > +     void __user *argp =3D (void __user *)arg;
> > +     struct liveupdate_fd luo_fd;
> > +     enum liveupdate_state state;
> > +     int ret =3D 0;
> > +     u64 token;
> > +
> > +     if (_IOC_TYPE(cmd) !=3D LIVEUPDATE_IOCTL_TYPE)
> > +             return -ENOTTY;
> > +
> > +     switch (cmd) {
> > +     case LIVEUPDATE_IOCTL_GET_STATE:
> > +             state =3D READ_ONCE(luo_state);
> > +             if (copy_to_user(argp, &state, sizeof(luo_state)))
> > +                     ret =3D -EFAULT;
> > +             break;
> > +
> > +     case LIVEUPDATE_IOCTL_EVENT_PREPARE:
> > +             ret =3D luo_prepare();
> > +             break;
> > +
> > +     case LIVEUPDATE_IOCTL_EVENT_FREEZE:
> > +             ret =3D luo_freeze();
> > +             break;
> > +
> > +     case LIVEUPDATE_IOCTL_EVENT_FINISH:
> > +             ret =3D luo_finish();
> > +             break;
> > +
> > +     case LIVEUPDATE_IOCTL_EVENT_CANCEL:
> > +             ret =3D luo_cancel();
> > +             break;
> > +
> > +     case LIVEUPDATE_IOCTL_FD_PRESERVE:
> > +             if (copy_from_user(&luo_fd, argp, sizeof(luo_fd))) {
> > +                     ret =3D -EFAULT;
> > +                     break;
> > +             }
> > +
> > +             ret =3D luo_ioctl_fd_preserve(&luo_fd);
> > +             if (!ret && copy_to_user(argp, &luo_fd, sizeof(luo_fd)))
> > +                     ret =3D -EFAULT;
> > +             break;
> > +
> > +     case LIVEUPDATE_IOCTL_FD_UNPRESERVE:
> > +             if (copy_from_user(&token, argp, sizeof(u64))) {
> > +                     ret =3D -EFAULT;
> > +                     break;
> > +             }
> > +
> > +             ret =3D luo_ioctl_fd_unpreserve(token);
> > +             break;
> > +
> > +     case LIVEUPDATE_IOCTL_FD_RESTORE:
> > +             if (copy_from_user(&luo_fd, argp, sizeof(luo_fd))) {
> > +                     ret =3D -EFAULT;
> > +                     break;
> > +             }
> > +
> > +             ret =3D luo_ioctl_fd_restore(&luo_fd);
> > +             if (!ret && copy_to_user(argp, &luo_fd, sizeof(luo_fd)))
> > +                     ret =3D -EFAULT;
> > +             break;
> > +
> > +     default:
> > +             pr_warn("ioctl: unknown command nr: 0x%x\n", _IOC_NR(cmd)=
);
> > +             ret =3D -ENOTTY;
> > +             break;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct file_operations fops =3D {
> > +     .owner          =3D THIS_MODULE,
> > +     .open           =3D luo_open,
> > +     .unlocked_ioctl =3D luo_ioctl,
> > +};
> > +
> > +static struct miscdevice liveupdate_miscdev =3D {
> > +     .minor =3D MISC_DYNAMIC_MINOR,
> > +     .name  =3D "liveupdate",
> > +     .fops  =3D &fops,
> > +};
>
> I'm not sure why people are so in love with character device based apis.
> It's terrible. It glues everything to devtmpfs which isn't namespacable
> in any way. It's terrible to delegate and extremely restrictive in terms
> of extensiblity if you need additional device entries (aka the loop
> driver folly).
>
> One stupid question: I probably have asked this before and just swapped
> out that I a) asked this already and b) received an explanation. But why
> isn't this a singleton simple in-memory filesystem with a flat
> hierarchy?

Hi Christian,

Thank you for the detailed feedback and for raising this important
design question. I appreciate the points you've made about the
benefits of a filesystem-based API.

I have thought thoroughly about this and explored various alternatives
before settling on the ioctl-based interface. This design isn't a
sudden decision but is based on ongoing conversations that have been
happening for over two years at LPC, as well as incorporating direct
feedback I received on LUOv1 at LSF/MM.

The choice for an ioctl-based character device was ultimately driven
by the specific lifecycle and dependency management requirements of
the live update process. While a filesystem API offers great
advantages in visibility and hierarchy, filesystems are not typically
designed to be state machines with the complex lifecycle, dependency,
and ownership tracking that LUO needs to manage.

Let me elaborate on the key aspects that led to the current design:

1. session based lifecycle management: The preservation of an FD is
tied to the open instance of /dev/liveupdate. If a userspace agent
opens /dev/liveupdate, registers several FDs for preservation, and
then crashes or exits before the prepare phase is triggered, all FDs
it registered are automatically unregistered. This "session-scoped"
behavior is crucial to prevent leaking preserved resources into the
next kernel if the controlling process fails. This is naturally
handled by the open() and release() file operations on a character
device. It's not immediately obvious how a similar automatic,
session-based cleanup would be implemented with a singleton
filesystem.

2. state machine: LUO is fundamentally a state machine (NORMAL ->
PREPARED -> FROZEN -> UPDATED -> NORMAL). As part of this, it provides
a crucial guarantee: any resource that was successfully preserved but
not explicitly reclaimed by userspace in the new kernel by the time
the FINISH event is triggered will be automatically cleaned up and its
memory released. This prevents leaks of unreclaimed resources and is
managed by the orchestrator, which is a concept that doesn't map
cleanly onto standard VFS semantics.

3. dependency tracking: Unlike normal files, preserved resources for
live update have strong, often complex interdependencies. For example,
a kvmfd might depend on a guestmemfd; an iommufd can depend on vfiofd,
eventfd, memfd, and kvmfd. LUO's current design provides explicit
callback points (prepare, freeze) where these dependencies can be
validated and tracked by the participating subsystems. If a dependency
is not met when we are about to freeze, we can fail the entire
operation and return an error to userspace. The cancel callback
further allows this complex dependency graph to be unwound safely. A
filesystem interface based on linkat() or unlink() doesn't inherently
provide these critical, ordered points for dependency verification and
rollback.

While I agree that a filesystem offers superior introspection and
integration with standard tools, building this complex, stateful
orchestration logic on top of VFS seemed to be forcing a square peg
into a round hole. The ioctl interface, while more opaque, provides a
direct and explicit way to command the state machine and manage these
complex lifecycle and dependency rules.

Thanks,
Pasha
