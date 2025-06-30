Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60991B87F0
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 20:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751314422; cv=none; b=hZTNj01CvIuaP4MhngMHUeGPjuKJMqdAEzFDBZFUkQQ+a8tlmV7t/WbdEqNmJMJBveocL81hGlaiEhDgc52+3RimTrUbJuWKXhJUvFLct6zHIQ6mEqWW4lD6A4xBAkT8t2+67ke3fa3SElFUCQNwpERSIyyR9QUgfSTQ8/Hjr2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751314422; c=relaxed/simple;
	bh=Rz5c9iymJ89RgH7VupYvYE77SNzmWUAZJfYVmptlxFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKqy9LTKHIQ5Fo1ltLxSiDwxS50K/HWa+Amt+2mVZsLgPwSJFbMHwtGg9uobmbo69NYG+AVqaTYvvxkcpVbMQR3qBuV6Jb+MLib2kNVkO8Mg3Z8GKd5YTO/BLlSR+5Ocv9e0r6rUEyKrjCRxTEzzmvwOmLEwQgG9adawefJbpUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SUvfdSNQ; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SUvfdSNQ"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72c47631b4cso1878690a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751314419; x=1751919219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Pw9uo4PLqW445+ML/2nj2YC9JrDhcP48EMZJgbllM0=;
        b=SUvfdSNQYt2jPuYULxgAzEJ0Asfn43e5IdzPJLOD1n9sgzBLYoE7f9NvEXdGlNQ3d3
         1w5pYQoz67Ev2el9/CJ8rTZY7bZ999YgiU3Srv6U6uYLdTMX08OqO6Hfb3czqIHEE3N6
         WrqPiNdMnAb7NETv8zrm+NLqxELtpIeI9BuFDmWGtNtYTAK+PQhMGemfSjhLgQnvJcPt
         KxiTzQMO56troEm2aIRj5qAm0pCyMuHzNV3gF0gfxGcAit/8JpD1iMsrSh2u6sxhy4Tz
         PGrmkK+pMEixR/WRs29qwDucEy6/zEstJfAq6Q/UjI05qMhbbcBK8PUAKwyLmdioS+6M
         UElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751314419; x=1751919219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Pw9uo4PLqW445+ML/2nj2YC9JrDhcP48EMZJgbllM0=;
        b=T6HNZMO/HQ+XQa1AJA33ldpZ8tIRF3nGUlL0lL6thc9AQubLGKY5p059Y80w0sEtKw
         5CM59n0RucVHtJpgacNk15wEfch9+Z8/NHws/K407ylb31ECKWmIoJo9cZOAZHdXvqTZ
         0uklygLBlaSY/B85hpjmQ1InP/xipWFLhta68tdLiO5MlZ/IYn7+QHjmdrsqp1EeVw1/
         fHySg1EH4POwlGcZVVwrhOuKicBJw3TnsG5DLZ+7kIgA5UGPuzK0xJ1DoshNcdsmSl2R
         999Sn1mrLH0CGFvxRVbSTUbwGTJhE4N6OwNjzeh/6QKCSB3snIObn6Uuvxw9Omzn9mBd
         5wkw==
X-Forwarded-Encrypted: i=1; AJvYcCW0vVLoaqLbUXmUPkC0q57JY10POGHGG75COY+ayczaeVJ5HHJjL2UTqPPSJ1TismI0HFlrp88E1iFiKr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHTa6yVuaA1blhlXZMTjI9GGRNfzilRxROddrOPV30mbIO6iAn
	4qzAiL3qJH5Z2+slr+Ri+48JfX818OMk1EHp31S/40pLqZMuG5RUwWY572IytRicP6Y=
X-Gm-Gg: ASbGnct3GRas3ucC1HHJXteoIwylAeaNuqOmHWSsistYrON3hnMMonCASUWrijOnRHP
	IDn7U23vRT5oDgYixR04qUxKM7EaEi90O8eBJtY/AR2OFgAV0ROD5DCs60aEy7J6qSUp8oLTqN3
	WBK1zh1JeEJyHPMQtZXdLVBKJll3Kutl9iI03SrgMZRwjqUpVsguWHF20/0ySbudMGmKIzqLDbT
	yNgmVbOlGaEN8Kxfp3lRWEh+O2VUv2Aixi+uvlTaSt2IXslzlWBxuiGNcG0rkht0ZEex68hd3Sc
	k80XB9DTBSXzzESB1k/ktLoFtmmuE+URMaH0vNWfQuYtY27SMFZ8PN6NcHAx6L6Xib4Ug2Ogcu/
	tDW0=
