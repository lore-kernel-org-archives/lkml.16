Received: from mail-m21471.qiye.163.com (mail-m21471.qiye.163.com [117.135.214.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4B127F737;
	Fri,  9 May 2025 09:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783152; cv=none; b=ZrtD78xmJ6ul3YW1t4pjermoIWeTG5azr+sH5esQXGwbXRJSlk8mf7j6IRxhuLkkfZyoRmKeTK4UtixpIuSXtcJiXM7eDgU4C1xS5WnJ4qVWn02pr4dmdw+T4J4aws6xsiKM4X/MipS7vUJP5h4D47tB6jFgk9EV/NO9VYGtrAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783152; c=relaxed/simple;
	bh=jZ2w0JPA9dw8AaHf9CQJxTScgEFLUoRYgy4KdmR02iE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I8wBibNS1PYGvZUPog6w/5j4pHyBQisCCVwPKlLaguXLy7yn0KpenHZPTZ4JOVQ0gPZDt5LRl+4oZ6kEIEPYGfOBluaTe9FElh0DzgfK2BDeziIoQoP4C7W3LGB7BsJifhn/pVuENNRUaNShwizdrpjSqltPr7qVWE6vhraEIsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ASkDftnQ; arc=none smtp.client-ip=117.135.214.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ASkDftnQ"
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1481670b2;
	Fri, 9 May 2025 17:32:13 +0800 (GMT+08:00)
Message-ID: <2f4e031c-25d1-4e2b-ad03-36e27d3d364d@rock-chips.com>
Date: Fri, 9 May 2025 17:32:02 +0800
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
 <5a4f6229-1450-4c96-bfac-5257f66b2ddf@rock-chips.com>
 <5c0a3b62-cf4f-46ec-b0e2-7d78ac499cb5@kernel.org>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <5c0a3b62-cf4f-46ec-b0e2-7d78ac499cb5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh8dHlYZS05KH0IfGB4eSkxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96b4635efa03abkunm1481670b2
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NSo6MDo5QjJJMwEWAQ4uCy8o
	LzUKCVZVSlVKTE9NTENISk9LSk5KVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSElLQzcG
DKIM-Signature:a=rsa-sha256;
	b=ASkDftnQLy66Ocju57vFIMbVp4bL9Dv2+YDTqq6ZomPhnJVLuM1V09jRMVOrMp+aqV2pPtZi4F57RYg2yNz1Be3J39EYdsQqqYk2nCSEEkFxf1VkVi6aRMtx92JJ1EFm1H8O7dDah9SLZk76tyxBqhFvgv+rY5m3gWYXBh6Tqn8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=vb9RNpQ9nn8CaEP5Dac/qXM6STSUoM5kUgGizmVamZ0=;
	h=date:mime-version:subject:message-id:from;

Hi Krzysztof,

On 2025/5/9 17:21, Krzysztof Kozlowski wrote:
> On 09/05/2025 09:34, Chaoyi Chen wrote:
>> Hi Krzysztof,
>>
>> On 2025/5/9 15:11, Krzysztof Kozlowski wrote:
>>> On 09/05/2025 09:02, Chaoyi Chen wrote:
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: core-clk
>>>> +      - const: pclk
>>>> +      - const: spdif
>>>> +      - const: grf
>>>> +
>>>> +  extcon:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>> +    description:
>>>> +      Phandle to the extcon device providing the cable state for the DP PHY.
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  phys:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> Just phandle. If this is an array (but why?), you need maxItems for
>>> outer and inner dimensions.
> Uh, sorry, that was supposed to be under extcon.

Oh, this also applies to extcon. Each extcon is used to indicate the 
status of the PHY.


>
>> I think it could be phandle or phandle-array. Since the RK3399 DP has
> Here it is obviously not needed, that's a dtschema type.

Do you mean that there is no need to explicitly specify something like 
"$ref: /schemas/types.yaml#/definitions/phandle" ?



>
>> two PHYs, if we put in two PHYs here, the driver will pick one PHY port
>> that is already plugged into the DP for output. If we fill in only one
>> PHY here, then output is only allowed on the corresponding PHY.
>>
>> Will add restrictions and add more descriptions in v3.
>>
>>
>>>> +    description:
>>>> +      Phandle to the PHY device for DP output.
> You need to list the items with description iinstead.

Okay, will fix in v3.


>
>
>
> Best regards,
> Krzysztof
>
>
