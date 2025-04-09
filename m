Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886C825D8F2;
	Wed,  9 Apr 2025 09:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744192585; cv=none; b=goe8C8Z51+GXDRZtTCT6ZhFGBxUivHLuR3/3MBuK+r+nTZ/l5WIeD9KgRI8YTA4Eg9z0n3FnA5HEGl9ZF5UZw5iSI1SguqmhtUip7/wMsKuCFvlw6OdlCULbo6O4TPIilA3MmBsXDgfhJJldbVYYdkGDQHD6p/eS1hO8IlZ6kAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744192585; c=relaxed/simple;
	bh=Rt/zFCT2dVTcx0v7PgWTkg2x2TmEPzbuCc7LGol1NJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+qw4Y3EiJYh8HTI89vUdzNgAdnZYH9ZhMx9Fxrb7EHxEW1Zs6bM/Aee33J0+sc7GbYNH+p4XGlFxbrZ1DMPp02YHxUucEbN4V9gtKVl2KYfJMnDj3rXeJ/6y6/iY8lIhPKCCB1LPpmydKE0B2+I3Yx6x9qSx+GXwdXnGZvwxlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qWPe5feZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qWPe5feZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B178EC4CEEB;
	Wed,  9 Apr 2025 09:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744192584;
	bh=Rt/zFCT2dVTcx0v7PgWTkg2x2TmEPzbuCc7LGol1NJo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qWPe5feZ8pZyNgIE8UrI6Qe+5HR6c8wDH2s4C1DqPnOMRD2ktMdZnSdqh7dCkyLWi
	 FP74r3nZP76ETGqCVpcNNDaZZsssd29J9NJxyVX9QoIMQlpnaoCezJx4hGlAAYEraz
	 knt1yLB+bcGqG4liiQxunbx2M4AVlHo+SMRRg1hQO6FT7QP9/iZ3aYw2IqXCXN7vdT
	 2Yl00VKdRd1Pbpiy9Hxi/QwpX+IgjYH1J+uJDsWbA8drLstFyOn9HY49GXdxgLF/Fb
	 CBIj5zIpwhsqr5DMGh8bPbOLs3AH6RVCcehA2xh3aqy/d3XNVzaoQb5dLI3R2G8Q6O
	 kVOtNcCJ9xQvQ==
Message-ID: <258c8fda-70cc-4624-aef6-7cbef3cdbde6@kernel.org>
Date: Wed, 9 Apr 2025 11:56:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] memory: mtk-smi: mt8188: Use
 devm_pm_runtime_enable
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <e777f95c-c21f-4a91-b044-5fc19eb22c3d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2025 10:26, AngeloGioacchino Del Regno wrote:
> Il 08/04/25 08:29, Krzysztof Kozlowski ha scritto:
>> On Tue, Apr 08, 2025 at 11:31:56AM GMT, Friday Yang wrote:
>>> Replace pm_runtime_enable with the devres-enabled version which
>>> can trigger pm_runtime_disable.
>>>
>>> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
>>> ---
>>>   drivers/memory/mtk-smi.c | 16 +++++++++-------
>>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
>>> index f25d46d2ef33..daef6d350419 100644
>>> --- a/drivers/memory/mtk-smi.c
>>> +++ b/drivers/memory/mtk-smi.c
>>> @@ -713,16 +713,17 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
>>>   	if (ret)
>>>   		goto err_link_remove;
>>>
>>> -	pm_runtime_enable(dev);
>>> +	ret = devm_pm_runtime_enable(dev);
>>> +	if (ret)
>>> +		goto err_link_remove;
>>> +
>>>   	platform_set_drvdata(pdev, larb);
>>>   	ret = component_add(dev, &mtk_smi_larb_component_ops);
>>>   	if (ret)
>>> -		goto err_pm_disable;
>>> +		goto err_link_remove;
>>>
>>>   	return 0;
>>>
>>> -err_pm_disable:
>>> -	pm_runtime_disable(dev);
>>
>> You now broke/changed the order of cleanup without any explanation.
>>
>> Best regards,
>> Krzysztof
>>
> 
> I agree some comment in the commit description saying that the cleanup reordering
> doesn't matter in this specific case would've been nice to have, but anyway IMO
> it's not a big deal - he didn't break anything, anyway :-)

Cleanup orderings are tricky, so are you sure nothing got here called in
incorrect moment? I see that runtime PM will be disabled much later and
what certainty you have that device won't get resumed that time?

Best regards,
Krzysztof
