Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBB4273D86
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750870771; cv=none; b=KcSMDrBMb6TH9kKOmHAhqrzkUU2M2DptX8stonJ3TQuWiJzhwr3USRrmpDLy1IuUUMjJV4TFnDDO3wFrS3UKL56gppaIdK5/VQKNmWPOn4VA51SoZDpFks0qCefkhU/JiB4lArOc9pOmg1GtppIgq7xdbzSWZK6TaFkYnWI4PbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750870771; c=relaxed/simple;
	bh=l8zxxJzF4mpV5WqO4/+d5XFWeNBNWQegpuXNxie2RGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snggWj0SuyKkXEGv8izGvAaP6jBdMhPR55UdpcPXwZql5N25I2p5m1jaiFXSxR8wdG8Jx187Ka63zWHsjdhqtIWPhUnIGraoTACTOqZU8opUWQoOdvM+bowlPkY2LgO/ANygjWqzWYaC/si7En9KG6wVT8mQeDGTQYRF+wU7SBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=qKJchqF2; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="qKJchqF2"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a42cb03673so2254501cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750870768; x=1751475568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8zxxJzF4mpV5WqO4/+d5XFWeNBNWQegpuXNxie2RGo=;
        b=qKJchqF2rNZ9ab2VcMAD4UiPiXprb+Z5wbCRNSJNj3IVMGtPAVxcm+CdbkH9tsjHvs
         rbLyg0aHUCGaeKuNvb/RejU5H/6nucD/Lx3GhUbR9ifwRPqUnAxIlekx4d51uKkYkSNW
         9rTKix4uCPAJ8RO1TzUoAZvHfz4lcQcCzMH7tnY/ui+BK8BazLzRyLOguuyx3wfro4KJ
         IgiTTYUHOEImV7PosZjSH/PZocsRrpVCDeX4K9G42ExD4L+97d/mWI5AzCWLcxRGXkM0
         AE2I/VASIMjs6vSRhTNFcjeVMZdtWNzHufxfnLmynHdZHWJB9Drjjn4R7GMI8nuhaQv0
         i1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750870768; x=1751475568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8zxxJzF4mpV5WqO4/+d5XFWeNBNWQegpuXNxie2RGo=;
        b=B+4ArikvNAO+sESyAgN+Mwp6iBGr1uCCRpaFU6H85GiByuv9+KHfayLI4wKCK9sBVe
         9BvNIGvxudvewKjWgk5Pjz9up/29l6LbPHZxYZra+wRlc2u/d1O9+j2+EjjP44bp4fXA
         0BJyBKlU+vFNhaGCaQC3C+OMc/ve5XRhBfASZXHBgKrPjzZh3B2rzPtwoB26WnTJiENr
         8q72V06llPR52sCY4Lrvy87nTsdp48Lak/c1Xfx1mrSXhaXaboeH6f8+7Yeqgx3oyyby
         6L+WBAM0SBWsRL8a/lLPpzWP2dFutd+m3cdp7xiCoMqDfjbiyvrW5D6dqUyVIf97bJ/a
         AZZg==
X-Forwarded-Encrypted: i=1; AJvYcCXBYTC1ISmthe+NqdNJsFtZo7WLIIpjv3U23uFuWRKV80/T80bvTpBWngjlspNoqTgbuXK48hoMnGnGizA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLJMdjcw5ciHduchLIX/NE8cvY+8VhvoKr1DT/eXNiJRNu/F2t
	gWcNbY/LLXjDfezXCsWeiiTYyzvSG5UEjqHi0Hc/UzbHdEy9J/RKduEd+ZKS+/gmvQCoQvDNVwq
	r2dzwmhlI8VuQyEMNXYy0WRlwFMpZE5FsKzzadfO0eQ==
X-Gm-Gg: ASbGncux+iwhOnDkFcZkAK1ElhNL0mq5py1vkFcWQCMzTAu7LTJF6FVs7NaFNDeyZVx
	F5DCabk+nKLnbop+4FHVbCgxXDYiJG8ZoBERF9+ocF47Z6WpiACZrZpdtNHcG7JFtHTieOOHitx
	lblKTj9qPV9Hs/6hANuSECP1rBrHa2VnPVXX3b1eliNg==
