Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A321E2614
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749195740; cv=none; b=Spr2FZsBTa3uWkSVdN2T9nzo7FeLFLoJeWj2Vlmp/WH7MX+SjVwXX2CgsTO6R42gPADV9MMINNQ8z+eXkvJdaMiaJeq4Nd+pFMCkI1F2FTi/T8Ny1e76IjsVUblDkzkZ8fam+FAEmHdaaHspqZFF/M/yZDMJOwJjDaBRGO61SQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749195740; c=relaxed/simple;
	bh=JrXEu9V00IDwc0gs2Fk3u6thmp4myUk90+/KCMWMqHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fy34UhK7elqhbibmMHrGNoQhOEVF9x33PPWSnJpe7FS1/6PLie/pzAuQ6Q/fyXieEwfVyM+DjvDepaDJpGchzKUY9fH3/tiCesO94G27RTJuKpjktJhuqRiitByv2V7Y4inHTzKPcQFExndncoviCOAqQTGJCpxEvcqYCY+qBKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NyqdMCWH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NyqdMCWH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4508287895dso18710025e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 00:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749195736; x=1749800536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Px7TUkiGLJQvkjO/71jKrxllILzPLzGA5siX95GH57I=;
        b=NyqdMCWHOoSp2C6ntTQEqAHoDzvLQxSzWsiWJAkHHcYmtu17UbnJEBc7fHWIC0FiIY
         yIOmjDrh873M0nLI5oenX6cHZd3aZF9LqNHPiHITxZH1D9u4LZHew0+ym7sqrWHf29jJ
         LLQ5AymDNct9M3rtrUb/FLTLlxRbp8JArLr00m1buxCJZldgV9fj89XjNmzsEtoPBlng
         gkfGjW6E+t1xLNUFMa8eWfjtZu4t1b2ikwjyenzfrjB5wNJwC9W//VGgrsAE+BioVOHJ
         wKRmCgpB5026ihZfvenShxWmLicm+cGPLAHYUndNNgHbVfx/aXI61EfMYJxrpxNP2uyO
         LvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749195736; x=1749800536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Px7TUkiGLJQvkjO/71jKrxllILzPLzGA5siX95GH57I=;
        b=YDFMEKbtzkRRJke7Tyv5giPWAOu7G1Ms/c4OtQDSAkOCOIxFR72DuMHA/mdfA6W6+X
         y0nCkyyFrdi2cFQzqyYmMQE+xumnyueFTTe2l1/URd576j0k0aLGGik44hHVYK9wbqkM
         wpwEDGpJTXrHayLdxYTQItNym8+lrvtUjwtvD0GB7M9h9yHo6BAvSY6IO+hTSSZkvc/z
         gnimSGPKMCr1dh0zrISySfR2D7D6pSpru6jULMr9CtpIxU0plB0QBEeWs9ejwUib0b5x
         yeQY1ESz6eo5QIra4MR2AJNjpSXm4Q7jGuZfFegKyvC9bMywJUFNtIKl9XNpqgTdfBi6
         BGhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/EJPoZHF2ZgMyYl2N0XnoP/fruDDZRwGjytc709QnTbVarIEONFKPPHtPhX/Qww/rxm0wKy826IMxG5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YysfxC2/XeB3UWwYX5eWRaAwfDJbypxS1krVevo38ucdAn2qjDa
	3u8+qf+jpRtTJv0HTCWqv0wt07XDxBoH2FVNk/hfbJSBJTj7OwL37R16BQcVDJD06Gs=
X-Gm-Gg: ASbGncuxfWsIP1uX6ILH4mTLFS4/Y+HHvAeNCN2YhM1nGpViP/ITAPIJUjuNuQ5LdsL
	yLTtqSEO4up43ACRH3kxXpcSjHrij7Q+SvENcjZQDYlupkzwQ/Cp7uJryJuCaTDdnTSXw8dLYX0
	8Z/ejfTDWVLKYxV7pOpCuBg1R/oK/xHnr06Tq0zTaa0FZoX68lxYmzZSDSHLj5xSavxrIkJ8FCR
	ptUjamG40fE0fGu5r6UqKfRNpHV2Nz3dxOmiQ/YrflcgpG6eK8BsaGPHt9ocM83zRHRWAqoxPbg
	EZEVpmPl57SWs6JHr0JbJ42ZZmsrgfZ4W0+9houZGJHxMbVKyd9Pf010EIVNDH8TseJu7SKDJid
	HZNCr
X-Google-Smtp-Source: AGHT+IEDJ6Qm0Ur3ac3Ih5jAsMWLAgYjL99/0S8sUsnqlAT4/rYCzrAkgc1FBvTgHlungYhO6iFY8w==
X-Received: by 2002:a05:600c:4f90:b0:44a:b468:87b1 with SMTP id 5b1f17b1804b1-45201506dd3mr20374865e9.4.1749195736011;
        Fri, 06 Jun 2025 00:42:16 -0700 (PDT)
Received: from [192.168.1.221] ([5.30.189.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm12622585e9.5.2025.06.06.00.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 00:42:15 -0700 (PDT)
Message-ID: <ff77f70e-344d-4b8a-a27f-c8287d49339c@linaro.org>
Date: Fri, 6 Jun 2025 10:42:11 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: mediatek: Fix a flag reuse error in
 mtk_cqdma_tx_status()
To: Qiu-ji Chen <chenqiuji666@gmail.com>, sean.wang@mediatek.com,
 vkoul@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com, stable@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20250606071709.4738-1-chenqiuji666@gmail.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20250606071709.4738-1-chenqiuji666@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/6/25 10:17, Qiu-ji Chen wrote:
> Fixed a flag reuse bug in the mtk_cqdma_tx_status() function.
> 
> Fixes: 157ae5ffd76a ("dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()")
> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505270641.MStzJUfU-lkp@intel.com/
> Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
> ---
>  drivers/dma/mediatek/mtk-cqdma.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
> index 47c8adfdc155..f7b870d2ca90 100644
> --- a/drivers/dma/mediatek/mtk-cqdma.c
> +++ b/drivers/dma/mediatek/mtk-cqdma.c
> @@ -441,18 +441,19 @@ static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
>  	struct mtk_cqdma_vdesc *cvd;
>  	struct virt_dma_desc *vd;
>  	enum dma_status ret;
> -	unsigned long flags;
> +	unsigned long pc_flags;
> +	unsigned long vc_flags;
>  	size_t bytes = 0;
>  
>  	ret = dma_cookie_status(c, cookie, txstate);
>  	if (ret == DMA_COMPLETE || !txstate)
>  		return ret;
>  
> -	spin_lock_irqsave(&cvc->pc->lock, flags);
> -	spin_lock_irqsave(&cvc->vc.lock, flags);
> +	spin_lock_irqsave(&cvc->pc->lock, pc_flags);
> +	spin_lock_irqsave(&cvc->vc.lock, vc_flags);
>  	vd = mtk_cqdma_find_active_desc(c, cookie);
> -	spin_unlock_irqrestore(&cvc->vc.lock, flags);
> -	spin_unlock_irqrestore(&cvc->pc->lock, flags);
> +	spin_unlock_irqrestore(&cvc->vc.lock, vc_flags);
> +	spin_unlock_irqrestore(&cvc->pc->lock, pc_flags);
>  
>  	if (vd) {
>  		cvd = to_cqdma_vdesc(vd);

If the first spin_lock_irqsave already saved the irq flags and disabled
them, would it be meaningful to actually use a simple spin_lock for the
second lock ? Or rather spin_lock_nested since there is a second nested
lock taken ?

Eugen

