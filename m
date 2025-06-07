Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DB74C8F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 12:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749298840; cv=none; b=TSrJQTL8TIFOHXHHyf9vmRbCDf4XkzG6kkQhCadwMIkfAwDHGBMhJ/XFJGLasVGsvV7f++oU7lFLGpwRALovoCbBVbpORii9h7FXTThjeZH2xjzzQvfwgqY74DjZ34SmOvd5ElI8Tr640seIvZ/a+tMa0IGaJXXRmmxmE5Be+OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749298840; c=relaxed/simple;
	bh=6yIyHvRp/1FaQ4jrUwGgmv8Co/tA7GZq3G5uLUMi2xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QnMTB2Fc2kkUnyL6MrkB5FeTDSJyI/utxy+aG4ye1scX5asQs0zmZMOr2/fVo40bsU/kUwr5SsSNcrjCYCyEajjx6TCYr1zgCXwPtgFfGJfBz8wnyXdXf+cegoghoOiUSZ0F2l7mT+z7oq5pijU/TyN+G2Dv5f0DSliD0LXLpUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bDxHn11l0z9sYQ;
	Sat,  7 Jun 2025 13:47:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jq2Gnj8iY67x; Sat,  7 Jun 2025 13:47:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bDxHm7448z9sXD;
	Sat,  7 Jun 2025 13:47:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E0D6A8B764;
	Sat,  7 Jun 2025 13:47:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xHP-SzKNoyYf; Sat,  7 Jun 2025 13:47:16 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7810E8B763;
	Sat,  7 Jun 2025 13:47:16 +0200 (CEST)
Message-ID: <6205828d-34ef-445d-8117-71a5269dc22f@csgroup.eu>
Date: Sat, 7 Jun 2025 13:47:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: unify two CONFIG_POWERPC64_CPU entries in the
 same choice block
To: Masahiro Yamada <masahiroy@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
References: <20250607102005.1965409-1-masahiroy@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250607102005.1965409-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 07/06/2025 à 12:13, Masahiro Yamada a écrit :
> There are two CONFIG_POWERPC64_CPU entries in the "CPU selection"
> choice block.
> 
> I guess the intent is to display a different prompt depending on
> CPU_LITTLE_ENDIAN: "Generic (POWER5 and PowerPC 970 and above)" for big
> endian, and "Generic (POWER8 and above)" for little endian.
> 
> I stumbled on this tricky use case, and worked around it on Kconfig with
> commit 4d46b5b623e0 ("kconfig: fix infinite loop in sym_calc_choice()").
> However, I doubt that supporting multiple entries with the same symbol
> in a choice block is worth the complexity - this is the only such case
> in the kernel tree.
> 
> This commit merges the two entries. Once this cleanup is accepted in
> the powerpc subsystem, I will proceed to refactor the Kconfig parser.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> 
>   arch/powerpc/platforms/Kconfig.cputype | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 613b383ed8b3..7b527d18aa5e 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -122,16 +122,11 @@ choice
>   	  If unsure, select Generic.
>   
>   config POWERPC64_CPU
> -	bool "Generic (POWER5 and PowerPC 970 and above)"
> -	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
> +	bool "Generic 64 bits powerpc"
> +	depends on PPC_BOOK3S_64
> +	select ARCH_HAS_FAST_MULTIPLIER if CPU_LITTLE_ENDIAN
>   	select PPC_64S_HASH_MMU
> -
> -config POWERPC64_CPU
> -	bool "Generic (POWER8 and above)"
> -	depends on PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
> -	select ARCH_HAS_FAST_MULTIPLIER
> -	select PPC_64S_HASH_MMU
> -	select PPC_HAS_LBARX_LHARX
> +	select PPC_HAS_LBARX_LHARX if CPU_LITTLE_ENDIAN
>   
>   config POWERPC_CPU
>   	bool "Generic 32 bits powerpc"

