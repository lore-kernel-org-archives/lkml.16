Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815E5248862
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743675686; cv=none; b=S+0J/NStu67M/gl/tpM/LXVwAOyyOaRrEn50fPFaaGIZcl+pkLisXBlEwNShIgCBtJ0w1obVsd2eiIu23ASTlli+rSuop3+ruSAt4Z6p1pbjfxLkuRhWpUl/XJajqwx/WZpzbFk4vpbxOMOjyegDEwD03sRJA3lWM91cq0pFwMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743675686; c=relaxed/simple;
	bh=0oE4lMdKbjGPtKZ/zki1hCNZrfNg91tWfdphSD8J1Nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gBmLus+9bXVCXrIyFmal7IM5Bs0jEh+KM263nSh2w15HvYez9radMLxN13BJZjjl+Onhza3AJvxOimGRomuel8KWEYu0CnvJmVidjRoN+wAvtAZzQRV5RQmJI6awW/V7XPTpab42yCrAdombPtp0WdMKHPpDW9I2IYsxOsq/XEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YOMpwmEH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YOMpwmEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743675682;
	bh=0oE4lMdKbjGPtKZ/zki1hCNZrfNg91tWfdphSD8J1Nw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YOMpwmEH6WLl5/kP+yXKdKE0c29/hieX44XzQ4RsIYxxu3SwsDQ17jv6szsAdzoyE
	 oABAy3C2DKTNPlg6FuaPa8CUQS7tcRNpzBN5byRJGF2KC9Mi+IQ+grVNxdoYfqm/HR
	 dUhT/adw6a5M3thbMccMxadccDn/EdlBz5hVJsx63TexyCB8X0y1m3ruccKaKcutg5
	 qxFBTlQlL7AihMPBkxV59weTtantbf6BM5CtJY4kwnZBfg6RvDt27QLJXuib/SqaC5
	 CUjCJ1IlnaRwnIthCpnLv+6+2JFEyXplP1Al2+CT0Pah8v1LP8qVUiY1p8kM6S/aY/
	 Pl6DhKuIpPfQw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C28C817E0F47;
	Thu,  3 Apr 2025 12:21:21 +0200 (CEST)
Message-ID: <568517cc-7108-4e38-b208-43d4e305f663@collabora.com>
Date: Thu, 3 Apr 2025 12:21:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Replace custom compare_dev with
 component_compare_of
To: shao.mingyin@zte.com.cn, chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, yang.yang29@zte.com.cn,
 xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, tang.dongxing@zte.com.cn
References: <20250403155419406T5YhIJKId1FWor70EWWHG@zte.com.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250403155419406T5YhIJKId1FWor70EWWHG@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 03/04/25 09:54, shao.mingyin@zte.com.cn ha scritto:
> From: Tang Dongxing <tang.dongxing@zte.com.cn>
> 
> Remove the custom device comparison function compare_dev and replace it
> with the existing kernel helper component_compare_of
> 
> Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> index fa0e95dd29a0..fe97bb97e004 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> @@ -492,11 +492,6 @@ static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] = {
>   	{ /* sentinel */ }
>   };
> 
> -static int compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>   static int ovl_adaptor_of_get_ddp_comp_type(struct device_node *node,
>   					    enum mtk_ovl_adaptor_comp_type *ctype)
>   {
> @@ -567,7 +562,7 @@ static int ovl_adaptor_comp_init(struct device *dev, struct component_match **ma
> 
>   		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;
> 
> -		drm_of_component_match_add(dev, match, compare_of, node);
> +		drm_of_component_match_add(dev, match, component_compare_of, node);
>   		dev_dbg(dev, "Adding component match for %pOF\n", node);
>   	}
> 


