Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AB74D599
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748246666; cv=none; b=l/V4tHGUlnn+oNqxTmCY6dNe3rkQ3/UQB1uV2tS7Pdn2Q2TC+4MbmPkABHhpShMgVcY21pF1cWQYViR7GRo6JorwMLivebUYBaybRhLr6AT+wlsrbhKK03plfkO/NWkJdUtJ2RNIi/tNx3a1UIgWPlV5dHHFS7cM7xNiwVSQXuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748246666; c=relaxed/simple;
	bh=DKj4jGMJwsluLhTtm1XSb43QIvPVBkJotokBx9IzykQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RiB5OPEnqUGRn8rdACrPzXVo3RrwdDd+8c24DIl5qhdy/7YNiRmYEIilGj6SJ73FhR+L9d0DnnWjl/pVSQnqqrLEuVLzoQW5cxwCx12vvDhGV+dEsbm4R0wWc1SXeCpsMl0hzBTwCBZe68exIy/i1j8Avc8nrq7WL0qBNAxfRi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bns86RnX; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bns86RnX"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso3525623a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748246662; x=1748851462; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/EqSXiGxXEzz4CTzqLi7kZXZnKST1GLrijY4jxIYksg=;
        b=bns86RnXUSYQ17WuMn/xo1SXbKER9aD8VQwT8oR0EolmXttjVzCigXkcck4a4zWn8t
         6lL26FvysTSFzgOpDKs5wiOSpiEwKcmtyRHjRVTgzvoU1ACR0vBDDbV4EIjvGA2s3PZl
         IeNbHR4VJJlHF88T93t5niZdgT/3eru6MOput90j0ZKHxmsT4evySdBXFdvD9Se808yz
         AQbCQvV4EjaufYx2eHm186akiB+igf8smPXtm9snXcB106g0knzPl6bFbY5FdiNuCdRz
         zbm2sas4eu4uncwihYvgQZPfnGYSbVA9ekPnravqwIai4O7DiwLDWgRTeSWi1y6MNgGO
         sYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748246662; x=1748851462;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/EqSXiGxXEzz4CTzqLi7kZXZnKST1GLrijY4jxIYksg=;
        b=WiBIudCxxCA5FXbpY/0E4w8x8dohZyXFdprZU+XihKx8JnZX+3+r3WXIZ6DhC5nl1i
         pKM9rom9ZAMk+EVaUCdhJOQAfeRn3f6Rf1MCvYOOKm37681Sq/8uApnJbOmfAef89d2f
         k40yjUrz9SLLWMvrakneyHO2RpdDJHFW+u0sWahulnWekhxOptdwux8WheRRe34Y/TzT
         IcmEMyzWNN3A0CUSV4JnbaUkcHJOul0v8RcbDJz7DYEEsT+ISHuGN3XENJgrN2oqni83
         XLzlqtSSIrI3w67SYe1H/3Ux/RzTatBgi3wwKUyLioHoe8fvPFkQhrtEw3pCHv4xklmU
         josg==
X-Forwarded-Encrypted: i=1; AJvYcCWqUfmn/UkVEKSHmDjQAApMGK2BYUeBprMP8w3Uje8pjW1Eub6dOGba003eDpqa/wpMCboi7AlIDzrOXGA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye60CLilkX2IRJC+x1hHAnMZcqijVKiwJ0F/zZzsINKm00YM3P
	iOBibHjcFZvDMr/oQK5xmb+oFGPrp0UVk7FvxqfgM27Km2ghXCJZUU1q9ngqkTkvfQU=
X-Gm-Gg: ASbGncvXARlN1M9orRMh4BZN+gLlN3MgVTnIQ22ye8VxSEHi/2LoEApjt3ZWnPkMAJL
	xZmHT8Qa3ws/e+IMgMb/A3y/qoFuDNiXQQLOZJy4TRJqmRasvVPj7S+U8eN+wzUKEtY+7kwl9la
	cxdThpiIduakXh7GXEEtN4VaTrGN4mWiqIljrlRr/ICd9eqS44pNoRbvraqNdDvfgbr0IRKJMel
	VnlXxFj5Y99ks6mdCwlOooX0iLtaFeq7SzqDIyMrc3oK+dIq0DKiDYyu/RS1xGSrORxCkImLDzm
	osswaJZyo2dByg6OobNfFI9VZ56SbswIF5JLgT3ieyi2vmy5Zp0qZzy6z98=
X-Google-Smtp-Source: AGHT+IFQQixy/VvIvZqVFDIkQNPaQDo10Gudza//G/gS6tJHfmV5TcIjld7nrBM3z67ERb/Rc4yYRA==
X-Received: by 2002:a17:907:7faa:b0:ad2:59c4:83 with SMTP id a640c23a62f3a-ad85b2b5649mr715969266b.42.1748246662344;
        Mon, 26 May 2025 01:04:22 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-604be9d8ca6sm581136a12.79.2025.05.26.01.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 01:04:21 -0700 (PDT)
Message-ID: <8e1250b2-b6da-4294-b02b-98c9d231a181@tuxon.dev>
Date: Mon, 26 May 2025 11:04:20 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: macb: Check return value of
 dma_set_mask_and_coherent()
To: Sergio Perez Gonzalez <sperezglz@gmail.com>, nicolas.ferre@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org
References: <20250526032034.84900-1-sperezglz@gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250526032034.84900-1-sperezglz@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26.05.2025 06:20, Sergio Perez Gonzalez wrote:
> Issue flagged by coverity. Add a safety check for the return value
> of dma_set_mask_and_coherent, go to a safe exit if it returns error.
> 
> Link: https://scan7.scan.coverity.com/#/project-view/53936/11354?selectedIssue=1643754
> 
> Signed-off-by: Sergio Perez Gonzalez <sperezglz@gmail.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  drivers/net/ethernet/cadence/macb_main.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index e1e8bd2ec155..d1f1ae5ea161 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -5283,7 +5283,11 @@ static int macb_probe(struct platform_device *pdev)
>  
>  #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
>  	if (GEM_BFEXT(DAW64, gem_readl(bp, DCFG6))) {
> -		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(44));
> +		err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(44));
> +		if (err) {
> +			dev_err(&pdev->dev, "failed to set DMA mask\n");
> +			goto err_out_free_netdev;
> +		}
>  		bp->hw_dma_cap |= HW_DMA_CAP_64B;
>  	}
>  #endif

