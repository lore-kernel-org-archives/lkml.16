Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E283A195808
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952115; cv=none; b=hSoHcc/3MrSWJR3yv5L5923l0vxSiSHBHw6+SGReMjaQMowyRgp4kNqlnkOhkNTENnnzNVpxypwhQvoPLrAsvzaX2Ncu3QnBv13R8wzsdtQDZko4jFTwODr+Bk0lwk4h3FQ5ebCnTEcFf/RKmp1DBlN1LSnDK56edz0JEy80H2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952115; c=relaxed/simple;
	bh=I77S/CC8CoEfIRGt2SJjVG4saUAsAKj2JTZZirWuCSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIeLz/qj4cMnJD81hBEFWMqP/nRZ+hLWgjTzqs3QZPiEWPLt4kYtsQaIxXtu5mmUny695NGqtbZHKZ3INdEc3BNrqFkdxG4mXrm47IA8uWQN72/iJjbjlLA2MJ3RMS7Xd2QoA8T7MmS7veXHxAvYuqS8QH8nxHxoGbVZuXT3bT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Bl0TyWsI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Bl0TyWsI"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so26119905e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 10:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738952112; x=1739556912; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hfNNfTRcuZ50Awu1MA8ah0JjMk2WSG6zS37X4vbd0AI=;
        b=Bl0TyWsInH4BXnfLRTECgo82w1q0neceLZYkCvBCfm8Jjv5kc0KhsP66pE6UbQ420n
         II9nO57uKxqFC7jUJSsNc7AELUcbOZlhkLzIjgnzT4uHmHyHh5BeGQyM0sKDI7pVLg3+
         xMBtr7fdTvTu9XamLVzfw0DgE33Fj5uDxYegvFlvlI/6TJl5KMMztkqHi3ecQUc5r/0h
         zlgN2X4/WpuGzvBSEzAUZwiaKWcmEH9skQsu2cLCtPTzDU5CVPUsowZhlEfUwNvupimp
         aWyFz/Z0VJvE6g86BmrYTZXvt3UjLl4FokXu1UmaeGZo/2GQTKPI1VBlXcQL3AnAPEd+
         MqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738952112; x=1739556912;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hfNNfTRcuZ50Awu1MA8ah0JjMk2WSG6zS37X4vbd0AI=;
        b=HxqGKp2aF0zIlWFw2D46s+Sj7sQOJ8YInk9pXZR7Af2/9c/6+16dr37yI5iqQBe5pz
         xKJbsopA/s+wmrQsx1sy08RMwB491TpNPt32bllibSmFdwE+Ioyg41W2HikqNN/1s9Nb
         /vddgPYCtIWzeeBKmVrxrCVJKJ/R0Mt4yeKNa/j8IMZ/We0stxu54ZHWLG8rFZ+SoBvj
         KpKZxNm4B2cEa8NZUYzowFY1zdFm5r1hBjqLeLyGB43tXTGsqysTGHjWhbSGWY1lETSv
         k3ZqDV8HqpC9ahxd5Lvc2vTOmyz+c04Sc4FCdYL8qlCgIE4C0pvWB8lSa8inInZT7DqA
         PHbw==
X-Forwarded-Encrypted: i=1; AJvYcCWasWTkTQv5LIUaDvAhcVeIhDgsczlY03q0gqYT8e9iqibJbKuiuhwuvPY13Lb/Y8I+mZGFYtVgGSeGjZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSKLcesbCqvEScg26XN+e9b6rci90Flr8lz0vaPl55LaMDtIsN
	BzYxKJl+nNVZ7FFliNGE1/HsLIRJHhNyL7zSUt/QjAeM3XM/a0Q/ToZ1b/tXdZo=
X-Gm-Gg: ASbGnctBayhzzmqvVTjXwxxz0GRgwhuRJI3oeIr6kIMBr7vK2qjNvHWKLoWAK4f7E96
	v3NahXoF/YHqtWyNyJ6qS4ACTDoaZYwTG6t9xNBuCYosZvGWpbzn5UN6gSgQOR4Xmggr+OfgEoP
	OGM52Nt6y4l0o7wawh7OGwgO+DFGHzWt4s7kmWtu18SshKAsA44kzBUynWaS1vEoLkUybVDOo2B
	bMg0ZceMFjsUFxPfTbpADRT6VD0mDHy775VyYR5VHlDA7CKyeLnMeooc2ISno5MYAeaGQrBv3/A
	hPHETP0iBnpfzXyFIpIE
