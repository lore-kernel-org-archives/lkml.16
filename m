Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1AB1E47CC
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750837911; cv=none; b=CfRFAwfzRheyRW4+yDtHayylG5Z4me8IqYpbKlHG6M3AEr/gskEP4bhBK8SNLFvxs1krO5V/ok2pEycrrjM249EOhYdMoGOMvakKzJPqIxx7dDji26qsjWloVBJLNSIDY2af2iIvMWEKaOUwIxkm/pYKgFoWIy8VcqE39m3QydI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750837911; c=relaxed/simple;
	bh=uO5otBrVQUQJAK7rtGEBFVxIpE/Lvv1YAresgBJq4WY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=DWBXLwDmqknC7q8FRgHbWJRTrB+ZegMyiG0Tl+0BX2K2AAKhLnim6JlGyiZWxHYyWDV0vfj1+Boikm/zrsgi4CJstJ0sx67eFA8rFFzzqFykJVeYDa/53PZ9W7YsNUi2lzhT+evGXDkjopzR+dXKXoatkL1upa8Oxv/cyVp6Eos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=neizcwXX; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="neizcwXX"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a52878d37aso937938f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750837907; x=1751442707; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/1kqXJPNv0gRjI46k/A/EmGeeHWQcmxjkHDa0w7+p0=;
        b=neizcwXX3gVY5sn1+cR29wp93fHRGSDos+IxueQ/9mPcEqRZWacjpYYd4h/tKjEmCw
         FJVSTi0qKDwihmhZ09K0CXGu5Lj7qmKoPxl88VzG3bvCiRpTuQ3qJ8ISeqWmxL8ZQ6N/
         9qi0LRxSiuBDf92lNnpxnWzjcA0mJyenPfJlRucluqT+fiYkpldrG3K51TlP9Fhnp672
         KFtLiYQTo7Y8DoHtK2NH9KUd6PmTt4h5AucjeQtFeSRWU2wGPdJM0UGggg9g+4ZC/ac+
         M92Q2y89+UGjjfGvBp0OMRL4n8B+b+en3Go99ZPhiDi1jvyxYJisnqjeeyrBfn0pLQ6f
         WLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750837907; x=1751442707;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0/1kqXJPNv0gRjI46k/A/EmGeeHWQcmxjkHDa0w7+p0=;
        b=qEgABVKS6mrs7uxgAQSA7p/x8x+/qrqGeDpkMKO9ayIf6Cu+mz0ITntGWXTKvrrhgW
         nVqTfrXkvBwteMIXdu3t8iwxEgzFfJ5YazFirTA/ncXMM9ISXwcH8HC1JX+goVdwSolB
         /IAw7VljE9djNcg7pSAcQdPZJzmNswi9pk3hWKSEsHYim0khUHbjZbSvnwGsq8grqOFq
         zjO4BnpI9Yw+QWqLO7eV/W5UhjS5xM+10sufFPIVWZsrT+m7Sz+w8hIDSEETX7eafUUu
         fX0I1OC2MS5BexFCmTvY7galZPqACvVqZOT+pUG0AbQQdJTbeQ/Yhfs7jNOZOxrCj26y
         XFcA==
X-Forwarded-Encrypted: i=1; AJvYcCX7XAtk+HpHs+tTfHzJCGw6Gu4P8rDAUfpEw5WQDA7SS+ORE0Se3G+CylXeCmK5ja62Iod/v403e3HG1FM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVepr2RucDA9ewakwITH9OcO7t6lAzHguF+gXqlkoek78AKlwK
	3kl36EalL5/qx1EuwS+r6hTQf3OhqsYoCwnFHsUGeO7qGyMQKIZ42Eb86yfEY2mVmNg=
X-Gm-Gg: ASbGncuI9ww1Czxi1a93BCRvsLExPDTJdK1w3ewq6G2yqSRJ+jPpGu/f7/WAJ7qDxxz
	C9iexyAbfEctyhP6Qv3h6g9WmymRXmVskuMl+OQc3Ss5t0XxNdbOBxwjtPPr1cIolK6XKXngBSM
	cqbgg7Yxgg7UJ2o5q2Ve/XP/dvt90i4DoWpM6F0ZumNq9jNTsLu8put4UNqLXNmiOEBSimZUrQn
	ejDtjNkBmvSCcJmP100lRZzsj36AEYKj+kxrgyvAFSVzKzUUH1xYteJi0qhYR2n6dB70eiNzm6h
	6fa3YmKFWVk1bMDTwr5HeBbG3lqakq/MIssRSGkr6PqafOJDnf3RCX6TRm2tjdlcbeZZAatqE5f
	ve0xO1lWNqwJ61LGkd2l85Q==
