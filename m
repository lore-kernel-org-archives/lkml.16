Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0024F23C8C7
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 20:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738959538; cv=none; b=g9WPSKkTLY8CPDmTOtbLVPxMy1WR/RcUrbZfr7TXJLDpqzqLFZuOaGJDYmwwOJsV4FTbUN3MgsX4E7yDiKIcq7lk0VMLqZ0MvCG5mWhZseF/JDmoXCOh8chWxe9yMC2OG24GiI+YFVQ83+69/78mWSpL6Ogd1kEv0H2imbVCsa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738959538; c=relaxed/simple;
	bh=lEOD/eFIum+VyzFNtI9Z/pDUiBWh3Mf2e0ze8INjyBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kvvrfZE98TrZqZ7ONXKzDQXl7H9iy5mHCzd5Na8VSBVKXzCHyYk+zfQgKbq3cSbkrUcbzHhsEBXI8HjSc2FnMLBZ+TiKhs5zeheYyZAtmFmAkaJ3lUv+SZu9IfHta0YL4bWov9aXzFXo12JSev6Ie0QBGBZ1gg+IqOwBQU84fVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=pass smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=pEhLGI1K; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="pEhLGI1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1738959533; bh=lEOD/eFIum+VyzFNtI9Z/pDUiBWh3Mf2e0ze8INjyBE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pEhLGI1K5PS8KGpoCx8/tXESm7ppQjxYNAAo4b/ayenOolDFsRYSYDABde9zgNrRi
	 Mc19L1stfK/AQn6U/ieGkJhd30ZhR28+xTBGGvqjdibV0DQAdhPaQ8yRIKjhSX8vbR
	 GvIboQ4HWSR9bvqLPZ8hseeJHxMr5ZSo5htoqCoA+s+UuPxRtjOn54cKty9Kbpr3xi
	 78y8kmYzf34g4zVA07BbMjGvsp6BeoQa3hT8G3u7VggAbblhUrHIlwy46NQIhVbLpR
	 E9dUyoLfHnqTtz1QBHO52eg8OP3aMlXIB9aRpqhm49Dtgzu3+FNZsYyCaAQcMOhybx
	 F3dE4/7dl8qkEGOBj9tPOEzwbvO8ENpHMOJgjjUaYQmEmhDesHAcWTsdbhbeJz9Emg
	 j7Iz4q5YbKvv3r7CyW2M1QzzJDPATa3wu4Ea7+KTkZwifwpZ5iWs080HhML/sFB/cK
	 AH/lq69JqtiDctsKvUBpHgqO2rATdtPnVtTfDkOOUoCO56BytCgiOWoqE2FOuNXYHZ
	 80ztseGhpzAkyQ1/iMMSfJAhLDCTqF5xpdUOBVNHp/9UxFK7NfRUVjfJQuNHC/Zttj
	 Q+0o786tabB+sR9vXW76Adleppb2UQfJmllWeEOLJJzImUNCtpE7643EVNuNuJwi4C
	 4q6jOjww/VebE4G7ZWnsx5GM=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id EED07160352;
	Fri,  7 Feb 2025 21:18:47 +0100 (CET)
Message-ID: <3753eb61-e198-4f4c-97d8-4634c1b8165d@ijzerbout.nl>
Date: Fri, 7 Feb 2025 21:18:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] staging: gpib: tnt4882: remove unused variable
To: Gaston Gonzalez <gascoar@gmail.com>, linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org, arnd@arndb.de,
 dan.carpenter@oracle.com, ajithpv.linux@gmail.com, roheetchavan@gmail.com,
 niharchaithanya@gmail.com, eleanor15x@gmail.com, everestkc@everestkc.com.np,
 skhan@linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20250207150427.153982-1-gascoar@gmail.com>
 <20250207150427.153982-9-gascoar@gmail.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20250207150427.153982-9-gascoar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Op 07-02-2025 om 16:04 schreef Gaston Gonzalez:
> Remove unused variable 'retval' in function 'tnt4882_update_status'
>
> This change removes the following warning:
>
> warning: variable ‘retval’ set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
> ---
>   drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
> index 2e1c3cbebaca..a681bf559b46 100644
> --- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
> +++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
> @@ -704,12 +704,10 @@ static unsigned int tnt4882_update_status(gpib_board_t *board, unsigned int clea
>   {
>   	unsigned long flags;
>   	u8 line_status;
> -	unsigned int retval;
>   	struct tnt4882_priv *priv = board->private_data;
>   
>   	spin_lock_irqsave(&board->spinlock, flags);
>   	board->status &= ~clear_mask;
> -	retval = nec7210_update_status_nolock(board, &priv->nec7210_priv);
You cannot remove a function call just like that. At least, not without 
describing that
it is OK to do so.
>   	/* set / clear SRQ state since it is not cleared by interrupt */
>   	line_status = tnt_readb(priv, BSR);
>   	if (line_status & BCSR_SRQ_BIT)

