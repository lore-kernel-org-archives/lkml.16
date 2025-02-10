Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7789614A639
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179604; cv=none; b=oEaZEtazKoCgnBe0LE75oSk3ZpJr1cCfya6G3MJ3IXUx9uTol5ClPkrH6hRGZIMjB74Sunc9NGLEFYcxsohMAR01CpHkmH+Z5+k8QJwncoQv41wGCieK1D31y9rKUciTYzJIXf0l4lLOcv8xI6IM8f5iUpp2FU4JCHqdINCv6/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179604; c=relaxed/simple;
	bh=jcrog3LqRVAtAeAh8/SGB/TeisekWizA1qutS/u0NwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQjuSKITsGqkGz8zRXGEp/yok7kvmVSuVRJIRSdlKVY9MFXq2Zo9xSk6oJ4/Gytizc0dzTgBVdVrHPm78uGizU1x2BWLoHk8EwNXKMv4gTR1Y+WR+JoasFG/2ARHbf+2Na5xlbS82VGGzF7a8fsrkVq1tiBPuo+qAfLCznXlWUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=WqWLydOv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="WqWLydOv"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361815b96cso26962425e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739179600; x=1739784400; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oGncZmhhAl71N1BLRgPGV01QcraTmYUOqNVFCE5sYHI=;
        b=WqWLydOvYlKasU4GN1uMD9Gl8HOTdeNRo/HKhyctV5+O9MB2xMti+Pp66JnqBcUpqM
         ztwCoOkzAKMEVkzHz8DFTEjb7wKRmiL/0cw1mjvs4XyDC8k0crPjqvcxz+1dTR3De30C
         zTtEK0qkCfCwy0zipvkVZLukNRfgFZ68OTnE5XDhipjjMnGyS4EiI8dpVMgi9oE13uCQ
         3xz3m752VdUfJPlMZzT7jHEztQOseXdZ4nB05fycJkTzB2aaSEfkAXuZWSyayPjsCD8F
         6wtLiEOD7nOZZSiFSbDaIfSzBNs4MVQbby7TqSqtcGCA5ZTTr2kVaywqkU+bj3PrfyI8
         GdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179600; x=1739784400;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oGncZmhhAl71N1BLRgPGV01QcraTmYUOqNVFCE5sYHI=;
        b=Dht1rCz0FdrVn2nISR2F3ZS7Gg9SQSMxFQejB8kamRoDPdJMs775n10W/K94kCqmsH
         D2gTNvmaP79i0rSeb+7HtHo4YoHRwTpUDxELcJ7Iop6tdZVhSPQNQuW4U87ChT8TQ4Qt
         3v0k+oe7b5b78K1TfAe3kTJhQNaJyb9JYXuoPNQyEf7xglMl15VIQ28u/O68+hqNZPCr
         t7mEr2FaIAPyaFiAV58gvVrpGn5ZP1IiR6d/ROOCb3INDvQNgJhPwDuN/7kANetAcXTk
         zeJHdp+CS5pmAgTbwNFfclxlyT0l7eKjut0U5uwlB17EXRA6GlUOQE7wkMmogoj18H3E
         5RTQ==
X-Forwarded-Encrypted: i=1; AJvYcCULa1TXQ5STy3BahAd0w1Tk6pfj1eU6ulTlN3hlqbDWomEWk8BFkbQG3LMJWbEOoK22KDbK9fSQuXLKeUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDK9AXXSE9UjvCmFoI4osh8CiVuI+7Ml+PrzR7a9VCrsCjlMuT
	nxRmDZKATHjZsufiutO5WW6nCTli0m98PQYXVQbAcmKpSe0wtidiUPsTCV9U+O8=
