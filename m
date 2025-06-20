Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7178421FF31
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407637; cv=none; b=E6uRcVbT7BOwb6n1aQveUOgS5/+kXCcDgHGuIMwcd7GcocHEoomUiNi68tkOcUGfpmi0c64v1+5G2WZsS4xrqDCHtYjyngsVZlxcgE8787Sg3nO1eP+gbYm/BlWZZ9yy7zz/mFRJV2VpMyiof2mv/oPgHumgCeJTPJIasXFY4wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407637; c=relaxed/simple;
	bh=98p7XFyIU8/mhoNbSjYfYvfy93NpNkwydwzxTinJHG8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YRpKcZv7fafGDbKVWLKzzbll96fxtd7FmgkCfSRug9wpzvSxm9e/Xxu8oT2BZajPvl78JxWUiNi7cCw2U1OPo+0wZhCjJFXaPtaJ00w9dxF4RlY1IL5eOWoyBPPlAm4SWbdLaBDz+ldZTo12QRti4Zkf7MJCk1JYNMenjo2gRg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bNqbG1LWXz9sXD;
	Fri, 20 Jun 2025 09:58:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l7-jiY9UMb34; Fri, 20 Jun 2025 09:58:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bNqbF6z05z9sB2;
	Fri, 20 Jun 2025 09:58:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EA9AF8B7AB;
	Fri, 20 Jun 2025 09:58:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id DbI3ugSJkLSZ; Fri, 20 Jun 2025 09:58:01 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B36DA8B78C;
	Fri, 20 Jun 2025 09:58:01 +0200 (CEST)
Message-ID: <430ad145-33f7-45b5-8fbd-4b0e2e0a2398@csgroup.eu>
Date: Fri, 20 Jun 2025 09:58:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc: floppy: Add missing checks after DMA map
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250620075602.12575-1-fourier.thomas@gmail.com>
Content-Language: fr-FR
In-Reply-To: <20250620075602.12575-1-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 20/06/2025 à 09:55, Thomas Fourier a écrit :
> [Vous ne recevez pas souvent de courriers de fourier.thomas@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> The DMA map functions can fail and should be tested for errors.
> 
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/include/asm/floppy.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/floppy.h b/arch/powerpc/include/asm/floppy.h
> index f8ce178b43b7..34abf8bea2cc 100644
> --- a/arch/powerpc/include/asm/floppy.h
> +++ b/arch/powerpc/include/asm/floppy.h
> @@ -144,9 +144,12 @@ static int hard_dma_setup(char *addr, unsigned long size, int mode, int io)
>                  bus_addr = 0;
>          }
> 
> -       if (!bus_addr)  /* need to map it */
> +       if (!bus_addr) {        /* need to map it */
>                  bus_addr = dma_map_single(&isa_bridge_pcidev->dev, addr, size,
>                                            dir);
> +               if (dma_mapping_error(&isa_bridge_pcidev->dev, bus_addr))
> +                       return -ENOMEM;
> +       }
> 
>          /* remember this one as prev */
>          prev_addr = addr;
> --
> 2.43.0
> 