X-Google-Smtp-Source: AGHT+IF/TkpC3NlD/HMifpack2QrokmF522u7Xr5D13/dT5pwOLN83NtG9UoEcLzCyYMeIfkeQYZhg==
X-Received: by 2002:a05:6000:410d:b0:3a5:7875:576 with SMTP id ffacd0b85a97d-3a6ed60db76mr384507f8f.1.1750837907380;
        Wed, 25 Jun 2025 00:51:47 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f27a8sm3859432f8f.56.2025.06.25.00.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:51:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jun 2025 09:51:45 +0200
Message-Id: <DAVG8M70SJ4Q.ZSTC5VSJWGSK@ventanamicro.com>
Subject: Re: [PATCH v2 3/2] RISC-V: sbi: remove sbi_ecall tracepoints
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>,
 <ajones@ventanamicro.com>, <cleger@rivosinc.com>,
 <apatel@ventanamicro.com>, <thomas.weissschuh@linutronix.de>,
 <david.laight.linux@gmail.com>, "Jeff Law" <jlaw@ventanamicro.com>
To: "Palmer Dabbelt" <palmer@dabbelt.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250619190315.2603194-4-rkrcmar@ventanamicro.com>
 <mhng-516082EA-5A9A-4A76-9448-70828749F95F@palmerdabbelt-mac>
 <DAUSD38QIV6D.1YO5ASNI3EUGV@ventanamicro.com>
In-Reply-To: <DAUSD38QIV6D.1YO5ASNI3EUGV@ventanamicro.com>

2025-06-24T15:09:09+02:00, Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicr=
o.com>:
> For another example, let's have the following function:
>
>   struct sbiret some_sbi_ecall(uintptr_t a0, uintptr_t a1)
>   {
>     return sbi_ecall(123, 456, a0, a1);
>   }
>
> The disassembly without tracepoints (with -fno-omit-frame-pointer):
> (It could have been just "li;li;ecall;ret" without frame pointer.)
>
>    0xffffffff80016d48 <+0>:	addi	sp,sp,-16
>    0xffffffff80016d4a <+2>:	sd	ra,8(sp)
>    0xffffffff80016d4c <+4>:	sd	s0,0(sp)
>    0xffffffff80016d4e <+6>:	addi	s0,sp,16
>    0xffffffff80016d50 <+8>:	li	a7,123
>    0xffffffff80016d54 <+12>:	li	a6,456
>    0xffffffff80016d58 <+16>:	ecall
>    0xffffffff80016d5c <+20>:	ld	ra,8(sp)
>    0xffffffff80016d5e <+22>:	ld	s0,0(sp)
>    0xffffffff80016d60 <+24>:	addi	sp,sp,16
>    0xffffffff80016d62 <+26>:	ret
>
> [ Removed previous disassembly with tracepoints. ]
>                                                                I'll try
> again with GCC 15.1, and get back if it actually improves the situation.

GCC 15.1 still leaves "mv" outside the branch, but at least seems to be
on the right track (undesired overhead is marked with leading stars):

   0xffffffff800236e8 <+0>:	addi	sp,sp,-48
   0xffffffff800236ea <+2>:	sd	s0,32(sp)
   0xffffffff800236ec <+4>:	sd	ra,40(sp)
   0xffffffff800236ee <+6>:	addi	s0,sp,48
*  0xffffffff800236f0 <+8>:	mv	a4,a0
*  0xffffffff800236f2 <+10>:	mv	a5,a1
   0xffffffff800236f4 <+12>:	nop
*  0xffffffff800236f8 <+16>:	mv	a0,a4
*  0xffffffff800236fa <+18>:	mv	a1,a5
   0xffffffff800236fc <+20>:	li	a7,123
   0xffffffff80023700 <+24>:	li	a6,456
   0xffffffff80023704 <+28>:	ecall
