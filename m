Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB8821C19C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749592824; cv=none; b=nTzLHaKg4UlPW+CffJedvZMuUfD44NEN2XatDlsZ9CLY130xR/Vh4NlRMAFzEacxlNL2PClqp+r3w00sKoxDnNgjdihcTuQ1nuZdHslrqXbEOU8thWKDowoYl9WSFn7w0Uaqqw0VIsenD4fYLTIkZYABNcoukcnj89w8h3jNCzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749592824; c=relaxed/simple;
	bh=UpwUFDrv2H2y0hTjwiZ8+emZ/Ud1s3QuDb4OOZFkd2c=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=giWhpDFBbvIUsW3UE3fwY56XNBom3qzqGZgXl4HG+lVadnK+KZ5V5ahAzMqF8HKCy5S6+8GJlecBAAXAvCzYh8PiLCTmiqhiYSInqFK7InFF0KZBg409rmz9Hy+H9dLUty6J4c4yFC5KxE0FiYveB8eYbt01CbFFEeUivwO7PL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=EXshuVzO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="EXshuVzO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2363e973db1so2445765ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749592822; x=1750197622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4G2dsRaNLfs2nkgAzSn0O1Z1VlS3VRtVJRLvHcMgFCE=;
        b=EXshuVzOFkz+Wp2oNWGb1H1bm/0OaSSfJR3dDRCixfmAxIGOzVjUAuWAv2gIxGDBcK
         evyXRI9VaJ/ifOm2rkm8LyYdwsOcbpxJach4FceAQIykiv+qgxj2yAkk90mcNvxAiz1i
         dObWGs4b7Tg1kRmv/67yz293YOuHENGyg3DSIqvXX7rRQuFhebdJis95DRkpWWrU8ywN
         3ksfh94u1tTvsekfte4odMHbdyzyj2jWQBm7j6eBIJ2Vt7Rk2RbTWXt+/RBmpkgsLXBX
         ZP4iOWW9eJXqnJbqHcd3pAMEglvTkQGG0Fr4xqwN+56cs3JIR59ubTfGrqPuy3/JeJJ7
         wU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749592822; x=1750197622;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4G2dsRaNLfs2nkgAzSn0O1Z1VlS3VRtVJRLvHcMgFCE=;
        b=P9Qu+g492i3eujqhbsquVQC/tvcBs7mjR04CziVCZC2TYlK7eqFcLTflSNwG9UkCIo
         SAQwqqzY1+oLPQ/IeqsS1OC+f/OipZAPWEynz8sirMLOzmaZjjiDwMfh6NcACw8rPvCV
         r6Jy9yMQMqc3UOGQqwGohXYFfVGJ4J0ai8LMBDZUU1k/eU/HPgLO/ZOIGihfrxBxgxi5
         D+7bcT4gvJxkZoU3fvG3JPOipsRsZNOwQ5GhUEEQYjDW/cWtwCO9wdypetP+2ZTNiKg1
         WP5ksHlnlIWrIQn9ejhtvqNMZlJx2HRpQv12L2dMsP+Xy85XkA1ztt0a1zwe2eReOBc5
         uScA==
X-Forwarded-Encrypted: i=1; AJvYcCUgBqJ3HwstikD35oHyjtUaMxkmPWfGAkzo2iwfjSSC5YQeEEoJF7V6Yyit5sfvAwiB3lAa0C7lN2PIm9M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/x81tbBTinQuLRydfgaL64GD5L1dBdXeZs+FG7V95IUszD836
	AUq+FCagfzedTyv/aD1Cy6ELJmHar0jGyaRiaEU+ncGi0tPqTWd3XO0W+2RWnYVslBs=
X-Gm-Gg: ASbGnctiWYnDIcMwooUepEXYpXHkIhQMOYm0ZVRSU7MnXHBbhLCr0ypbWFfRP6p69ZI
	JFultgQitNLPnSB2iqyaqQMSRCsrliET7HWm9jZLNX1yRCypKTHYaVuTdqsG6jO/ysIOEx2UKQO
	N/b5n8AI6rtVm6aeDqJpF/a5KNq90e72b2El/yjxIK/d6BVw9L35PtAvGLBVRGFkcciGYGOijG/
	nRjvwaNm1LcPwsN5x00icDlaIjJLsKEQO5XQzkugKMbzxqy7VaFED4SWOsPVJdWnNqM1bwX/Tfs
	mnfn4hG4745cpbojjxi6maPXObFSbpWCSFhIE+2DaLSaQewnbC+fpLHxp4I/
