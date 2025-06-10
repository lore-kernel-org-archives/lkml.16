Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7516F8BF8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749574238; cv=none; b=u3KP5WMjmGr46CNmfp1JYh1AMCqlKik/WfSpCCYfwK9vRYuBQvlfJe58yUYaB/8QmZdBFWgn2IPTGVn2Jqr0uMmKqcv887U4Y8CytntZUe8kU3rGaeIOtTmAO5RlwEMVxso267I3/9eNz2whlIjn4j8/fdAdFaOcegeFFhn+x9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749574238; c=relaxed/simple;
	bh=H+jenH+2aYZxxKoq09/Zlng/aid5enmc1DjTq62NRtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=teUDxETNA3KGaR+cWYCk2/rCFPdn1urgpSqYwUMNx8xgM/zFFvpozaIk168UdsmnPLqNA+KlLo73LW5LpuNmYFxA2vHmPbHbJ3W46gLTrw8Ywcb83hWBrhrJwzukOZytPaMP13ywpxmlZwpIrZ6Gj8MK89kuWAy2kLeZeABzEmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bGvb74yjgz9sZ2;
	Tue, 10 Jun 2025 18:37:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RpvMo2iatbtY; Tue, 10 Jun 2025 18:37:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bGvb74DX0z9sYQ;
	Tue, 10 Jun 2025 18:37:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 89E758B77A;
	Tue, 10 Jun 2025 18:37:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 7X_NwQXE2xj6; Tue, 10 Jun 2025 18:37:23 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D4458B76D;
	Tue, 10 Jun 2025 18:37:23 +0200 (CEST)
Message-ID: <88be9850-fa2e-4470-b54c-55b6b8e2dd29@csgroup.eu>
Date: Tue, 10 Jun 2025 18:37:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] (powerpc/512) Fix possible `dma_unmap_single()` on
 uninitialized pointer
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Anatolij Gustschin <agust@denx.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "open list:LINUX FOR POWERPC EMBEDDED MPC5XXX"
 <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
References: <20250610142918.169540-2-fourier.thomas@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250610142918.169540-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 10/06/2025 à 16:29, Thomas Fourier a écrit :
> [Vous ne recevez pas souvent de courriers de fourier.thomas@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> If the device configuration fails (if `dma_dev->device_config()`),
> `sg_dma_address(&sg)` is not initialized and the jump to `err_dma_prep`
> leads to calling `dma_unmap_single()` on `sg_dma_address(&sg)`.
> 
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/platforms/512x/mpc512x_lpbfifo.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> index 9668b052cd4b..f251e0f68262 100644
> --- a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> +++ b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> @@ -240,10 +240,8 @@ static int mpc512x_lpbfifo_kick(void)
>          dma_conf.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> 
>          /* Make DMA channel work with LPB FIFO data register */
> -       if (dma_dev->device_config(lpbfifo.chan, &dma_conf)) {
> -               ret = -EINVAL;
> -               goto err_dma_prep;
> -       }
> +       if (dma_dev->device_config(lpbfifo.chan, &dma_conf))
> +               return -EINVAL;
> 
>          sg_init_table(&sg, 1);
> 
> --
> 2.43.0
> 

