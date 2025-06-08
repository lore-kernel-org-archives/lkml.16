Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2956178C9C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749395329; cv=none; b=TCX8mLS2EWFlMyZKLXiF8Q/yq2rcRzhShmD0jZpCo5JFOGROx3dbfS7QZeZDuPZfq5XV6SKmqunbddtQWcpTRFgIkYoKRNy1WYICi6D30tos8yc6Pai5yGjt15vg8Dk6tcGjmwR00dyBY/oq9k3FnH2+FsHn7Yh17RreYr2mPF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749395329; c=relaxed/simple;
	bh=RiBPPqH3cfvIyD2u2C3gJbSOjM0gUID+3lZejJ4EnUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lVqwCGLch3YxMtVj91FxUt1QpdBxy3pPruuXGeFbJ06dSKlbhoYkHIccrLCz3KWzTRf/cHrnqwCyajVQ38z1+A7l9ze/+4v7Moj9B9X6HB3rmQ8izXNyT+kpXtB3ndXpMWITPOGxK3TRt0D0qwwuctk5I7pG8fTTCuoti9laEPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=aLX6eM5q; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="aLX6eM5q"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a43e277198so28835541cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 08:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749395325; x=1750000125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzuRPFYIZRvhRVOmWKy01BEcZ/VAU38+zCshzHdk5c8=;
        b=aLX6eM5qvBiY9fPMLXXaBJC8UcSpmUTerKaf6eKfCfKRbk42mCI65Uc+9aJLuFXnqG
         G1uMLg5GfI/KOG4SD2Wyi3yNzkZnWM42AWekznmvZTM7ClruRaC3mszSLVUvNbIklqc9
         kjs+aUxk7ccTHf7tgLJSnNjQFmuPuzQvDkBS4hxjHnNuq1UjOPa2p2J42TWNZCKU9FW8
         0SDZAwyfwYzwsh7sUUOtdFP9TKUOUQOugqSX+czOgB1Usq5CmnYY/+ViRCJzRuvsGerB
         VuS672lex+Jic7VuGnuvCCD6IytVoDJbd1x1Smn524s7p451/SGRSgjnlvLq17fMFUri
         Jabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749395325; x=1750000125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzuRPFYIZRvhRVOmWKy01BEcZ/VAU38+zCshzHdk5c8=;
        b=CScnLg4dFblbVEBjAPPdu5xuLVQZB1bdQDcrqVR+2rIToDZd0T4ha5J4nMzFi1YjyO
         BtULNxeMGnv+8MgQu0IT0oIl6mqTQA/RXDkSx3awN8lE6o5N4iw7jsw7Aw3ElnLFmsWJ
         v935lmLFa9H6+chAd0fmmXhEInVilzwzSRAVVgxrGiugcGH+5bikeu2hfj8t/mPGUXrZ
         qW+USrEJCg4cLJ6wpwRETlUl44dd72w9SCv0nU9px3vr1XtC40CKp2vFJVJiKwjZA/sy
         gSy63YVVGUSrraMP9vjUz7OfD/S9NEBz670x4eSGoZ0aDNBTAvOLxOZ3zvKPkF61GAE7
         8Cxg==
X-Forwarded-Encrypted: i=1; AJvYcCUrHQDInIDwu1z8IbrREAK2hfrcTObod7FtivmqYMjSIYFbkuFweLOrYspiX9dCjMLedcUcKrPZrp/WEyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIj1F6nh14FyUFTohBS0KNvIGFYD4c6llR0sRD1X9R+DSOuDWG
	Ky7uL9bKkPEEj0oQTc7sDpBc73B65nDYohIKCoaW0XgvUxOjt7KEJSxKAhH8wJiMC5ViiwZx+/v
	ZJliE9aqrfscqKcjuqboXfYiBGyqPLljiKVoiC+R3/Q==
X-Gm-Gg: ASbGncu+eZ+Q/5JADZZWcTmEDNaGvnHGOfgCoDkt4J0Rh5R4PZK/Jpo3O45rP76FZOI
	1WEnpmt8lNN2vKRXT8bjmgLCM9s2yxqkhK6KKV1Jhd/34xLHinmqwrV5YltVzamdEJpEF3ayNrj
	DqvD3AMJXDZWydEYqrfMxH0JAItDOhBw==
X-Google-Smtp-Source: AGHT+IE6Wavjh9lcZ08UG2JWQl0zBb+su/qycW7Wdsq/33CsGFoBpF8qSQTR9wAEzhKeUToBRdcuafqk0yX/KDtvId8=
X-Received: by 2002:a05:622a:411b:b0:4a6:f99c:395f with SMTP id
 d75a77b69052e-4a6f99c3abdmr46534851cf.44.1749395325030; Sun, 08 Jun 2025
 08:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-11-pasha.tatashin@soleen.com> <aDQpfiykuRrk_xnr@kernel.org>
In-Reply-To: <aDQpfiykuRrk_xnr@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 8 Jun 2025 11:08:07 -0400
X-Gm-Features: AX0GCFv10U-Kg40y4yXNpa11mJu1sY2K43SsH2vGJvqSKTOZOwQxZ_Kd2f14iWc
Message-ID: <CA+CK2bBrH6ExCzWMpzHpX6vUFvSW6ca_edR_hzEj84xLw20UXQ@mail.gmail.com>
Subject: Re: [RFC v2 10/16] luo: luo_ioctl: add ioctl interface
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

