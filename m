Received: from mail-m15593.qiye.163.com (mail-m15593.qiye.163.com [101.71.155.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D805EC2;
	Fri,  9 May 2025 15:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804694; cv=none; b=bBtNTkbB1rNDByAGktpwLxno6vvPafpmbfpxR9cQ+0HOGPC6Pk9G3I0DNhfxp9jv8v/wfv08j2+P6yamt6hharq5LtXqCZpR1n+XukTXbzarFveqg0B4j7TgXp9Q0VUIQpRB3eKo/tdvERkiaQot8QuOI+j6kwsHxrczkrnqgeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804694; c=relaxed/simple;
	bh=aUXLQFR9i3uB03CTH4HcldYKi09Z7d+Q5TiSesZj3Sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnJqQDmKtR6dk4m9gwYzdp1BKb4sr2p0eNvZSh956zdLV29P10VXL4V0lskd6+15kM+hyhZibEm5IiPbZR+l1rrK6m05nil8GWzBRd0o+FvkqIgUuvbR/y6AHRe2ShdQimiyEWwFGLe5Gu63MADxreKg+VRjWzG9oHUQzNKwSl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=hJ7Nikvu; arc=none smtp.client-ip=101.71.155.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="hJ7Nikvu"
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 147cae3e8;
	Fri, 9 May 2025 15:34:58 +0800 (GMT+08:00)
Message-ID: <5a4f6229-1450-4c96-bfac-5257f66b2ddf@rock-chips.com>
Date: Fri, 9 May 2025 15:34:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: display: rockchip: Convert
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
References: <20250509070247.868-1-kernel@airkyi.com>
 <20250509070247.868-3-kernel@airkyi.com>
 <ccf4b15a-8399-4a7f-ae40-d01d0975921c@kernel.org>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <ccf4b15a-8399-4a7f-ae40-d01d0975921c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUkfGVYYSUxJHhgdSBhLShpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96b3f8063203abkunm147cae3e8
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M1E6Kgw*HDJWFQI4FToPDCIW
	Fx0aCUhVSlVKTE9NTExNSktPQkhMVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSEJOTzcG
DKIM-Signature:a=rsa-sha256;
	b=hJ7NikvuDJyHiU7TZoYgd87OzKAxhsDgv4cKFeiFgwAnYpwpLeSMndEsG6yjBhRVE4W7w8ioYZpdvRBjJX0LT/gbPHUp9B3ZkZA+9kh6jciL3KWKe7lrhHOr8J8qyQdAE0rM7L+7JAmxljZqr+wVdMoLy7f0nS6OQxx/RUC+BZE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=BQYBVB8p8nqMgWuckxW3aKVVBX+ixBeiwRuXnWXYxag=;
	h=date:mime-version:subject:message-id:from;

Hi Krzysztof,

On 2025/5/9 15:11, Krzysztof Kozlowski wrote:
> On 09/05/2025 09:02, Chaoyi Chen wrote:
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core-clk
>> +      - const: pclk
>> +      - const: spdif
>> +      - const: grf
>> +
>> +  extcon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      Phandle to the extcon device providing the cable state for the DP PHY.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  phys:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> Just phandle. If this is an array (but why?), you need maxItems for
> outer and inner dimensions.

I think it could be phandle or phandle-array. Since the RK3399 DP has 
two PHYs, if we put in two PHYs here, the driver will pick one PHY port 
that is already plugged into the DP for output. If we fill in only one 
PHY here, then output is only allowed on the corresponding PHY.

Will add restrictions and add more descriptions in v3.


>
>> +    description:
>> +      Phandle to the PHY device for DP output.
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
>> +    maxItems: 4
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
>> +      Phandle to GRF register to control HPD.
>> +
>> +  "#sound-dai-cells":
>> +    const: 1
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
>> +additionalProperties: false
> Well, if you added dai-common $ref then this could have stayed as
> unevaluatedProperties, so you will allow names for the DAI as well.

Thanks for your clarification. Will fix in v3.


>
>
> Best regards,
> Krzysztof
>
>