X-Google-Smtp-Source: AGHT+IEHygQuRQmcpm3Zn4j4pduojeokahmiVVQJDy8o56yodyMF2rjdCCK/u2RBqmQlMoaKDuzeog==
X-Received: by 2002:a17:902:f54e:b0:235:eca0:12e8 with SMTP id d9443c01a7336-2364169ef07mr10412215ad.4.1749592821979;
        Tue, 10 Jun 2025 15:00:21 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-236030789cdsm75361745ad.11.2025.06.10.15.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:00:21 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:00:21 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Jun 2025 14:57:09 PDT (-0700)
Subject:     Re: [PATCH 2/4] raid6: riscv: Fix NULL pointer dereference issue
In-Reply-To: <20250610101234.1100660-3-zhangchunyan@iscas.ac.cn>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>, song@kernel.org, yukuai3@huawei.com,
  linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org, zhang.lyra@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhangchunyan@iscas.ac.cn
Message-ID: <mhng-8AD2A457-504F-4EF6-AB17-2CF316DFF6A0@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 10 Jun 2025 03:12:32 PDT (-0700), zhangchunyan@iscas.ac.cn wrote:
> When running the raid6 user-space test program on RISC-V QEMU, there's a
> segmentation fault which seems caused by accessing a NULL pointer,
> which is the pointer variable p/q in raid6_rvv*_gen/xor_syndrome_real(),
> p/q should have been equal to dptr[x], but when I use GDB command to
> see its value, which was 0x10 like below:
>
> "
> Program received signal SIGSEGV, Segmentation fault.
> 0x0000000000011062 in raid6_rvv2_xor_syndrome_real (disks=<optimized out>, start=0, stop=<optimized out>, bytes=4096, ptrs=<optimized out>) at rvv.c:386
> (gdb) p p
> $1 = (u8 *) 0x10 <error: Cannot access memory at address 0x10>
> "
>
> The issue was found to be related with:
> 1) Compile optimization
>    There's no segmentation fault if compiling the raid6test program with
>    the optimization flag -O0.
> 2) The RISC-V vector command vsetvli
>    If not used t0 as the first parameter in vsetvli, there's no
>    segmentation fault either.
>
> This patch selects the 2nd solution to fix the issue.

