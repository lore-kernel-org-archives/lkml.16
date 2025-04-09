Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2853D76;
	Wed,  9 Apr 2025 08:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187183; cv=none; b=ODiIOkpSmGYNzc4NajsFd+VsjfBORnqivrLiDpI9VntdP315AvbR1a/RPul8ZtZ6VatG8741ezrOwDw2EFqOkCmov0tIMyEhSW8qmdM+JoS3orpH1Q78lh6VU88oaoJwAwj3ZuI8LUAPZObPetisb7QzbcnBEIgNswCao4tgidg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187183; c=relaxed/simple;
	bh=wrOa//1C4u8hYENOAxqq+2W4agP1bfREkfVr0tNeANI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hD4NmEPW9Nc40B4J1uNd8vtNZDmvXcwlzuHt1Fyimt94OYEqn3w1PrF5bcxL1JIVU9QCSWOQmP84xeOdhx0YM/vZrKFZQrvu/IGPaRA2A14BhwSFXh5/r+XqxjLZholl5beECdZfSspRd2rldQuMUnPGyfnVoe9nu4XnKL4Yt9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=F4M+j51r; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="F4M+j51r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744187179;
	bh=wrOa//1C4u8hYENOAxqq+2W4agP1bfREkfVr0tNeANI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F4M+j51rC3JshiEfTXHA5tKJBpDoYImKAH5CAllztoULTu84ynM/m0X1gjyNr0bb7
	 o83QKIeC73hniza3njKH29vq0bplmPNLAyyH3LriOmF9mGgsVIz1Q8X51Nxw2zpkFD
	 5s38hOWVau7pPV2aE82YemPw2Sgkzv0XjjjFWdhQQBCYAqDAHt1XlL9EX08zRqM1Fk
	 QRMZ/V38HRRO8REFP/scEdG6Epme8kqSoTvueuiphBhPNt9icfCfQZ6zcz2GI0y5B8
	 QfwOk7c6MXeAX86zLCDOBp+phld5bOsn45WQj7gEo45Fv4IvVeTgQQZAZNoxSrt612
	 ZgHYzP8W4cmpw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 10C8F17E0903;
	Wed,  9 Apr 2025 10:26:19 +0200 (CEST)
Message-ID: <e777f95c-c21f-4a91-b044-5fc19eb22c3d@collabora.com>
Date: Wed, 9 Apr 2025 10:26:18 +0200
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250408-woodoo-quick-worm-bf82b4@shite>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 08/04/25 08:29, Krzysztof Kozlowski ha scritto:
> On Tue, Apr 08, 2025 at 11:31:56AM GMT, Friday Yang wrote:
>> Replace pm_runtime_enable with the devres-enabled version which
>> can trigger pm_runtime_disable.
>>
>> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
>> ---
>>   drivers/memory/mtk-smi.c | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
>> index f25d46d2ef33..daef6d350419 100644
>> --- a/drivers/memory/mtk-smi.c
>> +++ b/drivers/memory/mtk-smi.c
>> @@ -713,16 +713,17 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_link_remove;
>>
>> -	pm_runtime_enable(dev);
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret)
>> +		goto err_link_remove;
>> +
>>   	platform_set_drvdata(pdev, larb);
>>   	ret = component_add(dev, &mtk_smi_larb_component_ops);
>>   	if (ret)
>> -		goto err_pm_disable;
>> +		goto err_link_remove;
>>
>>   	return 0;
>>
>> -err_pm_disable:
>> -	pm_runtime_disable(dev);
> 
> You now broke/changed the order of cleanup without any explanation.
> 
> Best regards,
> Krzysztof
> 

I agree some comment in the commit description saying that the cleanup reordering
doesn't matter in this specific case would've been nice to have, but anyway IMO
it's not a big deal - he didn't break anything, anyway :-)

Instead, the big deal is that Friday forgot to retain Reviewed-by and Acked-by tags
that were released to him on those patches....... :-)

Cheers,
Angelo
