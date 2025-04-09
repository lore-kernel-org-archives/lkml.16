Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9904626A085;
	Wed,  9 Apr 2025 15:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213861; cv=none; b=LGvXi0j6MVRu+ckZwIyRumetSbJhr951d7lxDotPYJPtjpdA6co+7nRsheJTOS7p/vXJZJzYqr5vnR/GE7wE6VoTQIef0c4PmH7vrzjdx2prSj0y1te5hq1CPLg6SE/2GclSk1GgdGh23D6UVgrzJWc3wG+STag+we2cvjSe2sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213861; c=relaxed/simple;
	bh=bvozvL+Ka3UE57hADrHygiEEqNN6MU5nlJ3B+28IPjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XdHrAflbBmKLYCLKAboT88UgJgK4iiz5u5KPJaSMI857EpigSJKqN8X/MGh9wUBZJyLgA5SZCsg96VE/fbqEzT97CAFvoDKZwM4y4NhEhOOOApi1ryx5eJyt7wL01J5kGopKshJxKF1J4YA1XX/muzgibbXXYx+zYWHMzTNEUs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=d/QSwyj6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d/QSwyj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744213856;
	bh=bvozvL+Ka3UE57hADrHygiEEqNN6MU5nlJ3B+28IPjg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d/QSwyj6A/GsoV1lb0JMMaH1EXGZRVDAAH/pa/Fy+Vzkgi5vrgyalGshHWTccvu2T
	 eH7NBGQrxOZhgkW2FTWZ1fmBoPA/hG8GdyAGGg7ePKqln76v5bafr9JTsQRd5OnQJr
	 BpFdUtAlooojoZJ97HPjV5MN9Tcr3v0fKsYV7JfOz/qb6UXYoOKiVEgPvZep4kAM59
	 B0j9BiMIdGbzUl2HoROUyJijk+zTKxegWlSan6vy74mKleqdX0Fq2XLmOz1FDbW+YT
	 zVaK+shJ3ZNBWq8JkyAkoX14HLQQODhOwBJDcQjOTTTY3AGhXEMuOMLukiPFy2TDkC
	 ID2JcQzQ31ceA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F07EC17E0657;
	Wed,  9 Apr 2025 17:50:55 +0200 (CEST)
Message-ID: <399f89fb-092e-4fb3-8a0b-987dea129554@collabora.com>
Date: Wed, 9 Apr 2025 17:50:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] memory: mtk-smi: mt8188: Use
 devm_pm_runtime_enable
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Friday Yang <friday.yang@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250408033206.12176-1-friday.yang@mediatek.com>
 <20250408033206.12176-4-friday.yang@mediatek.com>
 <20250408-woodoo-quick-worm-bf82b4@shite>
 <e777f95c-c21f-4a91-b044-5fc19eb22c3d@collabora.com>
 <258c8fda-70cc-4624-aef6-7cbef3cdbde6@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <258c8fda-70cc-4624-aef6-7cbef3cdbde6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/04/25 11:56, Krzysztof Kozlowski ha scritto:
> On 09/04/2025 10:26, AngeloGioacchino Del Regno wrote:
>> Il 08/04/25 08:29, Krzysztof Kozlowski ha scritto:
>>> On Tue, Apr 08, 2025 at 11:31:56AM GMT, Friday Yang wrote:
>>>> Replace pm_runtime_enable with the devres-enabled version which
>>>> can trigger pm_runtime_disable.
>>>>
>>>> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
>>>> ---
>>>>    drivers/memory/mtk-smi.c | 16 +++++++++-------
>>>>    1 file changed, 9 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
>>>> index f25d46d2ef33..daef6d350419 100644
>>>> --- a/drivers/memory/mtk-smi.c
>>>> +++ b/drivers/memory/mtk-smi.c
>>>> @@ -713,16 +713,17 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
>>>>    	if (ret)
>>>>    		goto err_link_remove;
>>>>
>>>> -	pm_runtime_enable(dev);
>>>> +	ret = devm_pm_runtime_enable(dev);
>>>> +	if (ret)
>>>> +		goto err_link_remove;
>>>> +
>>>>    	platform_set_drvdata(pdev, larb);
>>>>    	ret = component_add(dev, &mtk_smi_larb_component_ops);
>>>>    	if (ret)
>>>> -		goto err_pm_disable;
>>>> +		goto err_link_remove;
>>>>
>>>>    	return 0;
>>>>
>>>> -err_pm_disable:
>>>> -	pm_runtime_disable(dev);
>>>
>>> You now broke/changed the order of cleanup without any explanation.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> I agree some comment in the commit description saying that the cleanup reordering
>> doesn't matter in this specific case would've been nice to have, but anyway IMO
>> it's not a big deal - he didn't break anything, anyway :-)
> 
> Cleanup orderings are tricky, so are you sure nothing got here called in
> incorrect moment?

Yes.

 >> I see that runtime PM will be disabled much later and
> what certainty you have that device won't get resumed that time?
> 
How can a device that failed to probe be resumed?! Who's going to resume it?! :-)

Also, in the remove phase, all users get removed first, there's no ISR (implies
that there's no isr that will resume this device inadvertently, and other than
no isr - there's no kthread/queue/this/that that could do this), and no nothing.

Moreover, SMI-LARB cannot be removed unless all of the components are unbound;
SMI-Common (be it a common or a sub-common) cannot be removed if SMI-LARB is still
using it.

No I don't see anything that can resume it before devm does its job.

If you do see something though, I'm curious to understand what I'm missing here :-)

Cheers!
Angelo
