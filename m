Received: from mail-m49210.qiye.163.com (mail-m49210.qiye.163.com [45.254.49.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80D81B423C;
	Mon, 28 Apr 2025 08:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829448; cv=none; b=fSeuDWgsBpSLcV+oOAkbXma8IgI9tguj5W89QYxLZAURY2oIx87mHs9e7TbBYTrMM2D/p6fjXdqDfo+a8CoCExVHs9oJtDWBLhDK8zzOdY0d+zpABPqVKVgVGs7UN0NdCAoM4KYILe1SBWo/5oYunBI+IwXZqAEorZYB/YCoG5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829448; c=relaxed/simple;
	bh=xmPngeECVmhAvM70jzaBoWCmDC5rNEugWKIjrTeVgck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRQLM9wRY6BvCmhvaySIvqz8K3swpgPPmQTsWpSb2mxzGxxSLAQoHrqasiIL3vnI4Sela8P7gxE3W8d/S1kgfsbG0V+vkJcgNbyhqmXr36kviP9sL6jdYtIDxS3UJWUTPpnnFXe/w75Be2TbENuYp151CgzcL/8UCZtyJoFHOIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=TN2Wu5aC; arc=none smtp.client-ip=45.254.49.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="TN2Wu5aC"
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1352e9cb0;
	Mon, 28 Apr 2025 09:47:35 +0800 (GMT+08:00)
Message-ID: <c583c59a-d5b7-4e20-9a1f-96f51bd7b4f3@rock-chips.com>
Date: Mon, 28 Apr 2025 09:47:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
To: Andrew Lunn <andrew@lunn.ch>, Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
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
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <6291f6b8-75d3-4243-9935-9b64450e2b7f@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0NJQ1YdS0NCTxlJTkkeGE1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a967a14094f03abkunm1352e9cb0
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PxA6Fyo4NTIBGTc5DjA0KClK
	MTAaCjZVSlVKTE9OQ0tPQ01JTEJLVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSkJCSzcG
DKIM-Signature:a=rsa-sha256;
	b=TN2Wu5aCbMNJ07Ic14b2WT/foLdkBTLvzfTZS6mnlGHNbaoXw/LbMDiGGutDzATnQT/dSjxXcZL/GxDTvu6c2BQ2VhDApBpJDim/4HnmuOFLLdkEb0DUFAOl3OQbL6HIrs5EUN35YkTzKuawI3xzhlTBTK7Gn2rQeLcUXEhkoOk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=A+SoCMYT/rgL+jihOoJQvLhqmps7MULckBt2jEZFGUc=;
	h=date:mime-version:subject:message-id:from;

Hi Andrew,

On 2025/4/28 4:42, Andrew Lunn wrote:
>> +&gmac {
>> +	assigned-clocks = <&cru SCLK_RMII_SRC>;
>> +	assigned-clock-parents = <&clkin_gmac>;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&rgmii_pins>;
>> +	clock_in_out = "input";
>> +	phy-supply = <&vcc_phy>;
>> +	phy-mode = "rgmii";
> Does the PCB have extra long clock lines to implement the RGMII 2ns
> delay?
The 2ns delay of RGMII is implemented inside the RK3399 chip instead of 
PCB lines, and there are also additional delayline configurations.

>
> 	Andrew
>
>
