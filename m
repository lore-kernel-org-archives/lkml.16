Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797BB22F750
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750405836; cv=none; b=aQFLowhUKebq4FyDS/cDfNS8d5ibka6Zx/NNSMOA/yukxpaOAmjat+vl5dfZ9mu5Yn2Sr/31Yflzef2bneeMNuAhlhrifHLatQ96v061SEJLi2wJFkCAiTrqQAmL63/HIS4Cz+9xFRYnkGB2SIU+wGlIxCa3S5MDmYsIUxOQw0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750405836; c=relaxed/simple;
	bh=eGSej3YNaCeGStzfd3t2gmDRYaMCZAVt45nnXtkdcTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RkDtMUY/IQB4wGv+9k45WfexuzHdHyqHBigC9w1oKE8Mda3m1K0O/AlaJ2zwfcRhteBjd3+Qu92kFO1hLHuzUOx3xHpeBvw/yCM3fYQ7ZIC2lc8tPmLSPVgBWQ9xDm03oW04g5LcZUqEOKd6xrK1xSE4dX+lxsi3Jk7VN18wbcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bNqJ74FjMz9sXD;
	Fri, 20 Jun 2025 09:44:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZdnK-QQBFf1P; Fri, 20 Jun 2025 09:44:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bNqJ73VYhz9s28;
	Fri, 20 Jun 2025 09:44:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 728D58B7AB;
	Fri, 20 Jun 2025 09:44:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id K4i5McYStysj; Fri, 20 Jun 2025 09:44:55 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3B2E98B78C;
	Fri, 20 Jun 2025 09:44:55 +0200 (CEST)
Message-ID: <16e789a6-87f4-4f7a-9f13-edf47f9f401f@csgroup.eu>
Date: Fri, 20 Jun 2025 09:44:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: floppy: Add missing checks after DMA map
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250619110739.323202-2-fourier.thomas@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250619110739.323202-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

Le 19/06/2025 à 13:07, Thomas Fourier a écrit :
> [Vous ne recevez pas souvent de courriers de fourier.thomas@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> The DMA map functions can fail and should be tested for errors.
> 
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>   arch/powerpc/include/asm/floppy.h | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/floppy.h b/arch/powerpc/include/asm/floppy.h
> index f8ce178b43b7..df8ce2ae636d 100644
> --- a/arch/powerpc/include/asm/floppy.h
> +++ b/arch/powerpc/include/asm/floppy.h
> @@ -144,9 +144,14 @@ static int hard_dma_setup(char *addr, unsigned long size, int mode, int io)
>                  bus_addr = 0;
>          }
> 
> -       if (!bus_addr)  /* need to map it */
> +       if (!bus_addr) {        /* need to map it */
>                  bus_addr = dma_map_single(&isa_bridge_pcidev->dev, addr, size,
>                                            dir);
> +               if (dma_mapping_error(&isa_bridge_pcidev->dev, bus_addr)) {
> +                       bus_addr = 0;

bus_addr is a local variable, there is no point in setting it to zero 
here. Just return -ENOMEM.

> +                       return -ENOMEM;
> +               }
> +       }
> 
>          /* remember this one as prev */
>          prev_addr = addr;
> --
> 2.43.0
> 

