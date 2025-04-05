Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE06B3FC3;
	Sat,  5 Apr 2025 07:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743838727; cv=none; b=RkGXuR5PsecKqxaHFgHcuQ8uwpAe5a7Bw5QCF09u/qMQlbLRIZ9XQvqDHBqRGot/YQeumcYHgNl2xzV4hR0KYCialqU71dIVcsGkXTnl5LbdinU6DlgDlvuIF3zgwC0JDqdhpQlBAsrwyZm9Luply49afKGPDW9xoI7ryW6OxjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743838727; c=relaxed/simple;
	bh=WLxOEAlNOQ4Xkv5hySHgQVLD+Z9CjIai20RwwfQBSlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7k+lWmQqJ5L4tw7p/lsxduVDI4FViFsJEDOj4P3H3duNMA1u5lNWLTK6dDNDe1fL0yQevNIcYNdM+QJ+lhk2yd5gx+WDssW9qV+RjkLUfC25R7QD8m8al0bekLLjPqun872FvJ0Tm25G1XpH0yftcRYFgHGwkSTCq3U2ClK/Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sCEafKo6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sCEafKo6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9619C4CEE4;
	Sat,  5 Apr 2025 07:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743838726;
	bh=WLxOEAlNOQ4Xkv5hySHgQVLD+Z9CjIai20RwwfQBSlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCEafKo6lzUG1gUFjQ22zB7MAGnLi1CTQe+KEU4jNh5woae5aOqxSXcbOTfmMWOnb
	 R9aUzhQf/QZvc+wvKhyNNIRSvHErOooH/SqGJGkf9NeP7HThxq/zCbwNJdgIb3uJx7
	 pDAdkxDUonmNYuyl3sUosLrDMTaUSL7z9gj1U1cY=
Date: Sat, 5 Apr 2025 08:37:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: outreachy@lists.linux.dev, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8723bs: Initialize local variables at
 declaration
Message-ID: <2025040507-attest-hyphen-5dae@gregkh>
References: <cover.1743820815.git.karanja99erick@gmail.com>
 <ef29adfe7c8a189009b07c2873aa48782cd594ca.1743820815.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef29adfe7c8a189009b07c2873aa48782cd594ca.1743820815.git.karanja99erick@gmail.com>

On Sat, Apr 05, 2025 at 06:14:49AM +0300, Erick Karanja wrote:
> Optimize variable initialization by integrating the initialization
> directly into the variable declaration in cases where the initialization
> is simple and doesn't depend on other variables or complex expressions.
> This makes the code more concise and readable.
> 
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 56 ++++++-------------
>  1 file changed, 16 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> index 5dc1c12fe03e..ebe9562a9606 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> @@ -120,13 +120,10 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
>   */
>  s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
>  {
> -	struct xmit_priv *pxmitpriv;
> +	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
>  	u8 queue_empty, queue_pending;
>  	s32 ret;
>  
> -
> -	pxmitpriv = &padapter->xmitpriv;
> -
>  	if (wait_for_completion_interruptible(&pxmitpriv->xmit_comp)) {
>  		netdev_emerg(padapter->pnetdev,
>  			     "%s: down SdioXmitBufSema fail!\n", __func__);
> @@ -168,10 +165,10 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
>   */
>  static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv)
>  {
> -	s32 err, ret;
> +	s32 err = 0, ret;
>  	u32 k = 0;
> -	struct hw_xmit *hwxmits, *phwxmit;
> -	u8 idx, hwentry;
> +	struct hw_xmit *hwxmits = pxmitpriv->hwxmits, *phwxmit;
> +	u8 idx, hwentry = pxmitpriv->hwxmit_entry;

These lines are NOT more understandable and readable at all, sorry.  You
are mixing pre-initialized variables with not-initialized ones, making
this harder to read and maintain over time.

Which would you want to come back to in 5 years to try to understand
what is going on?

Keep it simple please.

thanks,

greg k-h
