Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7B226BDA6
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739264686; cv=none; b=gpZbTKkTenIw0yO3CrOBIiDVhxKcPaX8W/62X+DG1gcOWiL90YNwKufEkLGTyNc/VV+O5gBXHwOM+AuV2csNZvrTAh1zWqcTir0pm3QDOGkvsWJkZXiPBroCv7uSNAcS7kIkn5Yzqr8DNiCyNXG+qKhf5yPlLfmxhrmoqVqg5HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739264686; c=relaxed/simple;
	bh=ejYZ6yNeyBXmiFK353aLAl8zXZRsfmM5p0F8KuhBomc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IucfcyEyKf6rFiELSNKmtVZhy5FCzUB+aeaDxk6k9bDeeeEtie5aanhpPP9tBqLtLH28gVP785DI3T2wVjDxCi3e9AWtrP/3SN/kKfbFyMVPz6UZf0MhgVH7CP5e72YpIqbEcqlrziecruUYx3MOvf3M4ytx603yOYTevTqxoek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=cOvXktm/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="cOvXktm/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394829ef0fso9222275e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739264683; x=1739869483; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1ayvVDmrwmcN9il9K7YbVSe6dt66ENiQTnWfgs8AYN4=;
        b=cOvXktm/taJgMrAhZiMEM5szyPqwRW+TtWUC3VJ5Svl7UXsZSRGUKYFQD/EPOSL1hg
         ki4oBNJDXkydhfKmVSxOaajd5vVx5McjDH9WxYyFfjPKB8Er77DamVBGzxjo1kQy8yp3
         9WDdtrZE0wq3QHm2zSYEfL6pxk3raacOPapOdgnl251c7Kll95DePXe0T98DIc0kPJMU
         xeN85FC5n7IO9huipJ74Ybo2OS1zARQT0fNTS/DmYKyzs/vClHTtxJBSsJ84rPNQ/I+W
         MxZc5zU9U2RuNJYaI9f9jE0aE+VUZjOwiRgEu0yDHHBb1iuOwHNJR/InY77MKSqc68Lr
         UU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739264683; x=1739869483;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ayvVDmrwmcN9il9K7YbVSe6dt66ENiQTnWfgs8AYN4=;
        b=WQnbfgMmlFq320I62P/VOH9WpS4qBLvDmSaPlETiyqg7TCCbliJeBeTaBcUSxtkgUl
         vEvQwcnrYMzO+8k4mVius0WMd+qkdI3SJ2n16ctKRb8XKc27Sci6vMytrdXX4uX44R2o
         cQlRnelRxPOe7MAzzaJHbnSE0bYCtGZhM57LC14A/E9+zHMZTp7mgEGY1vLvi+TMmDdA
         Ahop1t1kYDwnOPEtvz85MwGx3boJb0g3EYDnQc40rjaU8BArlWYWTDHRTIJlCj7lzrYo
         OpWFniWK3+7gKzGJOXOb5ZjKZcJRiI9ZPcG7KZ7uJzh2FuPf5kDq7bkQvkZMqeB6PpWI
         MS9g==
X-Forwarded-Encrypted: i=1; AJvYcCV2msbByEkN1IcxVFd9z5Cl911irwdRrFpH92g9pdaYLv9J0m5DWZvCN7ent3e3dbpXoFGMNGQIR3zAQtA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7QoVAqrn+a4id4/ojDAM8M+g7E99/hXKqsXPHbZhBdUrNZZi5
	TdbwRFDqMXfICfzIkGqzWMqzBlqOQ6sCNOsYt4++O7WK8+VwTIAdgUyBlWlF8q8=
X-Gm-Gg: ASbGncsDZyL/DuFa/dhcB7I+PWN4UpQQf5gJN4RzSkxtWDjo4RDKypZomCSmiX9ZElC
	DEmkD9VJq94hoGLgKL+2klgTbaPyUZcnvt1C/RO0aTRwV4Cw30WhGbVOmFean+VpczuTCivdV3x
	xhGjI+ENbgEKVGjEfASGca3Sb62RXbGDnp9lFsw/7Nziej+a6PqVdrjIO9Ec5vyEAs2GB1Ilx4Z
	PVcNOw8AdlUGDbD+7K9NWhUS8vrO6xX19tW92ebFVbj0l9Kg52hByOpBeiMGBeiIhwqE1M3CWa+
	sTg=
