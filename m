Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E29B20DD4B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823857; cv=none; b=kg759WmV87xGvQxKmh8YcMLB3kbJ5j6h/Wsr3HxB/zIjDOM5bkq42v8LOi9/mpLqAHNJIT0WwzL+OdE2ga0HIedmWWfRtGdKaX/xP4SrzA20+Ogn5i90h4q3ipL1z0ofJxxr4aBu0EAW4ntSuV5KMToDxz7IgIs7zJLbwyurlRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823857; c=relaxed/simple;
	bh=I/hB+x3yRCXCcEoIeWGWVXGO6fU3JqeyxrlJeHAWf8Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=IuLDUoo0UAr3MQZfpIlzqLGV7Fk5vME/tJJarbZZ9K9YAlAK+fULgwb/wHx2ekFCBUd4JJv1oz/ObcTdgIIp8SRzETeXmpZoH0u3OjtFV1yLj0AsQKAU4oSy5huPr1kKLH6MaacSlWcwUO9Ojep9ykoDlit/5240xhMZEV+1CLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=i1oJ3lYm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="i1oJ3lYm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450828af36aso1604105e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749823854; x=1750428654; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCwDooc5Gsj0hNyVB/vl+qIPOuR8M4GMrDeO1ReDJTw=;
        b=i1oJ3lYm5kzcpzh4bHcl0ucn6Pq8bD8ryDFsIL++VB2zrCryzhGO2Uf7UwgOj6fxzt
         QPHlVWCxNoItm+kJ/AR487JMWu1douMgaxaaRU+NAFmTJrcU7dly81MdplUdesqApmJg
         kDe44vHAUVaui4RTDmJWCTeTtAEtscjQ1Yh+Nu+xNK1lZjsyUjEEwa8ZKJHNhROeWyO2
         qNFuPwCj26grxfJ6PT2/8RAQFmbXpasKdSZc7tYS5eHyB0jod+LnHXQQvcaDW+O5bJgJ
         wd2H60v+nibkMDiOBWDnZb7YIP+8sxVy7MGftn1OzVy0Eydx21j+I2xKst1Zj04cy2QM
         d1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823854; x=1750428654;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YCwDooc5Gsj0hNyVB/vl+qIPOuR8M4GMrDeO1ReDJTw=;
        b=ITPWbAlrjtwl5ZJeWgYzaCKfcs455EkrS+KAqx9KUkBOf5cPxZkm5Ou5fimNSBdVn4
         E/n2ezKWkaKSq7pqBbUOmBTiYRWuqPhrcyx5602hpYFDPxAoazWsjCZ9ufPRn2d0igKB
         NzTYo25V5MxBofb/AJ/k4yAXv9Xip/05awxbTDH8IymkGEvA+xGPpGy+RlTOUgEhXtr+
         i8Y6Rx+YLPEpj4FkAaYzxvj8c8OClQg9mW2qXp+24DaupcgmHKAgxMbOuVJ1F7aV5Zvc
         e1amLA6GcvI0RGLIPJ8qAOdbj+dCVNGgJmgzzpEQ2SV8TFCs8fO0e7YUcWbl0HFg0/J7
         0Xag==
X-Forwarded-Encrypted: i=1; AJvYcCVhAwkcsP43NimSz4X9zeA9Jvmguclgy3pUSmmowOUKeawz89LbNyRRCx3/titp5TvGVh3JQB90Z7y43sU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtmUxN7/PnORo2Re16Ez3FbrfWwmWpPIXWnoFAasVUk5wK5t3y
	pMAjKoj+9RUkYOXoW1kqhh7jfYMYmywTeKF8xzl30itz6TivALNEhiSDU/OTYjTJHPY=
X-Gm-Gg: ASbGnctcImmqtrW8oUUlUqLVTXj+iZHSg5mT4NmrAEXmszAifztXpXiYSpIe3LAb8EH
	Vu+uRyF869gqDPmWgyVPojxQZrmkYtYTxFM1d5pQ6y7BouX5hksoz8E/Sthn5CTpbNpwYbtYT7S
	GBsp9MsGCedKcwvtf/XYHEaYFYYl/qLHZcMhppCsNGuA75GQ2gtOsVp/7hbKQgKroB0yzW4psqs
	emJ5wgHlqKZ5M2dPz3WgBScoeQqIpb86moHm8qCRzHvkh/dwdVGoWkpePKc6tD4vfTs8rVtSuUb
	9Of+Ro/WmHo9Lwbko6UihX0USf7yDqwjh1Gy0NPxYx28Fk6UA3Dd2du4Bq/vPzSWrXjhJcAY71S
	Y8CZi
