Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EBE1DDC28
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743530718; cv=none; b=f1by/7hkz2EsvtWAkinpLIWhQJeWGGMnrJ4fxw20xWyQBU7Gltod7bNCmzy6xTEIwLK0R006V5xrEPmNT+X/PrWhE41xn31OHwqI16CxmeIslLFt3vnSjMTZa8DkBD+nDcFpPF5Z8N76F85/wiO5J5DX6uw4FZOxZMPuUc7IWew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743530718; c=relaxed/simple;
	bh=p4ZAQqQjKOYzlzR10/Ir2f/KEq7r7+fJlvaawutdPuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6Rx+D9LcRWsU1xkPh3QrIT6hvZj4XRPLaE8jk/xGlsNp6/bdiUcqbPjOPWLb3lEV15BPU/QRoXzXuIe6lCL7SlOgUWqn+7yfsMY5v15ehXA6WFCwCCxkVN7UBDETvuSfEiy/7dzXohBKNzl4wFlmJpJFtOHE/JpQ5DkRzuj1yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Y8NON8IX; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Y8NON8IX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1743530715;
 bh=6BaPnjQcShc/TQj8w7bokIUcnPjhGONOza6lZPt107c=;
 b=Y8NON8IX5EBwK6hbsR3tXv4vf4WJlQ35u/D7JmE9DqLDEA06wN5+Fc/iLX9dx3dn/8UiasMFz
 sqtYcaxa1YHsei7vBkPZA+EmOVV1Kl9BxcAWtey3O/PXk+xhRjyIjQOznJrI87l0BI9a+9Fu0jV
 Y5+9R5UUJ0o+iHc2GLkIMcVzHAg75v+z4Zh5iL3sGafZ46/6LOnWAn6bCs9k+8nLTgWcfjXgJvX
 rqTQpKAHATQ9EAMZ6n7GyyBbdyCFkXvfkeBQH52N9xpjUkeO6PWoMLlS5LISm/xAAG9qThLMlCU
 YsgD4IYoZLA9+QEyt53qCRaXkvtjX6cRFXMVNCnWNukw==
X-Forward-Email-ID: 67ec25c900d8331c283c9f62
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <02f6e0e0-9cd8-425c-bad2-f061b601fdcd@kwiboo.se>
Date: Tue, 1 Apr 2025 19:43:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Add DMA controller for
 RK3528
To: Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250401100020.944658-1-amadeus@jmu.edu.cn>
 <20250401100020.944658-3-amadeus@jmu.edu.cn> <Z-wj_eO6FGcwsEh6@pie.lan>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <Z-wj_eO6FGcwsEh6@pie.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-04-01 19:35, Yao Zi wrote:
> On Tue, Apr 01, 2025 at 06:00:19PM +0800, Chukun Pan wrote:
>> Add DMA controller dt node for RK3528 SoC.
>>
>> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>> index 7f1ffd6003f5..c366766ee3f5 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>> @@ -493,6 +493,24 @@ sdhci: mmc@ffbf0000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		dmac: dma-controller@ffd60000 {
>> +			compatible = "arm,pl330", "arm,primecell";
>> +			reg = <0x0 0xffd60000 0x0 0x4000>;
>> +			clocks = <&cru ACLK_DMAC>;
>> +			clock-names = "apb_pclk";
>> +			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
>> +			arm,pl330-periph-burst;
> 
> Should this be moved above "clocks" line to sort the properties?

Not preferred according to [1], vendor-prefixed props is ordered after
non-vendor-prefixed props.

"""
The following order of properties in device nodes is preferred:
- "compatible"
- "reg"
- "ranges"
- Standard/common properties (defined by common bindings, e.g. without
  vendor-prefixes)
- Vendor-specific properties
- "status" (if applicable)
- Child nodes, where each node is preceded with a blank line

The "status" property is by default "okay", thus it can be omitted.

The above-described ordering follows this approach:
- Most important properties start the node: compatible then bus
  addressing to match unit address.
- Each node will have common properties in similar place.
- Status is the last information to annotate that device node is or is
  not finished (board resources are needed).
"""

[1] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node

Regards,
Jonas

> 
> Thanks,
> Yao Zi
> 
>> +			#dma-cells = <1>;
>> +		};
>> +
>>  		pinctrl: pinctrl {
>>  			compatible = "rockchip,rk3528-pinctrl";
>>  			rockchip,grf = <&ioc_grf>;
>> -- 
>> 2.25.1
>>