X-Google-Smtp-Source: AGHT+IHsVqa+gD29cjONjxJZbEgMlY0i24+ipstgNhfx5gKN7pnidM0AFKSkfQYHWJPURtGJ3aMJM/UHyOfnXlJo/Q4=
X-Received: by 2002:a05:622a:1ccd:b0:494:a4bc:3b4d with SMTP id
 d75a77b69052e-4a7c068da06mr59991101cf.18.1750870767738; Wed, 25 Jun 2025
 09:59:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-11-pasha.tatashin@soleen.com> <20250624-akzeptabel-angreifbar-9095f4717ca4@brauner>
 <CA+CK2bBu4ex9O5kPcR7++DVg3RM8ZWg3BCpcc6CboJ=aG8mVmQ@mail.gmail.com> <20250625-akrobatisch-libellen-352997eb08ef@brauner>
In-Reply-To: <20250625-akrobatisch-libellen-352997eb08ef@brauner>
From: "pasha.tatashin" <pasha.tatashin@soleen.com>
Date: Wed, 25 Jun 2025 12:58:49 -0400
X-Gm-Features: AX0GCFsLcQtAKsHQ7E9lthzKpTuYGc0t6y7agESjh9XPOaqb2LPofBMKpqHUGyg
Message-ID: <CA+CK2bA+iEZgs+NjNyzUT2LW5mmP7jOWLPM-=+HyyW8MGKOrtw@mail.gmail.com>
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

On Wed, Jun 25, 2025 at 5:36=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> > > I'm not sure why people are so in love with character device based ap=
is.
> > > It's terrible. It glues everything to devtmpfs which isn't namespacab=
le
> > > in any way. It's terrible to delegate and extremely restrictive in te=
rms
> > > of extensiblity if you need additional device entries (aka the loop
> > > driver folly).
> > >
> > > One stupid question: I probably have asked this before and just swapp=
ed
> > > out that I a) asked this already and b) received an explanation. But =
why
> > > isn't this a singleton simple in-memory filesystem with a flat
> > > hierarchy?
> >
> > Hi Christian,
> >
> > Thank you for the detailed feedback and for raising this important
>
> I don't know about detailed but no problem.
>
> > design question. I appreciate the points you've made about the
> > benefits of a filesystem-based API.
> >
> > I have thought thoroughly about this and explored various alternatives
> > before settling on the ioctl-based interface. This design isn't a
> > sudden decision but is based on ongoing conversations that have been
> > happening for over two years at LPC, as well as incorporating direct
> > feedback I received on LUOv1 at LSF/MM.
>
> Well, Mike mentioned that ultimately you want to interface this with
> systemd? And we certainly have never been privy to any of these
> uapi design conversations. Which is usually not a good sign...
>
> >
> > The choice for an ioctl-based character device was ultimately driven
> > by the specific lifecycle and dependency management requirements of
> > the live update process. While a filesystem API offers great
> > advantages in visibility and hierarchy, filesystems are not typically
> > designed to be state machines with the complex lifecycle, dependency,
> > and ownership tracking that LUO needs to manage.
> >
> > Let me elaborate on the key aspects that led to the current design:
> >
> > 1. session based lifecycle management: The preservation of an FD is
> > tied to the open instance of /dev/liveupdate. If a userspace agent
> > opens /dev/liveupdate, registers several FDs for preservation, and
> > then crashes or exits before the prepare phase is triggered, all FDs
> > it registered are automatically unregistered. This "session-scoped"
> > behavior is crucial to prevent leaking preserved resources into the
> > next kernel if the controlling process fails. This is naturally
> > handled by the open() and release() file operations on a character
> > device. It's not immediately obvious how a similar automatic,
> > session-based cleanup would be implemented with a singleton
> > filesystem.
>
> fwiw
>
> fd_context =3D fsopen("kexecfs")
> fd_context =3D fsconfig(FSCONFIG_CMD_CREATE, ...)
> fd_mnt =3D fsmount(fd_context, ...)

How is this kexecfs mount going to be restored into the container
view? Will we need to preserve fd_context in some global(?)
preservation way, i.e. in a root. Or is there a different way to
recreate fd_context upon reboot?

> This gets you a private kexecfs instances that's never visible anywhere
> in the filesystem hierarchy. When the fd is closed everything gets auto
> cleaned up by the kernel. No need to umount or anything.

