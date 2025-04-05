Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBCB8BE8
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743863622; cv=none; b=VKjxAmX5jYfm/TdD0QJKDZkVtobslChDnEOzmZjxo58Y2m4dVTRS5DnRz0rHzQLaZXeNduYArACgPTV8fpsKZRcyPshdOvJJ56gShc2DxAvycctYaMBqdf7Z+MYfmErhqSUbgq66+V+9jryIzWZXQo3qnuNQO0ydJz13KFxVfN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743863622; c=relaxed/simple;
	bh=n6rWsRfQhHOnDdcNMoA4eBWpEZyRhkYlhRd6+rT4QLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dud5fjNnjfr4VyFveCwGxEae/s1gUo03ayjGyVEYTVcWPy/U2+DamCbFv+uO5Aj7PL+FgL9ipxAaYHnuNwSFOFnqP/zLivkxyUko8pegaJjWjT1OGqlTxHP21tsP3QLO1Uabdr8JpwllAF8Go8iZO/kzsvqYurA4zjCYcjMAThg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wr9mf7vM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wr9mf7vM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf848528aso23889145e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 07:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743863619; x=1744468419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OoxNzsNchDHOU70Y3i7GeAy+PllFDOdfRlUFcH/VIg4=;
        b=Wr9mf7vM0y10pGXbHfqbSTioVDegoZptVFo6FTCob5GLWYjnGKuTbpOA6XYE5vmkfv
         tE8VipFvuzXD/ouFybGDqfhNUwTTx40wHU9lkc34MNRVHaeBf3sJ5Ijs7csU+dJw9hvE
         2gJkBAxW1Km95L/Wd5sdWNSNqmsG+NpalbyIAZJX6EhdYA5vNMBR/BEkL50ypHr48x2j
         ZSR6VPw7vroITx+/UeZeuN1x68dXxROAtpwVr9RlESXs7xtPB1tThhwbVZIDkR1HYry7
         5XifgCaK9/M40KMZb7jEuiwYSxJY5yvFE9Zut8JzZwJt/jD8vVCGa61Da38xNMvPyGuj
         xz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743863619; x=1744468419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoxNzsNchDHOU70Y3i7GeAy+PllFDOdfRlUFcH/VIg4=;
        b=mXS5hEb4tmnNiNqnkjMHTdC60rC8IyvQoHICH094nn+hJCK4GIn7mexQoPp4isyWfJ
         hvgGm9R/F7ohEQanKJsEmXMH9P5sGhW2C0evGFYN4Tyf4UbNGtZ7UnmGW1ZTbgSI52lx
         dHt+rWalkgSzsBUfw56IgM/zqDxaj02tmWDCDvb7Qdz/a6+9K+udTuRTvzBm+RYJPwzI
         i81l5X8T3FzRuDLig6KAOqCFjVLFtjyw6HWIvnJVcfx08uFNeBACQRY8SzZBOaXRmhry
         KdVxkdttVz6Mm1rdGcXR1G34a6/e0xvLMuQYspRiZdZBQ9SHsJhLZ6m5DxHM34XHDECL
         2M3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMB+JlvObrSWTUX6ceJPzlXSzJgqGgOuagnh4XNF5UO0UXIGtA8HizR0Ht8lB4Tqm+1j1N7uQigSSEbQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbyTghe/279/TYe6Y2s2P0ZS1a2+dL/spVP5rN8dppYnAhjt+U
	uaj6fBQU5WjdzIDTP14yRyGJzd6tQmVJHOJV12UagtdSXdrY2jrdZPzLpFS5FUuPCB1MViv6M3h
	AKQs=
X-Gm-Gg: ASbGncvUJ9VIMDp1X1d2BkJrI7c52CyCZCopS4f7uxUCIJitD9oYd3d6fJrniD0wVOB
	MYlLbzNV01kGkvNBTrf59k0NIs5X9lCaKR+kqSeUA0+gssmtaRRs8GLcn3DxTqeRbyy8gQhIX5U
	uMWN/3Dr5oPFgGu0Tcm7GxjOv+QeyEpgalFNpruXq94tLbFgJBrYFsWoqaLp/qpTYulDDFxVGKk
	WZA8PfZmxzEedUTioBzUqeWTs+ui9AxwNy0bGOlMfjCaAsIXhci5mZ+ZK+pY6dsQU5qwuZb92Ze
	UfWz7AqdsenteInKc18htAVg9vU2rag358b4+Gca2kxt1fBQlQ==
X-Google-Smtp-Source: AGHT+IGu4vtuFZZLiDsfaR5UTawWVxjaUy8tYom98X0dcbHdh+wzwt4Sj7ZBAAkC9odrdw/Fyb2qoQ==
X-Received: by 2002:a05:600c:a4c:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-43ee0768c6dmr19825025e9.26.1743863619058;
        Sat, 05 Apr 2025 07:33:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c30226e9asm7222515f8f.94.2025.04.05.07.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:33:38 -0700 (PDT)
Date: Sat, 5 Apr 2025 17:33:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: Add error handling for sd_read().
Message-ID: <e8a075e6-1c55-4c61-bc4b-51764b8b2e15@stanley.mountain>
References: <20250405130642.2255-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405130642.2255-1-vulab@iscas.ac.cn>

On Sat, Apr 05, 2025 at 09:06:42PM +0800, Wentao Liang wrote:
> The sdio_read32() calls sd_read(), but does not handle the error if
> sd_read() fails. This could lead to subsequent operations processing
> invalid data. A proper implementation can be found in sdio_readN().
> 
> Add error handling to the sd_read(), ensuring that the memcpy() is
> only performed when the read operation is successful.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
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

You've changed the sdio_read32() function to return negative errors.
That's probably a bad idea.

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
