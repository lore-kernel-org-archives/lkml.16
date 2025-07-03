Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269232DE713
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542286; cv=none; b=JQ+w4NevMecHOc8bHZMoOV01YXtNb7Y6njqmPAZAfpLhUAkpHuxdffvXOFNV1GZFKPk9HIPeQbxg77uRBdnkcNjEwcu7WVs+77ADtMO2nhz9NFpqvF/3yFAzSH23kDH9XceLJ6tSnJNk43K2dC3YVzlX2XkZ79LRT4LMmhvuUaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542286; c=relaxed/simple;
	bh=uP7Rr37PuYg5dHU6HWiu9xFkXLAx+9OBBp94Kf1AYzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FOFvnM2EcPH+vL3c5C5sC1JYJFDYepvei5l2tHjoHnn2MGVPrzzOeL44/nPfC1k2ECxc+9VvI14w9VP2LeAb720FHwLhX1r6UrB83U0zFebW2z4SIrOHWDwUYiLmTxJyPwXKD7U/qkvBtS9PZYqr2u/gFStjb8sa+0qW4RCLZSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GkgedwV6; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GkgedwV6"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553bd56011dso520797e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751542282; x=1752147082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPqrBVnVHFXf0pkS74FSHKy1+dZI9RB7aeR+nURK7zw=;
        b=GkgedwV644LcSYvlVXUJHG91vPn58wD7Ml3VXIh3J3BJ5NscTcbUOU/s3UCz9C8e63
         4R0f+9ZaStHCApBH6a70QPJPW6QHkHecf1x1KmLTQgGkyQvUQLZ07S3dxxpiyS8HKuga
         EyBffjayeMxbgUXBpc16Hy0MExVxKwzkSmrWe7uKOtnf7CiT88B31DoI//uzGrs3Wm7a
         zNU4L9DmAAgEOYLxs7WlS97lUJxKg1k+p0z/i/ANw2pB3C0IZTQkf/525Zp+5UWmXjMo
         a+InZGgkuKb36kvcAJRTKsBaURQGRH9Qw0Ucpmyx6dGMIEaf6/IzdQeCgh6WVVp3Sv/L
         FaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542282; x=1752147082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPqrBVnVHFXf0pkS74FSHKy1+dZI9RB7aeR+nURK7zw=;
        b=D1c7ppnd04toPuXfN75fay9Dg/QmofMY9snSnmrv6xx0InhsHvkmiQ+AsmEix7KBH5
         t8jl2/egYF0PaHfgmfySv/GaPdttZ9B45z04DsjfgEBicRAwVlNerNZcJF9dcbSkNKtE
         7XhAsTpDYQEzPZ0Et5jMNQqMslGJ0U93Ez6WXArnG995DScGSuKWRdVKGHB0N/mh1u/5
         wY4LPsCiBpSmSjDqrpPrAtCIoM9FONxBGq4FZFpRYrD8AT87dzxpmi9PekQ9mQNBAV+a
         TY1f/FKhG7G6z/8cIf2MoeCGnGxkdz4v/bKKrPRaa9AfZqNRFp3MxwRg+bdF7BBJ8jLk
         sWVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbFpxLQMvLaWMwlR1K5803Th7PKprP7eGmPlcqfU5SxsjFoG3FDumbkSA1uUvUBzR/yfys4U8QXMrZFdI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Lw3HSFKVCVaXjGuhExJ9FZRQ3iStl953L1qqHz56r4TmjxCP
	qa4zVxhnewWhnKnBcbWB9H9OrmYEdeEgzLDjUfImuHHeKLRDdijS4/ycu14x7uKmBYAFads5TSD
	XjuiD3knKpybydyxq9ckV/MrNpUpIfZgn7OfRT/MuPQ==
X-Gm-Gg: ASbGnctEEg8wXoi5eOs9M3aShzS0UDZ9rZ3VBs8NOBzKndAVBhvMCYnF7fF9PRX57Sb
	bt+O86TXo4Dcio9RWZpdecy3ZL2W5q5AbknrBIzpsBM3OJmK+MhIoeMhchW6X7/N75LG+7Oo2Dv
	QcAajsU9NMgoKwMacN6WPP03xvOfSBEv6WSRVM0Hwg9kK0V3mXWzrtVIdD
