Received: from mail-m3283.qiye.163.com (mail-m3283.qiye.163.com [220.197.32.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14382262FF2;
	Thu,  8 May 2025 08:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693528; cv=none; b=W6PNnTbwLBPQ7JQ7Ny2815wiO1tRTPl2YP7VvBpT3omQ72Yu2Mpghkl2RuJYURK7/Yl3zVUKHsazJrPiJd9bRzSswBUvf87o0ELM8pPy20SWnu8PAce7FU5+px6ibUurPCCxmzdBY7pxk+VjYmFQkEiqZNX9qCHfNXsnXFK1lx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693528; c=relaxed/simple;
	bh=7dXMuqnIRadv+b/6d2vtotIWyvUVoRQ+4boYpJQ2xaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tzP03Y63y2h2Sl7JorpNi+5z7jkB3j9HEV4ueZ2KzBLRZFb31TbKpXythPzzFRLueeJQb+RyH+++BL8s9agx+A2SnNJDW3Qhin++WNY7ySSSs3QHba7tfXEEpAqEeIxtXiQt7hPekoxH6Y6vEs1z1BA2e/9fcurid/34ME8TjVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=d+d+GykK; arc=none smtp.client-ip=220.197.32.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="d+d+GykK"
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 145d7c840;
	Thu, 8 May 2025 16:33:22 +0800 (GMT+08:00)
Message-ID: <f040a52e-51a8-4cea-afc1-7b3de259b067@rock-chips.com>
Date: Thu, 8 May 2025 16:33:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
To: Krzysztof Kozlowski <krzk@kernel.org>, Chaoyi Chen <kernel@airkyi.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250508064304.670-1-kernel@airkyi.com>
 <20250508064304.670-3-kernel@airkyi.com>
 <a3ef7af4-3c6a-4bc6-912b-5819393dcd6a@kernel.org>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <a3ef7af4-3c6a-4bc6-912b-5819393dcd6a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUIfSlYaQx5OTh8fSh5MHUhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96af0721d103abkunm145d7c840
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MEk6Mio4QjJJKw4SPwIOOQJN
	Nk4aFANVSlVKTE9NTUJISUtCSktJVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBTUlMTTcG
DKIM-Signature:a=rsa-sha256;
	b=d+d+GykKLO20BqAKyXobUAllLDcMm1FBKpufSoAaZTPmGMx0GkA+ZvMb4smItqg+JwLtrMyeuewWSNTfjKfuI4Xhnxf/j+yt27JadVLZBfsLhKDXvcEL9bBMicizb6paOsRCdizeMBKEmZtWX8ObSkpopPJMXNSMG99yzVMUGJE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Mpt0+g9c8cV/2h8BIvqsNb1JBcnr6Rbu0rfrAIyuOb0=;
	h=date:mime-version:subject:message-id:from;

Hi Krzysztof,

On 2025/5/8 15:16, Krzysztof Kozlowski wrote:
> On 08/05/2025 08:43, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Convert cdn-dp-rockchip.txt to yaml.
>>
>> Tested with:
>>
>> 1. make ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml
>>
>> 2. make ARCH=arm64 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml
> Drop. You do not have to embed in commit msg standard makefile targets.
> We all know how to use it. You do not do it for C files, do you?

Will drop it on v2.


>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
> ...
>
>> -	};
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml
>> new file mode 100644
>> index 000000000000..ed68b48a6743
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml
> Filename matching compatible.

Will change it in v2.


>
>> @@ -0,0 +1,148 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,cdn-dp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Rockchip RK3399 specific extensions to the CDN Display Port
>> +
>> +maintainers:
>> +  - Andy Yan <andy.yan@rock-chip.com>
>> +  - Heiko Stuebner <heiko@sntech.de>
>> +  - Sandy Huang <hjc@rock-chips.com>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: rockchip,rk3399-cdn-dp
>> +
>> +  reg:
>> +    description:
>> +      CDN DP core register
> Missing constraints. Drop description.
>
> Just look at other bindings.

Will fix in v2.


>
>> +
>> +  assigned-clock-rates: true
>> +  assigned-clocks: true
> Drop these two
>
>> +
>> +  clocks:
>> +    minItems: 4
> No, look at other bindings.

Will fix in v2.


>
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core-clk
>> +      - const: pclk
>> +      - const: spdif
>> +      - const: grf
>> +
>> +  extcon:
>> +    description:
>> +      Phandle to the extcon device providing the cable state for the DP phy.
> Missing type, unless you could not add a type because of conflicts? This
> should be really fixed...

Will add refs in v2.


>
>
>> +
>> +  interrupts:
>> +    maxItems: 1
> and here is maxItems. Why in other places you put minItems?

Sorry for that,  I misunderstood the meaning of those filed. Will fix in v2.


>
>> +
>> +  phys:
>> +    minItems: 1
>> +    maxItems: 2
> Why is this flexible? It wasn't in original binding and you must
> document all the changes done to the binding in commit msg.

I think the original binding had this. I will fix this in v2 and add 
more description.


>
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input of the CDN DP
>> +        properties:
>> +          endpoint@0:
>> +            description: Connection to the VOPB
>> +          endpoint@1:
>> +            description: Connection to the VOPL
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Output of the CDN DP
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    minItems: 4
> No, look at other bindings.

Will fix in v2.


>
>> +
>> +  reset-names:
>> +    items:
>> +      - const: spdif
>> +      - const: dptx
>> +      - const: apb
>> +      - const: core
>> +
>> +  rockchip,grf:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      This SoC makes use of GRF regs.
> For what? You did not say anything useful above, so instead explain the
> purpose.

Will add more description in v2.


>
>> +
>> +  "#sound-dai-cells":
>> +    const: 1
> Missing dai-common ref, unless this is not a DAI?

Will add dai-common.yaml ref in v2.


>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - phys
>> +  - ports
>> +  - resets
>> +  - reset-names
>> +  - rockchip,grf
>> +
>> +unevaluatedProperties: false
> Where is any $ref? additionalProperties instead or add proper ref

Will fix in v2.


>
>
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/rk3399-cru.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/rk3399-power.h>
>> +    cdn_dp: dp@fec00000 {
> Drop unused label

Will drop it in v2.


Thanks for you fast reply!

