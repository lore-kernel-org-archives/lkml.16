Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFFF2139D1
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680610; cv=none; b=HAqt2gFi72P1POxaKck1fln20YwNr/f+LWbsxjmxNbmZ472+M210/Zhd1MWGsnHoDO/86WdCExC9UTVFy72xG3T0OO4tGmjulsRmYJ23IAPlBBcmbMxuBnejt+aJEsRb6EV4sQji8Ik1DkH5FqLnMCwSlOZQPmCMBJWqu8A8stA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680610; c=relaxed/simple;
	bh=nOJm7PkBZEPpoXCGHLNHbKJW+/E6GyUBJzqj9K7/pbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uf3tsJnpcI8r81ktc9osdWOVPDFhlLj/3ojNtNbylrDgPwGeNLQ+Wqq7ame4iqDNrW5r/m0mPYQCLMZkmeYuJLNIyuSjSE0GmHNyIcxwCRXs6o7KAe+dorPgmKBPT0Gy519ek4imOYv+9kozqnOmY/AlMPDSdIh2fbeSXCg4qY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=iT6/WjdJ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="iT6/WjdJ"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30613802a59so62637741fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 06:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738680606; x=1739285406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6qovICTGPEEjhTN07umz778RBWf4L4gwOU9re+tr4g=;
        b=iT6/WjdJKZWw/qje1pycQ8ERYfbhFV4j7PLvswR0+Ol8b+i0XL87+ydstYY/+UHD4P
         bJXJdHiVRMAGcCqldlNrxhMvu7CYPKuLlH+/TVHqQW2KZyxKgKLkjDrBcrp3qbGSTSxT
         1rj+6fIr+Z4Xr56N/eJB/Z4DRey6Tq3okx412uLv7lAbnvJcgOId8BLjfsGxwjmp6GW5
         d2OJ+K4h5enHabBSKFoSuExJZjfQtd6QgJpJhO7puJqx4lSPbDO9BrnM92/tiNbQH5Tj
         wgExkIie9IYQHOulDFW9gbMKKV2vf+cGmQBxL40KyeFB0vCeN99zMvwh4Q4GgrP/NvzP
         MCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680606; x=1739285406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6qovICTGPEEjhTN07umz778RBWf4L4gwOU9re+tr4g=;
        b=nd2raz1psW84nV1onJJagiy8UgejLl1RZ6Owc7m3rrKdUBShk7oHNk+fUd5eQYVgHC
         7P7Hmkd/KOe2cGKcb/LrKqD7uBvLhPhTr14RavNhAAAUC2CWPW7zWvmPrGsuAbgx/FOH
         lPr5T92EK1SZf/GShTedB7s74UH+U5ZHKHGQAM0UfJwsokDf94rKrj/A155AnG1A8xrC
         Ar8qtGI5L9AlUqxqq97/g5lvPCtYJOMDk+ix9I49Zby1HSfu/MTpsWKZxRRDFBeeRuqj
         nCOCb3WFtoogZwyEAaBmqqADn2hoDtEAO7J9KNVnvhkxqvoYN/51RlNMwOPB5GPsnCCk
         IX6A==
X-Forwarded-Encrypted: i=1; AJvYcCVM0Ilel+GkvmY/TQXs+YzhP8lFLqFzatnvyRzQPjM8OliEI9Jqx5dFMJd9nFRghyP/3weqEEqgwFcAlh8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx77gFHOFQWyUQMtFuDiS+rpNHsFMg7rKE9gA4+XISFF69i1Hm
	sqF+Zk8mtlE3GbI0aykyZAEzE0NEPdSsHQkhXTq849t2mMvbXSzzf3LqtAlN20vi7ETadcNso6U
	dDdbGZ/NGLyMlhXr9S0YBx2C2+FEitUIGwuxXjQ==
X-Gm-Gg: ASbGnctMHwgvObajdtsvNduo2tV+/3peRdwJZO+2sFiDUIWvAZ0qobKE3at9/PbqlCr
	ev8b8U7FzHQW0HPHIDPdjEBnUX9kYGi1bClweT+v6PPjU/ZCwyzCHHoIcHxD3M+8+zsrciCT/sQ
	==
