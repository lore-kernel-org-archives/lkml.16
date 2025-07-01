Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A141E0DEA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351426; cv=none; b=GKg+oSMnQkbjVpCCUHIAXD0nBWZ2WaSr8hDhrkLQBsxAJqdXS7Qm++/15zkB4V4lSKtqIKJlTnTJIrZyo6Wq967Nxt+0/wglp9Dt+oQKDmX4I2Ec841MdTpAr99XF5cYWgAZsOTsC3x2e3dVD4IRmOVoqs6nlceHbrFSreWVJZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351426; c=relaxed/simple;
	bh=/jymfu3xRxUL4nTv5dvSQBmcbQG4COg2M3oUtazcjnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i2UOguHPFXNedp5FoIic9NV6a0+9mEbwbEo4z7vifSA21G1JCkMw4/7XR/1hfiidxI0Ko8KK8kF8+7in8hfZRHhJcPuObs8UfrtVZ33qQPBWRmj/3bcL+Ee08OLYQc6xUi6O0QJi6dLaEWVW8Kk6p3a/Vgetyaad/5Ax5XDmlfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=JvpgWZsI; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="JvpgWZsI"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55502821bd2so3298532e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751351422; x=1751956222; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jymfu3xRxUL4nTv5dvSQBmcbQG4COg2M3oUtazcjnU=;
        b=JvpgWZsIJFJ9VS/DKqAYe8YiZb63CMCUKXvGJT9eFwv6MprzkdD/o5Qa7GsETny4jX
         k+kGV/JK/VhQvHc4aUjz6EnoP2FejdbOHagajKGfwbTFVoBDpDp/H2uiIrhKD+gNGkq8
         pnOlPawYxc6fALHxherJ2ICajiA4DHjoj01bCVINHQGlqWBxPR63KpNBAqAPv2KTQeog
         cemZNXO4RFgoYetk7GguMlBhMn6E3xf2OGeggJpC+wN4WkMJvjc0b2+SusgBgPQhKb6E
         oDCMHRaCBuJhKzBBwLnTR1iBrZN8ZZEzS8bpzocjmqicls5XuPjQxA3BGc1TLY7VSRyn
         /p6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751351422; x=1751956222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jymfu3xRxUL4nTv5dvSQBmcbQG4COg2M3oUtazcjnU=;
        b=ETd3IV1WWyMcRowDCUF8H15LAxUx4WjgZI1sRztVnkI6wqQ9yLyTBf+ZOZJeWKghc9
         Xyo7WhFiqi+LC72Gk3Pb32pH1gnsIzLadVPaq4yB63a5qeoA4mjN+LMtrhMgkF1x8b4k
         wWEP/SPfzZE4Cwxk9hSlTu0lT7BRHyLN5K310+q4Q1iBiVWHSVCU/ocA2M0Uxs0DrYLp
         vGtNV029y6QXECxqWFtHzVmB30epPAHKylbUkpI/xMdTeb8r5Frkk5g4J3t9Vm7TRjkZ
         ggX9pvRRZ7T7Vz9XNEdt5TmwOGmyXH48JkOLZ0tgqKmAE5lU3JycTuhOmhjq2vx7mLo1
         Kyag==
X-Forwarded-Encrypted: i=1; AJvYcCU2oIQxKHe7BuyqzqxKvfvBSRMLnHrrGQADNv6ceod2aZKw+7Bml3+aTtY9ILTNUOmfFVrTNwYsYtLaoSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK/pGwWn1rG+e8vPPag6gnjJNnj7fuZxtvgoysmofyJ5NBImU7
	Mr5XfwjB7a/U/WaCBylRQi5wi8h1h0ZtGc00JuGLKzKU+HG5O34Ziaw6sTmCHTWJhvvb17a1o+a
	Blph+Rta4X1boYNeMH7aTB2gqRrFOkYAhCdLsEVuX+w==
X-Gm-Gg: ASbGncsSlPHYfVtqFb4wGa+HVwlQwGL/jwgsy1snjfyiPBqRa9BtuHk9iO6MX0HdPtN
	w48SRVTNx+xPfbXIlN6KzrL789ilv9WeXArip0aSRIhAt02/4ljfkgFE0lguLM5P7o8vYs58rbQ
	a1tnHMzf1nTv82MmjbmRwMt1rr8GMxssh0w6X3s5t+BEIy
X-Google-Smtp-Source: AGHT+IGH+LGsRYJu48HNl0J1fqNWuehHDcqXDQ2apcZ5zy2p4HTOSTuf2WNZWxIzC2FQvJFiTjte6PqMiOdGmU15sTY=
X-Received: by 2002:a05:6512:acd:b0:550:d4f3:84a6 with SMTP id
 2adb3069b0e04-5550b89706bmr5181580e87.33.1751351421803; Mon, 30 Jun 2025
 23:30:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625161715.1003948-1-apatel@ventanamicro.com> <87wm8tmcsr.ffs@tglx>
In-Reply-To: <87wm8tmcsr.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 1 Jul 2025 12:00:09 +0530
X-Gm-Features: Ac12FXxY7r-9px3Hqf4aneQ_IL7BH8XKIbw1hzdqfKKMngLAn19g0L7LHBLnNaM
Message-ID: <CAK9=C2Ue36iF8X17n-D70BkMk69bGKb+8dSmro6SEo5i2d+OSg@mail.gmail.com>
Subject: Re: [PATCH] irqchip: riscv-imsic: Add kernel parameter to disable IPIs
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 9:39=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Wed, Jun 25 2025 at 21:47, Anup Patel wrote:
>
> $Subject...
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-=
subject
>
> Is it that hard?

Not sure why I chose a different subject prefix this time. I will update
this in the next revision.

>
> > When injecting IPIs to a set of harts, the IMSIC IPI support will
> > do a separate MMIO write to SETIPNUM_LE register of each target
> > hart. This means on a platform where IMSIC is trap-n-emulated,
> > there will be N MMIO traps when injecting IPI to N target harts
> > hence IPIs based on IMSIC software injected MSI is slow compared
> > to the SBI IPI extension.
> >
> > Add a kernel parameter to disable IPIs in IMSIC driver for platforms
> > with trap-n-emulated IMSIC.
>
> Why do you need a kernel parameter for that. If the platform uses trap-n
> emulation, then disable the IPI muck automatically, no?
>

Unfortunately, we don't have DT, ACPI, or any other way of discovering
whether underlying IMSIC is trap-n-emulated. In fact, the DT or ACPI
passed to a KVM Guest is the same irrespective of whether underlying
IMSIC is trap-n-emulated or backed by hardware IMSIC VS-file.

Using software injected MSIs as IPIs is purely a software choice in the
IMSIC driver so this new kernel parameter allows users to override it.

Regards,
Anup