Yes, this is a very good property of using a file system.

> > 2. state machine: LUO is fundamentally a state machine (NORMAL ->
> > PREPARED -> FROZEN -> UPDATED -> NORMAL). As part of this, it provides
> > a crucial guarantee: any resource that was successfully preserved but
> > not explicitly reclaimed by userspace in the new kernel by the time
> > the FINISH event is triggered will be automatically cleaned up and its
> > memory released. This prevents leaks of unreclaimed resources and is
> > managed by the orchestrator, which is a concept that doesn't map
> > cleanly onto standard VFS semantics.
>
> I'm not following this. See above. And also any umount can trivially
> just destroy whatever resource is still left in the filesystem.

LUO provides more than just resource preservation; it orchestrates the
serialization. While LUO can support various scenarios, let's use
virtual machines as an example.

The process involves distinct phases:

Before suspending a VM, the Virtual Machine Monitor may take actions
to quiesce the guest's activity. For example, it might temporarily
prevent guest reboots to avoid new DMA mappings or PCI device resets.
We refer to this preparatory, limited-functionality period as the
"brownout."

Following the brownout, LUO is transitioned into the PREPARED state.
This allows device states and other resources that require significant
time to serialize to be processed while the VMs are still running. For
most guests, this preparation period is unnoticeable.

Blackout: Once preparation is complete, the VMs are fully suspended in
memory, and the "blackout" period begins. The goal is to perform the
minimal required shutdown sequence and execute
reboot(LINUX_REBOOT_CMD_KEXEC) as quickly as possible. During this
shutdown, the VMM process itself might or might not be terminated.
With FS approach it will have to stay alive in order to be preserved,
with liveupdated it can be terminated and the session in liveupdated
would carry the state into the kernel shutdown.

Restoration and Finish: After the new kernel boots, a userspace agent
like liveupdated would manage the preserved resources. It restores and
returns these resources to their respective VMMs or containers upon
request. Once all workloads have resumed, LUO is notified via the
FINISH event. LUO then cleans up any post live update state and
transitions the system back to the NORMAL state.

> >
> > 3. dependency tracking: Unlike normal files, preserved resources for
> > live update have strong, often complex interdependencies. For example,
> > a kvmfd might depend on a guestmemfd; an iommufd can depend on vfiofd,
> > eventfd, memfd, and kvmfd. LUO's current design provides explicit
> > callback points (prepare, freeze) where these dependencies can be
> > validated and tracked by the participating subsystems. If a dependency
> > is not met when we are about to freeze, we can fail the entire
> > operation and return an error to userspace. The cancel callback
> > further allows this complex dependency graph to be unwound safely. A
> > filesystem interface based on linkat() or unlink() doesn't inherently
> > provide these critical, ordered points for dependency verification and
> > rollback.
> >
> > While I agree that a filesystem offers superior introspection and
> > integration with standard tools, building this complex, stateful
> > orchestration logic on top of VFS seemed to be forcing a square peg
> > into a round hole. The ioctl interface, while more opaque, provides a
> > direct and explicit way to command the state machine and manage these
> > complex lifecycle and dependency rules.
>
> I'm not going to argue that you have to switch to this kexecfs idea
> but...
>
> You're using a character device that's tied to devmptfs. In other words,
> you're already using a filesystem interface. Literally the whole code
> here is built on top of filesystem APIs. So this argument is just very
> wrong imho. If you can built it on top of a character device using VFS
> interfaces you can do it as a minimal filesystem.
>
> You're free to define the filesystem interface any way you like it. We
> have a ton of examples there. All your ioctls would just be tied to the
> fileystem instance instead of the /dev/somethingsomething character
> device. The state machine could just be implemented the same way.
>
> One of my points is that with an fs interface you can have easy state
> seralization on a per-service level. IOW, you have a bunch of virtual
> machines running as services or some networking services or whatever.
> You could just bind-mount an instance of kexecfs into the service and
> the service can persist state into the instance and easily recover it
> after kexec.
>
> But anyway, you seem to be set on the ioctl() interface, fine.

I am not against your proposal, it should be discussed, perhaps at the
hypervisor live update bi-weekly meeting.

[1] https://lore.kernel.org/all/ee353d62-2e4c-b69c-39e6-1d273bfb01a0@google=
.com/