X-Google-Smtp-Source: AGHT+IHDEbsYQipfejXqFohjxLWs79QcoPD2kP+1yrW9qYk9n/SN/qyoP+wLyuKonmtT1FmQCmqnzeGwlD2OFASKWU0=
X-Received: by 2002:a05:651c:2115:b0:302:3a28:76cf with SMTP id
 38308e7fff4ca-307968e725emr115509751fa.25.1738680606043; Tue, 04 Feb 2025
 06:50:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204075405.824721-1-apatel@ventanamicro.com>
 <20250204075405.824721-11-apatel@ventanamicro.com> <87o6zinl5o.ffs@tglx>
In-Reply-To: <87o6zinl5o.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 4 Feb 2025 20:19:53 +0530
X-Gm-Features: AWEUYZnsP5bIEqfYtAEgSHeeevhnHrIfy83h-jtA8at0gwbWoWLEsA0X1oOoSQI
Message-ID: <CAK9=C2VgOnSVBRPh+bJBQnGreVYcUh6HWVg1MEzDtfYsuT0s-g@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED
 flag for PCI devices
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 2:26=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Tue, Feb 04 2025 at 13:24, Anup Patel wrote:
> > Devices (such as PCI) which have non-atomic MSI update should
> > migrate irq in the interrupt-context so use IRQCHIP_MOVE_DEFERRED
> > flag for corresponding irqchips.
> >
> > The use of IRQCHIP_MOVE_DEFERRED further simplifies IMSIC vector
> > movement as follows:
> >
> > 1) No need to handle the intermediate state seen by devices with
> >    non-atomic MSI update because imsic_irq_set_affinity() is called
> >    in the interrupt-context with interrupt masked.
> > 2) No need to check temporary vector when completing vector movement
> >    on the old CPU in __imsic_local_sync().
> > 3) No need to call imsic_local_sync_all() from imsic_handle_irq()
>
> I have no idea how you came to that delusion.
>
> IRQCHIP_MOVE_DEFERRED is part of the mechanism to handle this insanity
> correctly. It does not prevent the device from observing and actually
> using the intermediate state. All it does is to ensure that the kernel
> can observe this case and act on it.
>
> The fact that the kernel executes the interrupt handler on the original
> target CPU does not prevent the device from firing another interrupt.
> PCI/MSI interrupts are strictly edge. i.e. fire and forget.
>
> IRQCHIP_MOVE_DEFERRED solely ensures that the racy affinity update in
> the PCI device happens in the context of the original target CPU, which
> is required to handle all possible cases correctly.
>
> Let's assume the interrupt is affine to CPU0, vector A and a move to
> CPU1, vector B is pending. So we have three possible scenarios:
>
> CPU0                            Device
> interrupt
>                                 1) Raises interrupt on CPU0, vector A
>   ...
>
>     write_msg()
>         write_address(CPU1)
>                                 2) Raises interrupt on CPU1, vector A
>         write_data(vector B)
>                                 3) Raises interrupt on CPU1, vector B
>
> #1 is handled correctly because the interrupt is retriggered on CPU0,
>    vector A, which still has the interrupt associated (it's cleaned up
>    _after_ the first interrupt arrives on CPU1, vector B).
>
> #2 cannot be handled because CPU1, vector A is either not in use or
>    associated to a completely unrelated interrupt, which means if that
>    happens the interrupt is lost and the device might become stale.
>
> #3 is handled correctly for obvious reasons.
>
> The only way to handle #2 properly is to do the intermediate update to
> CPU0, vector B and checking for a pending interrupt on that. The
> important role IRQCHIP_MOVE_DEFERRED plays here is that it guarantees
> that the update happens on CPU0 (original target). Which in turn is
> required to observe that CPU0, vector B has been raised.
>
> The same could be achieved by executing that intermediate transition on
> CPU0 with interrupts disabled by affining the calling context (thread)
> to CPU0 or by issuing an IPI on CPU0 and doing it in that context. I
> looked into that, but that has it's own pile of issues. So at the end
> moving it in the context of the interrupt on the original CPU/vector
> turned out to be the simplest way to achieve it.

I got confused because IRQCHIP_MOVE_DEFERRED updates affinity
with the interrupt masked which I interpreted as masked at the device
level. Also, PCI MSI mask/unmask is an optional feature of PCI devices
which I totally missed.

I will keep the intermediate transition in the next revision. Thanks for
the clarification.

Regards,
Anup
