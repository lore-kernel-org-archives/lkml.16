Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B1A1EB5C9;
	Tue,  1 Apr 2025 10:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743502356; cv=none; b=FWY0M+BhNiwEFqE9DhTVutuUqoDnTiKRQI/bxFibiQhZVd9CvYaIluC38HYH1gfbNcMn/w7+ei/dwiJyaiXTZcdRkXz89aYmrt2pkuwWr1MslT2zBo7QMdTllFSnJGAeYeKs9pKa5PcGQ8uwOR1mn0MJjhA+fvzhqsl3ZR++i7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743502356; c=relaxed/simple;
	bh=8HXAKgifZyDMFvEFL2UG2RrXMWLxhgR2W5amAACOcGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uv+kWKu5G/rcxQJKMYJf5NiMaaznsj6xiRVLZ+dA595Z41n9Xpos0aGHMiPs0xsvtax51CeNnEN3UwjfrWJ+2N+gCegiOMqf0mqUG+Gev5H/iV614UuoWw2nChQIKwpF6+fmCJeYPlJMqM+oFD0fCmflAAjK0SPPnH2nNaHhZQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=m4zNDmD/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="m4zNDmD/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743502352;
	bh=8HXAKgifZyDMFvEFL2UG2RrXMWLxhgR2W5amAACOcGw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m4zNDmD/FgliKcANYqD0WMniKWGYG8uGdM78bd4lloUQqEpPTP+i8YoSEQfgU+xw7
	 P2ZXknDCGMQLlS2sI4ss+z8g7P/RhIYCO6zPzk4Pi0ZqzIDLLDjL6RoAkPmD3zxqpR
	 yg++vJd/7VBeqhaGCFEp9kLc8CLH6+Np+QzMEZQ4fxIENzxsyVTGA1KR4tI2q/DQ3W
	 CipZdK3dFvfDwTqYJ2JAeptX1/kVrATWLcoxudNoc8j2wND5WrZ+NbWwJG12Rldey5
	 dB27ZWqVupcEJUm9ifFCa8qHrk3A24CxdNAy23xwklXwmQj555r8BneLTlp+z1SHR/
	 k8qiM1TJU+DrA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E7CB17E07F3;
	Tue,  1 Apr 2025 12:12:31 +0200 (CEST)
Message-ID: <2de0cc68-f3d7-4b9c-86d3-105666963fb7@collabora.com>
Date: Tue, 1 Apr 2025 12:12:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: re-enable buffer pre-allocation on some
 platforms
To: Chen-Yu Tsai <wenst@chromium.org>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 treapking@chromium.org, yuanhsinte@chromium.org
References: <20250401085659.1222008-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250401085659.1222008-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 01/04/25 10:56, Chen-Yu Tsai ha scritto:
> In commit 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
> buffer pre-allocation was disabled to accommodate newer platforms that
> have a limited reserved memory region for the audio frontend.
> 
> Turns out disabling pre-allocation across the board impacts platforms
> that don't have this reserved memory region. Buffer allocation failures
> have been observed on MT8173 and MT8183 based Chromebooks under low
> memory conditions, which results in no audio playback for the user.
> 
> Reinstate the original policy of pre-allocating audio buffers at probe
> time on MT8173, MT8183, and MT8186 platforms. These platforms do not
> have reserved memory for the audio frontend.
> 
> Fixes: 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Have you tried to add the reserved memory regions to the MT8173/83/86 AFE?

This means not only devicetree but also the driver - that should be simple
enough, and would allow to eventually add a layer of further commonization
between the AFE PCM drivers of all those MediaTek SoCs.

Cheers,
Angelo

> ---
>   sound/soc/mediatek/common/mtk-afe-platform-driver.c | 4 +++-
>   sound/soc/mediatek/common/mtk-base-afe.h            | 1 +
>   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c          | 1 +
>   sound/soc/mediatek/mt8183/mt8183-afe-pcm.c          | 1 +
>   sound/soc/mediatek/mt8186/mt8186-afe-pcm.c          | 1 +
>   5 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> index 6b6330583941..70fd05d5ff48 100644
> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> @@ -120,7 +120,9 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
>   	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
>   
>   	size = afe->mtk_afe_hardware->buffer_bytes_max;
> -	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev, 0, size);
> +	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,
> +				       afe->preallocate_buffers ? size : 0,
> +				       size);
>   
>   	return 0;
>   }
> diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
> index f51578b6c50a..a406f2e3e7a8 100644
> --- a/sound/soc/mediatek/common/mtk-base-afe.h
> +++ b/sound/soc/mediatek/common/mtk-base-afe.h
> @@ -117,6 +117,7 @@ struct mtk_base_afe {
>   	struct mtk_base_afe_irq *irqs;
>   	int irqs_size;
>   	int memif_32bit_supported;
> +	bool preallocate_buffers;
>   
>   	struct list_head sub_dais;
>   	struct snd_soc_dai_driver *dai_drivers;
> diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
> index 04ed0cfec174..37b20ec80829 100644
> --- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
> @@ -1114,6 +1114,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
>   	afe->mtk_afe_hardware = &mt8173_afe_hardware;
>   	afe->memif_fs = mt8173_memif_fs;
>   	afe->irq_fs = mt8173_irq_fs;
> +	afe->preallocate_buffers = true;
>   
>   	platform_set_drvdata(pdev, afe);
>   
> diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> index d083b4bf0f95..0ef07fb2898d 100644
> --- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> @@ -1214,6 +1214,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
>   	afe->mtk_afe_hardware = &mt8183_afe_hardware;
>   	afe->memif_fs = mt8183_memif_fs;
>   	afe->irq_fs = mt8183_irq_fs;
> +	afe->preallocate_buffers = true;
>   
>   	afe->runtime_resume = mt8183_afe_runtime_resume;
>   	afe->runtime_suspend = mt8183_afe_runtime_suspend;
> diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> index db7c93401bee..c588a68d672d 100644
> --- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> @@ -2935,6 +2935,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
>   	afe->irq_fs = mt8186_irq_fs;
>   	afe->get_dai_fs = mt8186_get_dai_fs;
>   	afe->get_memif_pbuf_size = mt8186_get_memif_pbuf_size;
> +	afe->preallocate_buffers = true;
>   
>   	afe->runtime_resume = mt8186_afe_runtime_resume;
>   	afe->runtime_suspend = mt8186_afe_runtime_suspend;


