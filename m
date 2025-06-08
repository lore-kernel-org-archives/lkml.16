Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7621F4CB7
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 13:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749388469; cv=none; b=Otslwzzxqj+k4QyaJBWU9Q4DXstZalORB4NUC2EXsernT4IFGd3ij0kqSo90y4mDY/SLE5fjHBP66nMndjWcvCJZRpEWWwHmP61DJz+CjUbQl7LwpjRN3ohYEW4zCaqTZBFiPjkVyhTZ4B8i1iXSeX4rvJ/h5xFaeYZUJqF0cHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749388469; c=relaxed/simple;
	bh=tbF3zElzWpXhsW8xzj4x9NEkrL4AUAZKsrkOvGOC0N0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jbKpgfuHH07uNGJSMbsBJjaOVwd+ceBh3hyVEN1WQzmqHEU9ACWrYfl3B8tL5Nv2EYIlENOnh/1ZjS6Qo1uj+YkhOzutpI7fEJxX9ySmMiO5LshwlceXkyVQm7CB4RFuvUngm6b+vSpF06KkoIzwoGIYIMeSGDZahUag1wRlTc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=aVdoJgCk; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="aVdoJgCk"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a442a3a2bfso64440901cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 06:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749388466; x=1749993266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOnI+ywNmi7FgBJlaetCfpvk2bT6/nja0rLWlH5rfNA=;
        b=aVdoJgCkPKzJWhnVMnrE3vFogTVWH6A4JfM+96WDRLHyLIAFMIg7lqXlUuG4RVqxVd
         balYtFx1k4BQ2HLxxPvHTSpTAAloh/90bzgt6Og99CnAyQQhEK/gFttYWrmNlTePtnTX
         pamknF8At3vse9R9lbvGebxlOhRmR3aOS8xNUpS0EZh+M8A+tJxXqlrZbM4DTB+wZeIf
         nKi8a+IK7bcM9XW8IaEF8YPvvYiQy3LHyJEPUUyy+OyI8uCwjphlY/XLcEASN3ybqXUi
         R8BeZYR2yr6suHQFpxrtUrWh2tKT1ZQ01c8K96Zb5eT7DpPkrGVOfOFTQrePoUTJ+2GZ
         hbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749388466; x=1749993266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOnI+ywNmi7FgBJlaetCfpvk2bT6/nja0rLWlH5rfNA=;
        b=MFEDmEvJuGzi4JS3olmXgUkrYJ2d6MjL3r9eMVrA/xGzZ/aYHQbjoJMH7oiOtleu2c
         2xrLIu7CjpHDcCR6XbB7ic/khjETb/71HQXpghsggOU7t1CE0zooktMTPuEsXmK7s8i9
         zhObNzK6Nr7/lXa2FScyxLkKC/Yc7PAD1qnO2+414AxQ1gIwq2CXZgccFRNNTsKFN2yZ
         ovDNvEu5SpaHXujIcbPCWh1K9aBe9DEyzJrQcte27/6DAN5vhXzCC8xPZPv8k8x65TGW
         IJ8L/IZSvW2WYZLAtK1bFax8N5wqbaa/SYEBZUKVT0OAVbnKcPxFp1Id7fiqM/RSQicv
         wubw==
X-Forwarded-Encrypted: i=1; AJvYcCVOW8sdh3kcEQqyctBEmxatNCN9mo2VN+7CPB8iwjcaJEAKKNxMGGZb0SZvF/osPacy7t5DN0mlgR5lU88=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRndaywalj8F3AQCzaAnp4/kXImm5RKDMDKM8yGXG6/NhiejOI
	oJUJc1i+Joxlvann1ApGZQ+448mbzMWf1J5dKE+4DAJZkxA1j2nrdyBF6wRwNkH3udh4/IvqWiI
	9keAiJAya/0n9ahFE/N20+7vwi57tUUBa6JFwAqlnOw==
X-Gm-Gg: ASbGnctvF2owu13Ubwjuzo/5xNjdxJXA9jn/Z8cAwMYaB7nE4JDjJCQjaokcTWH9dR9
	py+NxprIeC/5ZReuHKCGL4qPNQ/uXSK3man7IraJiZaurQjb4hLgjwrcg1EC8Joo6mk+bx6ePyS
	K1Yd1qAEPOQ9YPIoKspMPtwU2rbJuTZOeKGgDGz222
