Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5648D8494;
	Sun,  4 May 2025 21:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746392558; cv=none; b=M+2oZL9ERDzZzsrg+iiCbb3Wn9Un5P1W4dB6zZpHtPokFFun1AE9E8MJ0R5yex+rq+vOU3CGtBS6msb8/X+UHccwGcXs6rejp9yrSk7Z16DKit2qR9SL/HScE1vyHydusZXNz7iWmsfJ0pcchWWJ9eILZaBYYseIIr/bVa9E4vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746392558; c=relaxed/simple;
	bh=2+dbrWE2LVz20TNug1FyH30TkSxKtnzpsRGrlmAfbsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tsI4K0G4Zh/S5txBd7vxlJ+6vU1oLxz3ACUCwSUxMIhcja5rCFNjRmhpLf3WLY1hIUdA0P64onqnvKzjKD6GNeQWe1my5OndrcxSm55B9zu1ZXgWjAdHnz9Cylp1wxTfgUIt+WmsJNsI9tz6g23dqyuMAiU+GvUoF4cG7XMpU34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gk5VMO8S; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gk5VMO8S"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c542ffec37so474280285a.2;
        Sun, 04 May 2025 14:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746392556; x=1746997356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ML8DjRZA7cKit0Oa6eU0aLRHGdDqUBnThTiiLI5SiXM=;
        b=Gk5VMO8S8V2y8SLf/oYVc623MP04Mu0PRSVjv7NSv1adxAvPYdsaplPCpT8z9GdCe8
         BcBJU1ZQ5tsdgDPdxCRBdHeWRy3e0s9AsnXtTTAjkIaq5M412mYdN7Y4ghA+zKOQD635
         G9YwHEku4f6+gLG3RYunDVFMH7W6ScTZAZwIo2r3jTFa9Gh4KNPDGj/CqJvsrGrnkwrr
         bOZwhw2O6vIpp/LqZXCHaiRoi8XWRZd4p8Rfel6Ze0VrbSDFM2oBEaJHjgUk327hSW3K
         m4wserOqHSxFJQnxIqxODbG4X3SI9lksqUBER0FdkgQJcTsQzZR+WTKdyWS0x7MlyA/j
         9iUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746392556; x=1746997356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ML8DjRZA7cKit0Oa6eU0aLRHGdDqUBnThTiiLI5SiXM=;
        b=JA2zrTOJuDthM2LYyLuEU4FfnMrhBBQ0lzk/Y+nbdOMQLn0+aaNysTjLdp531OQY19
         wMhhGBWxeNGKn4JgAo5VyedPw/5xDFEjLB8xrsshlzfVX9doq3Fe36EWP++B26GWabIe
         qWNSkNhu/ZJiVuYB3nOh7imCP4YCmf9WIDjgwtOk1XaKDMnDIXlbSsFuAKhXmKg7yPZ0
         Ns6xDmXhD5kt6SiBWAA7z5GNxB7WpktHy3ZBGolYJS2Z1SnIHuP2/m+mQCCpa/8eiGCh
         +FSxZt43Zx9h8x+S4DIR+Mu2G7AJqqc7PTwo9ExMXoxkM3BuaPrSNoxbg2qlr7VHV1Xq
         Vlhw==
X-Forwarded-Encrypted: i=1; AJvYcCV/AKwgjLqNhr1vEjVjG0hsVDVTI3eRySUpIcfp4YWYfs1Tsexhg1uh8JlgeyWIQ4Y4AXwG7cRfxCH4@vger.kernel.org, AJvYcCWjYHE3S6k2eo8jb2J1RRM0VItNF0/hpITKkfOkuBdKh9W8lOcb+NyhT4wqnPzZv62g2i4nBDMS9heUqBPa@vger.kernel.org
X-Gm-Message-State: AOJu0YyDmkHPqQqmDOdClStiWrp3fNrulSVZtS5GqJ9G//9NxJGMgJyd
	hx7qSukVTQy3oJNM5RvtzNrg+6RWSCCtZrz1DXh0OZ1RMA98qKeW
X-Gm-Gg: ASbGncvIChYZyb/xQ2ySBaB6CKjHY8baXElSzugBkxiHWXkT+5ybR3khCh8hJpixPc9
	ZvEPRLBO4RZpoR9rb1xyThuR00CCqBd0XyfdEdea/erlUoMkKpl+Z2YwV3jhOTqJZTkB81b5YKX
	WfBODDZUD9+roEJBUU/SUfZCGsg4oBIOeOw6eIewkU/aPvMlpxZ/j0i1B9OQ1F6pyUKCqIcxAfG
	SIU2Wm+JmxgaisuggjhJ6qJyGbyc0P4Vt1ChD/k05GraDgRrmJDLf4O+kZsM5z/UoqlLEi0jKb/
	qMgg4A6tkM/QYhNjRvnSf+C4jl9GnjspXoROHSId0kY3EC55j0mMBl+okkLHzA==