X-Gm-Gg: ASbGnctEMEdPwMWwBHdiC6z9CKrwIg5dACMSCzcFgURJGAKBBim+ZGNHwIvofvx5ezM
	j6LwdcTbJIJg2iS6YUPBJTjRe+8tNxycMVXoB/HWkHTWtBnjzBiuf07l6LI/FYQISZI9iPRcTyX
	7NphlqYwiwWXJvIEUJsv9h9yJOHfOLQAZV/2N/+iDGJpKGsbuqFsPXMzuIZAF0N76XfK93KlwWb
	C6Ks06rw5O+uTwduwdMXRETLPr/+HfZv8ahymMI9GRfdQ7nTOuQD+zojCZdh8TvWad5IoS4TLF1
	ZlQ=
X-Google-Smtp-Source: AGHT+IF2CDz3pJKnrOBObISkQd93Q04LKnWAfrGEobivnDx0uhirrebToLjWRMbheYbNUb8g9q6ZTg==
X-Received: by 2002:a05:600c:5110:b0:431:6083:cd38 with SMTP id 5b1f17b1804b1-4392497dad8mr98819615e9.6.1739179599483;
        Mon, 10 Feb 2025 01:26:39 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394679a3a1sm16563815e9.5.2025.02.10.01.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:26:39 -0800 (PST)
Date: Mon, 10 Feb 2025 10:26:38 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com, jesse@rivosinc.com
Subject: Re: [PATCH 0/9] riscv: Unaligned access speed probing fixes and
 skipping
Message-ID: <20250210-d575562e04d84ca570e26f5d@orel>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <CAK9=C2XmFtLHAxuWJVdvkUHFQTM+mE-D8E4sLvKxxUj_CqcbAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK9=C2XmFtLHAxuWJVdvkUHFQTM+mE-D8E4sLvKxxUj_CqcbAQ@mail.gmail.com>

On Sat, Feb 08, 2025 at 01:29:42PM +0530, Anup Patel wrote:
> On Fri, Feb 7, 2025 at 9:49 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > The first six patches of this series are fixes and cleanups of the
> > unaligned access speed probing code. The next two patches introduce
> > support to skip probing by matching vendor/arch/imp ids and checking a
> > table for the access speed type. The last patch applies the new skip
> > support to Ventana harts.
> 
> Alternatively, we can also skip probing misaligned access when Zicclsm
> extension is present in the ISA string. The Zicclsm extension is defined
> as part of the ratified RVA23 profile.

The definition of Zicclsm doesn't explicitly state that misaligned word
accesses will be faster than byte accesses to the same addresses. There's
also this spec issue[1] which appears to state that Zicclsm cannot be used
to infer fast misaligned accesses.

But, like Charlie suggests, maybe we should advocate the creation of an
extension (or "named feature") which allows specifically advertising that
misaligned accesses are fast.

[1] https://github.com/riscv/riscv-isa-manual/issues/1611

Thanks,
drew

> 
> Regards,
> Anup
> 
> >
> > (I'd be happy to split the fixes from the new skip support if we want to
> > discuss the skip support independently, but I want to base on the fixes
> > and I'm not sure if patchwork supports Based-on: $MESSAGE_ID/$LORE_URL
> > or not at the moment, so I'm just posting together for now in order to
> > be able to check for my patchwork green lights!)
> >
> > Thanks,
> > drew
> >
> > Andrew Jones (9):
> >   riscv: Annotate unaligned access init functions
> >   riscv: Fix riscv_online_cpu_vec
> >   riscv: Fix check_unaligned_access_all_cpus
> >   riscv: Change check_unaligned_access_speed_all_cpus to void
> >   riscv: Fix set up of cpu hotplug callbacks
> >   riscv: Fix set up of vector cpu hotplug callback
> >   riscv: Prepare for unaligned access type table lookups
> >   riscv: Implement check_unaligned_access_table
> >   riscv: Add Ventana unaligned access table entries
> >
> >  arch/riscv/include/asm/cpufeature.h        |   4 +-
> >  arch/riscv/include/asm/vendorid_list.h     |   1 +
> >  arch/riscv/kernel/traps_misaligned.c       |  14 +-
> >  arch/riscv/kernel/unaligned_access_speed.c | 278 ++++++++++++++-------
> >  4 files changed, 200 insertions(+), 97 deletions(-)
> >
> > --
> > 2.48.1
> >