X-Google-Smtp-Source: AGHT+IFBz1mf4oq7A3ReEQUsyyBOf5I39ND79UEaQKf+GlxlVGmffxMGccOdtg+5/rF1bbq6BZ70S7sN/cgh3Yyw3Fw=
X-Received: by 2002:a05:622a:4288:b0:4a3:398d:825c with SMTP id
 d75a77b69052e-4a5b9db7a82mr141080871cf.48.1749388466280; Sun, 08 Jun 2025
 06:14:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-9-pasha.tatashin@soleen.com> <aDQeWT9sLNQVZKf-@kernel.org>
In-Reply-To: <aDQeWT9sLNQVZKf-@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 8 Jun 2025 09:13:49 -0400
X-Gm-Features: AX0GCFtiq7vBHBoDPnbIibd9EmTAoTdMdAsXHx7f0tmrGnXXMhRyuB3NbXzgoLI
Message-ID: <CA+CK2bDoq=SxX_YV2S+YpXRi_a0eWOH+HC7u4NO9F-+YcPD5ew@mail.gmail.com>
Subject: Re: [RFC v2 08/16] luo: luo_files: add infrastructure for FDs
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, dmatlack@google.com, rientjes@google.com, 
	corbet@lwn.net, rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, 
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com, 
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org, 
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev, 
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 3:55=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, May 15, 2025 at 06:23:12PM +0000, Pasha Tatashin wrote:
> > Introduce the framework within LUO to support preserving specific types
> > of file descriptors across a live update transition. This allows
> > stateful FDs (like memfds or vfio FDs used by VMs) to be recreated in
> > the new kernel.
> >
> > Note: The core logic for iterating through the luo_files_list and
> > invoking the handler callbacks (prepare, freeze, cancel, finish)
> > within luo_do_files_*_calls, as well as managing the u64 data
> > persistence via the FDT for individual files, is currently implemented
> > as stubs in this patch. This patch sets up the registration, FDT layout=
,
> > and retrieval framework.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  drivers/misc/liveupdate/Makefile       |   1 +
> >  drivers/misc/liveupdate/luo_core.c     |  19 +
> >  drivers/misc/liveupdate/luo_files.c    | 563 +++++++++++++++++++++++++
> >  drivers/misc/liveupdate/luo_internal.h |  11 +
> >  include/linux/liveupdate.h             |  62 +++
> >  5 files changed, 656 insertions(+)
> >  create mode 100644 drivers/misc/liveupdate/luo_files.c
> >
> > diff --git a/drivers/misc/liveupdate/Makefile b/drivers/misc/liveupdate=
/Makefile
> > index df1c9709ba4f..b4cdd162574f 100644
> > --- a/drivers/misc/liveupdate/Makefile
> > +++ b/drivers/misc/liveupdate/Makefile
> > @@ -1,3 +1,4 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  obj-y                                        +=3D luo_core.o
> > +obj-y                                        +=3D luo_files.o
> >  obj-y                                        +=3D luo_subsystems.o
> > diff --git a/drivers/misc/liveupdate/luo_core.c b/drivers/misc/liveupda=
te/luo_core.c
> > index 417e7f6bf36c..ab1d76221fe2 100644
> > --- a/drivers/misc/liveupdate/luo_core.c
> > +++ b/drivers/misc/liveupdate/luo_core.c
> > @@ -110,6 +110,10 @@ static int luo_fdt_setup(struct kho_serialization =
*ser)
> >       if (ret)
> >               goto exit_free;
> >
> > +     ret =3D luo_files_fdt_setup(fdt_out);
> > +     if (ret)
> > +             goto exit_free;
> > +
> >       ret =3D luo_subsystems_fdt_setup(fdt_out);
> >       if (ret)
> >               goto exit_free;
>
> The duplication of files and subsystems does not look nice here and below=
.
> Can't we make files to be a subsystem?

Good idea, let me work on this.

