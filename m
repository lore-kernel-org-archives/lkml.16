Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA49233722;
	Wed, 11 Jun 2025 10:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637342; cv=none; b=qZL+mbMm4tfpQuZI5mcuLjyxsCSoxVPcD+4F4De9rZESTXnI+T1v/L9hUsnMJrRdbxIqjWuXrF0tQH5ZAgmbmMfbnQUIVy7zJGyHk1Ywhj/EvhaGjJ1jxdkLCqUfR9tP/7Y9+LZJ21ZGZbaw8quXDVJ3vpjPv53n+jbtd3EIpLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637342; c=relaxed/simple;
	bh=4b8PduoACBUaCTjAzlGQ9Kuyj+rMJBqCfxKWwFHLieI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7t7kQNyZ7Lncn20lyqTjxebRmVS6PpXbH2C3WWxQWV2UCkBMZOjEAY+BytdvxjlSKOwXSQ825mqwo4PUw0jRYqbr7UHrpUL+9aFH/5ahnic3xM4sOrJGMA4MOJmS6A8HiK/hqsWOKDjeDb5Nc02yf68JSDwwbbCF38NGPaW2WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hLGriKWW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hLGriKWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749637338;
	bh=4b8PduoACBUaCTjAzlGQ9Kuyj+rMJBqCfxKWwFHLieI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hLGriKWWoCwGqWdh1GbD0GObWrxIh27iLleEURTa0gamLYw1slQuzfcKHMThAZbbD
	 u/vWvaGQDSIvec+qPx4kRkcu84Q3dsS2iEAn0TZgTlHYxEkQaKVXUOdN1CWlPz2Pfw
	 78Vi4zza2iDTen1lja1G3CwBtqnyHtgtd1ULn/QU4QIJQEH75hjpltDGZoaYdZrf/F
	 e8odADGznQabfvc23h6j2ZZ1CzL4S4POiylYfoRNYYiYnT89tSXS2ARYxerv4vP+/0
	 aA2Fyqq9t/mCPGrtj+2cjexHHTob+S3WGIb0LDbfY67LCGPZu3Ce1zxacePla06KqF
	 FR20WHeTAJipQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A640317E0C99;
	Wed, 11 Jun 2025 12:22:17 +0200 (CEST)
Message-ID: <89e2699a-94cc-4d1d-9788-2c5bce1c361c@collabora.com>
Date: Wed, 11 Jun 2025 12:22:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] ASoC: mediatek: use reserved memory or enable
 buffer pre-allocation
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <aCRaTY76dnaavsrd@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/05/25 10:54, Mark Brown ha scritto:
> On Thu, Apr 24, 2025 at 06:24:54PM +0800, Chen-Yu Tsai wrote:
> 
>> This is v2 of what was just a single patch "ASoC: mediatek: re-enable
>> buffer pre-allocation on some platforms". Link to v1:
>>
>>      https://lore.kernel.org/all/20250401085659.1222008-1-wenst@chromium.org/
>>
>> Angelo requested that these platforms use reserved memory regions if
>> possible, and fall back to pre-allocated buffers only if that fails,
>> to align with other MediaTek SoCs / platforms that already use reserved
>> memory. The series covers MediaTek's MT8173, MT8183, MT8186, and MT8192
>> SoCs.
> 
> AngeloGioacchino?

Truly sorry for this slipping through the cracks - and thank you for the pings.
Also, thank you for all this code, love it.

Whole series is:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Sorry again for all the wait.

Cheers!
Angelo
