Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D133BA3D;
	Wed, 18 Jun 2025 14:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750255917; cv=none; b=bAzkCdPKKP+QK/LemUezi+M6nM8s4/X68mjZN4la7aGYvxyi8W7sbR3vxPZ57DpH1rKs1waY+7CGT72oYgnYINJR0/T5/KY0FNiYzS6LzSSrjj2oIEIbYUvvFYaIYmT4s70mVuS3oI4CygjE40AEe912Mx9MdJQA5FpKNrccon0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750255917; c=relaxed/simple;
	bh=ktqmoqHWAPl0Zq7KIfogS/MbVY1Y4zI40XjkZj5TB6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJ8/gU4TscDrkakL17ey001frgcib8QiK2bAuWD4szHCqwgQjl2WF7zykbknSv2LSCR0ygBbvcor3ZoaoBIHYa8xURs51dczv6aHZ1pnLAMnyeGEDAay6O8KjEeMGH56dmleI0iTqwYof3NNkMS8DIh3IcxhDL4B/GybCE/JQq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QBSZx0pj; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QBSZx0pj"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2463F43137;
	Wed, 18 Jun 2025 14:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750255912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vXF18F4sgIg2jD9ptU1LZHnjRdgQrEW5rmy82LsXF4s=;
	b=QBSZx0pj5qIxdvnIs5yPuGcY31Ww95QxRTZz5xQ6MvKFyBxJperJouMSpwrLPbXqLnuhFJ
	yG6Gg95xudBvhnqiDZKbePaRxdU1sQ5xN+tZ7KhJLpwFYT7rXZ5pCdVp2xoKxQGIWbx29a
	eFK7ji7esOMZDrd92Wj3SuAHjnhL5A1ToFm6eWB2Gyr1ZphaXt5fObdUSS16Jkb3bsTdZu
	yUM/WpmdN8bnEFXtnrs2i1BBGxO2f7jZY7PlG2q52efBmEBLYDb2Kcbweb26dvPOQThzGH
	BKONq2bU5FXVly8SXPTW55P9354qyGQELcTETFod+XvGWpHuISxvLBQvHKXtiQ==
Message-ID: <865fc263-b3c6-470a-9fb8-3d6df51a2b74@bootlin.com>
Date: Wed, 18 Jun 2025 16:11:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Fix the panel compatible for
 the PinePhone Pro
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com>
 <20250618-dtb_fixes-v1-1-e54797ad2eba@bootlin.com>
 <DAPPKP3OWLMU.C6HXTY24NZ4H@cknow.org>
Content-Language: en-US
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
In-Reply-To: <DAPPKP3OWLMU.C6HXTY24NZ4H@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvheejtdeifeejvedvffdtuddtheehtdelvdehvefgjeetveejfeeiveduvdejteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgfkrfggieemvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeingdpmhgrihhlfhhrohhmpeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepughiughirdguvggsihgrnhestghknhhofidrohhrghdprhgtphhtthhop
 ehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghikhhosehsnhhtvggthhdruggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: olivier.benjamin@bootlin.com



On 6/18/25 15:54, Diederik de Haas wrote:
> On Wed Jun 18, 2025 at 12:32 AM CEST, Olivier Benjamin wrote:
>> As documented in its bindings, the compatible for the Himax HX8394
>> MIPI-DSI LCD panel controller is in 2 parts.
>> The PinePhone Pro DTS currently only specifies the first part of the
>> compatible, generating a warning.
>>
>> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> index 04ba4c4565d0a205e2e46d7535c6a3190993621d..5ebc380a24df86ba7172b0950b89cac56b61c507 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> @@ -479,7 +479,7 @@ mipi_out_panel: endpoint {
>>   	};
>>   
>>   	panel@0 {
>> -		compatible = "hannstar,hsd060bhw4";
>> +		compatible = "hannstar,hsd060bhw4", "himax,hx8394";
>>   		reg = <0>;
>>   		backlight = <&backlight>;
>>   		reset-gpios = <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;
> 
> Reviewed-by: Diederik de Haas <didi.debian@cknow.org>
> 
Thanks for the review.
> But I'd actually suggest to combine it with patch 3 and use that
> opportunity to also fix the property sorting, so you'd get 1 patch which
> fixes all of the panel issues.
> 
Makes sense, I'll integrate your suggestions from the other 2 patches, 
fix the property sorting, and squash the fixes into 1 commit/patch in v2.
> Cheers,
>    Diederik

-- 
Olivier Benjamin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

