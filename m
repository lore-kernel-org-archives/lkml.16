Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A7C27D771
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747760905; cv=none; b=nxPo1zSe5wVUNwLGcARqJuo2rJUvU4nJAaKqkZGrKuJflLRDwNDp6lvhJjuiUuLTIsfEs93pdDxg+3D78+3fucsdJA62PtD+XI0kunGim7mMxE1KtIHDm9IMfZy1T1Q5/2iDe2mP96/p1MPuS9WVGossQAmTVIjJe7Y3eLdijsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747760905; c=relaxed/simple;
	bh=p7E1s58bfdKq/W84Pqelq9+BY61nFPwJbfs01hSKOuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYsKBd3DwPlL9B/pZy5tAjPCvLRLcXCFVXDWLFnNMQJTOew2EXj6jCqk3yVh0imV1wuznL+XGMXVrAYQGgQdwGeHF/bq0QsYgr6ZzPe1vnDJrhmjgyktYbGY0X8TJV1D7ZFH6eaptkiBe0264AnLgF4mT3O+0jKeFC6WzI+yw0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=QVmjnv5j; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="QVmjnv5j"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7426c44e014so5978144b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747760902; x=1748365702; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DDjRFmO/FlIqGEtWUGUmfdfKllur189aWobDQoyjRQs=;
        b=QVmjnv5jrhAjOmnrfodzMvtSxLGgoc9MgeXZfR/IQ1QM/cdFFBH6acGVW0LLOAaaqB
         wO51w0SuAvJaEMHoZksG4d5edkWcLoyS0cHawjMMzJNBGUkLNDK3dx33puavTOXeFRmG
         Vi+S+sZCew6BBZZrYKh+HeFG60bXUc4VfDz5gpeM6MK4O8rFG0APl5iaEIIS57nLUhTx
         rhNS1q1Dx8XY1sMuUyisn5i26OK6y3N9eyFQo1SUHpEuIic1rGgGCw1nL1iKCJWs+JWI
         hWmgUi/W2i8YOCvrFp23/iyeS/aXXPRuzTzTsPEDm92ajtQGqrPKRwlMiMIBeqJSx1OE
         JVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747760902; x=1748365702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DDjRFmO/FlIqGEtWUGUmfdfKllur189aWobDQoyjRQs=;
        b=MzMRVyCQXwegzK4KV8zkP99QiDXZUtghRGa+2SE4U+6ydFBAjp86N1u2YrCyRAx1zP
         qr3+41i8HtkThkStqiibI2lu9gdD3iCyejBuGMKq7uSnQHl7tXa0v2tN0itKWkgjr9a8
         MdbXa44MeWx2vLiyi8FAxNYMxcQ6B25WxuWCtlwP3kTbjg2amQnoZ9wV5i3Tp10Xssf7
         1F6A2e3VnXDG4A35TCfZZgCA/Zc4Z6Vbe08qCeXWO9DAgqsVyDO1HqHzF3B08KbzgsdX
         4sI2VNrvxpKjON+LmDhjSITzhEnFDFNMUldf12+nXIb2CwmAogl//DW7DIWl3+zZMIek
         eYJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAxMpxKCKzhh5XIsZoVxG0F+LFB+X/mPEMhqCumW/nnPpP+IYUFfve45cT6Eag6j+vdWzAaAFrQzwg56M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPb/XJS4qotC6PfDNy6BYmwJYlSJ3w4XLCknNlDqDePgW9ttKI
	T/TzSInKOJZy9QZXLeTMvaI2VRiG78lQoKtO5YgGYoy3tZet8fcjdOWlNNw/0GQc+mY=
X-Gm-Gg: ASbGncsDLtSFEoCQi4ezXeDMGhdNUWINy0/SgGERZlIyBlB03UFl8fpc4+1S5ehJ74c
	Au/ObhJNaS6yNIHWWGuUoYUG28KQQHTyOtWO7rasyNzFIc0KMGnaX2u8G6pn7nfhDNcgG2c3Npx
	noGl5uBQkN95wkpL5P0hinzKEwhQDPYESvRjOejUEWPyhkOb45seKkXDDqzcjqC9J2ZJ42MRPaJ
	ZyftlJ0ivjUseb2tk6eU5XbF2q4U8NJkRB1AWOwN6RDGLrOauQx+BQ08v7rcv8bTOheOI7jjxxe
	W6n6DEG12cpmwzRY4+AeAeOJMjgO8PLwIp9Cm7zP1KcT6As=
X-Google-Smtp-Source: AGHT+IHuT79L0+UrgKSwtY58fOb+r5axNp9Bh0rhvhNRM5zmWiTrh0ZXIgCZQR8QM+4Pdq9KGT4FDg==
X-Received: by 2002:a05:6a20:2d07:b0:1ee:a914:1d64 with SMTP id adf61e73a8af0-216219bd3a5mr27575586637.28.1747760902322;
        Tue, 20 May 2025 10:08:22 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:17b4:8663:3229:f2dd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf96573sm8189882a12.43.2025.05.20.10.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:08:21 -0700 (PDT)
Date: Tue, 20 May 2025 10:08:19 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v7 09/14] riscv: misaligned: move emulated access
 uniformity check in a function