>
> > @@ -145,7 +149,13 @@ static int luo_do_prepare_calls(void)
> >  {
> >       int ret;
> >
> > +     ret =3D luo_do_files_prepare_calls();
> > +     if (ret)
> > +             return ret;
> > +
> >       ret =3D luo_do_subsystems_prepare_calls();
> > +     if (ret)
> > +             luo_do_files_cancel_calls();
> >
> >       return ret;
> >  }
> > @@ -154,18 +164,26 @@ static int luo_do_freeze_calls(void)
> >  {
> >       int ret;
> >
> > +     ret =3D luo_do_files_freeze_calls();
> > +     if (ret)
> > +             return ret;
> > +
> >       ret =3D luo_do_subsystems_freeze_calls();
> > +     if (ret)
> > +             luo_do_files_cancel_calls();
> >
> >       return ret;
> >  }
> >
> >  static void luo_do_finish_calls(void)
> >  {
> > +     luo_do_files_finish_calls();
> >       luo_do_subsystems_finish_calls();
> >  }
> >
> >  static void luo_do_cancel_calls(void)
> >  {
> > +     luo_do_files_cancel_calls();
> >       luo_do_subsystems_cancel_calls();
> >  }
> >
> > @@ -436,6 +454,7 @@ static int __init luo_startup(void)
> >       }
> >
> >       __luo_set_state(LIVEUPDATE_STATE_UPDATED);
> > +     luo_files_startup(luo_fdt_in);
> >       luo_subsystems_startup(luo_fdt_in);
> >
> >       return 0;
> > diff --git a/drivers/misc/liveupdate/luo_files.c b/drivers/misc/liveupd=
ate/luo_files.c
> > new file mode 100644
> > index 000000000000..953fc40db3d7
> > --- /dev/null
> > +++ b/drivers/misc/liveupdate/luo_files.c
> > @@ -0,0 +1,563 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/*
> > + * Copyright (c) 2025, Google LLC.
> > + * Pasha Tatashin <pasha.tatashin@soleen.com>
> > + */
> > +
> > +/**
> > + * DOC: LUO file descriptors
> > + *
> > + * LUO provides the infrastructure necessary to preserve
> > + * specific types of stateful file descriptors across a kernel live
> > + * update transition. The primary goal is to allow workloads, such as =
virtual
> > + * machines using vfio, memfd, or iommufd to retain access to their es=
sential
> > + * resources without interruption after the underlying kernel is  upda=
ted.
> > + *
> > + * The framework operates based on handler registration and instance t=
racking:
> > + *
> > + * 1. Handler Registration: Kernel modules responsible for specific fi=
le
> > + * types (e.g., memfd, vfio) register a &struct liveupdate_filesystem
> > + * handler. This handler contains callbacks (&liveupdate_filesystem.pr=
epare,
> > + * &liveupdate_filesystem.freeze, &liveupdate_filesystem.finish, etc.)
> > + * and a unique 'compatible' string identifying the file type.
> > + * Registration occurs via liveupdate_register_filesystem().
>
> I wouldn't use filesystem here, as the obvious users are not really
> filesystems. Maybe liveupdate_register_file_ops?

This corresponds to the way these structs are called in linux, so I
think the name is OK.

>
> > + *
> > + * 2. File Instance Tracking: When a potentially preservable file need=
s to be
> > + * managed for live update, the core LUO logic (luo_register_file()) f=
inds a
> > + * compatible registered handler using its &liveupdate_filesystem.can_=
preserve
> > + * callback. If found,  an internal &struct luo_file instance is creat=
ed,
> > + * assigned a unique u64 'token', and added to a list.
> > + *
> > + * 3. State Persistence (FDT): During the LUO prepare/freeze phases, t=
he
> > + * registered handler callbacks are invoked for each tracked file inst=
ance.
> > + * These callbacks can generate a u64 data payload representing the mi=
nimal
> > + * state needed for restoration. This payload, along with the handler'=
s
> > + * compatible string and the unique token, is stored in a dedicated
> > + * '/file-descriptors' node within the main LUO FDT blob passed via
> > + * Kexec Handover (KHO).
> > + *
> > + * 4. Restoration: In the new kernel, the LUO framework parses the inc=
oming
> > + * FDT to reconstruct the list of &struct luo_file instances. When the
> > + * original owner requests the file, luo_retrieve_file() uses the corr=
esponding
> > + * handler's &liveupdate_filesystem.retrieve callback, passing the per=
sisted
> > + * u64 data, to recreate or find the appropriate &struct file object.
> > + */
>
> The DOC is mostly about what luo_files does, we'd also need a description
> of it's intended use, both internally in the kernel and by the userspace.
>
> > +
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > +
>
> ...
>
> > +/**
> > + * luo_register_file - Register a file descriptor for live update mana=
gement.
> > + * @tokenp: Return argument for the token value.
> > + * @file: Pointer to the struct file to be preserved.
> > + *
> > + * Context: Must be called when LUO is in 'normal' state.
> > + *
> > + * Return: 0 on success. Negative errno on failure.
> > + */
> > +int luo_register_file(u64 *tokenp, struct file *file)
> > +{
> > +     struct liveupdate_filesystem *fs;
> > +     bool found =3D false;
> > +     int ret =3D -ENOENT;
> > +     u64 token;
> > +
> > +     luo_state_read_enter();
> > +     if (!liveupdate_state_normal() && !liveupdate_state_updated()) {
> > +             pr_warn("File can be registered only in normal or prepare=
d state\n");
> > +             luo_state_read_exit();
> > +             return -EBUSY;
> > +     }
> > +
> > +     down_read(&luo_filesystems_list_rwsem);
> > +     list_for_each_entry(fs, &luo_filesystems_list, list) {
> > +             if (fs->can_preserve(file, fs->arg)) {
> > +                     found =3D true;
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (found) {
>
>         if (!found)
>                 goto exit_unlock;

Done, thank you.


> > + * struct liveupdate_filesystem - Represents a handler for a live-upda=
table
> > + * filesystem/file type.
> > + * @prepare:       Optional. Saves state for a specific file instance =
(@file,
> > + *                 @arg) before update, potentially returning value vi=
a @data.
> > + *                 Returns 0 on success, negative errno on failure.
> > + * @freeze:        Optional. Performs final actions just before kernel
> > + *                 transition, potentially reading/updating the handle=
 via
> > + *                 @data.
> > + *                 Returns 0 on success, negative errno on failure.
> > + * @cancel:        Optional. Cleans up state/resources if update is ab=
orted
> > + *                 after prepare/freeze succeeded, using the @data han=
dle (by
> > + *                 value) from the successful prepare. Returns void.
> > + * @finish:        Optional. Performs final cleanup in the new kernel =
using the
> > + *                 preserved @data handle (by value). Returns void.
> > + * @retrieve:      Retrieve the preserved file. Must be called before =
finish.
> > + * @can_preserve:  callback to determine if @file with associated cont=
ext (@arg)
> > + *                 can be preserved by this handler.
> > + *                 Return bool (true if preservable, false otherwise).
> > + * @compatible:    The compatibility string (e.g., "memfd-v1", "vfiofd=
-v1")
> > + *                 that uniquely identifies the filesystem or file typ=
e this
> > + *                 handler supports. This is matched against the compa=
tible
> > + *                 string associated with individual &struct liveupdat=
e_file
> > + *                 instances.
> > + * @arg:           An opaque pointer to implementation-specific contex=
t data
> > + *                 associated with this filesystem handler registratio=
n.
> > + * @list:          used for linking this handler instance into a globa=
l list of
> > + *                 registered filesystem handlers.
> > + *
> > + * Modules that want to support live update for specific file types sh=
ould
> > + * register an instance of this structure. LUO uses this registration =
to
> > + * determine if a given file can be preserved and to find the appropri=
ate
> > + * operations to manage its state across the update.
> > + */
> > +struct liveupdate_filesystem {
> > +     int (*prepare)(struct file *file, void *arg, u64 *data);
> > +     int (*freeze)(struct file *file, void *arg, u64 *data);
> > +     void (*cancel)(struct file *file, void *arg, u64 data);
> > +     void (*finish)(struct file *file, void *arg, u64 data, bool recla=
imed);
> > +     int (*retrieve)(void *arg, u64 data, struct file **file);
> > +     bool (*can_preserve)(struct file *file, void *arg);
> > +     const char *compatible;
> > +     void *arg;
> > +     struct list_head list;
> > +};
> > +
>
> Like with subsystems, I'd split ops and make the data part private to
> luo_files.c

For simplicity, I would like to keep them together, the same as in subsyste=
ms.


>
> >  /**
> >   * struct liveupdate_subsystem - Represents a subsystem participating =
in LUO
> >   * @prepare:      Optional. Called during LUO prepare phase. Should pe=
rform
> > @@ -142,6 +191,9 @@ int liveupdate_register_subsystem(struct liveupdate=
_subsystem *h);
> >  int liveupdate_unregister_subsystem(struct liveupdate_subsystem *h);
> >  int liveupdate_get_subsystem_data(struct liveupdate_subsystem *h, u64 =
*data);
> >
> > +int liveupdate_register_filesystem(struct liveupdate_filesystem *h);
> > +int liveupdate_unregister_filesystem(struct liveupdate_filesystem *h);
>
> int liveupdate_register_file_ops(name, ops, data, ret_token) ?
>
> > +
> >  #else /* CONFIG_LIVEUPDATE */
> >
> >  static inline int liveupdate_reboot(void)
> > @@ -180,5 +232,15 @@ static inline int liveupdate_get_subsystem_data(st=
ruct liveupdate_subsystem *h,
> >       return -ENODATA;
> >  }
> >
> > +static inline int liveupdate_register_filesystem(struct liveupdate_fil=
esystem *h)
> > +{
> > +     return 0;
> > +}
> > +
> > +static inline int liveupdate_unregister_filesystem(struct liveupdate_f=
ilesystem *h)
> > +{
> > +     return 0;
> > +}
> > +
> >  #endif /* CONFIG_LIVEUPDATE */
> >  #endif /* _LINUX_LIVEUPDATE_H */
> > --
> > 2.49.0.1101.gccaa498523-goog
> >
> >
>
> --
> Sincerely yours,
> Mike.