*  0xffffffff80023708 <+32>:	mv	a5,a0
*  0xffffffff8002370a <+34>:	mv	a2,a1
   0xffffffff8002370c <+36>:	nop
   0xffffffff80023710 <+40>:	ld	ra,40(sp)
   0xffffffff80023712 <+42>:	ld	s0,32(sp)
*  0xffffffff80023714 <+44>:	mv	a0,a5
*  0xffffffff80023716 <+46>:	mv	a1,a2
   0xffffffff80023718 <+48>:	addi	sp,sp,48
   0xffffffff8002371a <+50>:	ret
   [Tracing goes to +126]

I realized I had the environment configured for clang in the last mail,
so here is actual GCC 14.3, which also spills in the prologue:

   0xffffffff80023360 <+0>:	addi	sp,sp,-48
   0xffffffff80023362 <+2>:	sd	s0,32(sp)
*  0xffffffff80023364 <+4>:	sd	s1,24(sp)
*  0xffffffff80023366 <+6>:	sd	s2,16(sp)
   0xffffffff80023368 <+8>:	sd	ra,40(sp)
   0xffffffff8002336a <+10>:	addi	s0,sp,48
*  0xffffffff8002336c <+12>:	mv	s2,a0
*  0xffffffff8002336e <+14>:	mv	s1,a1
   0xffffffff80023370 <+16>:	nop
*  0xffffffff80023374 <+20>:	mv	a0,s2
*  0xffffffff80023376 <+22>:	mv	a1,s1
   0xffffffff80023378 <+24>:	li	a7,123
   0xffffffff8002337c <+28>:	li	a6,456
   0xffffffff80023380 <+32>:	ecall
*  0xffffffff80023384 <+36>:	mv	s2,a0
*  0xffffffff80023386 <+38>:	mv	s1,a1
   0xffffffff80023388 <+40>:	nop
   0xffffffff8002338c <+44>:	ld	ra,40(sp)
   0xffffffff8002338e <+46>:	ld	s0,32(sp)
*  0xffffffff80023390 <+48>:	mv	a0,s2
*  0xffffffff80023392 <+50>:	mv	a1,s1
*  0xffffffff80023394 <+52>:	ld	s2,16(sp)
*  0xffffffff80023396 <+54>:	ld	s1,24(sp)
   0xffffffff80023398 <+56>:	addi	sp,sp,48
   0xffffffff8002339a <+58>:	ret
   [Tracing goes to +108]

And clang in the last mail inlined the tracepoints, because I put the
example function in sbi_ecall.c, which bloated the tracing slowpath, and
spilled one more register than needed.
With the function in sbi.c, to better simulate actual use (gcc examples
are already doing this), clang 20.1.6 and 19.1.7 do:

   0xffffffff80016f08 <+0>:	addi	sp,sp,-32
   0xffffffff80016f0a <+2>:	sd	ra,24(sp)
   0xffffffff80016f0c <+4>:	sd	s0,16(sp)
*  0xffffffff80016f0e <+6>:	sd	s1,8(sp)
*  0xffffffff80016f10 <+8>:	sd	s2,0(sp)
   0xffffffff80016f12 <+10>:	addi	s0,sp,32
   0xffffffff80016f14 <+12>:	nop
   0xffffffff80016f18 <+16>:	li	a7,123
   0xffffffff80016f1c <+20>:	li	a6,456
   0xffffffff80016f20 <+24>:	ecall
   0xffffffff80016f24 <+28>:	nop
   0xffffffff80016f28 <+32>:	ld	ra,24(sp)
   0xffffffff80016f2a <+34>:	ld	s0,16(sp)
*  0xffffffff80016f2c <+36>:	ld	s1,8(sp)
*  0xffffffff80016f2e <+38>:	ld	s2,0(sp)
   0xffffffff80016f30 <+40>:	addi	sp,sp,32
   0xffffffff80016f32 <+42>:	ret
   [Tracing goes to +94]

When compared to GCC 15.1, clang spills in the prologue, but doesn't
store around the static branch sites.  The optimal result would be a
combination of what clang and GCC 15.1 do (code without any stars).

When I looked at real code samples, the behavior was roughly similar.
GCC just wasn't always placing the "mv"s as obviously.