Message-ID: <aCy3A6uUbnWoO9uC@ghost>
References: <20250515082217.433227-1-cleger@rivosinc.com>
 <20250515082217.433227-10-cleger@rivosinc.com>
 <aCu_ce-kVQsyjrh5@ghost>
 <126762fc-17ca-4e9d-94d0-3aed1ae321ff@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <126762fc-17ca-4e9d-94d0-3aed1ae321ff@rivosinc.com>

On Tue, May 20, 2025 at 10:19:47AM +0200, Clément Léger wrote:
> 
> 
> On 20/05/2025 01:32, Charlie Jenkins wrote:
> > On Thu, May 15, 2025 at 10:22:10AM +0200, Clément Léger wrote:
> >> Split the code that check for the uniformity of misaligned accesses
> >> performance on all cpus from check_unaligned_access_emulated_all_cpus()
> >> to its own function which will be used for delegation check. No
> >> functional changes intended.
> >>
> >> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> >> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >> ---
> >>  arch/riscv/kernel/traps_misaligned.c | 20 ++++++++++++++------
> >>  1 file changed, 14 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> >> index e551ba17f557..287ec37021c8 100644
> >> --- a/arch/riscv/kernel/traps_misaligned.c
> >> +++ b/arch/riscv/kernel/traps_misaligned.c
> >> @@ -647,6 +647,18 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
> >>  }
> >>  #endif
> >>  
> >> +static bool all_cpus_unaligned_scalar_access_emulated(void)
> >> +{
> >> +	int cpu;
> >> +
> >> +	for_each_online_cpu(cpu)
> >> +		if (per_cpu(misaligned_access_speed, cpu) !=
> > 
> > misaligned_access_speed is only defined when
> > CONFIG_RISCV_SCALAR_MISALIGNED. This function should return false when
> > !CONFIG_RISCV_SCALAR_MISALIGNED and only use this logic otherwise.
> 
> Hi Charlie,
> 
> misaligned_access_speed is defined in unaligned_access_speed.c which is
> compiled based on CONFIG_RISCV_MISALIGNED (ditto for trap_misaligned.c)
> 
> obj-$(CONFIG_RISCV_MISALIGNED)	+= unaligned_access_speed.o
> 
> However, the declaration for it in the header cpu-feature.h however is
> under a CONFIG_RISCV_SCALAR_MISALIGNED ifdef. So either the declaration
> or the definition is wrong but the ifdefery soup makes it quite
> difficult to understand what's going on.
> 
> I would suggest to move the DECLARE_PER_CPU under
> CONFIG_RISCV_MISALIGNED so that it reduces ifdef in traps_misaligned as
> well.

Here is the patch I am using locally for testing purposes, but if there
is a way to reduce the number of ifdefs that is probably the better way to go:

From 18f9a056d3b597934c931abdf72fb6e775ccb714 Mon Sep 17 00:00:00 2001
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 19 May 2025 16:35:51 -0700
Subject: [PATCH] fixup! riscv: misaligned: move emulated access uniformity
 check in a function

---
 arch/riscv/kernel/traps_misaligned.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index f3ab84bc4632..1449c6a4ac21 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -647,6 +647,10 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 }
 #endif
 
+#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
+
+static bool unaligned_ctl __read_mostly;
+
 static bool all_cpus_unaligned_scalar_access_emulated(void)
 {
 	int cpu;
@@ -659,10 +663,6 @@ static bool all_cpus_unaligned_scalar_access_emulated(void)
 	return true;
 }
 
-#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
-
-static bool unaligned_ctl __read_mostly;
-
 static void check_unaligned_access_emulated(void *arg __always_unused)
 {
 	int cpu = smp_processor_id();
@@ -716,6 +716,10 @@ bool unaligned_ctl_available(void)
 	return unaligned_ctl;
 }
 #else
+static bool all_cpus_unaligned_scalar_access_emulated(void)
+{
+	return false;
+}
 bool __init check_unaligned_access_emulated_all_cpus(void)
 {
 	return false;
-- 
2.43.0


- Charlie

> 
> Thanks,
>
> Clément
> 
> > 
> > - Charlie
> > 
> >> +		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> >> +			return false;
> >> +
> >> +	return true;
> >> +}
> >> +
> >>  #ifdef CONFIG_RISCV_SCALAR_MISALIGNED
> >>  
> >>  static bool unaligned_ctl __read_mostly;
> >> @@ -685,8 +697,6 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
> >>  
> >>  bool __init check_unaligned_access_emulated_all_cpus(void)
> >>  {
> >> -	int cpu;
> >> -
> >>  	/*
> >>  	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
> >>  	 * accesses emulated since tasks requesting such control can run on any
> >> @@ -694,10 +704,8 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
> >>  	 */
> >>  	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
> >>  
> >> -	for_each_online_cpu(cpu)
> >> -		if (per_cpu(misaligned_access_speed, cpu)
> >> -		    != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> >> -			return false;
> >> +	if (!all_cpus_unaligned_scalar_access_emulated())
> >> +		return false;
> >>  
> >>  	unaligned_ctl = true;
> >>  	return true;
> >> -- 
> >> 2.49.0
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
