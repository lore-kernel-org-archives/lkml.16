Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438F51F1506;
	Mon, 14 Apr 2025 11:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629608; cv=none; b=cj2V8Fst+sWsYan3O9JGFHEnaZriTSMRMh7GKcb3v6LLbpECXJjRG2L9vfi/u79aaL+g9z5Dw+u63sCB1IqJqM3a2FkSPtLrNyK+6exhcaaacpt0zimCcGgvBspOWr1z6veKbXSuR0TbY5hHcCU14JFtKUQdUnaZkrcvLFCN8zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629608; c=relaxed/simple;
	bh=me7hnFUemACg5+LWnK3v5vg7rKKJpQlwUnNnkLHu5c4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FvbpV+ajRSGtDTJPZ+xkOrzFBnq4PFkmtAFeA22pxw33gsMyOAibDF9vXjLxSY7StS7cs/cawZhQS9UFfX9iGPBynoCzSETnbrqH84a8MWgEeMPZHAZx0fzN0uYNSIWIGSsPc8JacxNdNNoot4B/uCYYoVfn4v3ezXz3ty9bnbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=a+bDrffT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="a+bDrffT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744629603;
	bh=me7hnFUemACg5+LWnK3v5vg7rKKJpQlwUnNnkLHu5c4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a+bDrffThoN0yZarfWiV9G2YLin0HKv3155Brcsi8AVvEXhtw0YpnqbWvmHV1Qeaq
	 X+ISyMvLGulm0sFjohN1PfNn2S877H/92jq6OjP5P8m5giZ79aNNhyA8AaW4tYL6fr
	 Fc1/BXRaBG9TY29btQb/Bn9gz63FNwGMJJ8hxWWPFTxPfGek7PTH6Zhn+Ws7B0voHc
	 u5sHHXPi5zsfVM+VrCEuaX9vUMf2EUYkh2JiLMpIbj46FnCtGdARMMzO7NiPaZNjjh
	 B3lv0tpQccDa4Q2XqhBFTw1/LnGhhWgy1KTKwjwApaWU1hnA3IoQpnukU0MwryFi58
	 o1UXdZoo+3AMQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F57D17E0F85;
	Mon, 14 Apr 2025 13:20:02 +0200 (CEST)
Message-ID: <70231f99-5b41-4be4-8046-c73e32c68841@collabora.com>
Date: Mon, 14 Apr 2025 13:20:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw
 variants of bpi-r4
To: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>
References: <20250412102109.101094-1-linux@fw-web.de>
 <c8f9f019-a238-47c8-a900-9ca48ce09503@collabora.com>
 <4469DD7C-1C73-4767-867B-729819C2E1B4@public-files.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4469DD7C-1C73-4767-867B-729819C2E1B4@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/04/25 12:19, Frank Wunderlich ha scritto:
> Am 14. April 2025 11:27:23 MESZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 12/04/25 12:21, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
> snip
>> This should at least have some different compatible, if not probably also a
>> different model string - as it's a different device.
>>
>> 	compatible = "bananapi,bpi-r4-2g5", "bananapi,bpi-r4", "mediatek,mt7988a";
>> 	model = "Banana Pi BPI-R4 (2.5GbE)";
>> 	chassis-type = "embedded";
>>
>> ..snip..
>>
>> a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
>>> new file mode 100644
>>> index 000000000000..1ab09ed2f151
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
>>> @@ -0,0 +1,403 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/regulator/richtek,rt5190a-regulator.h>
>>> +
>>> +#include "mt7988a.dtsi"
>>> +
>>> +/ {
>>> +	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
>>> +	model = "Banana Pi BPI-R4";
>>> +	chassis-type = "embedded";
>>
>> Please keep compatible/model/chassis-type in dts files.
> 
> Ok, should i add specific compatible to existing board (like 2sfp)? Just thinking how binding should look like.
> 

No, the existing board compatibles should not be touched.

I would imagine the bootloader reading the compatibles of all DTs and:

- On the 2G5 device, prefer a devicetree having that machine compatible;
   - 2G5: If no 2G5 specific DT exists, fall back to using bananapi,bpi-r4
- On the 2sfp device, use DT that has bananapi,bpi-r4 but not the 2g5 compat.

So all of the DTs can be present, and the bootloader chooses the right one for
whatever device it is running on.
If it's not possible for the bootloader to do so... well, that still doesn't
change anything: you need two different DTS with a difference in machine compatible
because those are two different machines :-)

> Else is there an example for adding optional compatible without adding a complete block in binding?

I'm not sure if you can nest oneOf statements in bindings... but that anyway
doesn't really solve anything, so just add a full block....

Just to be sure, though:

krzk/Rob/Conor, am I right on this?

Thanks!>
>> Cheers,
>> Angelo
> 
> 
> regards Frank


