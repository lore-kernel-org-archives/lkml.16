Received: from mail-m19731104.qiye.163.com (mail-m19731104.qiye.163.com [220.197.31.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C332750E1;
	Tue, 29 Apr 2025 07:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745911151; cv=none; b=MBr3L4hORxc9M+R9aol8/RKmDPC8zkq3mOTLNQawCGYuByI1KfADptLocQPbBqJE055pobFBq4H6vzzxR5lhrgUe9EUXlvGglmQmt8mn2SsWc3Yv0ExzV61ad+EEM6TLAwRjTMJV/lfGsPJiqP63F6bI7Pxrf1dB0LJvhIdvo/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745911151; c=relaxed/simple;
	bh=iN5EuTFR6FY4U9PPMMwgN8esEdP0zX1zCcZhV+aHgFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nh1SGtQol8PTK5R7zKljzO5e0X4h7PwOWg9RUJ6Mgu+0kgrFRTJjXdc42pwaLHanQjz1JyImDM4PZMeRwq+o1TUB50lKDmvrQiMii9SlMbWngDrYBg9ZqdBsuOxt6YaMM6Nm3l/mBmPnuqPmHGIDjpgiH9oLewk9aLuylZVNP/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=EpGcqWX9; arc=none smtp.client-ip=220.197.31.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="EpGcqWX9"
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 137882886;
	Tue, 29 Apr 2025 10:42:59 +0800 (GMT+08:00)
Message-ID: <027de192-4227-4010-a759-5283b6af1531@rock-chips.com>
Date: Tue, 29 Apr 2025 10:42:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
To: Andrew Lunn <andrew@lunn.ch>
Cc: Chaoyi Chen <kernel@airkyi.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Kever Yang <kever.yang@rock-chips.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Jimmy Hon <honyuenkwun@gmail.com>, Quentin Schulz
 <quentin.schulz@cherry.de>, FUKAUMI Naoki <naoki@radxa.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250427094211.246-1-kernel@airkyi.com>
 <20250427094211.246-3-kernel@airkyi.com>
 <6291f6b8-75d3-4243-9935-9b64450e2b7f@lunn.ch>
 <c583c59a-d5b7-4e20-9a1f-96f51bd7b4f3@rock-chips.com>
 <15ee1a6b-55ba-41e9-b8a0-6e0bf62cabf0@lunn.ch>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <15ee1a6b-55ba-41e9-b8a0-6e0bf62cabf0@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkpKT1YaHh0ZH05OSEIYTB1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
X-HM-Tid: 0a967f6d1f6303abkunm137882886
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MhA6Hww5QjJCHSkuOjw5LhUD
	C0lPCg9VSlVKTE9OQ0JPTkNMSEpPVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSElCSzcG
DKIM-Signature:a=rsa-sha256;
	b=EpGcqWX9zy7b4aOQJQl3I+h7mRCxOtfrxcfOyZWgCO5Xbg67xbaFmiQOrSj42HnlGh3mT2NSrLAHkxuGFUuURJhC9/XoiI1g47KLJ33keDr/FvfvjP0JhZUJzOwuhpVsunq+3DGBVLesmqCEjhgrA/sFnyq1HT1xtUBZjxkaPhQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=gkmGwA1JNJSi9vWgEDnuu8pe72dV9P14DRuR/dc+N4Y=;
	h=date:mime-version:subject:message-id:from;

Hi Andrew,

On 2025/4/28 20:45, Andrew Lunn wrote:
> On Mon, Apr 28, 2025 at 09:47:34AM +0800, Chaoyi Chen wrote:
>> Hi Andrew,
>>
>> On 2025/4/28 4:42, Andrew Lunn wrote:
>>>> +&gmac {
>>>> +	assigned-clocks = <&cru SCLK_RMII_SRC>;
>>>> +	assigned-clock-parents = <&clkin_gmac>;
>>>> +	pinctrl-names = "default";
>>>> +	pinctrl-0 = <&rgmii_pins>;
>>>> +	clock_in_out = "input";
>>>> +	phy-supply = <&vcc_phy>;
>>>> +	phy-mode = "rgmii";
>>> Does the PCB have extra long clock lines to implement the RGMII 2ns
>>> delay?
>> The 2ns delay of RGMII is implemented inside the RK3399 chip instead of PCB
>> lines, and there are also additional delayline configurations.
> If the PCB does not implement the delay, rgmii is wrong.
>
> If the MAC/PHY pair is implementing the delay, you need to use
> rgmii-id. You can then use additional properties to fine tune the
> delay the MAC/PHY is adding. And the Linux preference is that the PHY
> adds the delay.

The signal path of RK3399 is as follows:

MAC <---> IO <---> PHY

In fact, the delay is added to the path between the MAC and the IO, 
rather than being implemented in the MAC itself. These delay value is 
controlled by the GRF register[0] . These paths are implemented inside 
the SoC and have not yet reached the board level.

According to the document[1], use "rgmii" when "RX and TX delays are 
added by the MAC when required". In addition, currently we can see that 
all RK3399 boards use "rgmii".  Is there anything I missed? Thank you.


[0]: 
https://lore.kernel.org/netdev/1472752204-8924-2-git-send-email-wxt@rock-chips.com/

[1]: 
https://www.kernel.org/doc/Documentation/devicetree/bindings/net/ethernet-controller.yaml

>
> 	Andrew
>
>
