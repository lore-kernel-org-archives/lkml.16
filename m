Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826291DB92C
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748578517; cv=none; b=qIvK2OMyaV4YXetrnlYJslZzzkKXARKAA3Q89P8wrKaj+RRBqJtlIfX0ZcoKcxZsp9n6oMegLE/Znu1+XU9rUtLfeE/RGwxtbZfA1jE6ncStFPkIfzC+Ksfwk5bOJlzlNWGvOn00EoecsoHwUTaUPPs/xA/E7itgK+IxANhP/hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748578517; c=relaxed/simple;
	bh=ME5ccnIAVYQSz3b4RI9mFcQVxdpBwo1MysYq1/2Wgvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RB/TKzgftYHUpEr8DNlAUF5SCX7cKqzrlEuhR2k8j1mHeCqsWQVq+2w1UvNdyidFBey/Y3aKsVofTEApE7hpcBwtadBMz+FvVvBKCKoG5zNOEh3iViMA9jK5550xoXXJMIxhBPqRzpxxiTeABVd7oMWqlYXqOPZsoaK6fqMuqRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VCZv3pw5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VCZv3pw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748578511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BEb33DDg7DpFW9LjvXELe8JW6iZ+vyGYUAOVA6/mv7c=;
	b=VCZv3pw5AfjzSyPYwp0oAfZC7JEToFiqrq1RluiWr+ghXLAaqNGURdEDx13riFRUlq//1Y
	hm81u5kYdeArXCQ5x24TgjotvIztMZv6zWFGLPeVQP4RF7sjtlEcX8FTlV1XCohp927GBI
	Jc37plCbmCq1q64KwPCxZX8gbAt+Glc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-xBT8DwJrPki9jW40kFRuNQ-1; Fri, 30 May 2025 00:15:09 -0400
X-MC-Unique: xBT8DwJrPki9jW40kFRuNQ-1
X-Mimecast-MFC-AGG-ID: xBT8DwJrPki9jW40kFRuNQ_1748578509
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31220ecc586so1187532a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 21:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748578509; x=1749183309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEb33DDg7DpFW9LjvXELe8JW6iZ+vyGYUAOVA6/mv7c=;
        b=nolIaBONt/m6TENWC8dQHrjXypT2gX0VpooW+CzKKUsJa+QIgsjKmdK7nHT4vG1o6d
         TJyu5pwDOsaSKrSnzRcledRMgzoX0Gk5b1i4EuyaSBfIyO8ZSOF3vyWNEYzSsjkiBiUL
         1z5g32MG9KmUXcOWPSR7j2uvvQaLwQbP3BnTxPtNshU1OdzvDAc9i2wxR3OvMMq5Xu4h
         wsLeSl1I/Us3V94DtjVbNzlzzvkCV8/6V4ViAisGTbrhHAhMG4A07Wnm79RZVsWcZ1Ae
         Nhx/d1XsqsrwCGHjnX/BECUiDB9fV19mBIQ+1NP0UibepO6Maq4cCF6mvAp74n7sPgyJ
         XH9A==
X-Forwarded-Encrypted: i=1; AJvYcCV7P9BhV3U/mAcSwm7iUK/fPonotlBTdRes023LXc/pYHAqWPXtJIF7gSU5tN9IPJQxjWdEGGqD2SD5npw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5teENOxzLXBYvI2Cd9F5GL5RtLG8NSvZVWba/opFd24+J8G4V
	kH7uOvZj2YouVA/FvIFARjMwjLR6NCZxm/4vEpzvxCp5QWPBWspX7rcZjCjp5qcvwJ4DaFM3bVs
	5+q4RXzvpdmNl22gGih26a88qF3xB8pgrYjAh2oxlVGo8U+PGJCNUBVOyBZojfANvHWRLXutL7m
	UbW/PWQGIGb9D+Hf0gKpzphhC82R4EYQG2rIW+o1FA
X-Gm-Gg: ASbGncutD3ooMR0Rg4P07O4N9PmuCtGfWslK+qs1OZ+xgwVOhvrEK48eJRQNb4R0OKq
	NdF8juAgUjRqwdUC990GO1ErzHndtpet7ISwtXSaxiI2AlOVAGqjxCH0r9y9oqhUtrdjCgg==
X-Received: by 2002:a17:90b:58eb:b0:311:f99e:7f4e with SMTP id 98e67ed59e1d1-3124152f29fmr3271297a91.16.1748578508610;
        Thu, 29 May 2025 21:15:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdNkL/QOg0pgwhpFjclJbxX9yS+kdBsgXT9/3xp4M+RVHKQ3aStcTn4xx15LUWcuWRLmKhhRfllSzauASBpmg=
