Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F795223DF5;
	Thu, 19 Jun 2025 10:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750330089; cv=none; b=q6NxVu5SFhzihROFAqtbQLCwbfLETtS2RMGvt9/ICyZ3eZLqycUrIsiWQolPylJTyC0uKwKT8uqSGeKvFAzlizRLf7HwaS+iPbB72eFJjMgyNRXuu0KtE9yILCzG0DFyCPHq3adU0F5jRBbIv2UE80YWQu0Jkf5MnHYOPDOKs2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750330089; c=relaxed/simple;
	bh=92oRe7d2R8Bz+GLGeI+CL7LHJz6LbFva0fu3VY+Ti6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kk4mHXsTzvJbgGjSAbQkAxsF7lG9b39VuYsYJyn7mrlVymWfL9vdy0lKmcaIOXi5UeqE8l4hnsfoLPjOd4w0V0hZT6ZHVc6WJRGjNPwoiadEtfmQpz1zBT7NMFxzqTvZEyidYVdK2aL7QGF45oIzhGvSdcVXZN8uIsbkAMU/tjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Fdj0OnyG; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Fdj0OnyG"
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF5F44396F;
	Thu, 19 Jun 2025 10:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750330079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YrYJ8w60yCUBZigSm+JV9lV/nNFVXOxrB9Gm7xPQC6A=;
	b=Fdj0OnyGM/LIKEoR67MIFPtCrbEaBwTFCjHjfXIe2gV/5Q5MdeVZmWL1UAwK+YucK6tESv
	1WPzDuiDlQMae4blgiTIVdGUVGALZJaWeKzzTlv2IaBS0NpVQiMsP7WDy/DlTfCSBX7TWw
	7mXdmJjQ/ER2+q+7oHYIyzoEecykD096ST65HAG6c6lbzw38hVTaNEKKnbRDk6+Xote/rB
	3TzQvUCx+GFM7JZx+sD6k3Nmawn3oHIkyu498nTe1rPNCEv2CI6v5l6sFDlUrro8jtextJ
	jHeePypFVx4xYHK0U7uqG9y3VLi+wk3YVNoMFY4MX2BBz4w97QiKtD998UdXZg==
Message-ID: <c26ce505-343a-4759-90b5-a026c66979c7@bootlin.com>
Date: Thu, 19 Jun 2025 12:47:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: rockchip: Fix the PinePhone Pro DTS' panel
 description
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Diederik de Haas <didi.debian@cknow.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250619-dtb_fixes-v2-1-abd711d11b67@bootlin.com>
 <DAQEX04P5320.CQDU7SL7AV4A@cknow.org> <5461462.0VBMTVartN@phil>
Content-Language: en-US
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
In-Reply-To: <5461462.0VBMTVartN@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuieffteevudettdejleejheekkeeftefggedttefhheeikeejgeehveefjeejheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiedphhgvlhhopeglkffrggeimedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiegnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehhvghikhhosehsnhhtvggthhdruggvpdhrt
 ghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughiughirdguvggsihgrnhestghknhhofidrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: olivier.benjamin@bootlin.com



On 6/19/25 12:31, Heiko Stuebner wrote:
> Am Donnerstag, 19. Juni 2025, 11:46:15 Mitteleuropäische Sommerzeit schrieb Diederik de Haas:
>> Hi,
>>
>> Thanks for working on upstreaming PPP things :-)
>>
My pleasure. I also have 
https://lore.kernel.org/linux-rockchip/20250509-camera-v3-0-dab2772d229a@bootlin.com/ 
pending = )
>> On Thu Jun 19, 2025 at 7:21 AM CEST, Olivier Benjamin wrote:
>>> Fix a few issues in the panel section of the PinePhone Pro DTS:
>>>    - add the second part of the Himax HX8394 LCD panel controller
>>>      compatible
>>>    - as proposed by Diederik de Haas, reuse the mipi_out and ports
>>>      definitions from rk3399-base.dtsi instead of redefining them
>>>    - add a pinctrl for the LCD_RST signal for LCD1, derived from
>>>      LCD1_RST, which is on GPIO4_D1, as documented on pages 11
>>>      and 16 of the PinePhone Pro schematic
>>>
>>> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> 
>>> +	lcd {
>>> +		lcd_reset_pin: reset-pin {
>>
>> I don't know if there's a 'hard rule' for it, but I'd recommend to use
>> ``lcd1_rst_pin: lcd1-rst-pin {`` as that would match the naming from
>> the schematics. I realize that some but not all (other) pinctrl nodes
>> follow that 'rule', but it helps with traceability.
> 
> not a "hard" rule, but a strong preference.
> I.e. we want people to ideally be able to just hit search in the
> schematics PDFs for the name they saw in the devicetree.
> 
> Sometimes that is not possible, because of naming conventions or
> overly strange schematic-names ... and sometimes things slip through
> as well.
> 
> But following the schematic names, is the general goal.
> 
Very fair. I used "lcd_reset" because even the schematic is not super 
clear: it uses "LCD_RST" on page 16 and LCD1_RST on pages 11 and 16.

> 
> If this stays the only suggestion though, I can fix that when
> applying. Or you can send a v3 - up to you :-)
> 
I'll correct to lcd1_rst_pin and send a v3 (most likely later today)
> 
> Heiko
> 
> 
>>
>>> +			rockchip,pins = <4 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
>>> +		};
>>> +	};
>>> +
>>>   	leds {
>>>   		red_led_pin: red-led-pin {
>>>   			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
>>
>> Otherwise,
>>
>> Reviewed-by: Diederik de Haas <didi.debian@cknow.org>
>>
>> Cheers,
>>    Diederik
>>
> 
> 
> 
> 

-- 
Olivier Benjamin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

