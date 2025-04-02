Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD161230BCF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 10:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743588535; cv=none; b=Lq/Rfaddgza8bz5cPQyK2vftdutu4tlBzUuRnzSYf2cuEKul0ql0CqsM/Nrn2SeqMPuJNNCpLyjlhi381t+E9fDRyxotTaBhaMjTNlfaF7nmwV5Sxf4WA9awLG0f0wSw6Gtv63cCqvwqJVqos3BhBqIu9MmOTAv4+86hzdaMinM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743588535; c=relaxed/simple;
	bh=xA/faLEB0MkdAsz9QcJVzhzblw7gBnHvn4QbsV73wCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ch9g2UM2c+smigeAgRr6AmOGMvcqg2PDOJLOZJo37DMJfRj3Kq9zVN/AWPU5Bl5OdV6Jru1mD4RvN8Lp2Sis6md1+RHK6v85xgy/O+XFFysSocE+D9iMAEPayQYXEaNzhmyY5jbauuCExIO1xlY3UvO58KeRG5oasSTS9Hapax4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R2TTor1l; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R2TTor1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743588532;
	bh=xA/faLEB0MkdAsz9QcJVzhzblw7gBnHvn4QbsV73wCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R2TTor1lnu8BsZvlTYnHg1NXM+t7l+8q5xKDq8ujeaUyOQxiOJPQHoSfF6Ip0AJEh
	 6kJie715j+uoTCnirJs9ssTrPtEwaF20B0EeVm76TgV31oOYsEGSZHrwGNTh6oYukt
	 AdWFSYI/AwvwGpWzKloINpz0kk27tkvPte7eVlAn+eyBEYniAYGePJ+DlSHChlTwmg
	 44grpWD2LoZRw6uCHVezgVsmi6h/AdyRPZl+YQ56DZEbwd69/egpnWifrmHnpC/oND
	 uEVdX/IMJMqseTxjRIgBD6SlWuv9pc7ThdvOUhW0bxla5wfH7zaWB1pPmL/qn7Nw6h
	 n5SnKausYkHqg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0CD3117E091E;
	Wed,  2 Apr 2025 12:08:51 +0200 (CEST)
Message-ID: <608f25af-69dc-455d-b382-aaa3cb2d9578@collabora.com>
Date: Wed, 2 Apr 2025 12:08:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] drm/mediatek: mtk_disp_ovl: Enable/disable
 interrupt on bind/unbind
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, matthias.bgg@gmail.com, nancy.lin@mediatek.com,
 ck.hu@mediatek.com, djkurtz@chromium.org, littlecvr@chromium.org,
 bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
 <20250402083628.20111-5-angelogioacchino.delregno@collabora.com>
 <CAGXv+5E1qShE1LqgFL6rrgRzjwFUPoBqYdhO-sgNzmMqQsMS0Q@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5E1qShE1LqgFL6rrgRzjwFUPoBqYdhO-sgNzmMqQsMS0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 02/04/25 11:38, Chen-Yu Tsai ha scritto:
> On Wed, Apr 2, 2025 at 4:36 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> The OVL driver is installing an ISR in the probe function but, if
>> the component is not bound yet, the interrupt handler may call the
>> vblank_cb ahead of time (while probing other drivers) or too late
>> (while removing other drivers), possibly accessing memory that it
>> should not try to access by reusing stale pointers.
>>
>> In order to fix this, add a new `irq` member to struct mtk_disp_ovl
>> and then set the NOAUTOEN flag to the irq before installing the ISR
>> to manually call enable_irq() and disable_irq() in the bind and
>> unbind callbacks respectively.
>>
>> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 19 +++++++++++++------
>>   1 file changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>> index df82cea4bb79..1bff3a1273f6 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>> @@ -161,6 +161,7 @@ struct mtk_disp_ovl {
>>          struct drm_crtc                 *crtc;
>>          struct clk                      *clk;
>>          void __iomem                    *regs;
>> +       int                             irq;
>>          struct cmdq_client_reg          cmdq_reg;
>>          const struct mtk_disp_ovl_data  *data;
>>          void                            (*vblank_cb)(void *data);
>> @@ -587,12 +588,18 @@ void mtk_ovl_bgclr_in_off(struct device *dev)
>>   static int mtk_disp_ovl_bind(struct device *dev, struct device *master,
>>                               void *data)
>>   {
>> +       struct mtk_disp_ovl *priv = dev_get_drvdata(dev);
>> +
>> +       enable_irq(priv->irq);
>>          return 0;
>>   }
>>
>>   static void mtk_disp_ovl_unbind(struct device *dev, struct device *master,
>>                                  void *data)
>>   {
>> +       struct mtk_disp_ovl *priv = dev_get_drvdata(dev);
>> +
>> +       disable_irq(priv->irq);
>>   }
>>
>>   static const struct component_ops mtk_disp_ovl_component_ops = {
>> @@ -605,16 +612,15 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
>>          struct device *dev = &pdev->dev;
>>          struct mtk_disp_ovl *priv;
>>          struct resource *res;
>> -       int irq;
>>          int ret;
>>
>>          priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>          if (!priv)
>>                  return -ENOMEM;
>>
>> -       irq = platform_get_irq(pdev, 0);
>> -       if (irq < 0)
>> -               return irq;
>> +       priv->irq = platform_get_irq(pdev, 0);
>> +       if (priv->irq < 0)
>> +               return priv->irq;
>>
>>          priv->clk = devm_clk_get(dev, NULL);
>>          if (IS_ERR(priv->clk))
>> @@ -635,10 +641,11 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
>>          priv->data = of_device_get_match_data(dev);
>>          platform_set_drvdata(pdev, priv);
>>
>> -       ret = devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
>> +       irq_set_status_flags(priv->irq, IRQ_NOAUTOEN);
>> +       ret = devm_request_irq(dev, priv->irq, mtk_disp_ovl_irq_handler,
>>                                 IRQF_TRIGGER_NONE, dev_name(dev), priv);
> 
> Use IRQF_NO_AUTOEN here? Also, IRQF_TRIGGER_NONE can be dropped.
> 

Yeah, nice one. Thanks!

Cheers,
Angelo

> Make sense otherwise.
> 
> ChenYu
> 
>>          if (ret < 0)
>> -               return dev_err_probe(dev, ret, "Failed to request irq %d\n", irq);
>> +               return dev_err_probe(dev, ret, "Failed to request irq %d\n", priv->irq);
>>
>>          pm_runtime_enable(dev);
>>
>> --
>> 2.48.1
>>