X-Received: by 2002:a17:90b:58eb:b0:311:f99e:7f4e with SMTP id
 98e67ed59e1d1-3124152f29fmr3271262a91.16.1748578508205; Thu, 29 May 2025
 21:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515233953.14685-1-bhe@redhat.com> <aCaFNvHbYxrCaPbe@MiWiFi-R3L-srv>
 <1d2848fe45dbf58707cecf16c4fc46b179e24415.camel@linux.ibm.com>
 <aC6Y3S9hEB1snvwj@MiWiFi-R3L-srv> <c0f1df02160138d0782cb897eda844287b3d7792.camel@linux.ibm.com>
 <aC86NSypHlER2C3L@MiWiFi-R3L-srv> <CAF+s44QHJs8J27TEy0AW1m2wT=LRSz59nHf-8AuqL8px_zKGUg@mail.gmail.com>
 <0e794fc984c8f37a6d3eb5acdb6cc094f14df940.camel@linux.ibm.com>
 <CAF+s44Q6ZJ8rdi1VG40JVJmxX-1hmss5eNaKvGhJSOS6xYLx-g@mail.gmail.com> <91a9aa935b3a194c57a166133c9c1a537a9ca802.camel@linux.ibm.com>
In-Reply-To: <91a9aa935b3a194c57a166133c9c1a537a9ca802.camel@linux.ibm.com>
From: Pingfan Liu <piliu@redhat.com>
Date: Fri, 30 May 2025 12:14:57 +0800
X-Gm-Features: AX0GCFu-M8N1d-FrbfO4Ax_Xw2IAE_iVpqDIOOmbg0VDp3GzgJjExVn2UQM-Mb0
Message-ID: <CAF+s44TOjC60hfTU2JKQrfiogUin5E=O7XvePb86Lv7jjobJ1Q@mail.gmail.com>
Subject: Re: [PATCH] ima: add a knob ima= to make IMA be able to be disabled
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Baoquan He <bhe@redhat.com>, prudo@redhat.com, linux-integrity@vger.kernel.org, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	pmenzel@molgen.mpg.de, coxu@redhat.com, ruyang@redhat.com, 
	chenste@linux.microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 10:32=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.com> w=
rote:
>
> On Thu, 2025-05-29 at 12:13 +0800, Pingfan Liu wrote:
> > On Tue, May 27, 2025 at 10:18=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.co=
m> wrote:
> > >
> > > On Tue, 2025-05-27 at 11:25 +0800, Pingfan Liu wrote
> > > > > >
> > > > > >
> > > > > > We're trying to close integrity gaps, not add new ones.  Verify=
ing the
> > > > > > UKI's
> > > > > > signature addresses the integrity of the initramfs.  What about=
 the
> > > > > > integrity of
> > > > > > the kdump initramfs (or for that matter the kexec initramfs)?  =
If the
> > > > > > kdump
> > > > > > initramfs was signed, IMA would be able to verify it before the=
 kexec.
> > > >
> > > > IMHO, from the higher level, if there is a requirement on the integ=
rity of
> > > > the
> > > > initramfs, it should take a similar approach as UKI. And the system=
 admin
> > > > can
> > > > choose whether to disable the unsafe format loader or not.
> > >
> > > Yes, that is a possibility, probably a good aim, but in the case of
> > > kexec/kdump
> > > that isn't really necessary.  As filesystem(s) support xattrs, IMA po=
licies
> > > could be written in terms of "func=3DKEXEC_INITRAMFS_CHECK" to includ=
e the
> > > initramfs.
> > >
> >
> > Just aware that we have such a cool feature. Thanks!
>
> > I checked the code. IIUC, the relevant code has already been in the
> > kernel. And the thing left to do is to install an IMA policy, right?
>
> Correct.  The problem up to now has been that the initramfs was created o=
n the
> fly on the target system, so it was impossible to remotely sign it by the
> distro.
>
> >
> > But there are still two things to be considered.
> > -1.The UEFI partition is FAT format, which can not support xattr
>
> The normal kexec/kdump kernel image and initramfs are stored in /boot, no=
t the
> UEFI partition.  Is that changing?
>
I think that is the case if grub is used as a bootloader.

But officially, only FAT32 is supported in the UEFI specification. So
if a UEFI application (let's say systemd-boot) tries to load kernel
and initramfs, then boots into kernel, it can only expect to read
these files from FAT32 partition.

> e.g. kexec -s -l /boot/vmlinuz-`uname -r` --initrd=3D/boot/initramfs-`una=
me -
> r`.img --reuse-cmdline
>
> > -2. Just like in the UKI case, the kernel fd content is not necessary
> > for the kernel image itself. The initramfs fd can be used to pass some
> > extra data if we use a temp file as a package. So checking the
> > signatures at the initramfs level will block this usage
>
> Sorry I lost you here.  What exactly is included in the UKI signature?  W=
hat is
> this initramfs fd extra data?  Is it included in the UKI signature?  Can =
you
> point me to some documentation?
>

Sorry for the awkward expression, let me clarify it.

It is a pity that these things are on the fly and there are no documents ye=
t.

With the advent of UKI, which encapsulates the kernel, initramfs, and
cmdline into a single PE file, the original kexec_file_load syscall
schema no longer aligns with this design.

SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
                unsigned long, cmdline_len, const char __user *, cmdline_pt=
r,
                unsigned long, flags)

In particular, the kernel_fd parameter no longer refers to just the
kernel image alone.
And the same thing may happen to initrd_fd.

In essence, it means the redesign or re-explaining of the
kexec_file_load() interface, but for the time being, these things are
on the fly.

Thanks,

Pingfan

