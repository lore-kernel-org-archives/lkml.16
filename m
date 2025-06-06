Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708C42882B6
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 16:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749229101; cv=none; b=T4VVZW0YZWcg7AmbFbFBJh/YtVeQdbdc2sqsW1qt3Ws9K4BasDk44G/RX5Z4Ib+o5CaIFdb7IqUxl2F/zfzaJxQYYNwI+jEI6j9BfSdnYwe5k6hdsYSQBEEb+/5/fw0EC3Nw539iPddNDuaATijbpfsuT4YzTKLwRPOdBRw3tTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749229101; c=relaxed/simple;
	bh=/89DxzOAi7PMxm7LqunTELrn5pv182kVgQoUK1apSAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3UlcvG+BFshZ8zoYfy95FKEHrxmeeLqepr8WzmyPvgguCNA63MkHMpRwA5R2O+szto8BMqVJEuWf9F+2360hRRn59r8X3Nca/7hd/HnphVhyMJxbKV6X7J0RgdNTE54jTuCHI2Ikixu9weHXdLds7DQjzKsdCu66k7+JS/l11c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=kglEKFuJ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="kglEKFuJ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2353a2bc210so21692145ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 09:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749229099; x=1749833899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BcxjZScvM2lKpgQY852iFru4i2EtNEedlu5deP8M4Ro=;
        b=kglEKFuJWMbWRPi/qv2oHyF3WJ7RRj3kOfV4RAU8NMXhr6d0/LT4xkMZYsiE/EauIR
         fUlFFflvQuZCvUSsaOS3aJavPFdgfdR261OyYrQLOtu9BmW9INMtRA/SZ2uy55qrDi04
         56LL+tbwEokAnwNOu4d1IwPjRGDVBIPVYP/KHoJMWyV1s8jSTHzzkfBIGJ4pv056J4c8
         vrWFp6Sh2XaFqE6nj74a9YWnCVDU/CxjT2b6JolerMdPyLHfQKHV+NiVBjwk/SfQVuyO
         PDuum+yIw0APpQG7j5YyLRv3CwTs9UQmRSm3n/j2bokxp8jvILQmnp97bbAMFGEZnCoB
         R+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749229099; x=1749833899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcxjZScvM2lKpgQY852iFru4i2EtNEedlu5deP8M4Ro=;
        b=ECcZT6VfgE+zRTRm9u8Sh/x388UnbtUyytH01KPmAJawarE1VCSLAkOOWIVnJlFw6t
         1NcFhYqWotHj3FkHRo/la8k4tqO+xcyC02d6TscQlY2xTN/B4ANXt6jjgktU1cK5xlVi
         vkpXZCkYbNZBRppFm677ys4ScxBLX6FNREuPBwMdK/xcDXsR2/MR1uRjPnp5Xi7jt9RX
         Zyp3TAmPZEHGdPDz2Kguk3aNvgkiF6LM+/iMhOUKIpvVYrPhwnYxUFaAN70hVGq+chM8
         ub+9UT24Lu4MXe0heP0tgkUOht3nM4P5+lhZAxQRjUeL3w2+iQ7oKb9SJpMqLQnXXxO1
         sfHw==
X-Forwarded-Encrypted: i=1; AJvYcCVCZXqKs8AIkaLgpGdSFxHEVq7Xoh2J7I5C2h4km3QBWVg1dcSZ+Xph9dk7GROYByzeFQ3UEN0kekmnSu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJXZJl6vbVi0wFx243pJmST7gAKLJerf0IFEjaf8VT2+U5/ZrE
	XoqdTPBc/sad1LtdM5wUWHFgtUfQgaARvDPIc0FvGZuw0YWQ3nCvlgN+kjyBZFyl4Lg=