This code is super fragile, it's got a bunch of vector asm blocks in 
there that aren't declaring their cobbers.  At a bare minimum we should 
have something like

    diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
    index 99dfa16d37c7..3c9b3fd9f2ed 100644
    --- a/lib/raid6/rvv.c
    +++ b/lib/raid6/rvv.c
    @@ -17,6 +17,10 @@
     #define NSIZE  16
     #endif
    
    +#ifdef __riscv_vector
    +#error "This code must be built without compiler support for vector"
    +#endif
    +
     static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
     {
     	u8 **dptr = (u8 **)ptrs;

because it just won't work when built with a compiler that can use 
vector instructions.

> Fixes: 6093faaf9593 ("raid6: Add RISC-V SIMD syndrome and recovery calculations")
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>  lib/raid6/rvv.c | 48 ++++++++++++++++++++++++++++--------------------
>  1 file changed, 28 insertions(+), 20 deletions(-)
>
> diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
> index bf7d5cd659e0..b193ea176d5d 100644
> --- a/lib/raid6/rvv.c
> +++ b/lib/raid6/rvv.c
> @@ -23,9 +23,9 @@ static int rvv_has_vector(void)
>  static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
>  {
>  	u8 **dptr = (u8 **)ptrs;
> -	unsigned long d;
> -	int z, z0;
>  	u8 *p, *q;
> +	unsigned long vl, d;
> +	int z, z0;
>
>  	z0 = disks - 3;		/* Highest data disk */
>  	p = dptr[z0 + 1];		/* XOR parity */
> @@ -33,8 +33,9 @@ static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **
>
>  	asm volatile (".option	push\n"
>  		      ".option	arch,+v\n"
> -		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
> +		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
>  		      ".option	pop\n"
> +		      : "=&r" (vl)
>  	);
>
>  	 /* v0:wp0, v1:wq0, v2:wd0/w20, v3:w10 */
> @@ -96,7 +97,7 @@ static void raid6_rvv1_xor_syndrome_real(int disks, int start, int stop,
>  {
>  	u8 **dptr = (u8 **)ptrs;
>  	u8 *p, *q;
> -	unsigned long d;
> +	unsigned long vl, d;
>  	int z, z0;
>
>  	z0 = stop;		/* P/Q right side optimization */
> @@ -105,8 +106,9 @@ static void raid6_rvv1_xor_syndrome_real(int disks, int start, int stop,
>
>  	asm volatile (".option	push\n"
>  		      ".option	arch,+v\n"
> -		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
> +		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
>  		      ".option	pop\n"
> +		      : "=&r" (vl)
>  	);
>
>  	/* v0:wp0, v1:wq0, v2:wd0/w20, v3:w10 */
> @@ -192,9 +194,9 @@ static void raid6_rvv1_xor_syndrome_real(int disks, int start, int stop,
>  static void raid6_rvv2_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
>  {
>  	u8 **dptr = (u8 **)ptrs;
> -	unsigned long d;
> -	int z, z0;
>  	u8 *p, *q;
> +	unsigned long vl, d;
> +	int z, z0;
>
>  	z0 = disks - 3;		/* Highest data disk */
>  	p = dptr[z0 + 1];		/* XOR parity */
> @@ -202,8 +204,9 @@ static void raid6_rvv2_gen_syndrome_real(int disks, unsigned long bytes, void **
>
>  	asm volatile (".option	push\n"
>  		      ".option	arch,+v\n"
> -		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
> +		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
>  		      ".option	pop\n"
> +		      : "=&r" (vl)
>  	);
>
>  	/*
> @@ -284,7 +287,7 @@ static void raid6_rvv2_xor_syndrome_real(int disks, int start, int stop,
>  {
>  	u8 **dptr = (u8 **)ptrs;
>  	u8 *p, *q;
> -	unsigned long d;
> +	unsigned long vl, d;
>  	int z, z0;
>
>  	z0 = stop;		/* P/Q right side optimization */
> @@ -293,8 +296,9 @@ static void raid6_rvv2_xor_syndrome_real(int disks, int start, int stop,
>
>  	asm volatile (".option	push\n"
>  		      ".option	arch,+v\n"
> -		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
> +		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
>  		      ".option	pop\n"
> +		      : "=&r" (vl)
>  	);
>
>  	/*
> @@ -410,9 +414,9 @@ static void raid6_rvv2_xor_syndrome_real(int disks, int start, int stop,
>  static void raid6_rvv4_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
>  {
>  	u8 **dptr = (u8 **)ptrs;
> -	unsigned long d;
> -	int z, z0;
>  	u8 *p, *q;
> +	unsigned long vl, d;
> +	int z, z0;
>
>  	z0 = disks - 3;	/* Highest data disk */
>  	p = dptr[z0 + 1];	/* XOR parity */
> @@ -420,8 +424,9 @@ static void raid6_rvv4_gen_syndrome_real(int disks, unsigned long bytes, void **
>
>  	asm volatile (".option	push\n"
>  		      ".option	arch,+v\n"
> -		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
> +		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
>  		      ".option	pop\n"
> +		      : "=&r" (vl)
>  	);
>
>  	/*
> @@ -536,7 +541,7 @@ static void raid6_rvv4_xor_syndrome_real(int disks, int start, int stop,
>  {
>  	u8 **dptr = (u8 **)ptrs;
>  	u8 *p, *q;
> -	unsigned long d;
> +	unsigned long vl, d;
>  	int z, z0;
>
>  	z0 = stop;		/* P/Q right side optimization */
> @@ -545,8 +550,9 @@ static void raid6_rvv4_xor_syndrome_real(int disks, int start, int stop,
>
>  	asm volatile (".option	push\n"
>  		      ".option	arch,+v\n"
> -		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
> +		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
>  		      ".option	pop\n"
> +		      : "=&r" (vl)
>  	);
>
>  	/*
> @@ -718,9 +724,9 @@ static void raid6_rvv4_xor_syndrome_real(int disks, int start, int stop,
>  static void raid6_rvv8_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
>  {
>  	u8 **dptr = (u8 **)ptrs;
> -	unsigned long d;
> -	int z, z0;
>  	u8 *p, *q;
> +	unsigned long vl, d;
> +	int z, z0;
>
>  	z0 = disks - 3;	/* Highest data disk */
>  	p = dptr[z0 + 1];	/* XOR parity */
> @@ -728,8 +734,9 @@ static void raid6_rvv8_gen_syndrome_real(int disks, unsigned long bytes, void **
>
>  	asm volatile (".option	push\n"
>  		      ".option	arch,+v\n"
> -		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
> +		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
>  		      ".option	pop\n"
> +		      : "=&r" (vl)
>  	);
>
>  	/*
> @@ -912,7 +919,7 @@ static void raid6_rvv8_xor_syndrome_real(int disks, int start, int stop,
>  {
>  	u8 **dptr = (u8 **)ptrs;
>  	u8 *p, *q;
> -	unsigned long d;
> +	unsigned long vl, d;
>  	int z, z0;
>
>  	z0 = stop;		/* P/Q right side optimization */
> @@ -921,8 +928,9 @@ static void raid6_rvv8_xor_syndrome_real(int disks, int start, int stop,
>
>  	asm volatile (".option	push\n"
>  		      ".option	arch,+v\n"
> -		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
> +		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
>  		      ".option	pop\n"
> +		      : "=&r" (vl)
>  	);
>
>  	/*