X-Google-Smtp-Source: AGHT+IE28+xEK7288oQImXpZSUZs2LbwMwLdxQciIh7WFkHeIOKTXFrxgU5POHxG3pYM8Mke5GY4gQ==
X-Received: by 2002:a05:620a:2697:b0:7c5:49b7:237c with SMTP id af79cd13be357-7cadfe16d0dmr954871285a.27.1746392555994;
        Sun, 04 May 2025 14:02:35 -0700 (PDT)
Received: from [192.168.21.149] ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad243f339sm472102685a.90.2025.05.04.14.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 14:02:34 -0700 (PDT)
Message-ID: <b603e92f-8c1a-4aea-8bab-82a1f035c7fa@gmail.com>
Date: Sun, 4 May 2025 17:02:33 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Luckfox Omni3576 Board
 support
To: Andrew Lunn <andrew@lunn.ch>, Jonas Karlman <jonas@kwiboo.se>
Cc: heiko@sntech.de, robh@kernel.org, conor+dt@kernel.org,
 detlev.casanova@collabora.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-4-inindev@gmail.com>
 <bb171ae2-c495-49a3-a7eb-a4b865e54199@kwiboo.se>
 <87892840-bdbf-43d4-bd93-cb98f5e1c672@lunn.ch>
Content-Language: en-US
From: John Clark <inindev@gmail.com>
In-Reply-To: <87892840-bdbf-43d4-bd93-cb98f5e1c672@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/4/25 10:12 AM, Andrew Lunn wrote:
>>> +&gmac0 {
>>> +	clock_in_out = "output";
>>> +	phy-handle = <&rgmii_phy0>;
>>> +	phy-mode = "rgmii-rxid";
>>
>> See Andrew's remark on v1 of this patch.
> 
> Hi John
> 
> If you have questions, please ask. It is not a good idea to silently
> ignore reviewers comments. Either do something about it, ask
> questions, or politely argue why the reviewer is wrong, because
> sometimes we are.
> 
Hi Andrew,
Thanks for your feedback and the link to the RGMII delays discussion. I 
assumed you suggested switching to phy-mode = "rgmii-id" from 
rgmii-rxid. The vendor’s downstream kernel uses rgmii-rxid with tx_delay 
= <0x20>, as shown in my post. I tried rgmii-id and removed tx_delay, 
but the interface failed to get a DHCP address. Reverting to rgmii-rxid 
with the delay restored functionality. Any advice on correctly 
configuring rgmii-id or adjusting delays for this board?
Best,
John Clark

>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&eth0m0_miim
>>> +		     &eth0m0_tx_bus2
>>> +		     &eth0m0_rx_bus2
>>> +		     &eth0m0_rgmii_clk
>>> +		     &eth0m0_rgmii_bus
>>> +		     &ethm0_clk0_25m_out>;
>>> +	snps,reset-gpio = <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
>>> +	snps,reset-active-low;
>>> +	snps,reset-delays-us = <0 20000 100000>;
>>
>> The snps,reset- props are depracated, please move to reset props in the
>> Ethernet PHY node.
> 
> FYI: snps,dwmac.yaml says:
> 
> snps,reset-gpio:
>      deprecated: true
>      maxItems: 1
>      description:
>        PHY Reset GPIO
> 
> Anything with 'deprecated: true' you should not be using in new DT
> blobs. Don't blindly copy vendor DT, you need to verify it is up to
> Mainline quality, and if not, bring it up to Mainline quality.
> 
>>> +	tx_delay = <0x20>;
> 
> This property probably plays a role in the issue with phy-mode.
> 
> arch/arm64/boot/dts/rockchip$ grep "rgmii-id" *
> rk3328-orangepi-r1-plus-lts.dts:	phy-mode = "rgmii-id";
> rk3566-bigtreetech-cb2.dtsi:	phy-mode = "rgmii-id";
> rk3566-nanopi-r3s.dts:	phy-mode = "rgmii-id";
> rk3566-odroid-m1s.dts:	phy-mode = "rgmii-id";
> rk3566-orangepi-3b.dtsi:	phy-mode = "rgmii-id";
> rk3566-radxa-zero-3e.dts:	phy-mode = "rgmii-id";
> rk3566-rock-3c.dts:	phy-mode = "rgmii-id";
> rk3568-evb1-v10.dts:	phy-mode = "rgmii-id";
> rk3568-evb1-v10.dts:	phy-mode = "rgmii-id";
> ...
> etc.
> 
> You might be able to learn something from these.
> 
> 	Andrew