X-Google-Smtp-Source: AGHT+IHqwZ00JzaSxoHP5Y5eGO6U1F00cLkLgLHN8uq84JwqyOmuyFj/rx7viXN7xQL8y5yojWgEcXAb4bcR3EsVmBI=
X-Received: by 2002:a05:6512:3e1c:b0:553:cc61:172b with SMTP id
 2adb3069b0e04-55632c67ae6mr203802e87.3.1751542282204; Thu, 03 Jul 2025
 04:31:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702155112.40124-1-heshuan@bytedance.com> <aGYkx4a4eJUJorYp@sunil-laptop>
In-Reply-To: <aGYkx4a4eJUJorYp@sunil-laptop>
From: =?UTF-8?B?5ou05L2V?= <heshuan@bytedance.com>
Date: Thu, 3 Jul 2025 19:31:10 +0800
X-Gm-Features: Ac12FXwmgaLHVh9stIrXQTsWM1XVkm09j05abjeG1jdXSTB5G1pTJuNhmJuU4TA
Message-ID: <CAKmKDKksSTrT=wMBpnqGupe4WRnHosYZLunw0FdVbhW_dyym+A@mail.gmail.com>
Subject: Re: [External] Re: [RFC 0/1] PCI: Fix pci devices double register
 WARNING in the kernel starting process
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: bhelgaas@google.com, cuiyunhui@bytedance.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sunil,
Thanks for your reply! (really appricate it).
This WARNING truly occurred. Through the added debug info, I found
that the device was registered to proc via pci_proc_init and
acpi_pci_root_add paths respectively, which ultimately triggered
the warning message.
Let me try to reproduce it on qemu first. I'll keep you updated.
Thanks again.

Regards,
Shuan

On Thu, Jul 3, 2025 at 2:36=E2=80=AFPM Sunil V L <sunilvl@ventanamicro.com>=
 wrote:
>
> On Wed, Jul 02, 2025 at 11:51:11PM +0800, Shuan He wrote:
> > Hi All.
> > I encountered a WARNING printed out during the kernel starting process
> > on my developing environment.
> > (with RISC-V arch, 6.12 kernel, and Debian 13 OS).
> >
> > WARN Trace:
> > [    0.518993] proc_dir_entry '000c:00/00.0' already registered
> > [    0.519187] WARNING: CPU: 2 PID: 179 at fs/proc/generic.c:375 proc_r=
egister+0xf6/0x180
> > [    0.519214] [<ffffffff804055a6>] proc_register+0xf6/0x180
> > [    0.519217] [<ffffffff80405a9e>] proc_create_data+0x3e/0x60
> > [    0.519220] [<ffffffff80616e44>] pci_proc_attach_device+0x74/0x130
> > [    0.509991] [<ffffffff805f1af2>] pci_bus_add_device+0x42/0x100
> > [    0.509997] [<ffffffff805f1c76>] pci_bus_add_devices+0xc6/0x110
> > [    0.519230] [<ffffffff8066763c>] acpi_pci_root_add+0x54c/0x810
> > [    0.519233] [<ffffffff8065d206>] acpi_bus_attach+0x196/0x2f0
> > [    0.519234] [<ffffffff8065d390>] acpi_scan_clear_dep_fn+0x30/0x70
> > [    0.519236] [<ffffffff800468fa>] process_one_work+0x19a/0x390
> > [    0.519239] [<ffffffff80047a6e>] worker_thread+0x2be/0x420
> > [    0.519241] [<ffffffff80050dc4>] kthread+0xc4/0xf0
> > [    0.519243] [<ffffffff80ad6ad2>] ret_from_fork+0xe/0x1c
> >
> This should not happen. I suspect some issue in ACPI namespace/_PRT. Can
> you reproduce this on qemu virt machine?
>
> Regards
> Sunil
>
