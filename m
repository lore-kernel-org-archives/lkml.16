Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4A918DB0C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738948111; cv=none; b=r2swHeSqCPm78BiLZOWH2n1Vn5Recvc9NGZ2guGQ2hMZNdff7ZayZ7q96TRCL/3Z7ofD2KBJ8V8OfOS8qNNoLgWbj7GK76vpeeHnpaB8Q/IbgV9LVjaYgssrycnK9wd8gVKUMZY3xWLuH2UCe8ZdFrf+1YPKGIFwhcjbATamMWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738948111; c=relaxed/simple;
	bh=jlbv4XcNmbnXnjciEGgrvk+rCB33BUmy1c5btNd5yzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMB3Vz82cg6YPxQZKm+B4eyNM8MuvuKmluctQLLfiaAlYeTj/mO3hSZj55zV3dw3hoJEwL/JQni1A37rsr4IPX/kgYUDmyn+AetFqAT8VR9ConOGBTWPT6UeLz/Rz9HeZKMwFxmSIZw+aJuy4/fGSmq9LWrTJlI9hIiEVsbAkiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=QdSwBkio; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="QdSwBkio"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436a39e4891so16146235e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738948108; x=1739552908; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hzFYQcWwH2Y5uIdZUjghbiPiPqpBNdu4abetnt9RgbA=;
        b=QdSwBkio1Ra/lnnou3VleYRu8byN8f1tPaWbTVADQdpiQn2MNLEqUNkg7yKqx4OBMQ
         DC7e4sDg2EJ7LzdZkQwfZgCd1G2lNKbBjWdqVlZDEpyjNejqUl2S/Jg4gHsNes4AFAX7
         n7DuHKjekXcZjVNrGjaotgzQz61obQ9ZrgKn96FsDW4c3WNsyVF30x0sqdowwQMp5NDI
         fqmS9Mew9Dmq2Q/2c9UQo6D4iXp9zGnqtWY5dQmv10C82W/22iyq3hB1qq6ESgvDAN3n
         TqR7vBjI2J3TlpcOxcnVW5rOwVK8qcu/8oOzQSZbBMsl5f9k67iFg4Bq9uS5go49LvVP
         v6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738948108; x=1739552908;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hzFYQcWwH2Y5uIdZUjghbiPiPqpBNdu4abetnt9RgbA=;
        b=Y9yE71F11m58Q0kQqYLSzIqAzmm/13+XEfJgNs3Em7LNjosUSTFL0HwIuBk/fLP7YC
         75dISi8+0UB6Mj+a9xWvkGVdGSLRIkanMe7xmEUcLLULmVMT4TkeAlY7VRsQ8Q+Oo4Fq
         vWLpgPADoewAt2N0/pnh0qkUdy33gB8xE2z0LCgyFEgkAU6jQImf6feDakaEL2I1YK9k
         2EgPdL1X1c+rVb60rX3ONTRm3Rzlw5ROWeQyUT7LrBAJLDW7hfO+Be8pNW9vWpzWei7c
         VmpMpnPrIXvr0NTdKUqTUOPVxICXgv/cCn4pGHoTEpQP/TZw39bW/Olw2HW60s8ooTOI
         8UyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGHvX5BZKCE3P5QEP0xFi0ZTI4QV0AddIyW0b7K0SmWgn26jZIiRp56nkuVSZnenzJH8YOxpxPqsiR74E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJENJfptN9hvrNdjNP/VlVAPQi1KgKgl0sbU4YWkmAA/TSdj75
	8IX8SsTB1HE7Iqy5IMl5XmxBuCJg+pqRhukef1WKqxCitFim4sz0/Rg/H+UKanI=
X-Gm-Gg: ASbGnctkM67xVSmJpXBo8OXA1MxaPwK05Oy/CbE9EFLw+FUxRm3PylVqzVAoDZLvFjy
	dLMt3+NxXX5bdMQ0s7lDyEIVc9VVaEmEOaBByjBYVznHUnQdPgP1GAxRqXb6Quc5NV3Nvc7aCSI
	fjDIxtcLI7WFS+hGYdia8bsJW0mAGGelji1KMtLT9Mp9avZYi4FOHx3dMvBcNICVkfbAlsnT7CX
	A47InfX3O6EpCT6oy2owUz5vznSTihwdY3WuacH4hAYr1UKvWhLOa/D9dYWQM0BuFmJdpZWdqpQ
	x8DExiUFIzHWp6aWJAxh
X-Google-Smtp-Source: AGHT+IEOQqTcT5a5Iq3DF4THEtYt1FSKEZXvl2qDY1SvH7aPo5nTk6ZuygmQqzsZsTb2UCMreC3zbA==
X-Received: by 2002:a05:600c:a0a:b0:434:a525:7257 with SMTP id 5b1f17b1804b1-439249abea0mr29321785e9.21.1738948107886;
        Fri, 07 Feb 2025 09:08:27 -0800 (PST)
Received: from localhost ([2a00:11b1:103b:18b0:943f:8e0:c299:6db0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd802csm59164785e9.34.2025.02.07.09.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:08:26 -0800 (PST)
Date: Fri, 7 Feb 2025 18:08:22 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com, jesse@rivosinc.com, 
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 2/9] riscv: Fix riscv_online_cpu_vec
Message-ID: <20250207-f0e7e2b868ef3e9f2a174f29@orel>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-13-ajones@ventanamicro.com>
 <1a4de5bb-913d-489a-ac96-3f4dec48cb2d@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a4de5bb-913d-489a-ac96-3f4dec48cb2d@rivosinc.com>

On Fri, Feb 07, 2025 at 05:47:28PM +0100, Clément Léger wrote:
> 
> 
> On 07/02/2025 17:19, Andrew Jones wrote:
> > We shouldn't probe when we already know vector is unsupported and
> > we should probe when we see we don't yet know whether it's supported.
> > Furthermore, we should ensure we've set the access type to
> > unsupported when we don't have vector at all.
> > 
> > Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/unaligned_access_speed.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> > index b7a8ff7ba6df..161964cf2abc 100644
> > --- a/arch/riscv/kernel/unaligned_access_speed.c
> > +++ b/arch/riscv/kernel/unaligned_access_speed.c
> > @@ -367,10 +367,12 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
> >  
> >  static int riscv_online_cpu_vec(unsigned int cpu)
> >  {
> > -	if (!has_vector())
> > +	if (!has_vector()) {
> > +		per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> >  		return 0;
> > +	}
> >  
> > -	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED)
> > +	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
> >  		return 0;
> >  
> >  	check_vector_unaligned_access_emulated(NULL);
> 
> Hi Andrew,
> 
> Wouldn't it be easier just not to register the hotplug callback in case
> !has_vector() ? In which case just set all possible cpus
> vector_misaligned_access to RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED
> at startup.

We could do that, but I have another use for the hotplug callback that
you'll see near the end of the series.

Thanks,
drew
