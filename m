Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2969425487D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 07:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749455440; cv=none; b=FzTiNIujQXQVIZQ0E9K6ldNk9hkm+Nmfc0n1JF21Mc8Ayyr7SNX4DYOHhh0DoFTQN7IBMSSiY6n+33A1gvYfnVO1SBw3DHqULQKfgO/pebAdKNF8hqegPrLsc37bL/PfyfKywbjbXKeXgtxV3KO0nm4MRRpvMzjAxo2cRg5CAvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749455440; c=relaxed/simple;
	bh=5uOztrQkQsHa0KrVLeK32BKkqwnB/6pJzduoFa9innQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nyETko4ypAbR6wSoAhA8p1YPSZMjEWMOFFQ1g9Dx6y5PYi47vCHNQ/j3y3a8UmjeU5lhGfOE9mmbYjtJnZ+JV2khbQcWiMT4pskZU3D232tP+6POGUmPdKndvQt5AkDPWGrwrQhsnfMyu2GtcSbEUfz7yOyu68QMfVBtu1PhOgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bG3kR1Rjxz9sTD;
	Mon,  9 Jun 2025 09:40:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id StlkMA7BaDrA; Mon,  9 Jun 2025 09:40:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bG3kR0ZZyz9sN6;
	Mon,  9 Jun 2025 09:40:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0E72A8B764;
	Mon,  9 Jun 2025 09:40:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id nvfTNSoQtYcj; Mon,  9 Jun 2025 09:40:46 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 92C398B763;
	Mon,  9 Jun 2025 09:40:46 +0200 (CEST)
Message-ID: <fbe9378a-f3f0-4398-b91b-dd3713c0be5e@csgroup.eu>
Date: Mon, 9 Jun 2025 09:40:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] (powerpc/512) Fix possible `dma_unmap_single()` on
 uninitialized pointer
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Anatolij Gustschin <agust@denx.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "open list:LINUX FOR POWERPC EMBEDDED MPC5XXX"
 <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
References: <20250605163717.18020-1-fourier.thomas@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250605163717.18020-1-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 05/06/2025 à 18:37, Thomas Fourier a écrit :
> [Vous ne recevez pas souvent de courriers de fourier.thomas@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> If the device configuration fails (if `dma_dev->device_config()`),
> `sg_dma_address(&sg)` is not initialized and the jump to `err_dma_prep`
> leads to calling `dma_unmap_single()` on `sg_dma_address(&sg)`.
> 
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>   arch/powerpc/platforms/512x/mpc512x_lpbfifo.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> index 9668b052cd4b..ef3be438f914 100644
> --- a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> +++ b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> @@ -241,8 +241,7 @@ static int mpc512x_lpbfifo_kick(void)
> 
>          /* Make DMA channel work with LPB FIFO data register */
>          if (dma_dev->device_config(lpbfifo.chan, &dma_conf)) {
> -               ret = -EINVAL;
> -               goto err_dma_prep;
> +               return -EINVAL;
>          }

You should remove the { } as it is now a single line.

> 
>          sg_init_table(&sg, 1);
> --
> 2.43.0
> 

