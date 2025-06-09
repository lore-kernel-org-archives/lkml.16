Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DC0323E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 00:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749430214; cv=none; b=cESq0CA3Tt9EyWhsgpiYB7mju9he+8SOtr5ec6aYIOovhAzkwJMfwaZQPXoyy4VLU/+UHBxjuynw7aupTZUWPQV+m0R5EWqiz1y0sHlnGz1bzwtHgObdwUHk6tBDPRMLvXaQyCoqjEXvhBXDCXxNf5Uf+LH3tNMpq6eLVVaquNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749430214; c=relaxed/simple;
	bh=tJvQbGMl4d3Av3kuwx30wJVsgS/o/J1DnU/2t+/sovk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AAEsc8PF/9xoNjIIsmrPD4Xg2qnaGKO+ncdc1uxMdJPaSFvvEhz5J1+mTR381IXJo2w2KioDWVqhsrwxRk+xvgZq/XbpBlxSqnEtwjB2Lr5d7+9RWLSiMPiRsiWTJMsWk94i85APYqm99/kimrbNggP/Gif/JAPtyYbqmat/15c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=UXCmrlKN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="UXCmrlKN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1749430202;
	bh=sdfLGZeREbdRtpiQQRo8sJe4Akri5tZyrF4Ogu7Xmes=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UXCmrlKNCbZbitpL8txJwEXwigYIQeBOQYDj+nGYPVrtdx8aUV/ahizYFuJQRI7hy
	 uQUL9plAzWwbgQwB1gjqH2f/mRriRqHE9hw9a4lrxRcEAXOCOhk0qsUjfjeU5aOdPW
	 HDl/nhYxm9w96n2YE9S0K5vjm++/9RPaV7qZU1RDkEiGirzSt2yPyoYUEyEoYpMrv/
	 0I7DBCjG3wCS9gD4YnuE0asEsQjC01gKBScqXH79Zw39mDKxUNZ3rxNofjm/ABey0k
	 ckfbnlMu0xFO/WA6iTkxvX6GmfSVx8Io5ytwSsxLfqf7L/LEpe6bBLR3YNFoIeKhst
	 fgibYyCLw1ZOQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bFtcT614gz4wbv;
	Mon,  9 Jun 2025 10:50:01 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Thomas Fourier <fourier.thomas@gmail.com>, Anatolij Gustschin
 <agust@denx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, "open list:LINUX FOR POWERPC EMBEDDED
 MPC5XXX" <linuxppc-dev@lists.ozlabs.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] (powerpc/512) Fix possible `dma_unmap_single()` on
 uninitialized pointer
In-Reply-To: <20250605163717.18020-1-fourier.thomas@gmail.com>
References: <20250605163717.18020-1-fourier.thomas@gmail.com>
Date: Mon, 09 Jun 2025 10:49:59 +1000
Message-ID: <878qm1wxfs.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Fourier <fourier.thomas@gmail.com> writes:
> If the device configuration fails (if `dma_dev->device_config()`),
> `sg_dma_address(&sg)` is not initialized and the jump to `err_dma_prep`
> leads to calling `dma_unmap_single()` on `sg_dma_address(&sg)`.
>
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>  arch/powerpc/platforms/512x/mpc512x_lpbfifo.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> index 9668b052cd4b..ef3be438f914 100644
> --- a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> +++ b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> @@ -241,8 +241,7 @@ static int mpc512x_lpbfifo_kick(void)
>  
>  	/* Make DMA channel work with LPB FIFO data register */
>  	if (dma_dev->device_config(lpbfifo.chan, &dma_conf)) {
> -		ret = -EINVAL;
> -		goto err_dma_prep;
> +		return -EINVAL;
>  	}
>  
>  	sg_init_table(&sg, 1);

Yep looks good. That's the first use of goto for error handling, and
it's clearly too early. All the previous error cases do a direct return.

Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
