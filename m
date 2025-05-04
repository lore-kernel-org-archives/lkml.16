Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F3C367;
	Sun,  4 May 2025 23:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746399980; cv=none; b=rHwMm0I0kM9gS4ntaS/p5JAV4Zs4XKhy6zsuPsGN22Fd/7ueqhxetjJ7ek4j1NGMJQCu1qlTOmTmFaNdNE5+URE0GafVsPoiNVQdQb1jhc0LlCjhEZUZem9/TybpHsJO81zWOjnWJykmjBdr8QPJGxpthQTRvgJbzgTiiVpDMF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746399980; c=relaxed/simple;
	bh=lyb7GoplRmJsmVTNL+2R2hg5BaAEG29fLECJ8gmEECY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EpPHmMTeZZHa1Br0yQXC7WLE1yAdj5zSayoBb+RaUDRcgOc2+eHzOV4VpOwJ2uvgN7k4SK1vEC9TcaU7h6qHX0ExPOFdXRSFyqp3k7L0FimeOWEp67Yfuo/ayywLqxt2HY2UuUbTGGWkj6mX/eDHhw+EO3eZ709A0thJgsPXV7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYlfj4x5; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYlfj4x5"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5f720c717so577963085a.0;
        Sun, 04 May 2025 16:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746399975; x=1747004775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WG5Q7M6LXC8ceUGjLsv7jt8ZOhJNoErjR02gyORXoXA=;
        b=eYlfj4x5fBCINZCR17cG5i1LwCxXhJfEPX9BZL/eOQH2hQUh9at0zZCkHi8Nfe1naO
         w8SFanw3ESERV9YDusHY9IsihtO+Tuvv+PjTXu52dUqCJZxxQK9hQe26phPQU6koKud5
         z9jJEhiyjuF0J1MGCgSWIMb+FCCZQrAGn6ZZDM3yNSdrXbfrv52T/zI9/ImYMQ7LO1Lj
         Z9uyHcj/3KlCOewVlkfkx+RgLZ3pfkIQGCWmL3v7BZDr+kfOOi026wB8WJeWFT1ApD95
         FQCJpLSNbdAYCXEpRAILVqFWrmVHm0vyebe823L8/7xwft29Zrwi3MYkfS70HOUiaVJq
         b4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746399975; x=1747004775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WG5Q7M6LXC8ceUGjLsv7jt8ZOhJNoErjR02gyORXoXA=;
        b=K4ey3119JcZnYEBeVH/IS/fn3rlCuTPJbzPr1KidFJF1mo5h0cuWY4UEDnSzYFofvr
         DupTd4phtekUX76loOr/pN/VdWPDa39EDFsyxPZT6swy39aZsB9H0+29ea/CAlZK5yMv
         LTY/q3vJM3S+nCqfOMWONvOOJ9LwqeNvVr7ZP0iL6eRCoGy84Yt1PLnUXQdjiemAVVys
         2YoHTOMZOioHNdrgbqKBKkvJFfOpbSqH4EDU8u5YFXujqAt4cUuyoOA3jRwKufAwH4zl
         OIJw/DCQtLmlrL3kG+9/zuY2Sx0QhPrz6YIIB5P8dAlnZBM+tApZsX6XqseSd+N8hSRP
         aaeA==
X-Forwarded-Encrypted: i=1; AJvYcCWIpxearbpb13p1nrSnt6cEEDn2Ukj3xMARn0VA7xITPsWCEtscqssrcNdw2qdKA1cHFR9U99Ler3y6@vger.kernel.org, AJvYcCWXWCXjeSGEuGHP/BmF3RsCr8s8Q4BUZBx/sSG1GEYBH1td5cu7nDzzjIKSdCG42HaIrqnqew/L+fsVr3f9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9W+CpBKuEXdSx7D0oeB5Nw3jLHjYJOYAimWSZ+3zsO4sLqomw
	1rbZ6fgceqImcO4wA6qmwpuv9e5Mf3S+VhFXDS6WRhs2ElXPUWJ/gGRh2Euw/gY=
X-Gm-Gg: ASbGncuKNIGWR3kl/YuKgt233Spwy2rXG3rbXoS3eHAhLswPwgga/KSlE5vuc2cLsLg
	6o66KOUjCVkyCkGWpqAPaoODmFtQWAn+QCGWJ3FBRvOU2vEnij5vA/o31uhxZFKW0qOEx2YDMtH
	pv1jdYZsAkd9I4Ly+/P/6eu+14oSf8ANaDIxGbcHlq48Hojn5eHKUTBMhQ7HTEgIW4DwruZjAQn
	tCVm/XOq4UFuvA8aiqU4uirA3k0CxTLdKwkaKnfjb+xE9t61MSWwQgLDz6+0YGIyGstcESt1jgk
	PPUhzl5CfJi4EEGMpdbAtLKEpU5oQJvaDQHC8mMviSLLzJmeju15YxVpXntxAQ==
X-Google-Smtp-Source: AGHT+IGXVOmqNZtnqI0MebY7SuNjt8ChHjXmPGL86trlt2xMX3O3Zn4OdIXuAF3VZCOaQ2cofukTSA==
X-Received: by 2002:a05:620a:1995:b0:7b6:d273:9b4f with SMTP id af79cd13be357-7cad5745825mr1588016285a.11.1746399974646;
        Sun, 04 May 2025 16:06:14 -0700 (PDT)
