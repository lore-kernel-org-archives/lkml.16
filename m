Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A935126AE4;
	Tue,  1 Apr 2025 10:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743504356; cv=none; b=rN1bgdl7pIfhvuuJgtYICRtiCEj+cz3cNODDiDy5f2sfhvQwbxPly+v8XqL/Dc1uhf528/DglKuDtvFk36B2bspmry0XB0NS6hhz7oNGKa/p02dKxn07z5qnY69IZbj86wHSi1cDvEmvtOABt0XbtBIuBCWfsuEMXSB0EObdq0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743504356; c=relaxed/simple;
	bh=Q3Rq26r7RWzMRNiTpdrzgrN2XFA9CqCbvfJV1vKATc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RUTNj0Om8OrWJn1CoNQVoCNISpIOQbrDFlpzk3CmsLqENNo/LBwigtYLmve9fkt08laNmGqs6gBcQ1kqy/fWpefcLRjNOY/h5RXN0cXTAsD52eOT72VcaSDFoII5BLtni0w1ippvmhM7KNpY4vN5p1CT2fHNfYWpFFFPIGKNZTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NuUWo2AR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NuUWo2AR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743504352;
	bh=Q3Rq26r7RWzMRNiTpdrzgrN2XFA9CqCbvfJV1vKATc8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NuUWo2ARnMiC1dVIpFKvf5r/VCD292ws5muhqdcTQrKXr12ZlJaoapPdcnzUy1liz
	 cI4SmM+IqaFhl8z3gILjXtMQz0ron6kbgRwCPeh3GKS8vM5L2ljrxqPTv+OdEDEkt7
	 9GZNZqkp2M9S04lRC0ZWuk2etWZmYsIpS9c/Os+duaxgTOSG24B36JQzZpCpyd+JBV
	 fu3uH3U+OWMVc6z/azpKDu4dp5gGcqLLy28lUVpdm1Po82W+BCiOKw/yWp/dgKsNMh
	 apNsP9RXJuLsw4kePW+SArv5CFHLZQFqRB/xIF1Nj0o0maGjvLwYtNZJUUKYrI5WXo
	 Z/XWH8i61t4oQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2111A17E014F;
	Tue,  1 Apr 2025 12:45:52 +0200 (CEST)
Message-ID: <10af1881-a930-4552-a369-97d4c52459c4@collabora.com>
Date: Tue, 1 Apr 2025 12:45:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: re-enable buffer pre-allocation on some
 platforms
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 treapking@chromium.org, yuanhsinte@chromium.org
References: <20250401085659.1222008-1-wenst@chromium.org>
 <2de0cc68-f3d7-4b9c-86d3-105666963fb7@collabora.com>
 <CAGXv+5Hw+13J6eU6X3EPa+Vr4kmyNH5L83Zj2VLqx=_Z+XtOzw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5Hw+13J6eU6X3EPa+Vr4kmyNH5L83Zj2VLqx=_Z+XtOzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 01/04/25 12:38, Chen-Yu Tsai ha scritto:
> On Tue, Apr 1, 2025 at 6:12 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 01/04/25 10:56, Chen-Yu Tsai ha scritto:
>>> In commit 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
>>> buffer pre-allocation was disabled to accommodate newer platforms that
>>> have a limited reserved memory region for the audio frontend.
>>>
>>> Turns out disabling pre-allocation across the board impacts platforms
>>> that don't have this reserved memory region. Buffer allocation failures
>>> have been observed on MT8173 and MT8183 based Chromebooks under low
>>> memory conditions, which results in no audio playback for the user.
>>>
>>> Reinstate the original policy of pre-allocating audio buffers at probe
>>> time on MT8173, MT8183, and MT8186 platforms. These platforms do not
>>> have reserved memory for the audio frontend.
>>>
>>> Fixes: 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>
>> Have you tried to add the reserved memory regions to the MT8173/83/86 AFE?
> 
> I haven't tried it, though I'm fairly certain that would work as well.
> 
>> This means not only devicetree but also the driver - that should be simple
>> enough, and would allow to eventually add a layer of further commonization
>> between the AFE PCM drivers of all those MediaTek SoCs.
> 
> I think no driver changes are necessary? It's a single memory region,
> so it would automatically be picked by the driver core for all coherent
> DMA allocations.
> 
> I picked the driver route because it restores old behavior.

