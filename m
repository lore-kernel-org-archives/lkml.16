Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3202291C28
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770554; cv=none; b=im399CgSxKrI0NSP7N7lqokeVLRjUbJ9b1DQinu5lUq885V6j7fiW2sUJD+bLyBhODmTt0563sgL5jvtPQdkxUHPwjZc7zDqxTZMK9h4MNACkJZb+WerneobmiibVhDxoRktHQG61jvGhtk6TXhnmW1PXpxpETT3MO+wL3aXQYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770554; c=relaxed/simple;
	bh=ktaevRMBGsoLidMb1dd+ZMhyr1fO7+J8BWuwSpQW2sg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=WG20c5o8WE6qqyf1jvL6+69mWKiKhFhxbW9zkkDL+FAdoGRMIMA05KfDnawCQFz+3bbq2UczwAcjj38Iqv5Tj6t4Vo9pOEEPJj/MI7mK2zXRftxZobZnYMkCXltWPDWyfLzC4PqcG9mcyBzHYf5Axa749Fb51JRdOPSB2dqfwmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=BjotVEEU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="BjotVEEU"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso2192865e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750770551; x=1751375351; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbX9Uex4uDqQrjo1IMKC5QJV+aFv1JyAj570tEl8UMs=;
        b=BjotVEEUUneIn/UNkOHNhF9ifjUCjpaSC3u0P3/Pb2r1AruhOs4Itk+WoAzx6Ia4et
         ycp2wJHSc00GSnBndjZgquYNikQGoVuaKUydC0IAhl1M3e7a29oYdgRYQoZUdZf+5ntN
         o7UrAHllE0fTRrjFTS4Fq38kEPEsg9O+SG6iHT83dindBpcjFe9vKnE6h2CYZJ9WqxIl
         PFvqShsuUFyqzwUuyV5ZU0Or/lWMNfbbe+mg5LIb3p+o1qCwsfNikjV9E4w9jMg6ppIp
         Hq9hD3hbIKm9cfQDSBAbWOkWYO8sMrfBIPXfMLwjOxYdsXgCne0/pa6aNZEZyxGK8D6S
         CAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750770551; x=1751375351;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tbX9Uex4uDqQrjo1IMKC5QJV+aFv1JyAj570tEl8UMs=;
        b=lVHTtZsSiX4LEmel5FR7cn7r9xYu3WW6rgMbw7XEfp4uBYgCGVF/IAvXaH8DPTFDrU
         Yz1r4Q8SifhsqSWMc6NNb2oEMLu/P93sf6xzkxvL+485ru1BszzH0SDqByo9UzLywfZy
         hUNBc//bv3DtxvDs2PXM57+bwmPlCdWS7RLqXQn9mFyVeQ6o/coVw4Xzk8Rxi69YQyic
         CvxjMCtoMOL4x96HLD0BZaC30r2k3R6LAvHO+COQ3PGz2uf7utIEdqEjXineBM1MBGb0
         C7qkpaoe0ZdeddJpGlLPULVQRKC4zLNlSiavqNsRSq1hIHfpp/7OKnSwjCPFWa/Pv2Qx
         Zzbg==
X-Forwarded-Encrypted: i=1; AJvYcCUKKnmdSDLvgb4Rp7y7Pz6F2G/OBuw7wjUMy5SgPaI9DS86S9ns9mDUnYSABW84zTe7Y2sIhkeVgnuLiL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/1TgzpkOqjrUXutfi3QZVjOun6I5A/YYvBljTkzT/JQbKuB7z
	btHamtHkTZJumVz2QmRxGeN1rFwazHxgWPZM88l8PUlPD20hjYXq76mh09X9IryAsNg=
X-Gm-Gg: ASbGnctYJh1KeiT6WYRHN6Wi04/EkGIOGyLX4RaTZ2IQRvYbLhJAItcFYX9lFfpoYp+
	9cWY8ntZpjB5u/yfc70NrXW8+q4NnzOQ6PrpaLYicbxc3PLopdU2k0ZnZv6t4sW9oVZ6ublgXof
	uf2+DWTiMPaYvuTp6E3DVtNuc/dIOfpwzblnxGGPUxXZFSp1YTZZAs6QTP2dX4WGtQyCeFK27wV
	8Ozpy1IXwA0uRwUN2Ne+cOuSlkpCrhEVG4iUAZ4f13M8xakoJ0jJTQibCrf8+YfG31QPdVFECV7
	WkYV3cTRJvLXCBKvRHDvOiQJ4DNE3L0HBzHnVyVtNsYM+BRyB1fd7vB0paZTpHhauNb79w==
X-Google-Smtp-Source: AGHT+IHLyqpQ2L0/HxAVYH8zaUo9/78YcAJU66JWhWRRX6Iocb5sQWqQnegkrlHDzIHVDiiRW2HaGg==
X-Received: by 2002:a05:600c:1e8a:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-453659dd769mr67708255e9.8.1750770550920;
        Tue, 24 Jun 2025 06:09:10 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b00d:6d5f:6e67:f5e8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e741b43sm178430385e9.0.2025.06.24.06.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 15:09:09 +0200
