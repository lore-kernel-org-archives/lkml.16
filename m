Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55442E9748;
	Wed, 18 Jun 2025 13:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254004; cv=none; b=JpLR6SsK9nRwEZKCXdHouUJNnZFaFLjae7FEDv6TzigpEcyskS31+dTv+kXVc/xapRntYWbEnV4XlV/r7S3eOo4iGm+gW7Fqk2IWl7gJhXXeVq4Te3V2Y3Jk1+9iYKTRxtegMxz+vGDZvf4PKjAqq7FRGN2Fo1fcV4soynOg84E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254004; c=relaxed/simple;
	bh=/owkB95o54XoReDLw1Le3+hhwzEByfiKJVJ89LjRmG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ElSAPy17feb0NueD+t6fkRvjM283pdkOVIdDolJFs0aCdczHtS09j1LK2T+PmKIiq1NnqX48Z/ZKBU0v5igxih0gVYKFnZaz0+efKz3v8jQGSVAk9gady+dQYFL4p2FffkOl5zsN5AXsnkbySeEal1hZgw8AqUgYwztcXVW35wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cBeCCwRW; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cBeCCwRW"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C06BA443BC;
	Wed, 18 Jun 2025 13:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750253994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dgrZOfyKtBkV3FRP+QW5pRebwqcUGFtff5SNDuOzWCw=;
	b=cBeCCwRWYKaXrBWXnieTF9Lfp7GlUSilFf3D5MOrwR7vnJVlg5HIUhkC4zaiFnlWTAm9pt
	GAci5crFZVOTHAu3pJztu6OxNsxECwMEcTHUR5zObr1EwCJL309nrgq4bT2gcgPD0ifOJY
	exIlKTj/XxkUd3AvNQOxf8nKoo8G1+NX1zT3wZ/dpJZ3dNSmuWYY+k6gJpLeUndPCUN8X5
	+0CJjy1KlZKlQuF3Ich9hVSrUhk42XprvvFWcqFfd9ubPl+ztpvQD65lxZmW4FGLv9WFnx
	K8/XeLDm1PCfp7vS1N00WMHj6jXLw7MAPtC7YubzDJMppH/OwP5cVoQUZkNnCQ==
Message-ID: <f5f4072f-759e-4086-833a-14868a8b8423@bootlin.com>
Date: Wed, 18 Jun 2025 15:39:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Remove unused property in
 PinePhone Pro MIPI panel
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com>
 <20250618-dtb_fixes-v1-3-e54797ad2eba@bootlin.com>
 <DAPNE849BAON.1DPGBKMHM552V@cknow.org>
Content-Language: en-US
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
In-Reply-To: <DAPNE849BAON.1DPGBKMHM552V@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvheejtdeifeejvedvffdtuddtheehtdelvdehvefgjeetveejfeeiveduvdejteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgfkrfggieemvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeingdpmhgrihhlfhhrohhmpeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepughiughirdguvggsihgrnhestghknhhofidrohhrghdprhgtphhtthhop
 ehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghikhhosehsnhhtvggthhdruggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: olivier.benjamin@bootlin.com



On 6/18/25 14:12, Diederik de Haas wrote:
> Hi,
> 
Hello Diederik,

> On Wed Jun 18, 2025 at 12:32 AM CEST, Olivier Benjamin wrote:
>> The MIPI panel definition in the PinePhone Pro DTS includes a
>> "pinctrl-names" property, which is unused in the absence of pinctrl-0.
>>
>> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> index 5a7341fb6bcb0613af6f3ac31d99355a0f890e89..405140700208365c8631de86a2d7b6e577b7aa7f 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> @@ -485,7 +485,6 @@ panel@0 {
>>   		reset-gpios = <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;
>>   		vcc-supply = <&vcc2v8_lcd>;
>>   		iovcc-supply = <&vcc1v8_lcd>;
>> -		pinctrl-names = "default";
> 
> Why not define a pinctrl for LCD1_RST for GPIO4_D1 and reference that in
> pinctrl-0? (See page 11 and 16 of the schematics)
> 
That is a very fair question. I had simply missed that signal.
I'll get right on that, thanks for the suggestion!
> Cheers,
>    Diederik
>>   
>>   		port {
>>   			mipi_in_panel: endpoint {
> 

-- 
Olivier Benjamin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

