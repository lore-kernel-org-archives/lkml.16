Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDC732C8B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 14:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743863701; cv=none; b=c6fOqngxaYXGHUeGEWUyX+G6shERr9em/OVNdvte4vmqWSZHUPSbdyWwrvFFm21SqM8f0ALt31sjBjzlI1FxjarEc59B/ua0bf7fwiEtUr1bm0anCpxcAkVaIET9SgJqN2YXjLSEumqyQNzKvRuaxZuQuySIIpZFBKyE+CfTmY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743863701; c=relaxed/simple;
	bh=Jz2jG35a8jxkfJR/K1JGWyUsAohw0IVAj9COzgsDaK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1UTN6BCipJHP6bWGCsgQA4bYe+fDXteIB50T4inwyFvwGikaejwxogE18aNO/QK1YFM21e3xVrt33TYO+xfx3dRImbc3yD/kgdyXsG3yvHmMKiUdHOWWoURDAh2Z6lHnNgMxcCzyAo9U3hoEM6/VftUXzTLVl/eMiDVC9rTkTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wwansMkW; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wwansMkW"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3913d129c1aso2050900f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 07:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743863698; x=1744468498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zhyg0t58cU1vi3f6vTrT4cSrowyxcOvo1z5RkDWvOMc=;
        b=wwansMkWvgZTGyCaz691HGawa2IHcI4N/4QQAolFtDP8yQCSuT9jWXSCz+yHS4q1tz
         yQwpPzNIVZ8v+tcwmAwkD2ldIK+S+rhkzBVFIGktjGzaVgZmhtgM29CE+kMDWvB6IV10
         7FO4fCe+HFmsm+kv2BN0P2BosXnh6ouo8eJgjSfPPJ17As0N7bYmsK/jy3UT6u1OBLHH
         A3a/l+pj/84GWozfC1F6kHIqYnG1120jUbnIfUfPP0jEfxgUo8ICgZc1lUumyQnR1EUW
         DSeo+WHSgQU7S4DlPTwx1NRbQLdjhdEKFXGWMO+lsDBuVA2ejr5o01NbwrfEf5mo9NWx
         /a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743863698; x=1744468498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhyg0t58cU1vi3f6vTrT4cSrowyxcOvo1z5RkDWvOMc=;
        b=RLI3DH4HoCiKoagqENRPp47KkWHQvYgBmQNp/HV/bJbYC9yFS5zDSl0M0Oh88YQ1oo
         OgqvaNT/MQwnTbJp2EA1Rn5bxpZ2454QwuITiPJyKC4gAhKyRH0tcdS5DS9GTKP339MO
         azfOV2MTY1Diw9YhCMutfMHBWv5G2KZvpSkJ68xNdtde3ryKzw9vUrLzA+5vGwvhjUSA
         zcYaDBoyWotYhQCqnZvlYKEsuFdQHxBt21gmNvNX7jz9Z0vp3SifYII8StuxJxKHsw5F
         4YfzGtdhIpHNvivkLdm/fxz0VGMFtdOoRTbQhSt2GrujwxmCTZ1nfe2Oy94hyEbzd7xA
         ZUJA==
X-Forwarded-Encrypted: i=1; AJvYcCUEp5Vg7F0W8HRmHuldCSOdaSCG6oZ8pp9boTuJ38uRWkiZmO0twZ7DTHZ+fBAuc241BeluvOWgiIwRg6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww84Un8GoiLAVkE/DHQCfASBCidZcAQv/1SKJMIxOHfVjaP5mH
	HOp4VQJusHrevWqLf7LXULoGVSLKgj0mUmZVrYzbFzLpX8LRinUgz958Sf9ntCM=
X-Gm-Gg: ASbGncvU8eC2u4vKKGi5L8GWdj9yRbUFWQgCRhquscW+zp6kNIYWawu1uVcbYnPZLZC
	y9dxXEUZO7SKD5owPhPXoY6aX4x6GBHND0DlGAWqXLQgTcoafj24hW+FhdNb3ws23WIp+sWrHhe
	LGeUQXlUktOIEffky9GL5RVuifsYweRIJWIulo4CHYdImoF8EnyHQ/PFFZvxbsndk6wLW5N1t+j
	V/nUe0bI6cAC8uqmiAQplemT+1eo7XF1dhcHvmUgQ7IzM5KER8AcSfyXiXQBqPSTUccCoSUyfub
	A0K9jowv6f8y+vZPevVJnSB6OH8nGw/cFyiAmedQLYPygPd7Naw9hQiR5qHs
X-Google-Smtp-Source: AGHT+IE/M9txzHe0PtFaLgR9ct861DaYcfnp5n7x7JLLBKwz5m7VyOjZai/5+5Yi3USWwxC/jRVIdg==
X-Received: by 2002:a5d:6d8f:0:b0:39c:e0e:b7ea with SMTP id ffacd0b85a97d-39cba942a90mr5605476f8f.20.1743863697655;
        Sat, 05 Apr 2025 07:34:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301a7586sm7163739f8f.38.2025.04.05.07.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:34:57 -0700 (PDT)
Date: Sat, 5 Apr 2025 17:34:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: Add error handling for sd_read().
Message-ID: <948e34d5-95b0-4f7f-acf2-c93cd2536300@stanley.mountain>
References: <20250405140703.2419-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405140703.2419-1-vulab@iscas.ac.cn>

On Sat, Apr 05, 2025 at 10:07:02PM +0800, Wentao Liang wrote:
> The sdio_read32() calls sd_read(), but does not handle the error if
> sd_read() fails. This could lead to subsequent operations processing
> invalid data. A proper implementation can be found in sdio_readN().
> 
> Add error handling to the sd_read(), ensuring that the memcpy() is
> only performed when the read operation is successful.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org # v4.12+
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---


You need to add an explanation here what changed in v3.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

>  drivers/staging/rtl8723bs/hal/sdio_ops.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> index 21e9f1858745..b21fd087c9a0 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> @@ -185,9 +185,11 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
>  			return SDIO_ERR_VAL32;
>  
>  		ftaddr &= ~(u16)0x3;
> -		sd_read(intfhdl, ftaddr, 8, tmpbuf);
> -		memcpy(&le_tmp, tmpbuf + shift, 4);
> -		val = le32_to_cpu(le_tmp);
> +		val = sd_read(intfhdl, ftaddr, 8, tmpbuf);
> +		if (!val) {

The sdio_read32() function now returns negative error codes.  Probably
a bad idea.

regards,
dan carpenter

> +			memcpy(&le_tmp, tmpbuf + shift, 4);
> +			val = le32_to_cpu(le_tmp);
> +		}
>  
>  		kfree(tmpbuf);
>  	}
> -- 
> 2.42.0.windows.2
> 
