Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436CE26A1AA;
	Wed, 11 Jun 2025 10:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637916; cv=none; b=KSLHWZcd8a6nosBHPEKI5VzGxwBKyyF2KalRqCEkKaWWxsA6eI+Fw9+mBVYRyvUPvSddHowQTEz2e64PKtEksVUouG0TWQpaCLVlTJMimz0qCq0UFexB+moIB6uRX0PH8GoZAcsewr2EJbXO8kKyj8iQMAM2QwAbmKXkHwtwUng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637916; c=relaxed/simple;
	bh=3z8hZFa9//bUvzwLa3zjwL+7K6avZpJg2PLIMuQmLL4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JZnBJJVnmIB7XEjaCo5HiGr31ZbRdYLA5bzdK/1IpmhesjsTqphhfmipD08rL1EEZZwinG67YPUqKNXdKiaIBGgL1eFfmo7lsguOq8fzv063mP3MzcJUW9s78Ajo09OTdpb6lFhEsV6spp51ETgBcauwMlrVP1gLGfT2WbBZX/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Og+Ohgdr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Og+Ohgdr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749637912;
	bh=3z8hZFa9//bUvzwLa3zjwL+7K6avZpJg2PLIMuQmLL4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Og+Ohgdrlx/tf6pMagXXUidF1owJ7JRpFiMxz0sXLlLR9I2U8xFsYL9B+0W1w1MT3
	 ABTGmg3o1ZfpZDQW+9sCzpec1N0npade21fFY2BIdbUSmoTiAndGHckAXyVLBin1Zw
	 SEFLxL2fNGuiAOER7JvOE7F5hrIsNSMOMWwk5wJLRaG04QJoWl4/qY1oXWuzJBb6Af
	 wsSwTI7WHVnBOjhKpaaXNrSKvb/y52T44HaGHpXZpxyCXBT0I6xgzKADXngnaMedXD
	 TeT5RIjeDhQMAfnPxWxgjbiRGw9wPUnIqens1694qMuudhCCCtN7OR2QcCO8DmFrm2
	 P+aTeW0M3kohQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F6D417E02B0;
	Wed, 11 Jun 2025 12:31:51 +0200 (CEST)
Message-ID: <ccd10443-c643-487b-ab2b-f1da00f97ed7@collabora.com>
Date: Wed, 11 Jun 2025 12:31:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] ASoC: mediatek: use reserved memory or enable
 buffer pre-allocation
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250424102509.1083185-1-wenst@chromium.org>
 <aCRaTY76dnaavsrd@finisterre.sirena.org.uk>
 <89e2699a-94cc-4d1d-9788-2c5bce1c361c@collabora.com>
Content-Language: en-US
In-Reply-To: <89e2699a-94cc-4d1d-9788-2c5bce1c361c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 11/06/25 12:22, AngeloGioacchino Del Regno ha scritto:
> Il 14/05/25 10:54, Mark Brown ha scritto:
>> On Thu, Apr 24, 2025 at 06:24:54PM +0800, Chen-Yu Tsai wrote:
>>
>>> This is v2 of what was just a single patch "ASoC: mediatek: re-enable
>>> buffer pre-allocation on some platforms". Link to v1:
>>>
>>>      https://lore.kernel.org/all/20250401085659.1222008-1-wenst@chromium.org/
>>>
>>> Angelo requested that these platforms use reserved memory regions if
>>> possible, and fall back to pre-allocated buffers only if that fails,
>>> to align with other MediaTek SoCs / platforms that already use reserved
>>> memory. The series covers MediaTek's MT8173, MT8183, MT8186, and MT8192
>>> SoCs.
>>
>> AngeloGioacchino?
> 
> Truly sorry for this slipping through the cracks - and thank you for the pings.
> Also, thank you for all this code, love it.
> 
> Whole series is:
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Sorry again for all the wait.
> 
> Cheers!
> Angelo

Also, I picked patches 10 to 13, applied to v6.16-next/dts64 and manually fixed
a merge issue with patch 13.

https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/log/?h=v6.16-next/dts64

Cheers!
