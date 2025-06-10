Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D744E1F09B0
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749536439; cv=none; b=ROif1ZEFfYJYByl8r9DBSA/i5bS1Q/0pWNvJ2N7N3H0KVm90y2eqGlrRI1lj/56j5dHDF/usWHCxtGwLOexVAj2JJBCVWz0bkf+AINgYRxNtefF6RWioG93huWMMldhsCM2jC5zq48696SXHmOB+WeVXGnaQW0bkqq4tED0hLeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749536439; c=relaxed/simple;
	bh=yYXSTmYM1eoWhEB9ZXZsKxbxwn96wbv+4QnbPRdXIHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8PSegJeFoOdZqx1GT7Bx5riEToA4GFMjeimMwg8N/yAe0llF2v9/YKz6NL634rFcV58OvEIO3DlWeJUCPQruT6DkLxY8p6KgmtCal6rY+ApkyZ94OnaYlN6T9uSyHLMTZLCdzRFrzhJfDNenbXFu7sAhi3alIlpr+sKElJ+YGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bGdWg0XP7z9sVS;
	Tue, 10 Jun 2025 08:03:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rnIOCq5v7DqQ; Tue, 10 Jun 2025 08:03:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bGdWf5CPLz9sTD;
	Tue, 10 Jun 2025 08:03:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ACA9E8B764;
	Tue, 10 Jun 2025 08:03:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 7h7BDLB4LqL8; Tue, 10 Jun 2025 08:03:26 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 549968B763;
	Tue, 10 Jun 2025 08:03:26 +0200 (CEST)
Message-ID: <8dceee14-6008-48d0-a3c8-30ae777660a1@csgroup.eu>
Date: Tue, 10 Jun 2025 08:03:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/vdso: Fix build of VDSO32 with pcrel
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <1fa3453f07d42a50a70114da9905bf7b73304fca.1747073669.git.christophe.leroy@csgroup.eu>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1fa3453f07d42a50a70114da9905bf7b73304fca.1747073669.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Maddy,

ping ?

Christophe

Le 12/05/2025 à 20:14, Christophe Leroy a écrit :
> Building vdso32 on power10 with pcrel leads to following errors:
> 
> 	  VDSO32A arch/powerpc/kernel/vdso/gettimeofday-32.o
> 	arch/powerpc/kernel/vdso/gettimeofday.S: Assembler messages:
> 	arch/powerpc/kernel/vdso/gettimeofday.S:40: Error: syntax error; found `@', expected `,'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:71:  Info: macro invoked from here
> 	arch/powerpc/kernel/vdso/gettimeofday.S:40: Error: junk at end of line: `@notoc'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:71:  Info: macro invoked from here
> 	 ...
> 	make[2]: *** [arch/powerpc/kernel/vdso/Makefile:85: arch/powerpc/kernel/vdso/gettimeofday-32.o] Error 1
> 	make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
> 
> Once the above is fixed, the following happens:
> 
> 	  VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
> 	cc1: error: '-mpcrel' requires '-mcmodel=medium'
> 	make[2]: *** [arch/powerpc/kernel/vdso/Makefile:89: arch/powerpc/kernel/vdso/vgettimeofday-32.o] Error 1
> 	make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
> 	make: *** [Makefile:251: __sub-make] Error 2
> 
> Make sure pcrel version of CFUNC() macro is used only for powerpc64
> builds and remove -mpcrel for powerpc32 builds.
> 
> Fixes: 7e3a68be42e1 ("powerpc/64: vmlinux support building with PCREL addresing")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>   arch/powerpc/include/asm/ppc_asm.h | 2 +-
>   arch/powerpc/kernel/vdso/Makefile  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
> index 02897f4b0dbf..b891910fce8a 100644
> --- a/arch/powerpc/include/asm/ppc_asm.h
> +++ b/arch/powerpc/include/asm/ppc_asm.h
> @@ -183,7 +183,7 @@
>   /*
>    * Used to name C functions called from asm
>    */
> -#ifdef CONFIG_PPC_KERNEL_PCREL
> +#if defined(__powerpc64__) && defined(CONFIG_PPC_KERNEL_PCREL)
>   #define CFUNC(name) name@notoc
>   #else
>   #define CFUNC(name) name
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> index e8824f933326..8834dfe9d727 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -53,7 +53,7 @@ ldflags-$(CONFIG_LD_ORPHAN_WARN) += -Wl,--orphan-handling=$(CONFIG_LD_ORPHAN_WAR
>   ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
>   
>   CC32FLAGS := -m32
> -CC32FLAGSREMOVE := -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc
> +CC32FLAGSREMOVE := -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc -mpcrel
>   ifdef CONFIG_CC_IS_CLANG
>   # This flag is supported by clang for 64-bit but not 32-bit so it will cause
>   # an unused command line flag warning for this file.

