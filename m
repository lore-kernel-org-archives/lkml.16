Received: from mail-m93197.xmail.ntesmail.com (mail-m93197.xmail.ntesmail.com [103.126.93.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20667405A;
	Wed, 30 Apr 2025 02:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.126.93.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745978658; cv=none; b=F/38LPhjfBbY1ePH1Q5L7hF2kQDqNnLIrg0nD4m+nNaZJWC2CEIVPtTJgjzWWpcmjn+R4844FWevq3SReGEMzTOZhAVIAVap8SX04qQ76bX611+R5M3LnfPKGBJ7msmbgwg49/p0j5p/IZjwhWORSz52AKiWZ3VLGKPz+eyISWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745978658; c=relaxed/simple;
	bh=zY7m/i5fkkk0qT0ubn4v6yh7AcHEEjb6q0ezIKXYFq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWN8qnGQt1dOY71NTb9iL8+VxiMR0InresWFTOGlAP56ISqeZY5T7Nq3lYyH/fdXa4/gWXt09X7ffYlfE+U3adGxABSw1GSHZtbFdPVY7dKi9cGFXwbfJjNMkASyA6pELAIP6p08/v8d1E6jh5kJNKVofleoJr8fSlzuoZM92bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Qi9o/yJn; arc=none smtp.client-ip=103.126.93.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Qi9o/yJn"
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1398a2eb4;
	Wed, 30 Apr 2025 10:03:55 +0800 (GMT+08:00)
Message-ID: <3c66f508-6192-4dd5-8561-d746665952b5@rock-chips.com>
Date: Wed, 30 Apr 2025 10:03:53 +0800
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
 <027de192-4227-4010-a759-5283b6af1531@rock-chips.com>
 <c9b46d09-f1ed-4549-8267-9a38ceca6461@lunn.ch>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <c9b46d09-f1ed-4549-8267-9a38ceca6461@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ05MTVYZSBlDSk4ZQktISR9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96846fb72b03abkunm1398a2eb4
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ok06Njo4GDJKNy1MCA1DCgsp
	TgIaFDZVSlVKTE9OQkxDTU9ISUxDVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSUtDTzcG
DKIM-Signature:a=rsa-sha256;
	b=Qi9o/yJnFnGDgKs0UMtWAB+KmxAU1cggUCmbwwZZvSgaw9HgdNIBQbnVSDAYivJSgWn5fEJyOWxU3NDN0AtKDtfizNo1gcFjpl8ZnNRIhBx/cn/Tf18qUuybJbdYIETC9Sqvm2L0hi5+QChG3fQVg13Prv4pe6D8izTHZUjdeQE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=DKR60j4UMg5PnXkIvOcvtrX6NGX6zXBYsWyUwoAwfA8=;
	h=date:mime-version:subject:message-id:from;

Hi Andrew,

On 2025/4/29 20:22, Andrew Lunn wrote:
> Please consider how you can fix the MAC driver without breaking all
> the boards using the wrong rgmii value. There are a few discussion
> about this on the mailing list if you go searching.

Thanks for the clarification. I'll fix the problems in the RK3399 gmac 
driver in a separate patch series. In v2 of this patch, I'll remove the 
ethernet device tree content for now.