X-Google-Smtp-Source: AGHT+IF2bHM+w0oqv+2GI5jLOgo08atfHsKBXad89kPavKIYpA3L2mvYlOwrOo1nKxkMGjuZXO2PVQ==
X-Received: by 2002:a05:6830:6501:b0:739:fcb4:db17 with SMTP id 46e09a7af769-73afc57af58mr10984924a34.15.1751314418614;
        Mon, 30 Jun 2025 13:13:38 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb0068e6sm1807151a34.17.2025.06.30.13.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 13:13:38 -0700 (PDT)
Date: Mon, 30 Jun 2025 23:13:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marcos Garcia <magazo2005@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	karanja99erick@gmail.com, rodrigo.gobbi.7@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH staging] staging: rtl8723bs: replace magic numbers in
 beacon init
Message-ID: <38411a98-d907-4173-a528-8d50b337de0c@suswa.mountain>
References: <20250630173339.3828756-1-magazo2005@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630173339.3828756-1-magazo2005@gmail.com>

On Mon, Jun 30, 2025 at 07:33:39PM +0200, Marcos Garcia wrote:
> Replace hardcoded register values in rtl8723b_InitBeaconParameters()
> with properly named defines documenting their purpose:
> - TBTT_PROHIBIT_DEFAULT_MS (0x6404) for 100ms interval + 4ms margin
> - BCNTCFG_AIFS_LARGEST (0x660F) for maximum AIFS value
> 
> This improves maintainability while preserving the original behavior.
> 
> Signed-off-by: Marcos Garcia <magazo2005@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 27 +++++++++----------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index 893cab0532ed..cc7886d75a0b 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -1183,31 +1183,28 @@ void rtl8723b_read_chip_version(struct adapter *padapter)
>  	ReadChipVersion8723B(padapter);
>  }
>  
> +/* Beacon Configuration */
> +#define TBTT_PROHIBIT_DEFAULT_MS	0x6404  /* 100ms interval + 4ms margin */

I don't understand the units here.  How is 100 + 4 = 0x6404.
0x6404 is 25604 in decimal...  I don't get it at all.

> +#define BCNTCFG_AIFS_LARGEST		0x660F  /* Max AIFS for beacon priority */

I don't understand this comment.  This feels like ChatGPT...  It's
got that magical feeling where every word follows the other so smoothly
but when you think about the meaning, it's both really vague and
slightly wrong.  What is "beacon priority"?  What other types of
priority are there?  What type of units is this?

> +
>  void rtl8723b_InitBeaconParameters(struct adapter *padapter)
>  {
>  	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
>  	u16 val16;
>  	u8 val8 = DIS_TSF_UDT;
>  
> -
> -	val16 = val8 | (val8 << 8); /*  port0 and port1 */
> -
> -	/*  Enable prot0 beacon function for PSTDMA */
> -	val16 |= EN_BCN_FUNCTION;
> -
> +	val16 = val8 | (val8 << 8); /* port0 and port1 */
> +	val16 |= EN_BCN_FUNCTION;   /* Enable prot0 beacon function */
>  	rtw_write16(padapter, REG_BCN_CTRL, val16);
>  
> -	/*  TODO: Remove these magic number */
> -	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
> -	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
> -	/*  so don't set this register on STA mode. */

This comment was clear and useful.  Keep it.

> +	/* Fixed: Replaced magic numbers with defines */
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is kind of information about what you're fixing is supposed to
go in the commit message.  Not the comments.


> +	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_DEFAULT_MS);
> +
>  	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
> -		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B); /*  5ms */
> -	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B); /*  2ms */

These comments that explained that DRIVER_EARLY_INT_TIME_8723B was 5ms
and BCN_DMA_ATIME_INT_TIME_8723B is 2ms are kind of crap.  The define
should have been called something like BCN_DMA_ATIME_2MS or something.
But they were at least better than nothing.

> +		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B);
>  
> -	/*  Suggested by designer timchen. Change beacon AIFS to the largest number */
> -	/*  because test chip does not contension before sending beacon. by tynli. 2009.11.03 */

This comment has a typo s/contension/contention/ and it's not clear
if we're trying to avoid contention or if we don't need to worry about
contention.  So it's not perfect, but it does potentially provide some
useful clues about the code so it's better than the new comments in that
sense.  Let's keep it until we can find a better explanation.

regards,
dan carpenter

> -	rtw_write16(padapter, REG_BCNTCFG, 0x660F);
> +	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B);
> +	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_AIFS_LARGEST);

