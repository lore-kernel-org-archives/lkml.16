Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DCC25761
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748935237; cv=none; b=GpRLf23ecHfOF7xAlhqP7s0p2+vbK/85V1p6WGhZRRKM2GCS625A8A+l9cf3wiH7fnOXMHMcigpJg2K2d+AV1xksMIqA2VO61dqHzsWDKot46Dy/fRwjYH3Y+ktV6B9cyXzTroIvecmpSsAgJFyM7acABtPvwfptMp03Vbnll8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748935237; c=relaxed/simple;
	bh=I1rWHPG1Var68cD3urblSC4rQhrXEaK0reNfkq52rNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMyvv/3LxyUWKMwZsyZa70hanqTZIpzbORw33EbRgl4tFnEwfsKM9VKlXlBpqIbgxI2owTZonCszqUX7v7UoRRW+i1W2zM298XcGiuevGwNrtp5/xVQ7MMlwgRNwz959FOHDA4MiQWvTrpHiDdqcO4HKvW0aVaLVvuoi/qOGRqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bBLln4vWSz9vY5;
	Tue,  3 Jun 2025 08:44:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jjqPCRYCwsSv; Tue,  3 Jun 2025 08:44:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bBLln47Zbz9vY4;
	Tue,  3 Jun 2025 08:44:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 88DBB8B765;
	Tue,  3 Jun 2025 08:44:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WDcIPDlhdCxM; Tue,  3 Jun 2025 08:44:05 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D7CC8B763;
	Tue,  3 Jun 2025 08:44:05 +0200 (CEST)
Message-ID: <3cebc3c4-dbaf-41f6-b98d-1d33bea2eeeb@csgroup.eu>
Date: Tue, 3 Jun 2025 08:44:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: use always-y instead of extra-y in Makefiles
To: Masahiro Yamada <masahiroy@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
References: <20250602163302.478765-1-masahiroy@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250602163302.478765-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 02/06/2025 à 18:32, Masahiro Yamada a écrit :
> The extra-y syntax is planned for deprecation because it is similar
> to always-y.
> 
> When building the boot wrapper, always-y and extra-y are equivalent.
> Use always-y instead.
> 
> In arch/powerpc/kernel/Makefile, I added ifdef KBUILD_BUILTIN to
> keep the current behavior: prom_init_check is skipped when building
> only modular objects.

I don't understand what you mean.

CONFIG_PPC_OF_BOOT_TRAMPOLINE is a bool, it cannot be a module.

prom_init_check is only to check the content of prom_init.o which is 
never a module.

Is always-y to run _after_ prom_init.o is built ?

Christophe

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>   arch/powerpc/boot/Makefile   | 6 +++---
>   arch/powerpc/kernel/Makefile | 4 +++-
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 184d0680e661..b003f7ac8755 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -242,13 +242,13 @@ $(obj)/wrapper.a: $(obj-wlib) FORCE
>   hostprogs	:= addnote hack-coff mktree
>   
>   targets		+= $(patsubst $(obj)/%,%,$(obj-boot) wrapper.a) zImage.lds
> -extra-y		:= $(obj)/wrapper.a $(obj-plat) $(obj)/empty.o \
> +always-y	:= $(obj)/wrapper.a $(obj-plat) $(obj)/empty.o \
>   		   $(obj)/zImage.lds $(obj)/zImage.coff.lds $(obj)/zImage.ps3.lds
>   
>   dtstree		:= $(src)/dts
>   
>   wrapper		:= $(src)/wrapper
> -wrapperbits	:= $(extra-y) $(addprefix $(obj)/,addnote hack-coff mktree) \
> +wrapperbits	:= $(always-y) $(addprefix $(obj)/,addnote hack-coff mktree) \
>   			$(wrapper) FORCE
>   
>   #############
> @@ -455,7 +455,7 @@ WRAPPER_DTSDIR := /usr/lib/kernel-wrapper/dts
>   WRAPPER_BINDIR := /usr/sbin
>   INSTALL := install
>   
> -extra-installed		:= $(patsubst $(obj)/%, $(DESTDIR)$(WRAPPER_OBJDIR)/%, $(extra-y))
> +extra-installed		:= $(patsubst $(obj)/%, $(DESTDIR)$(WRAPPER_OBJDIR)/%, $(always-y))
>   hostprogs-installed	:= $(patsubst %, $(DESTDIR)$(WRAPPER_BINDIR)/%, $(hostprogs))
>   wrapper-installed	:= $(DESTDIR)$(WRAPPER_BINDIR)/wrapper
>   dts-installed		:= $(patsubst $(dtstree)/%, $(DESTDIR)$(WRAPPER_DTSDIR)/%, $(wildcard $(dtstree)/*.dts))
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 4d2daa8e7bca..ac01cedad107 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -201,7 +201,9 @@ obj-$(CONFIG_ALTIVEC)		+= vector.o
>   
>   obj-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_init.o
>   obj64-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_entry_64.o
> -extra-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_init_check
> +ifdef KBUILD_BUILTIN
> +always-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_init_check
> +endif
>   
>   obj-$(CONFIG_PPC64)		+= $(obj64-y)
>   obj-$(CONFIG_PPC32)		+= $(obj32-y)