X-Google-Smtp-Source: AGHT+IG9/anMAZ6jBKO14yIerC1k3wRGRjYOqfPrrfTTy+DzxQn+cFCYD3jAseCl4Ag2HTXQ0Khgqg==
X-Received: by 2002:a05:600c:1e01:b0:436:6ddf:7a27 with SMTP id 5b1f17b1804b1-439249a843amr36988155e9.23.1738952112152;
        Fri, 07 Feb 2025 10:15:12 -0800 (PST)
Received: from localhost ([2a00:11b1:103b:18b0:943f:8e0:c299:6db0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde33e86sm5200577f8f.97.2025.02.07.10.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 10:15:11 -0800 (PST)
Date: Fri, 7 Feb 2025 19:15:08 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com, jesse@rivosinc.com, 
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 6/9] riscv: Fix set up of vector cpu hotplug callback
Message-ID: <20250207-7d43933438bb9a5a2d6002d0@orel>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-17-ajones@ventanamicro.com>
 <00cbde9c-39b4-4445-98af-70dfd1fbd62a@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00cbde9c-39b4-4445-98af-70dfd1fbd62a@rivosinc.com>

On Fri, Feb 07, 2025 at 06:36:28PM +0100, Clément Léger wrote:
> 
> 
> On 07/02/2025 17:19, Andrew Jones wrote:
> > Whether or not we have RISCV_PROBE_VECTOR_UNALIGNED_ACCESS we need to
> > set up a cpu hotplug callback to check if we have vector at all,
> > since, when we don't have vector, we need to set
> > vector_misaligned_access to unsupported rather than leave it the
> > default of unknown.
> > 
> > Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/unaligned_access_speed.c | 31 +++++++++++-----------
> >  1 file changed, 16 insertions(+), 15 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> > index c9d3237649bb..d9d4ca1fadc7 100644
> > --- a/arch/riscv/kernel/unaligned_access_speed.c
> > +++ b/arch/riscv/kernel/unaligned_access_speed.c
> > @@ -356,6 +356,20 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
> >  	per_cpu(vector_misaligned_access, cpu) = speed;
> >  }
> >  
> > +/* Measure unaligned access speed on all CPUs present at boot in parallel. */
> > +static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
> > +{
> > +	schedule_on_each_cpu(check_vector_unaligned_access);
> Hey Andrew,
> 
> While at it, could you add a comment stating that schedule_on_cpu()
> (while documented as really slow) is used due to kernel_vector_begin()
> needing interrupts to be enabled ? I stumbled upon that while reworking
> misaligned.

That should be a separate patch, since this patch is mostly just moving
code (not even this function was "moved", but git-diff prefers to say it
was moved rather than what was actually moved...)

I guess the comment patch you suggest should go in your rework series.

Thanks,
drew

> 
> Thanks,
> 
> Clément
> 
> > +
> > +	return 0;
> > +}
> > +#else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
> > +static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
> > +{
> > +	return 0;
> > +}
> > +#endif
> > +
> >  static int riscv_online_cpu_vec(unsigned int cpu)
> >  {
> >  	if (!has_vector()) {
> > @@ -363,27 +377,16 @@ static int riscv_online_cpu_vec(unsigned int cpu)
> >  		return 0;
> >  	}
> >  
> > +#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
> >  	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
> >  		return 0;
> >  
> >  	check_vector_unaligned_access_emulated(NULL);
> >  	check_vector_unaligned_access(NULL);
> > -	return 0;
> > -}
> > -
> > -/* Measure unaligned access speed on all CPUs present at boot in parallel. */
> > -static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
> > -{
> > -	schedule_on_each_cpu(check_vector_unaligned_access);
> > +#endif
> >  
> >  	return 0;
> >  }
> > -#else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
> > -static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
> > -{
> > -	return 0;
> > -}
> > -#endif
> >  
> >  static int __init check_unaligned_access_all_cpus(void)
> >  {
> > @@ -409,10 +412,8 @@ static int __init check_unaligned_access_all_cpus(void)
> >  	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
> >  				  riscv_online_cpu, riscv_offline_cpu);
> >  #endif
> > -#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
> >  	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
> >  				  riscv_online_cpu_vec, NULL);
> > -#endif
> >  
> >  	return 0;
> >  }
> 