X-Google-Smtp-Source: AGHT+IG4GeDYIccMx3Bp09h1EiucZJUl0jOo1LzwGgmCUjMutG0m5EDpaCILXiv1gNh0ijozMoQ+aA==
X-Received: by 2002:a05:600c:a414:b0:453:9b3:5b70 with SMTP id 5b1f17b1804b1-45334b07e86mr10021225e9.8.1749823853636;
        Fri, 13 Jun 2025 07:10:53 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:3c9f:2b68:ce36:f64b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea15b0sm54247605e9.11.2025.06.13.07.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:10:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 16:10:52 +0200
Message-Id: <DALGSCDW0GIG.10I22KD2SCSNX@ventanamicro.com>
Subject: Re: [PATCH 2/2] RISC-V: make use of variadic sbi_ecall
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?=
 <cleger@rivosinc.com>, "Anup Patel" <apatel@ventanamicro.com>
To: "David Laight" <david.laight.linux@gmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
 <20250612145754.2126147-4-rkrcmar@ventanamicro.com>
 <20250613115459.6293f929@pumpkin>
In-Reply-To: <20250613115459.6293f929@pumpkin>

2025-06-13T11:54:59+01:00, David Laight <david.laight.linux@gmail.com>:
> On Thu, 12 Jun 2025 16:57:55 +0200
> Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicro.com> wrote:
>
>> The new sbi_ecall doesn't have to list all 8 arguments anymore, so only
>> pass the actual numbers of arguments for each SBI function.
>>=20
>> Trailing 0 is sometimes intentional.
> ...
>> @@ -630,10 +630,10 @@ static int pmu_sbi_snapshot_setup(struct riscv_pmu=
 *pmu, int cpu)
>>  	if (IS_ENABLED(CONFIG_32BIT))
>>  		ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
>>  				cpu_hw_evt->snapshot_addr_phys,
>> -				(u64)(cpu_hw_evt->snapshot_addr_phys) >> 32, 0, 0, 0, 0);
>> +				(u64)(cpu_hw_evt->snapshot_addr_phys) >> 32);
>
> That doesn't look right (and other similar ones).

This one is wrong, but because I missed the flags.  This patch should
have been:

		ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
				cpu_hw_evt->snapshot_addr_phys,
				(u64)(cpu_hw_evt->snapshot_addr_phys) >> 32, 0);

I'll fix that in v2, thanks.  I think you might be referring to the fact
that the code would make more sense as:

		ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
				lower_32_bits(cpu_hw_evt->snapshot_addr_phys),
				upper_32_bits(cpu_hw_evt->snapshot_addr_phys))

I fully agree with that, but it's a different patch... I would even
special case the `if` with CONFIG_32BIT && CONFIG_PHYS_ADDR_T_64BIT to
make it extra clear why we're doing such a weird thing.

> The values are still 64bit - so get passed as two 32bit values (in some w=
ay)
> so that varargs code will get the wrong values.

The SBI function prototype looks like this in the specification:

  struct sbiret sbi_pmu_snapshot_set_shmem(unsigned long shmem_phys_lo,
                                           unsigned long shmem_phys_hi,
                                           unsigned long flags)

SBI defines long to be the native register width, 32-bit with
CONFIG_32BIT, and therefore uses 2 registers to pass the physical
address, because the physical address can be up to 34 bits on RV32.

The macro will result in the same arguments as before, and it is what
the sbi_ecall actually should do.

> I guess the previous change wasn't tested on 32bit?

It wasn't even compiled, because 64-bit phys_addr_t on CONFIG_32BIT
requires CONFIG_PHYS_ADDR_T_64BIT, but that config combination seems
impossible at this point.
"(u64)(cpu_hw_evt->snapshot_addr_phys) >> 32)" is a fancy way to say 0.

If we were able to compile with CONFIG_PHYS_ADDR_T_64BIT, I think the
patch would produce the desired result, hopefully with a warning that
we're implicitly casting u64 to u32, but that was there even before this
patch.

Enabling CONFIG_PHYS_ADDR_T_64BIT will have its share of issues --
I noticed a bug where other 32-bit function (SBI_EXT_NACL_SET_SHMEM)
forgets to pass the upper part of the physical address, but I didn't
include it in this series, because it made no difference right now.
