Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C58258CF4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745593824; cv=none; b=K6qPns8CB9nNjRgzIzRQgQtWGmutHenBAFsrR1Gjk1/KCNfcDkdlV+4mx+Iff9wnt6ycsmn6nNE6XkgcLaHWNjqrzQI4drf+DGgykhoxTvgzmczPDugcHtnTm8eSFB8fSruD13htO/+x+H4iTwRW0jUqqmXdj6yEZlTvihJUV+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745593824; c=relaxed/simple;
	bh=vY6swcT0Alboo7MgvnMQJB9vpruBePBrokItleYPUxY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=dG6ZPjrIWkgxH7nSNI1M8LXcSCClLd4BQWGzlub0+MU7Div2pyL2jmpxmOtBwsPbAN5oZ/+R6fUCWZJY8Zgtclm8rK9ojeHCLGRVytGY8Oe2mmWrHjbYKPTHOtJyU503Oy+mSKqgOeFyMHteznfUOP7K/YelJjGX2q548Pkh3FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=XG4y/1b8; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="XG4y/1b8"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53PF9nln2855517
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 25 Apr 2025 08:09:50 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53PF9nln2855517
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745593790;
	bh=IGecZCjl5YfBf0UiQM9IPZczEb4L7UhgqvPM+Q8gibg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=XG4y/1b8Fbb1KxTNO/IVuCGrL4x7LLZ0U5q8MVUmv43nS+I1SPHwVg4Q9AasbuukE
	 5jyE9gWtT1H44a5JwK3iI6HbhpYbTKUfTAinczCMkcUWVFOUH0TvnYkokRnORR2Wx2
	 fKJoaeuh5L9QJlrx6nDmh20mNcqBvyUCGMWRXEs5iuXpJq2bE5cSlR2fWRjL8K+FYI
	 ei5Xql8gpdPQN2NCF4uMXsQx63UA6bBQc2ptjxHQIFfIjBjSVIt+USphm7oEWSk0Jo
	 JRvd6vP5qjFfJ4tgQASETaAwNiRk/4aW5whO7JFMqwVbMzTC4zFQTM3CzVCayy+LuM
	 j92qXhydNHh2w==
Date: Fri, 25 Apr 2025 08:09:48 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
CC: "Ahmed S . Darwish" <darwi@linutronix.de>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        John Ogness <john.ogness@linutronix.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 04/15] x86/cpu: Remove TSC-less CONFIG_M586 support
User-Agent: K-9 Mail for Android
In-Reply-To: <20250425084216.3913608-5-mingo@kernel.org>
References: <20250425084216.3913608-1-mingo@kernel.org> <20250425084216.3913608-5-mingo@kernel.org>
Message-ID: <1837ABEC-86BF-44DC-B32B-6C59DF61BFE6@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 25, 2025 1:42:01 AM PDT, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>Remove support for TSC-less Pentium variants=2E
>
>All TSC-capable Pentium variants, derivatives and
>clones should still work under the M586TSC or M586MMX
>options=2E
>
>Signed-off-by: Ingo Molnar <mingo@kernel=2Eorg>
>---
> arch/x86/Kconfig=2Ecpu            | 10 +---------
> arch/x86/Makefile_32=2Ecpu        |  1 -
> arch/x86/include/asm/vermagic=2Eh |  2 --
> 3 files changed, 1 insertion(+), 12 deletions(-)
>
>diff --git a/arch/x86/Kconfig=2Ecpu b/arch/x86/Kconfig=2Ecpu
>index df586ff2178f=2E=2Ee9499e58776c 100644
>--- a/arch/x86/Kconfig=2Ecpu
>+++ b/arch/x86/Kconfig=2Ecpu
>@@ -43,14 +43,6 @@ choice
> 	  See each option's help text for additional details=2E If you don't kn=
ow
> 	  what to do, choose "Pentium-Pro"=2E
>=20
>-config M586
>-	bool "586/K5/5x86/6x86/6x86MX"
>-	depends on X86_32
>-	help
>-	  Select this for an 586 or 686 series processor such as the AMD K5,
>-	  the Cyrix 5x86, 6x86 and 6x86MX=2E  This choice does not
>-	  assume the RDTSC (Read Time Stamp Counter) instruction=2E
>-
> config M586TSC
> 	bool "Pentium-Classic"
> 	depends on X86_32
>@@ -226,7 +218,7 @@ config X86_L1_CACHE_SHIFT
> 	default "7" if MPENTIUM4
> 	default "6" if MK7 || MPENTIUMM || MATOM || MVIAC7 || X86_GENERIC || X8=
6_64
> 	default "4" if MGEODEGX1
>-	default "5" if MCRUSOE || MEFFICEON || MCYRIXIII || MK6 || MPENTIUMIII =
|| MPENTIUMII || M686 || M586MMX || M586TSC || M586 || MVIAC3_2 || MGEODE_L=
X
>+	default "5" if MCRUSOE || MEFFICEON || MCYRIXIII || MK6 || MPENTIUMIII =
|| MPENTIUMII || M686 || M586MMX || M586TSC || MVIAC3_2 || MGEODE_LX
>=20
> config X86_F00F_BUG
> 	def_bool y
>diff --git a/arch/x86/Makefile_32=2Ecpu b/arch/x86/Makefile_32=2Ecpu
>index 2dda0a19b06a=2E=2E43226c9fe795 100644
>--- a/arch/x86/Makefile_32=2Ecpu
>+++ b/arch/x86/Makefile_32=2Ecpu
>@@ -10,7 +10,6 @@ else
> align		:=3D -falign-functions=3D0 -falign-jumps=3D0 -falign-loops=3D0
> endif
>=20
>-cflags-$(CONFIG_M586)		+=3D -march=3Di586
> cflags-$(CONFIG_M586TSC)	+=3D -march=3Di586
> cflags-$(CONFIG_M586MMX)	+=3D -march=3Dpentium-mmx
> cflags-$(CONFIG_M686)		+=3D -march=3Di686
>diff --git a/arch/x86/include/asm/vermagic=2Eh b/arch/x86/include/asm/ver=
magic=2Eh
>index b3a8beb32dfd=2E=2Ee26061df0c9b 100644
>--- a/arch/x86/include/asm/vermagic=2Eh
>+++ b/arch/x86/include/asm/vermagic=2Eh
>@@ -5,8 +5,6 @@
>=20
> #ifdef CONFIG_X86_64
> /* X86_64 does not define MODULE_PROC_FAMILY */
>-#elif defined CONFIG_M586
>-#define MODULE_PROC_FAMILY "586 "
> #elif defined CONFIG_M586TSC
> #define MODULE_PROC_FAMILY "586TSC "
> #elif defined CONFIG_M586MMX

For the record, all "real" Pentium chips had CX8 and TSC=2E