X-Google-Smtp-Source: AGHT+IEfz4udPottet3K2ickkfVAL1NPauK4J7aoUebSrapujfts7RLgM9V3b4aTiUJhAZmdmGqebA==
X-Received: by 2002:a7b:cd17:0:b0:439:33ac:ba49 with SMTP id 5b1f17b1804b1-4394ceaf87fmr20886665e9.1.1739264682546;
        Tue, 11 Feb 2025 01:04:42 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43947bdc5c4sm42522365e9.23.2025.02.11.01.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 01:04:41 -0800 (PST)
Date: Tue, 11 Feb 2025 10:04:40 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, jesse@rivosinc.com, 
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <20250211-0a44854789bf8588ded25288@orel>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com>
 <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <Z6o1NCo5nLPwBsUT@ghost>
 <65f48829-56d2-47fc-8f61-074ff122d964@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65f48829-56d2-47fc-8f61-074ff122d964@rivosinc.com>

On Mon, Feb 10, 2025 at 09:37:10PM +0100, Clément Léger wrote:
> 
> 
> On 10/02/2025 18:19, Charlie Jenkins wrote:
> > On Mon, Feb 10, 2025 at 03:46:46PM +0530, Anup Patel wrote:
> >> On Sat, Feb 8, 2025 at 6:53 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >>>
> >>> On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
> >>>> Probing unaligned accesses on boot is time consuming. Provide a
> >>>> function which will be used to look up the access type in a table
> >>>> by id registers. Vendors which provide table entries can then skip
> >>>> the probing.
> >>>
> >>> The access checker in my experience is only time consuming on slow
> >>> hardware. Hardware that supports fast unaligned accesses isn't really
> >>> impacted by this? Avoiding a list of hardware that has slow/fast
> >>> unaligned accesses in the kernel was the main reason for dynamically
> >>> checking. We did introduce the config option to compile the kernel with
> >>> assumed slow/fast accesses, which of course has the downside of
> >>> recompiling the kernel and I assume that you already considered that.
> >>
> >> The kconfig option does not align with the vision of running the same
> >> kernel image across platforms.
> > 
> > I just don't think that vision is realistic.
> > 
> > I am a proponent for compile time defines because ri ght now we are
> > catering the kernel to both microcontrollers and for high performance
> > platforms. I am in favor of having a set of configur ations that are
> > ideal for these microcontrollers and a different set for high
> > performance platforms. This is where the RVI profile s would ideally
> > come in, having different configs for different profiles that target low
> > performance/high performance.
> > 
> > Compiler optimizations for extensions are not possib le to do by just
> > having these different methods of selecting at runti me. By enabling
> > extra extensions like the bitmanip extensions during compilation via a
> > config flag we can optimize the entire kernel. It is not possible to
> > push all optimizations off to runtime detection.
> 
> While this might be true for the bitmanip extension and other extensions
> that the compiler can take advantage of, that isn't true for the
> misaligned speed probing code. The only meaningful misaligned access
> configuration option for kernel "speed" optimization is
> RISCV_EFFICIENT_UNALIGNED_ACCESS (which is ironically not easily
> selectable since it is under NON_PORTABLE).
> 
> Currently all the config options that have been added around misaligned
> support "just" allows to get rid of the probing code at compile time and
> set a predefined speed. That does not really improve the kernel
> performance itself, just allows for a faster boot. That could as well be
> supported using a command line option as suggested.

I agree. I'll look into stripping config options and picking up Jesse's
command line option for v2. I'll also drop the table approach of this
series since I don't have a strong enough justification for it over the
command line at this time.

Thanks,
drew

> 
> That being said, I agree that some additional configuration options
> should be added to enable additional extension support at compile time,
> enabling a faster kernel. Having a single image for all hardware is as
> you said not realistic but profiles configuration as you proposed might
> be the key for this support.
> 
> Clément
> 
> > 
> >>
> >>>
> >>> Instead of having a table in the kernel, something that would be more
> >>> platform agnostic would be to have an extension that signals this
> >>> information. That seems like it would accomplish the same goal and
> >>> leverage the existing infrastructure in the kernel, albeit with the need
> >>> to make a new extension.
> >>>
> >>
> >> IMO, expecting an ISA extension to be defined for all possible
> >> microarchitectural choices is not going to scale so it is better
> >> to have infrastructure in kernel itself to infer microarchitectural
> >> choices based on RISC-V implementation ID.
> > 
> > How is keeping tables in the kernel for all microarchitectural details
> > any more scalable than having extensions that do the same thing? I would
> > argue that having it in the kernel is less scalable since it needs to be
> > described for all implementation IDs, and all changes require going
> > through the kernel review process. Dynamic probing avoids these issues.
> > Having an extension has the one-time process of getting the extension
> > into something like a profile, but then anybody could use it without
> > needing a kernel patch.
> > 
> > - Charlie
> > 
> >>
> >> Regards,
> >> Anup
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
