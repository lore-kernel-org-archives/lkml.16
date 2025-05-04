Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A291634;
	Sun,  4 May 2025 23:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746402097; cv=none; b=liF5YY4UkpNUOafCC/30Okm21XL1VsfeE5df96mxvxIwCavkRrjwbnvu/yHu//WobTRZjXSKqq8o9Um+AVofW1RArROUjWMf/qaekNQN5vjPLlNq1udxruXXLcX+KUNigX0qxLK6M3TBu82xhnSOJprAZT3290xlO2V7/8jL0Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746402097; c=relaxed/simple;
	bh=JNZjvPgYKins+AFjarIJCezeshm+E7weG0IIXZuxj2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HmdCBMJv8PwzkA4MNY0sjJl9LMZyzAS8PlYnZNVDgzeaToCcpH0k+BkQvzRm05Fe6sTi/3CfgFEUhXk5bLfusLJQzao89NoVoquEiHeznA20ytKFz1+bQciKiwIROmAcak98NVpeZmqpD35WLgzeuuME5z06EbuSYAT102aZrJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+c+gdyL; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+c+gdyL"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f2b05f87bcso42709476d6.3;
        Sun, 04 May 2025 16:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746402094; x=1747006894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pT4RA58kZsgWbSkRHLKZhNgsm4pyPu3PviW5NDVxO2s=;
        b=B+c+gdyLjrX5aZQFnbuhu5m8+cvDuW/KV7gZt7B1Ze4wpFW1ao3+nX4mCACKwl/CuX
         JqFevC4r+Hxr1Uxo+26zdzOsBcsMCw6MNfpHhhc0tHpYL9rSNqB7BeQEwk56c/qT+9uE
         cCd0zhjlAgGoi4kN5RvGf2yk11WWi84I07Eqeq/olwmvWHajm9mV94UGjUoLLPXek2ji
         tvL8lKpOEqSlyzl9rGGQAh3Cm1WZ/W+6UQIaUjVGEcXUbNCbPn22b6HSrxU5kb71TTAR
         LE9nbInn28nYt4taJwMaK0MRcp0iznLzHpppVsgzot0sQ/lkZnvx2YxtiFQP7ZtIrRm2
         N5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746402094; x=1747006894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pT4RA58kZsgWbSkRHLKZhNgsm4pyPu3PviW5NDVxO2s=;
        b=ddj3mbhdxcHyGugYLnttwom+7WEjOo8ec0QIMx9OyPWXaiB9mhkT6G6I0FWxVYoPeg
         vPC7jRIpPtMl4x0OTq/aPiBwTwuLCiMWnk3cRcXlXgmUgnSx672yvh9SezW7Th13KJXl
         GNwInBdP0VIyImOhvGVy5zukxFvDEUuRQ4PvacG5H9nEDJN8z6e4K8uR+EhjpATqacPm
         T53DdUBMxTEOnc3xQqq5szRh9vcHp+AhwvSgUyy425UdfzHwspIT13OHTLR4QAiYcofb
         SW05hpxxEkU2b5ZQzLMvsivW1AOKY7tvbSjDnB+tO7JTvMo9FQ9U43ZRGSr8UJT4seSL
         KbPg==
X-Forwarded-Encrypted: i=1; AJvYcCWVWDB5oNBvCkGsFJfIMaLPGW4cRmdfJy4Kc1oIpTq3utV3RM3Gugu8CwhZ1L5oErd7BSafiGXgEfISRhDp@vger.kernel.org, AJvYcCXOkmG4xc4MNh+f4wGhUeObIDAUr5zSScXQbjxlo4lVdlxACr0sXEj1dr9F0YbJvzCLTewC0UZjXp3i@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf1DxcWnvfMpNDKOvNCo6nCQy724fDA1PHXJClEQuoXgHCNXPz
	MHlu5Ab7zwm5BwBO+JGTQhPCdkVe1WUcYmJRe6S51slxywcsxU1XKdlhDg3r0lI=
X-Gm-Gg: ASbGncvsP8jaNt82WJXwZ8npsyg4dkI+vVF07uU6esMEszBdzqi7rEatkeB3SVIcYpS
	M6exIa0XfOvb+xxetXk7EX3jieUyLgi6FQtpI2V98ATd7LnnLNqcHVas25r8KmkyAmdVcjbckX2
	ybCZ4aB8F3fmA6sgVso/NpZHScWxSy2VexvIdetlkD0V4VyZXWanseedYaELutdWS67PHF2YZLI
	RCydQ5MBa+15dyY9pSQdwsolZw/co7sJvAMZ7iBxvN2JyZS5IqC6KN/Hfhe67rYMG/A+JhGgsPF
	p1pRdyELpYZQvSNaMoBCY0NWxQ2MOspLPbWt4A1ns4N6X2wyjbKwpduGzkskPA==
X-Google-Smtp-Source: AGHT+IEuS32WQXdYrsUKx3W6fkH04iM3f+qJZnWVRNzxohjJqcepLThyrNOUzuchkb36omAniuxWKQ==
X-Received: by 2002:a05:6214:d83:b0:6d8:9c92:6555 with SMTP id 6a1803df08f44-6f528cf17f5mr81249826d6.29.1746402094429;
        Sun, 04 May 2025 16:41:34 -0700 (PDT)
Received: from [192.168.21.149] ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3b05b0sm48091906d6.1.2025.05.04.16.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 16:41:34 -0700 (PDT)
Message-ID: <46cbdabd-b0ed-4c9b-9f01-4d2d8eceac24@gmail.com>
Date: Sun, 4 May 2025 19:41:32 -0400
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
MAE0621A-Q3C
http://www.maxio-tech.com/product/12928/12929/12930/12931.html

> rk3576-rock-4d.dts and rk3576-armsom-sige5.dts show that it is
> possible to use this SoC with the correct 'rgmii-id',
> 
> 	Andrew
