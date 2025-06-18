Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D4B2E54AA;
	Wed, 18 Jun 2025 14:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750256097; cv=none; b=dD/4jZGtqezJoZ1kxW/z7E9yRMr+LTNhFoTPigOi75V2gJ2OFxQeWt/H2noUSiF7CIuzHJkIHsEX2xTUYJdfyKNtvq/nZ2DwqJpIRLcOaeuVDCkAxdq/MiO4x4K6LtcXyOPoaNYyAqSHOF1fj9S2MLTj2CLW5lRyRouNW2ysoLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750256097; c=relaxed/simple;
	bh=7joRVJmJSVqkdNthqW2fkY4i9Jk1mXkGvpIDShV3Pdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdadVgbc1lYs9gg+fdYJ1djoM4p4B5dTgjE4oDTyYt2Ag2/keNmx4IKWId/6d8b6K231syv3+vVLXLoXafXPJCq9C5Yrhopj38bEdInKqKg8x7fYUWSwHlDFQjlR0ecP80N+eAM8/OjFmELVBmd3u1oojmnqDlAjNWkjZFWcFPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M3GMdsgx; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M3GMdsgx"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44DE743A29;
	Wed, 18 Jun 2025 14:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750256086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BR2Js8AYTA3uqJ+dhjRGvYCUNC9Z3XvtFngEWfHaNL4=;
	b=M3GMdsgxD6lk12yug3GZIA8tEeyFYbrlJgFxgmCaHKFUrC5JJagMIGi3UonPF93IgRsa0e
	91VmMYNOWFqFjkgDwrtJCBNw0kqYZ78J7y/0GcpTTb5w9PScz8COG1ISoU+ymvY6deqwHU
	eFa8aDov6g1X5Z0U7XvCaG3a2TC3vJx8Q58k96AcZsZcGLy0o+/s8AiHhvL/XRjHZQ57V+
	t+oMgkfbyWN6LIZZE350GAwt4swQwwMRB8EIuQKKPAygPkzZQX4XpN0jddH+BhU7S55K1X
	9XFLQ7bAdz5CemKbwN+ahVr+YigNdMg5BZoI32c8u593JeheOJHk+9jqWIv2BA==
Message-ID: <3acaaf1c-b4ed-47ff-8de5-195a9cfc5338@bootlin.com>
Date: Wed, 18 Jun 2025 16:14:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Fix the mipi port definition
 for RK3399
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com>
 <20250618-dtb_fixes-v1-2-e54797ad2eba@bootlin.com>
 <DAPPHL6RPWWM.94C7P26AUCCN@cknow.org>
Content-Language: en-US
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
In-Reply-To: <DAPPHL6RPWWM.94C7P26AUCCN@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvheejtdeifeejvedvffdtuddtheehtdelvdehvefgjeetveejfeeiveduvdejteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgfkrfggieemvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeingdpmhgrihhlfhhrohhmpeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepughiughirdguvggsihgrnhestghknhhofidrohhrghdprhgtphhtthhop
 ehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghikhhosehsnhhtvggthhdruggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: olivier.benjamin@bootlin.com



On 6/18/25 15:50, Diederik de Haas wrote:
> Hi (again),
> 
Hello again, I appreciate you taking the time!
> On Wed Jun 18, 2025 at 12:32 AM CEST, Olivier Benjamin wrote:
>> The RK3399's MIPI DSI has 2 ports: in an out. The definition of
>> the port property necessitates the value of #address-cells to be 1.
>>
>> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> index 5ebc380a24df86ba7172b0950b89cac56b61c507..5a7341fb6bcb0613af6f3ac31d99355a0f890e89 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> @@ -468,7 +468,7 @@ &mipi_dsi {
>>   
>>   	ports {
>>   		mipi_out: port@1 {
>> -			#address-cells = <0>;
>> +			#address-cells = <1>;
>>   			#size-cells = <0>;
>>   			reg = <1>;
>>   
> 
> In rk3399-base.dtsi there is already a definition for mipi-in and
> mipi-out. AFAICT what this change does is require a reg property on the
> endpoint and I don't think that's correct.
> 
Those definitions do indeed exist in the base DTSI.
> It seems to me that all you need is a mipi_out_panel definition.
> So what I came up with is this:
> 
> ```sh
> $ git diff
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 04ba4c4565d0..b175aeed99e2 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -466,18 +466,6 @@ &mipi_dsi {
>   	status = "okay";
>   	clock-master;
> 
> -	ports {
> -		mipi_out: port@1 {
> -			#address-cells = <0>;
> -			#size-cells = <0>;
> -			reg = <1>;
> -
> -			mipi_out_panel: endpoint {
> -				remote-endpoint = <&mipi_in_panel>;
> -			};
> -		};
> -	};
> -
>   	panel@0 {
>   		compatible = "hannstar,hsd060bhw4";
>   		reg = <0>;
> @@ -495,6 +483,12 @@ mipi_in_panel: endpoint {
>   	};
>   };
> 
> +&mipi_out {
> +	mipi_out_panel: endpoint {
> +		remote-endpoint = <&mipi_in_panel>;
> +	};
> +};
> +
>   &pmu_io_domains {
>   	pmu1830-supply = <&vcc_1v8>;
>   	status = "okay";
> ```
> 
Thanks for the suggestion, that looks like it might actually solve the 
issue.
> I don't have a PPP so I can't verify it, but ``make CHECK_DTBS=y W=1
> rockchip/rk3399-pinephone-pro.dtb`` no longer reports issues wrt
> dsi@ff960000 (after I also fixed the panel compatible like in patch 1
> and added a LCD1_RST pinctrl definition as indicated in my reply to
> patch 3).
> 
I'll test on my PPP and report back in v2.
> Cheers,
>    Diederik

-- 
Olivier Benjamin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

