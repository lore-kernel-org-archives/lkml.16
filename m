Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEF338DD8;
	Sat,  5 Apr 2025 07:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743838867; cv=none; b=EuN1v4bnxL4cax1oYuSg0eZEZmFwwXsuTnqTqAompJJObwzgCszfgNoQ575+dkJZan/iym3mDW/4RaUs/OMezqwLtM7zErc8Jjdr1Tq1c58DoeELC1balSLtFlJogQNN3uq2TamwFSl51HmDIr7EC33nY7DjsMeYCui6xrKKAA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743838867; c=relaxed/simple;
	bh=NRX4+qgcwMXArCe5OstNuBJYSawf0hUuiCSLrdtvt9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhK2uhaSDe/8JlRn8xxpecGjSpN29fMxdsCms29sv2H3hmn9bVpucII3CZ9KTd8E4DKzLwtsUTeUn99lmmacB2P7URBYYJBat8S/uLTLugaRyPyEmK4+atUIsy9VVRh3UoljkxYE/U6CHW2zfeGb9PvyipH4Suri7Jt5pTgH18Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cOEObAzJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cOEObAzJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED5AC4CEE4;
	Sat,  5 Apr 2025 07:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743838865;
	bh=NRX4+qgcwMXArCe5OstNuBJYSawf0hUuiCSLrdtvt9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cOEObAzJHkgfS4b1PWDh1UYUrltkU0P5XOmXLl42EOFbe3ZYbyY3/eQHpeyCxFwxr
	 X68swRoma8ftuykzFMYX9Un8GRqqb87TOXdLy0YaE1yMXW3/lyJclrU0jdwguxr4Yh
	 feM3PU3alsdnegrPPyZzAk8FDV6rD1DHzsza/k0I=
Date: Sat, 5 Apr 2025 08:39:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: outreachy@lists.linux.dev, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: Optimize variable initialization
 in rtl8723b_hal_init.c
Message-ID: <2025040532-only-quickness-21f2@gregkh>
References: <cover.1743820815.git.karanja99erick@gmail.com>
 <f7b63d834b98aedfe2ce277d8008d7e398ea29ba.1743820815.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7b63d834b98aedfe2ce277d8008d7e398ea29ba.1743820815.git.karanja99erick@gmail.com>

On Sat, Apr 05, 2025 at 06:14:48AM +0300, Erick Karanja wrote:
> Optimize variable initialization by integrating the initialization
> directly into the variable declaration in cases where the initialization
> is simple and doesn't depend on other variables or complex expressions.
> This makes the code more concise and readable.
> 
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 155 +++++-------------
>  1 file changed, 41 insertions(+), 114 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index e15ec6452fd0..1e980b291e90 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -152,13 +152,12 @@ static int _WriteFW(struct adapter *padapter, void *buffer, u32 size)
>  void _8051Reset8723(struct adapter *padapter)
>  {
>  	u8 cpu_rst;
> -	u8 io_rst;
> +	u8 io_rst = rtw_read8(padapter, REG_RSV_CTRL + 1);
>  
>  
>  	/*  Reset 8051(WLMCU) IO wrapper */
>  	/*  0x1c[8] = 0 */
>  	/*  Suggested by Isaac@SD1 and Gimmy@SD1, coding by Lucas@20130624 */
> -	io_rst = rtw_read8(padapter, REG_RSV_CTRL+1);

Ick, no, now the comment doesn't make much sense, right?

The changes you are making here are odd, why are you wanting to do this
type of thing?  What tool suggested that these are a good idea?

thanks,

greg k-h
