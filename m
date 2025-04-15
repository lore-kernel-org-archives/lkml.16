Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9572DFA56
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728729; cv=none; b=AyAkp1Dps59up4nNURyUTWeyZ5uYA91q6im3D2CV6v8FXoCkFu4/jYYufyj50G0lTH7E7XXYmPfmXLMen7vwAfRgiQJAHr/8uzxf2xeMJiIxcYAhD8AIHjqLv1bdNsR5+ucR6wKCz0n5FQy0vlBd5uOTx8R5itnb1zpIVhUH4mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728729; c=relaxed/simple;
	bh=lp5fmkgjvS/BK2jSJgya3szHboKt2Q+8y2xzDzjZl/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAH8UsdDcuvM+De79AfHi5gqBNPqMMdLdGdAqPmgo2ympd/7snIQQCoBf73+Xk8zqO0j5tqR2JzTjTy9U+bLPYysR4ZSiUWWy/Xuf0Guf8tN0rNLc6Qnb5t2DUabSi4hBDydHoikNCT5sjtlzr041YdEyFhtlwIVfEz4auUK7bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X9hKzZaf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X9hKzZaf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD9EC4CEEB;
	Tue, 15 Apr 2025 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744728728;
	bh=lp5fmkgjvS/BK2jSJgya3szHboKt2Q+8y2xzDzjZl/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X9hKzZafH0jkea7AJbW9qE805otVpDH/Y1scKpqrzV4prW1JjYePJEt2FTz5oTjG2
	 Myr84uyZb8WJ9noQNNLg6Xpl3c9teEWTUeYgumozaVdIMyly4SqWk/OhuJRZL8VsQq
	 PlM5oqgCxtv5lt3IgZ8k54cR5r5TuMRQtHiE2vJc=
Date: Tue, 15 Apr 2025 16:52:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Purva Yeshi <purvayeshi550@gmail.com>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] char: mwave: smapi: Make usSmapiOK signed to fix warning
Message-ID: <2025041520-culinary-obsessive-1dc3@gregkh>
References: <20250409211929.213360-1-purvayeshi550@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409211929.213360-1-purvayeshi550@gmail.com>

On Thu, Apr 10, 2025 at 02:49:29AM +0530, Purva Yeshi wrote:
> Fix Smatch-detected warning:
> drivers/char/mwave/smapi.c:69 smapi_request() warn:
> assigning (-5) to unsigned variable 'usSmapiOK'
> 
> Assigning a negative value (-EIO, which is -5) to an unsigned short
> (usSmapiOK) causes a Smatch warning because negative values cannot
> be correctly represented in an unsigned type, leading to unexpected
> behavior.
> 
> Change the type of usSmapiOK from unsigned short to short to allow
> storing negative values like -EIO without causing a type mismatch or
> logic error.
> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> ---
>  drivers/char/mwave/smapi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/mwave/smapi.c b/drivers/char/mwave/smapi.c
> index f8d79d393b69..37da1339357e 100644
> --- a/drivers/char/mwave/smapi.c
> +++ b/drivers/char/mwave/smapi.c
> @@ -66,7 +66,7 @@ static int smapi_request(unsigned short inBX, unsigned short inCX,
>  	unsigned short myoutDX = 5, *pmyoutDX = &myoutDX;
>  	unsigned short myoutDI = 6, *pmyoutDI = &myoutDI;
>  	unsigned short myoutSI = 7, *pmyoutSI = &myoutSI;
> -	unsigned short usSmapiOK = -EIO, *pusSmapiOK = &usSmapiOK;
> +	short usSmapiOK = -EIO, *pusSmapiOK = &usSmapiOK;

This no longer a "us" variable type :(

The joy of using this type of notation, ick.  Please fix this up to use
an explicit type (like s16), and fix the variable name at the same time.

thanks,

greg k-h