Received: from [192.168.21.149] ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23b530bsm490164385a.6.2025.05.04.16.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 16:06:14 -0700 (PDT)
Message-ID: <547dab4c-a96d-4196-a092-ca409e2ca8c5@gmail.com>
Date: Sun, 4 May 2025 19:06:13 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Luckfox Omni3576 Board
 support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jonas Karlman <jonas@kwiboo.se>, heiko@sntech.de, robh@kernel.org,
 conor+dt@kernel.org, detlev.casanova@collabora.com,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-4-inindev@gmail.com>
 <bb171ae2-c495-49a3-a7eb-a4b865e54199@kwiboo.se>
 <87892840-bdbf-43d4-bd93-cb98f5e1c672@lunn.ch>
 <b603e92f-8c1a-4aea-8bab-82a1f035c7fa@gmail.com>
 <b50c68bd-9b15-412a-ac00-1df25601edd9@lunn.ch>
Content-Language: en-US
From: John Clark <inindev@gmail.com>
In-Reply-To: <b50c68bd-9b15-412a-ac00-1df25601edd9@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/4/25 7:01 PM, Andrew Lunn wrote:
> On Sun, May 04, 2025 at 05:02:33PM -0400, John Clark wrote:
>> On 5/4/25 10:12 AM, Andrew Lunn wrote:
>>>>> +&gmac0 {
>>>>> +	clock_in_out = "output";
>>>>> +	phy-handle = <&rgmii_phy0>;
>>>>> +	phy-mode = "rgmii-rxid";
>>>>
>>>> See Andrew's remark on v1 of this patch.
>>>
>>> Hi John
>>>
>>> If you have questions, please ask. It is not a good idea to silently
>>> ignore reviewers comments. Either do something about it, ask
>>> questions, or politely argue why the reviewer is wrong, because
>>> sometimes we are.
>>>
>> Hi Andrew,
>> Thanks for your feedback and the link to the RGMII delays discussion. I
>> assumed you suggested switching to phy-mode = "rgmii-id" from rgmii-rxid.
>> The vendor’s downstream kernel uses rgmii-rxid with tx_delay = <0x20>, as
>> shown in my post. I tried rgmii-id and removed tx_delay, but the interface
>> failed to get a DHCP address. Reverting to rgmii-rxid with the delay
>> restored functionality. Any advice on correctly configuring rgmii-id or
>> adjusting delays for this board?
> 
> What PHY is it? Are you using the correct PHY driver for it, or
> genphy?
 >

This fails:

&gmac0 {
         clock_in_out = "output";
         phy-handle = <&rgmii_phy0>;
         phy-mode = "rgmii-id";
         pinctrl-names = "default";
         pinctrl-0 = <&eth0m0_miim
                      &eth0m0_tx_bus2
                      &eth0m0_rx_bus2
                      &eth0m0_rgmii_clk
                      &eth0m0_rgmii_bus
                      &ethm0_clk0_25m_out>;
         status = "okay";
};

&mdio0 {
         rgmii_phy0: ethernet-phy@0 {
                 compatible = "ethernet-phy-ieee802.3-c22";
                 reg = <0x0>;
                 clocks = <&cru REFCLKO25M_GMAC0_OUT>;
                 pinctrl-names = "default";
                 pinctrl-0 = <&gmac0_rst>;
                 reset-assert-us = <20000>;
                 reset-deassert-us = <100000>;
                 reset-gpios = <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
         };
};

&pinctrl {
         gmac {
                 gmac0_rst: gmac0-rst {
                         rockchip,pins = <2 RK_PB3 RK_FUNC_GPIO 
&pcfg_pull_none>;
                 };
         };
};


This works:

&gmac0 {
         clock_in_out = "output";
         phy-handle = <&rgmii_phy0>;
         phy-mode = "rgmii-rxid";
         pinctrl-names = "default";
         pinctrl-0 = <&eth0m0_miim
                      &eth0m0_tx_bus2
                      &eth0m0_rx_bus2
                      &eth0m0_rgmii_clk
                      &eth0m0_rgmii_bus
                      &ethm0_clk0_25m_out>;
         tx_delay = <0x20>;
         status = "okay";
};

&mdio0 {
         rgmii_phy0: ethernet-phy@0 {
                 compatible = "ethernet-phy-ieee802.3-c22";
                 reg = <0x0>;
                 clocks = <&cru REFCLKO25M_GMAC0_OUT>;
                 pinctrl-names = "default";
                 pinctrl-0 = <&gmac0_rst>;
                 reset-assert-us = <20000>;
                 reset-deassert-us = <100000>;
                 reset-gpios = <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
         };
};

&pinctrl {
         gmac {
                 gmac0_rst: gmac0-rst {
                         rockchip,pins = <2 RK_PB3 RK_FUNC_GPIO 
&pcfg_pull_none>;
                 };
         };
};

> 
> rk3576-rock-4d.dts and rk3576-armsom-sige5.dts show that it is
> possible to use this SoC with the correct 'rgmii-id',
> 
> 	Andrew
