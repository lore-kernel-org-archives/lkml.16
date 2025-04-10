Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5695E278174
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279429; cv=none; b=rvERX2d7glxtRvh+YeOIqtiyk6g2QoB3lKvuAEKumZ7TG7vpXQYUNvimAwVWHRKLvTmp4C5Uw7rfD6PlrNeG1HqYyzK21HfnL92AcP4bIQcbEGwVMpn9XU63ekTav9Vs7/ecvqp87H/CxgxOE/wKaO18DwfX/6Zn8J80un49Qp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279429; c=relaxed/simple;
	bh=HUIIkQA6QycOoJu2qQMdVk5tOnI9W5lI6BOW89OgIIQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=UqCqIO5/9ycjI3fKs8S9/YCH5tm9IMAP3a9nIRkeeUorYxA0dMM5U73HaaBJIClKJPDVwK3mmUj5vVekGOnc3gb/o3xzpZRKtwg+Fo9mdEUxuvxOipAIl6J6RLskBvJOj4CNffhZ1Ch+1jzUiBgj70LF6froPfs7b6yX7LYalC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=m+y/XIU0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="m+y/XIU0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43eeb4e09b5so978245e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744279425; x=1744884225; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuhlYfO+SCuG1tPDw0icZEsvUHv3NYtA5HOyZj159xM=;
        b=m+y/XIU0hk4zgQ0m6cmy30IVEMK/Cf7BEKyo4w/ypQmckNGam9UbI8aBFIBh5MzJ0E
         NwVHqY6AVKxYft/z58pmNoYSKAKAPfNMd2VLY2XqEIqPmt3QAqhgsLdQmq1gIU5gBbvN
         nqXM96PRmPlNx3YDrO1MJwRPy99sVOlT2y0LgfvDOAV52aBIURP+NQW6VhvL80zXZDdI
         SbupOWBGC2yPGcx+h9aFFe3fnw4KfY1nktDodlcLwDzUiMRIadzlm9+euvoXd0aurX+J
         kaORrNbwesg6m/U98zAZNeKtjlcATHWhzATrLpVb+BuFuEPxsAGEP0x7q88E/oTBFmDT
         PuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279425; x=1744884225;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yuhlYfO+SCuG1tPDw0icZEsvUHv3NYtA5HOyZj159xM=;
        b=k1yH7Ms9HEkHs/xBqCFKGe5TG7OOQSZ4nrpzQFCvG6wKwlgXiaag5ahzrOQywANO62
         sVRowRIKdIzhrpyqzLP6LCsRLz19ayxgXCS0rtui2lcKsljcBNN0MMmagHgJUUFuQ7co
         C/09k1g+zBweZHeM4NFzgjwxslxNHNL6KgOcj+WxvGMMu6GK6kCE+rleH8smoZQzvr8W
         co5p8TunahkhciMnJ1vbaeQxuGHncltsH2T8BB6ztYnQglHc8qWdzBsqe0yhWzoIxhJ2
         zFkdZBTRITscirDwsD9ouNWvihizYKu4f4HvIC8R+8bT69EpJx95H21AA/4G4YM7L3Dl
         M8+w==
X-Gm-Message-State: AOJu0Yy9WWetqxXrGKhw3dD2m2cLXhGbpRzCtdNHu+cES8FOMumvOvhj
	tY5MGfoFADjgrzPu+i6zE4V3Vp6C9Xb1trwOCgWXH5U4lYGASD4Vv1La7qbh8sE=
X-Gm-Gg: ASbGnct0Yi9mNboEXONOOrasdDwkUR+FJOrRbrWEup816IBpoTw7JLFQm0gDNUnNWjP
	Pc23K+JiBV12qHAHiYpHTqT9BoC2Z6QZZpqfvLAScoAuzIeE/AoqF2pagVZwUNYto1MYcVu2eKx
	8wtP7IbfARM6VjMkbgcO+T8tI8ad0lLHJhdLpMfzop5AZqtDrGJwNQu4cfzG6s/qQjKGm46120J
	OGnJyJgBldLMVA0f6TBjC0YakG2d18ayvdlGpN2PlSPzaYOl81IsZxRkiXZA24PqsCo06yyZYfQ
	P+oSadeiHcAkvsw5CZYkP6WSTfUXYcM3euE5WjI3zOIXNP4c
X-Google-Smtp-Source: AGHT+IFucTZsmmGzPkhUaQ2Z/vAwZtrI/ji5V2QIPWKukl3A8249XbRp5GqSbF4sFE7Q2Qv5hdQlbA==
X-Received: by 2002:a05:600c:3d0c:b0:439:a1ce:5669 with SMTP id 5b1f17b1804b1-43f1ed4a7a9mr22097145e9.5.1744279425469;
        Thu, 10 Apr 2025 03:03:45 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:7d22:13bb:e539:15ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893773a0sm4273653f8f.25.2025.04.10.03.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:03:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Apr 2025 12:03:44 +0200
Message-Id: <D92VG9GT3W5D.2B71FBI67EYJ6@ventanamicro.com>
Subject: Re: [PATCH v12 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ
 | VM_WRITE
Cc: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "Zong Li"
 <zong.li@sifive.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>, "Thomas Gleixner"
 <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov"
 <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Arnd Bergmann"
 <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>, "Eric Biederman"
 <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann Horn"
 <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-6-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-6-e51202b53138@rivosinc.com>

2025-03-14T14:39:25-07:00, Deepak Gupta <debug@rivosinc.com>:
> diff --git a/arch/riscv/include/asm/mman.h b/arch/riscv/include/asm/mman.=
h
> +static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
> +						   unsigned long pkey __always_unused)
> +{
> +	unsigned long ret =3D 0;
> +
> +	/*
> +	 * If PROT_WRITE was specified, force it to VM_READ | VM_WRITE.
> +	 * Only VM_WRITE means shadow stack.
> +	 */

This function also changes PROT_WX to VM_RWX, which is effectively not
changing anything, but I think it deserves an explicit intent.
(At least in the commit message.)

> +	if (prot & PROT_WRITE)
> +		ret =3D (VM_READ | VM_WRITE);
> +	return ret;
> +}
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.=
c
> @@ -16,6 +17,15 @@ static long riscv_sys_mmap(unsigned long addr, unsigne=
d long len,
> +	/*
> +	 * If PROT_WRITE is specified then extend that to PROT_READ
> +	 * protection_map[VM_WRITE] is now going to select shadow stack encodin=
gs.
> +	 * So specifying PROT_WRITE actually should select protection_map [VM_W=
RITE | VM_READ]
> +	 * If user wants to create shadow stack then they should use `map_shado=
w_stack` syscall.
> +	 */
> +	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
> +		prot |=3D PROT_READ;

Why isn't the previous hunk be enough?  (Or why don't we do just this?)

riscv_sys_mmap() eventually calls arch_calc_vm_prot_bits(), so I'd
rather fix each code path just once.

Thanks.
