Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5CD253956
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454286; cv=none; b=QWdKoat5r0qSVTipfGMp6PXe2YV7ENZzoc1yNWWanlOhMeTbMFwsbvOv/ZRS4ksM5Fo58uhoSTuDYLtcVn7g7+J48mnYoOY95HeswuvpobqUSpon80E8GetIamvp1Lprf8odcMPT1L0fdHdjdaiUJOTbaKgFpXb/oQOiPHHiNJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454286; c=relaxed/simple;
	bh=kIO4kRErh11jy7TmCP0YkdztWKE/kaiytblz1fDz4a0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lcQeHVM0RoAXCqgJnQW3OY0PvbLG7Cnp4TKib5QBViHtgy/L1bEGo1ZaxIThGInWXpEJ6jT6SeC1/pI+zt0GRgIMJgxpr8rea9Am5XVY9CBEAJvgG24Lav0fEbJGmZX8jUFD5UCzTOwAatR85bFaNvIdjiF5WB9Dw6TzTzlPQ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=oPK3CLK3; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="oPK3CLK3"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553b60de463so4907074e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 04:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751454282; x=1752059082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIO4kRErh11jy7TmCP0YkdztWKE/kaiytblz1fDz4a0=;
        b=oPK3CLK3RDQCKYt/TK1SwrNYLnJNgMN2/XBuAYx2DVxT3nqZjg2UYXhDYw7H0Tga+p
         SvBraC/NM46Cn5SPF4xsx1kkUH7RmVSsyqvOvNU5/QbPbzBwDObf4754LWVDjd7gKt8l
         B770v6aBKuPpA3fUm/l9IYRAgYTn2AOqNrOX4cOG8x760hdeqWiW9jTUWYoqirfZZ6H9
         3HxCHTRYTgBI/CVREtIfuqT8eUl+yQRtRV+tUPzdDt6jVwmYX1Ev8pqkwax3UqjfnIaa
         GNDjCi2sMWfKyXJSPcey4PhZ5UUXmmvvvhqM/pGmzQOH9bMaQvGFByxJQLdftqje+oFu
         gQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751454282; x=1752059082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIO4kRErh11jy7TmCP0YkdztWKE/kaiytblz1fDz4a0=;
        b=tAVgVVICxWFjjFqK5XeKpiAryBx6gflly6WoEXL/2Tw3RS7vfHg/aMS8qYfvvnLaUu
         IWk/CvNU2sg21YVBUaH3jpK+rW2i5JmUGSwdQll6uFCfdCR3Oetliby8qp397+U+WnPm
         1AijCWLL5lsQyWcvfCQQR02MuZONX/YeXJkrUEnjwowLyG5pJHGLLextXzHC8rHPvqiO
         sru7oUB3LsM5boihID3ySXWgovSvJFlkWNYWtludzDEe9N1iydTHJIGymks4z0y5w/k/
         fWXRoChomDHcd1enVYknbSx8UM4fKR6FBRFCyzEnv5D3DBxWW6va1N1ay1Hgeew7Lsu+
         CTNA==
X-Forwarded-Encrypted: i=1; AJvYcCXmcyzlgGqhbhJCD45lKmmj+CyOndWHYRkN8fCif6UO8nkDAJ3yM97TgtYbbrYzgIhDoRS9o6+wbLOz3mU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqnrStCaTrGwiz2WcjV74iQdZuZ82/E0PaQ85xrTBV6D0K5Ji3
	AYZ1vKZ7bnijs2PskIHb1MI17RC3rKdX3Ti/M37ljKUPW033dIeXRHjI/gbOXBBS2imHl5soSmv
	bUWfuV2FrQZ8QLjH8MqBbXAiB7Mches3VvYVmN03aqA==
X-Gm-Gg: ASbGncusueHoexcjXHNwvG6lFkVoJjCS7EJia2Y/w4G5UXLCxOL0xnZZnlgmko1993B
	/75aaaBFJmgbHWsHgPG6WjUC8ixZkKaB6U0c47Y4SLURLrNeT+pCIVIKySCqjJtiXXTChlrf9T/
	Ny0CpsKdCv2b7M3VO0LVHMxtVGw6HG4oTt0Wwceg416OeK
X-Google-Smtp-Source: AGHT+IGSDJNqIbDFzqak4r2BGWXjw343zIhJGh0HVunBXOW/GFwnNwsW8KCXGLfWRyUIYjnvV9Y3uHTO0FTpSpd8arQ=
X-Received: by 2002:a05:6512:33c3:b0:553:3621:efee with SMTP id
 2adb3069b0e04-55628376b73mr910658e87.50.1751454282296; Wed, 02 Jul 2025
 04:04:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625161715.1003948-1-apatel@ventanamicro.com>
 <87wm8tmcsr.ffs@tglx> <CAK9=C2Ue36iF8X17n-D70BkMk69bGKb+8dSmro6SEo5i2d+OSg@mail.gmail.com>
 <87ikkcmkje.ffs@tglx>
In-Reply-To: <87ikkcmkje.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 2 Jul 2025 16:34:29 +0530
X-Gm-Features: Ac12FXxlQtBoP2wnUwftAZfKRl4x57RrJbhO7WA0tbv3mASPe9I66ZZKjnYy204
Message-ID: <CAK9=C2U7Ze=q12N+_MM5c+nsJEBkuCoHs-GUsM0qdfVSyR2QVQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip: riscv-imsic: Add kernel parameter to disable IPIs
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 1:04=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Tue, Jul 01 2025 at 12:00, Anup Patel wrote:
> > On Mon, Jun 30, 2025 at 9:39=E2=80=AFPM Thomas Gleixner <tglx@linutroni=
x.de> wrote:
> >> > When injecting IPIs to a set of harts, the IMSIC IPI support will
> >> > do a separate MMIO write to SETIPNUM_LE register of each target
> >> > hart. This means on a platform where IMSIC is trap-n-emulated,
> >> > there will be N MMIO traps when injecting IPI to N target harts
> >> > hence IPIs based on IMSIC software injected MSI is slow compared
> >> > to the SBI IPI extension.
> >> >
> >> > Add a kernel parameter to disable IPIs in IMSIC driver for platforms
> >> > with trap-n-emulated IMSIC.
> >>
> >> Why do you need a kernel parameter for that. If the platform uses trap=
-n
> >> emulation, then disable the IPI muck automatically, no?
> >>
> > Unfortunately, we don't have DT, ACPI, or any other way of discovering
> > whether underlying IMSIC is trap-n-emulated. In fact, the DT or ACPI
> > passed to a KVM Guest is the same irrespective of whether underlying
> > IMSIC is trap-n-emulated or backed by hardware IMSIC VS-file.
>
> Sigh.
>
> > Using software injected MSIs as IPIs is purely a software choice in the
> > IMSIC driver so this new kernel parameter allows users to override it.
>
> Please add that information to the change log.
>

Okay, I will add these details to the patch description.

Regards,
Anup
