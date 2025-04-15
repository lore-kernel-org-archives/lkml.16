Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5359A27A108;
	Tue, 15 Apr 2025 07:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702608; cv=none; b=sGf8K9CCcHjVAUd3lLA/lorjF+80fYC4O37lkJkdG2oxaRPA73CuSZafe7bn801BqLJrbHaU8NR7xFjbY0PgGxsqOEF3o1lQN+DQ85og5T9hHD3pamGG1beYHhmp5r78yUJQzBF6wp7VkdDdX4Um6EJptvM4fx764VuTZwIg9bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702608; c=relaxed/simple;
	bh=Gyqan9yP4T12N6ZMRWgle82MYUjBp6SE0Fd8GLFRa4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FYdtNcVOWo1HGqWyE8C8gOUX8DG5VQF14xeAvhcJKWJcHz9swTmkovOfzw8wyfzVPIJGuCq9zsQmucjQOhws0wsQ+mdrr2nJtbLLZbw8vdg4KlqUUxfUN6y79D5/Upx7rURHqHn7J1Fp8BI5mnBc69Wn/UQ8oRgi1gYecRgTkro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OQ3cErnZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OQ3cErnZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744702604;
	bh=Gyqan9yP4T12N6ZMRWgle82MYUjBp6SE0Fd8GLFRa4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OQ3cErnZenuC4mmP4FMwxHNVrjpN86+MlVyREFmpaMcqiJW6/QPaM5zgBvCTGlcRz
	 +SfMEAGeHUnnHdBxDDG63RKjzzejYguNsvJUaXv6rTrQlMTQDGca9oOFnCRnHrZyCr
	 VsKCs3qi/vAwzwbxKKBMnlIpo1vlH7wv+LuHwviH3ODapO4eJAsyQ/LUTv2JhPOSLi
	 75p6CGbfqiCqBxfC40Ri1eUKg2jhuktbjcUPWtKSYyL8tcafGLJszA41FaQONzB9y/
	 8zmN4vyB8j31+WKo3qwZTId7ip+8GnEgwi69/uGNDKFpgopnMv2fVBlXtp8eFaQ+XU
	 5BHXEWTRojqTw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BDC8C17E0ABE;
	Tue, 15 Apr 2025 09:36:43 +0200 (CEST)
Message-ID: <36fe0778-399a-4406-8516-54b968cd9073@collabora.com>
Date: Tue, 15 Apr 2025 09:36:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw
 variants of bpi-r4
To: Daniel Golle <daniel@makrotopia.org>
Cc: Frank Wunderlich <linux@fw-web.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Wunderlich <frank-w@public-files.de>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20250412102109.101094-1-linux@fw-web.de>
 <c8f9f019-a238-47c8-a900-9ca48ce09503@collabora.com>
 <Z_0AdtyvehR9SHnU@pidgin.makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <Z_0AdtyvehR9SHnU@pidgin.makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/04/25 14:32, Daniel Golle ha scritto:
> On Mon, Apr 14, 2025 at 11:27:23AM +0200, AngeloGioacchino Del Regno wrote:
>> Il 12/04/25 12:21, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Sinovoip has released other variants of Bananapi-R4 board.
>>> The known changes affecting only the LAN SFP+ slot which is replaced
>>> by a 2.5G phy with optional PoE.
>>>
>>> Just move the common parts to a new dtsi and keep differences (only
>>> i2c for lan-sfp) in dts.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>> ---
>>> v2:
>>> - added basic dts for 2g5 variant
>>> - moved i2c used for sfp-lan to board dts
>>> ---
>>>    arch/arm64/boot/dts/mediatek/Makefile         |   2 +
>>>    .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts  |   5 +
>>>    .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 404 +-----------------
>>>    .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 403 +++++++++++++++++
>>>    4 files changed, 414 insertions(+), 400 deletions(-)
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
>>> index 58484e830063..a1ebc9aa4ba6 100644
>>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>>> @@ -22,6 +22,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtbo
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4.dtb
>>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-2g5.dtb
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-emmc.dtbo
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-sd.dtbo
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
>>> @@ -107,4 +108,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
>>>    DTC_FLAGS_mt7986a-bananapi-bpi-r3 := -@
>>>    DTC_FLAGS_mt7986a-bananapi-bpi-r3-mini := -@
>>>    DTC_FLAGS_mt7988a-bananapi-bpi-r4 := -@
>>> +DTC_FLAGS_mt7988a-bananapi-bpi-r4-2g5 := -@
>>>    DTC_FLAGS_mt8395-radxa-nio-12l := -@
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
>>> new file mode 100644
>>> index 000000000000..76eca976b968
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
>>> @@ -0,0 +1,5 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include "mt7988a-bananapi-bpi-r4.dtsi"
>>
>> This should at least have some different compatible, if not probably also a
>> different model string - as it's a different device.
>>
>> 	compatible = "bananapi,bpi-r4-2g5", "bananapi,bpi-r4", "mediatek,mt7988a";
> 
> Imho it doesn't make sense to declare compatibility with the
> "bananapi,bpi-r4" as the "bananapi,bpi-r4-2g5" is NOT compatible with the
> "bananapi,bpi-r4". It's a different board and using firmware meant for the
> "bananapi,bpi-r4-2g5" on the "bananapi,bpi-r4" (or vice versa) will result
> in a non-working Ethernet port.
> 

Is this device a BananaPi R4 variant, or is it a completely different device?

If this is a completely different device, then it's not even a BananaPi R4,
otherwise this is compatible with BananaPi R4, with a small variation :-)

Cheers,
Angelo