X-Gm-Gg: ASbGncvoUSJTlPXUcm89i2KKi9y9RE4xCMoFP4xbnKXSblKIyxM4yI5BebU7q+w5cjs
	G2lwsdnX797yXjeA9ifzPzq+9nwBw7yrBtqX/6OkApjyqqaYZTFrx7nMu72vJP+GpafpXRPIrKR
	86VpPPZ9n4c/9u4hzmp6BiCcrBxS/lZyphdpdM+kAYX9eABpTI11gzHxzK/pjqmO8gi8LC2mKJN
	JruWOX41bVquVVYKLqfW+4kHB3FHRkUD0G2mnBaDIoGyCY8MBSKwjkd67so08q+u+7eVJKdBuJy
	arX648lMpLkpaO5zvsWL/4Y5veoyrRiYpnmLv5uaxboswQz9mhrGT9NvmicSxw==
X-Google-Smtp-Source: AGHT+IEFbEqDfqUF5m1o5ZSy4azWIZls70KNFStC8E9KnYlaEsLemZ77jdHc6KP24GJveCrVcgRxfw==
X-Received: by 2002:a17:903:32cf:b0:235:6f7:b918 with SMTP id d9443c01a7336-23601d225cdmr62084635ad.28.1749229098693;
        Fri, 06 Jun 2025 09:58:18 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032ff216sm14585925ad.111.2025.06.06.09.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:58:18 -0700 (PDT)
Date: Fri, 6 Jun 2025 09:58:16 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Ved Shanbhogue <ved@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH RFC v7 1/3] riscv: Add RISC-V Svrsw60t59b extension
 support
Message-ID: <aEMeKIBDKUTUI3B1@debug.ba.rivosinc.com>
References: <20250409095320.224100-1-zhangchunyan@iscas.ac.cn>
 <20250409095320.224100-2-zhangchunyan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250409095320.224100-2-zhangchunyan@iscas.ac.cn>

On Wed, Apr 09, 2025 at 05:53:18PM +0800, Chunyan Zhang wrote:
>The Svrsw60t59b extension allows to free the PTE reserved bits 60
>and 59 for software to use.
>
>Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
>---
> arch/riscv/Kconfig             | 13 +++++++++++++
> arch/riscv/include/asm/hwcap.h |  1 +
> arch/riscv/kernel/cpufeature.c |  1 +
> 3 files changed, 15 insertions(+)
>
>diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>index bbec87b79309..332fc00243ad 100644
>--- a/arch/riscv/Kconfig
>+++ b/arch/riscv/Kconfig
>@@ -842,6 +842,19 @@ config RISCV_ISA_ZICBOZ
>
> 	   If you don't know what to do here, say Y.
>
>+config RISCV_ISA_SVRSW60T59B
>+	bool "Svrsw60t59b extension support for using PTE bits 60 and 59"
>+	depends on RISCV_ALTERNATIVE

depends on MMU && 64BIT as well.

>+	default y
>+	help
>+	  Adds support to dynamically detect the presence of the SVRSW60T59B
>+	  extension and enable its usage.
>+
>+	  The Svrsw60t59b extension allows to free the PTE reserved bits 60
>+	  and 59 for software to use.
>+
>+	  If you don't know what to do here, say Y.
>+
> config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
> 	def_bool y
> 	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
>diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>index e3cbf203cdde..985f6dfc80ed 100644
>--- a/arch/riscv/include/asm/hwcap.h
>+++ b/arch/riscv/include/asm/hwcap.h
>@@ -105,6 +105,7 @@
> #define RISCV_ISA_EXT_ZVFBFWMA		96
> #define RISCV_ISA_EXT_ZAAMO		97
> #define RISCV_ISA_EXT_ZALRSC		98
>+#define RISCV_ISA_EXT_SVRSW60T59B	99
>
> #define RISCV_ISA_EXT_XLINUXENVCFG	127
>
>diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>index 2054f6c4b0ae..0f0f3027d400 100644
>--- a/arch/riscv/kernel/cpufeature.c
>+++ b/arch/riscv/kernel/cpufeature.c
>@@ -523,6 +523,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> 	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
>+	__RISCV_ISA_EXT_DATA(svrsw60t59b, RISCV_ISA_EXT_SVRSW60T59B),
> };
>
> const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
>-- 
>2.34.1
>
