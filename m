Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA8218FDDB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750057060; cv=none; b=SwIGdz6OCfrc/cOzaJZ3idoDuBKZfXMYsc4Z/8MKnCMGwjDyGM1jZ6tMS0jnNdpa5miECWAs+fJfzkVbpO/IVws/uNN5mweSqS6wdybkLAxOiBV3EfO4Xv70Ql59X40s/XZf9DEh90/T/Yg/GuRkmRN8aJT1vuahP/W579k/DSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750057060; c=relaxed/simple;
	bh=YjB88UBSVsnAqTwOpkq03DmbKTMee/O0rDci21YJxjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kz5Up6dG5oC2f6rbgtfM4Tq7tplwwko6RWmJnySinWEkwpGMOryCJqWk5F0JN3+VTEgdPCNXvO3iiUVjQQY7UojLxi6lRJRr8V+YMJ8aIXY2zlxLLv1S87pgr81H5UqFYUR87a4+oTHqTEz685jVFf4ihghopt6oOak79hzp9oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DoauAYjd; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DoauAYjd"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-addcea380eeso658348166b.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 23:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750057056; x=1750661856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/gtV1rZVMGwEdKZN2cNY4PElvgVuiPb0Q4ZvaOK51qQ=;
        b=DoauAYjdf48OMXEYuUoGbgOVbqHsbj9/QqSB61BBB93edQbzbdXAsRCOw1pwzYRzwq
         xzVX7M896MWWp7cVoJte04LN1NmYrdrqCFL1bhhrJrSl/2LktDFU0QsBuQbjJhe0Y5ZT
         HNgqF6opo3WsbvHmqofCrVgLtShH+fW7zapz1iUYcCdPlCh7c0IsmcuWLrh5yA6DbqRS
         tIzPNiarF55yh8G/DiEq3kYn0gBd1ota57zHjwRyFaBYCpFvgG0zJG5hpgzty2ujFROh
         O6b2RbegexXvtPNF8nuSnGyObAieTlA9IEdIeLCRjUO83gFXUHUV5EcNjP8KnS9oEcfX
         CcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750057056; x=1750661856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gtV1rZVMGwEdKZN2cNY4PElvgVuiPb0Q4ZvaOK51qQ=;
        b=v4OPQst5O4xHCUbmojGNgbG+ppEfa+ffd/r1J0A7DVppu/cPxx2fxsiE2JHHi+Gx8P
         HwueKseldoGbyAYlVudiGASUhrpXIA6BbAqWdxvl8aHNUMFpTw+taRMTjfputszwqszs
         8xYmx2mnxp1z7H8ihlBieP/fa3GnArcs2/zzrbOYj1WeQYTrSi+Vvh0pGChZ9W6QVUUy
         rZJhe4o6wgSFtW/An6k2pPu53Qx5QExaRCE4iL56S4r9Cwlm5OYmGQLm/wauhGQQIdDi
         5H9p8EJhZfopkjgPlrFtPrc+LSBZdqQHoMcuHQB9NPbOxz3METezu1ClhIkoES65CKCQ
         xoUw==
X-Forwarded-Encrypted: i=1; AJvYcCUx6OHhIgo06OJhRQA2LF0OxyHzD1i08y61qrYnzq9pgTxgHdv9lkQm5/4PTXKJRALnG5i6Qd97eJ7IscE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU6Rdw5e6LIuGITQNCwmDM6XQlaz4oDQvuMLvB4jXIf8EvtrL8
	tKj1VMCtlUsccmVmo+pzCEILWC/tVrGP9d8P06k1pM+3g+2XtLod38ffsLyPSdDfd84=
X-Gm-Gg: ASbGncu4wUl9AKl8L/r6gizL47hLNId1vkHeXmmnNOydWGwn1IAwqBszBRvgMITqH/m
	CoHOgQ1kZcHD0UgTkr+nNQEN1+q9XtufDvzflx6iIpFULqulillysfNjPRqJ8l1G3kPWT12BfVZ
	FRBkTb4HiCJ9dkEuF2R+Y11+FRMAi/Uos+eIwMUFy0Ve/22ctKQOaRPkDo3WrzQkO4szG6jiP5Z
	JGeU3Wh7eO8/0n1fecBVi6Ie562DT0iUR/5PWeDlTOrSSsbnHjtaYbQqwOtxAHJwKxydxIQZW27
	m43JkodH4URvNBB6oa/gN1pm1By/pXS4E4f2LvVig3tQMLcorTcj97awXBFhW+IqA+eZRg==
X-Google-Smtp-Source: AGHT+IHOPqpWs/bEljRavIVMEjqIgNiUcWesMvNiRC3Z2rgdIApjZ4oCO/f0xQlOdJfvEukvSCkvSw==
X-Received: by 2002:a17:907:c25:b0:ade:470b:d5ac with SMTP id a640c23a62f3a-adfad4f6209mr738394066b.56.1750057056147;
        Sun, 15 Jun 2025 23:57:36 -0700 (PDT)
Received: from [192.168.0.33] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c5bedsm602221266b.66.2025.06.15.23.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 23:57:35 -0700 (PDT)
Message-ID: <dd2bf2eb-d0a0-4bc4-b4be-a60a671222f9@linaro.org>
Date: Mon, 16 Jun 2025 09:57:34 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: Add NULL check in lpc18xx_dmamux_reserve()
To: Charles Han <hanchunchao@inspur.com>, vkoul@kernel.org, vz@mleia.com,
 manabian@gmail.com
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250616060212.1560-1-hanchunchao@inspur.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20250616060212.1560-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/16/25 09:02, Charles Han wrote:
> The function of_find_device_by_node() may return NULL if the device
> node is not found or CONFIG_OF not defined.
> Add  check whether the return value is NULL and set the error code
> to be returned as -ENODEV.
> 
> Fixes: e5f4ae84be74 ("dmaengine: add driver for lpc18xx dmamux")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/dma/lpc18xx-dmamux.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/lpc18xx-dmamux.c b/drivers/dma/lpc18xx-dmamux.c
> index 2b6436f4b193..ef9aed4ba173 100644
> --- a/drivers/dma/lpc18xx-dmamux.c
> +++ b/drivers/dma/lpc18xx-dmamux.c
> @@ -53,11 +53,16 @@ static void lpc18xx_dmamux_free(struct device *dev, void *route_data)
>  static void *lpc18xx_dmamux_reserve(struct of_phandle_args *dma_spec,
>  				    struct of_dma *ofdma)
>  {
> -	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
> -	struct lpc18xx_dmamux_data *dmamux = platform_get_drvdata(pdev);
>  	unsigned long flags;
>  	unsigned mux;
>  
> +	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
> +
> +	if (!pdev)
> +		return ERR_PTR(-ENODEV);
> +
> +	struct lpc18xx_dmamux_data *dmamux = platform_get_drvdata(pdev);

I believe you should still declare all the variables at the beginning of
the function, even if you initialize them later.

> +
>  	if (dma_spec->args_count != 3) {
>  		dev_err(&pdev->dev, "invalid number of dma mux args\n");
>  		return ERR_PTR(-EINVAL);