Message-Id: <DAUSD38QIV6D.1YO5ASNI3EUGV@ventanamicro.com>
Subject: Re: [PATCH v2 3/2] RISC-V: sbi: remove sbi_ecall tracepoints
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>,
 <ajones@ventanamicro.com>, <cleger@rivosinc.com>,
 <apatel@ventanamicro.com>, <thomas.weissschuh@linutronix.de>,
 <david.laight.linux@gmail.com>
To: "Palmer Dabbelt" <palmer@dabbelt.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250619190315.2603194-4-rkrcmar@ventanamicro.com>
 <mhng-516082EA-5A9A-4A76-9448-70828749F95F@palmerdabbelt-mac>
In-Reply-To: <mhng-516082EA-5A9A-4A76-9448-70828749F95F@palmerdabbelt-mac>

2025-06-23T15:54:00-07:00, Palmer Dabbelt <palmer@dabbelt.com>:
> Having patch 3 of 2 is not normal.

Sorry, I wanted to distinguish it from the original series without
sending a new one, because it's quite radical proposal I don't
necessarily want to get merged.
Would "[RFC 3/2]", "[RFC 3/3]", or something else look better while
raising the same alarms?

> On Thu, 19 Jun 2025 12:03:15 PDT (-0700), rkrcmar@ventanamicro.com wrote:
> So the issue is the extra save/restore on function entry?  That's the=20
> sort of think shrink wrapping is supposed to help with.  It's been=20
> implemented in GCC for a while, but I'm not sure how well it's been=20
> pushed on (IIRC it was just one of the SPEC workloads).

Yes, shrink wrapping could help if compilers can figure out what to do
with static_keys. It's hopefully going to sort itself out in the future.
We'd ideally have some way to tell the compiler to always keep the
tracepoints inside their branches, to make them less fragile, but that
is probably asking too much from C.

I think GCC 15.1 had some shrink-wrapping improvements, but I've only
been using 14.3 so far...

> That said, this is kind of hard to reason about.  Can you pull out a=20
> smaller example?

I posted an example of the original 8 argument ecall in v1:
https://lore.kernel.org/linux-riscv/20250612145754.2126147-2-rkrcmar@ventan=
amicro.com/T/#m1d441ab3de3e6d6b3b8d120b923f2e2081918a98
For another example, let's have the following function:

  struct sbiret some_sbi_ecall(uintptr_t a0, uintptr_t a1)
  {
    return sbi_ecall(123, 456, a0, a1);
  }

The disassembly without tracepoints (with -fno-omit-frame-pointer):
(It could have been just "li;li;ecall;ret" without frame pointer.)

   0xffffffff80016d48 <+0>:	addi	sp,sp,-16
   0xffffffff80016d4a <+2>:	sd	ra,8(sp)
   0xffffffff80016d4c <+4>:	sd	s0,0(sp)
   0xffffffff80016d4e <+6>:	addi	s0,sp,16
   0xffffffff80016d50 <+8>:	li	a7,123
   0xffffffff80016d54 <+12>:	li	a6,456
   0xffffffff80016d58 <+16>:	ecall
   0xffffffff80016d5c <+20>:	ld	ra,8(sp)
   0xffffffff80016d5e <+22>:	ld	s0,0(sp)
   0xffffffff80016d60 <+24>:	addi	sp,sp,16
   0xffffffff80016d62 <+26>:	ret

With tracepoints, the situation is worse... the optimal outcome would
add two nops, but the actual result is:

   0xffffffff80017720 <+0>:	addi	sp,sp,-48
   0xffffffff80017722 <+2>:	sd	ra,40(sp)
   0xffffffff80017724 <+4>:	sd	s0,32(sp)
   0xffffffff80017726 <+6>:	sd	s1,24(sp)
   0xffffffff80017728 <+8>:	sd	s2,16(sp)
   0xffffffff8001772a <+10>:	sd	s3,8(sp)
   0xffffffff8001772c <+12>:	addi	s0,sp,48
   0xffffffff8001772e <+14>:	nop
   0xffffffff80017730 <+16>:	nop
   0xffffffff80017734 <+20>:	li	a7,123
   0xffffffff80017738 <+24>:	li	a6,456
   0xffffffff8001773c <+28>:	ecall
   0xffffffff80017740 <+32>:	nop
   0xffffffff80017744 <+36>:	ld	ra,40(sp)
   0xffffffff80017746 <+38>:	ld	s0,32(sp)
   0xffffffff80017748 <+40>:	ld	s1,24(sp)
   0xffffffff8001774a <+42>:	ld	s2,16(sp)
   0xffffffff8001774c <+44>:	ld	s3,8(sp)
   0xffffffff8001774e <+46>:	addi	sp,sp,48
   0xffffffff80017750 <+48>:	ret
   [Tracing slowpath continues to 202.]

i.e. we spill 3 extra registers, which is at least better v1.  I'll try
again with GCC 15.1, and get back if it actually improves the situation.