On Mon, May 26, 2025 at 4:43=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
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
>
> ...
>
> > -/**
> > - * enum liveupdate_state - Defines the possible states of the live upd=
ate
> > - * orchestrator.
> > - * @LIVEUPDATE_STATE_NORMAL:         Default state, no live update in =
progress.
> > - * @LIVEUPDATE_STATE_PREPARED:       Live update is prepared for reboo=
t; the
> > - *                                   LIVEUPDATE_PREPARE callbacks have=
 completed
> > - *                                   successfully.
> > - *                                   Devices might operate in a limite=
d state
> > - *                                   for example the participating dev=
ices might
> > - *                                   not be allowed to unbind, and als=
o the
> > - *                                   setting up of new DMA mappings mi=
ght be
> > - *                                   disabled in this state.
> > - * @LIVEUPDATE_STATE_FROZEN:         The final reboot event
> > - *                                   (%LIVEUPDATE_FREEZE) has been sen=
t, and the
> > - *                                   system is performing its final st=
ate saving
> > - *                                   within the "blackout window". Use=
r
> > - *                                   workloads must be suspended. The =
actual
> > - *                                   reboot (kexec) into the next kern=
el is
> > - *                                   imminent.
> > - * @LIVEUPDATE_STATE_UPDATED:        The system has rebooted into the =
next
> > - *                                   kernel via live update the system=
 is now
> > - *                                   running the next kernel, awaiting=
 the
> > - *                                   finish event.
> > - *
> > - * These states track the progress and outcome of a live update operat=
ion.
> > - */
> > -enum liveupdate_state  {
> > -     LIVEUPDATE_STATE_NORMAL =3D 0,
> > -     LIVEUPDATE_STATE_PREPARED =3D 1,
> > -     LIVEUPDATE_STATE_FROZEN =3D 2,
> > -     LIVEUPDATE_STATE_UPDATED =3D 3,
> > -};
> > -
>
> Nit: this seems an unnecessary churn, these definitions can go to
> include/uapi from the start.

True, but we do not have a user api at that moment yet :-)

>
> > diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveu=
pdate.h
> > +/**
> > + * struct liveupdate_fd - Holds parameters for preserving and restorin=
g file
> > + * descriptors across live update.
> > + * @fd:    Input for %LIVEUPDATE_IOCTL_FD_PRESERVE: The user-space fil=
e
> > + *         descriptor to be preserved.
> > + *         Output for %LIVEUPDATE_IOCTL_FD_RESTORE: The new file descr=
iptor
> > + *         representing the fully restored kernel resource.
> > + * @flags: Unused, reserved for future expansion, must be set to 0.
> > + * @token: Output for %LIVEUPDATE_IOCTL_FD_PRESERVE: An opaque, unique=
 token
> > + *         generated by the kernel representing the successfully prese=
rved
> > + *         resource state.
> > + *         Input for %LIVEUPDATE_IOCTL_FD_RESTORE: The token previousl=
y
> > + *         returned by the preserve ioctl for the resource to be resto=
red.
> > + *
> > + * This structure is used as the argument for the %LIVEUPDATE_IOCTL_FD=
_PRESERVE
> > + * and %LIVEUPDATE_IOCTL_FD_RESTORE ioctls. These ioctls allow specifi=
c types
> > + * of file descriptors (for example memfd, kvm, iommufd, and VFIO) to =
have their
> > + * underlying kernel state preserved across a live update cycle.
> > + *
> > + * To preserve an FD, user space passes this struct to
> > + * %LIVEUPDATE_IOCTL_FD_PRESERVE with the @fd field set. On success, t=
he
> > + * kernel populates the @token field.
> > + *
> > + * After the live update transition, user space passes the struct popu=
lated with
> > + * the *same* @token to %LIVEUPDATE_IOCTL_FD_RESTORE. The kernel uses =
the @token
> > + * to find the preserved state and, on success, populates the @fd fiel=
d with a
> > + * new file descriptor referring to the fully restored resource.
> > + */
> > +struct liveupdate_fd {
> > +     int             fd;
> > +     __u32           flags;
> > +     __u64           token;
> > +};
>
> Consider using __aligned_u64 here for size-based versioning.

Good suggestion, added.

>
> > +
> > +/* The ioctl type, documented in ioctl-number.rst */
> > +#define LIVEUPDATE_IOCTL_TYPE                0xBA
>
> ...
>
> > +/**
> > + * LIVEUPDATE_IOCTL_EVENT_PREPARE - Initiate preparation phase and tri=
gger state
> > + * saving.
>
> This (and others below) is more a command than an event IMHO. Maybe just
> LIVEUPDATE_IOCTL_PREPARE?

Renamed.

>
> > + * Argument: None.
> > + *
> > + * Initiates the live update preparation phase. This action correspond=
s to
> > + * the internal %LIVEUPDATE_PREPARE kernel event and can also be trigg=
ered
>
> This action is a reason for LIVEUPDATE_PREPARE event, isn't it?
> The same applies to other IOCTL_EVENTS

It is.

>
> > + * by writing '1' to ``/sys/kernel/liveupdate/prepare``. This typicall=
y

Oops, this is a leftover from LUO RFCv1, fixed.

> > + * triggers the main state saving process for items marked via the PRE=
SERVE
> > + * ioctls. This occurs *before* the main "blackout window", while user
> > + * applications (e.g., VMs) may still be running. Kernel subsystems
> > + * receiving the %LIVEUPDATE_PREPARE event should serialize necessary =
state.
> > + * This command does not transfer data.
>
> I'm not sure I follow what this sentence means.

Fixed

Thanks,
Pasha