That makes sense, yes, but I'd still like to get them all behaving the same
instead of having some doing this, and some others doing that - especially
because we can...

So while I agree on that we should have this fix, I'd really like to see it
done properly, so that if there is no reserved memory assigned in devicetree
the probe function sets preallocate_buffers = true.

That's why I said driver changes... (and sorry I've been a bit cryptic!)

Hint: If of_reserved_mem_device_init() fails, no memory region was assigned!

Angelo

> 
> 
> ChenYu
> 
>> Cheers,
>> Angelo
>>
>>> ---
>>>    sound/soc/mediatek/common/mtk-afe-platform-driver.c | 4 +++-
>>>    sound/soc/mediatek/common/mtk-base-afe.h            | 1 +
>>>    sound/soc/mediatek/mt8173/mt8173-afe-pcm.c          | 1 +
>>>    sound/soc/mediatek/mt8183/mt8183-afe-pcm.c          | 1 +
>>>    sound/soc/mediatek/mt8186/mt8186-afe-pcm.c          | 1 +
>>>    5 files changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
>>> index 6b6330583941..70fd05d5ff48 100644
>>> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
>>> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
>>> @@ -120,7 +120,9 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
>>>        struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
>>>
>>>        size = afe->mtk_afe_hardware->buffer_bytes_max;
>>> -     snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev, 0, size);
>>> +     snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,
>>> +                                    afe->preallocate_buffers ? size : 0,
>>> +                                    size);
>>>
>>>        return 0;
>>>    }
>>> diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
>>> index f51578b6c50a..a406f2e3e7a8 100644
>>> --- a/sound/soc/mediatek/common/mtk-base-afe.h
>>> +++ b/sound/soc/mediatek/common/mtk-base-afe.h
>>> @@ -117,6 +117,7 @@ struct mtk_base_afe {
>>>        struct mtk_base_afe_irq *irqs;
>>>        int irqs_size;
>>>        int memif_32bit_supported;
>>> +     bool preallocate_buffers;
>>>
>>>        struct list_head sub_dais;
>>>        struct snd_soc_dai_driver *dai_drivers;
>>> diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
>>> index 04ed0cfec174..37b20ec80829 100644
>>> --- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
>>> +++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
>>> @@ -1114,6 +1114,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
>>>        afe->mtk_afe_hardware = &mt8173_afe_hardware;
>>>        afe->memif_fs = mt8173_memif_fs;
>>>        afe->irq_fs = mt8173_irq_fs;
>>> +     afe->preallocate_buffers = true;
>>>
>>>        platform_set_drvdata(pdev, afe);
>>>
>>> diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
>>> index d083b4bf0f95..0ef07fb2898d 100644
>>> --- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
>>> +++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
>>> @@ -1214,6 +1214,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
>>>        afe->mtk_afe_hardware = &mt8183_afe_hardware;
>>>        afe->memif_fs = mt8183_memif_fs;
>>>        afe->irq_fs = mt8183_irq_fs;
>>> +     afe->preallocate_buffers = true;
>>>
>>>        afe->runtime_resume = mt8183_afe_runtime_resume;
>>>        afe->runtime_suspend = mt8183_afe_runtime_suspend;
>>> diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
>>> index db7c93401bee..c588a68d672d 100644
>>> --- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
>>> +++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
>>> @@ -2935,6 +2935,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
>>>        afe->irq_fs = mt8186_irq_fs;
>>>        afe->get_dai_fs = mt8186_get_dai_fs;
>>>        afe->get_memif_pbuf_size = mt8186_get_memif_pbuf_size;
>>> +     afe->preallocate_buffers = true;
>>>
>>>        afe->runtime_resume = mt8186_afe_runtime_resume;
>>>        afe->runtime_suspend = mt8186_afe_runtime_suspend;
>>
>>

