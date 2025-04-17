Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4A71CB9E2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882696; cv=none; b=Rw8+v3kfGSp1VRXa4t3TyQTTKHiKdANjmuL1BVfndIqU4hkDf2JXVcyQSDn1HPU1ZY4TxfY+RCGtqfdc/HVCa37tSJTObu0oKIpEdNUzU1g0RkIjNkG4/VT+2osHAToRh5gr4duvwkL1C/0dpfisLF1DouQCYAG14eOME7xzjOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882696; c=relaxed/simple;
	bh=1JLQIUPbTX8Mcp+jC0eFAYhsWsIwTKoFJYRCd63OuSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWgHfM2j77DO1dZhLd0Uzy2N1c6G7CBJ82+DuGu6Z6U0hGUhJlIU/0aQai16ykUNM5Nz5cNDYvF0M5mB/AKfxmGTZ33grhixHTaap4A84prcTHqreIHwo232d8PQwzxV6efnpPhbxdAR8GW0Fuj8hXrUuQwjw9ZQ9unTV3yqvRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TlgJ7Jdu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TlgJ7Jdu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4979BC4CEE4;
	Thu, 17 Apr 2025 09:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744882694;
	bh=1JLQIUPbTX8Mcp+jC0eFAYhsWsIwTKoFJYRCd63OuSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TlgJ7Jdu9uPc42f8y6yqRQrdR79IOMv1nqoKIT/0RrZQR4mBpnGJMIZBdaUeLZM/j
	 4+OGHgHWNxD6nlC5ZezPZCp1adJJdj6pmzjQbaxGAaIDvks7T2nYTzf8BEYGbGNMu3
	 7fWgA3HtyraqfDh4ZCQ+34SlQIjeU05YWNb+ogho=
Date: Thu, 17 Apr 2025 11:38:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Purva Yeshi <purvayeshi550@gmail.com>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] char: mwave: smapi: Fix signedness of SmapiOK variable
Message-ID: <2025041728-calamity-unsuited-4ba9@gregkh>
References: <20250417091018.29767-1-purvayeshi550@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417091018.29767-1-purvayeshi550@gmail.com>

On Thu, Apr 17, 2025 at 02:40:18PM +0530, Purva Yeshi wrote:
> Smatch warning:
> drivers/char/mwave/smapi.c:69 smapi_request() warn:
> assigning (-5) to unsigned variable 'usSmapiOK'
> 
> Fix Smatch warning caused by assigning -EIO to an unsigned short.
> 
> Smatch detected a warning due to assigning -EIO (a negative value) to an
> unsigned short variable, causing a type mismatch and potential issues.
> 
> In v1, the type was changed to short, which resolved the warning, but
> retained the misleading "us" prefix in the variable name.
> 
> In v2, update the type to s16 and rename the variable to SmapiOK,
> removing the "us" (unsigned short) prefix as per Greg KH suggestion.
> 
> This change ensures type correctness, avoids confusion, and improves
> overall code readability.
> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> ---
> V1 - https://lore.kernel.org/all/20250409211929.213360-1-purvayeshi550@gmail.com/
> V2 - Use s16 type and rename variable to remove misleading "us" prefix.
> 
>  drivers/char/mwave/smapi.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/char/mwave/smapi.c b/drivers/char/mwave/smapi.c
> index f8d79d393b69..65bc7e1ea6cf 100644
> --- a/drivers/char/mwave/smapi.c
> +++ b/drivers/char/mwave/smapi.c
> @@ -66,7 +66,7 @@ static int smapi_request(unsigned short inBX, unsigned short inCX,
>  	unsigned short myoutDX = 5, *pmyoutDX = &myoutDX;
>  	unsigned short myoutDI = 6, *pmyoutDI = &myoutDI;
>  	unsigned short myoutSI = 7, *pmyoutSI = &myoutSI;
> -	unsigned short usSmapiOK = -EIO, *pusSmapiOK = &usSmapiOK;
> +	s16 SmapiOK = -EIO, *pSmapiOK = &SmapiOK;

Do you think that "SmapiOK" is a valid kernel variable name?  Doesn't
look ok to me, what does checkpatch.pl say?  :)

thanks,

greg k-h
