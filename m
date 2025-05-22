Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC8828F3;
	Thu, 22 May 2025 04:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747888969; cv=none; b=ijX0F2GBnUP6TWXPuR5g3Muv5kDzCGTuiLAW052LwA+HCxKF/jMmWULiRal7m3BUccOsX8BqBtF86dEm8H7qPSNaVaZL9w5V9whd+bOjhYPuL+1xhceKkR3zv9Ro6Rhc4ycvtHeZ5IkCuNBJABtxES7CmaDLFrHkQyEVjoAIRQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747888969; c=relaxed/simple;
	bh=k/bDjmbkYJFwosrdMlSd6S9ya2h9rb0iqhZ+wyjGtgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDlc+08goqE6i69sNCcKpCBfvds4KgyZQoq7Rmj/6kJXgg+vuyH//DjPIGH+X7SYAm+UsQU1kud4XyrnsGZqbS/n0NEz1kBwkZqn/o6W+D6tJMeRD8VssWb+tYGQ+PzO/IulLR/B7ns/RFXLAy2hGHCxCm+mtqC3xDtbs3cQbqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LemoEoAz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LemoEoAz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEF7C4CEE4;
	Thu, 22 May 2025 04:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747888968;
	bh=k/bDjmbkYJFwosrdMlSd6S9ya2h9rb0iqhZ+wyjGtgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LemoEoAzlt5RYgvONZWY4dHkTksrg41V1EVsSdtGjMgXCsp6l/TDMQcYXotwpcQ13
	 fxbC8IG9VNmpefYCtOXxFmJ4SiXHd8WEnOlQDmtR8k3Irlb3j9xtuPdCOv5vwgjmct
	 xqqwr5Aa/Xi0JB6yV7yPPnEwGIirQxMtd75aIKHA=
Date: Thu, 22 May 2025 06:42:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Donny Turizo <donnyturizo13@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rename _Read_EEPROM to _read_eeprom
Message-ID: <2025052246-boxing-swung-31b2@gregkh>
References: <20250522031538.30635-1-donnyturizo13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522031538.30635-1-donnyturizo13@gmail.com>

On Thu, May 22, 2025 at 03:15:38AM +0000, Donny Turizo wrote:
> From: Donny-Dev <donnyturizo13@gmail.com>
> 
> Fixes a checkpath warning by renaming the function
> _Read_EEPROM to follow the kernel coding style (snake_case).

Why just this one?

> 
> Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
>  drivers/staging/rtl8723bs/include/rtw_cmd.h      | 2 +-
>  drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index 49bcefb5e8d2..a0b85beffe5d 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -15,7 +15,7 @@ static struct _cmd_callback rtw_cmd_callback[] = {
>  	{GEN_CMD_CODE(_Write_BBREG), NULL},
>  	{GEN_CMD_CODE(_Read_RFREG), &rtw_getbbrfreg_cmdrsp_callback},
>  	{GEN_CMD_CODE(_Write_RFREG), NULL}, /*5*/
> -	{GEN_CMD_CODE(_Read_EEPROM), NULL},
> +	{GEN_CMD_CODE(_read_eeprom), NULL},

Are you sure this is correct?  Aren't these commands that come from the
hardware and show up on a datasheet somewhere?  Don't rename things that
are referenced outside of the kernel in a different way if at all
possible.

thanks,

greg k-h
