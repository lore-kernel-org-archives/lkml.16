Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE39D2505DE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693015; cv=none; b=YzrT8VH1thdNSvIpTRmMCi/+Q3JhUkHlERye2iAzSitQ/ltbI5Jex07NlbRUT2w1Df+R3E6yXwKxwtcdvdvDK8ciZ0NoX0JM5EFLaOZ/tG0foWHRqbU4b7BbfZXvsGAtL6+5uzDp2BD2xzR1ODSpJbcBezSKXUziMCopUY9TQ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693015; c=relaxed/simple;
	bh=3xsuXjoivOlqLYm45J8XhER5c8e8iHHhlk5GjLRhsfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b9ggsNGirNFhHHLsib0SuQeW37obG28+3ik9hEW82+P9m0CTc2flUn219WeHbtUa+3iHHGj2Gg/mOw+5zRDQkcX74+Vgaxw5mBDLBjO78bBMrHrR2YUUxc74NVIwYZ0b/gAUcA827Od10LjF4OWA2cbyZ5e8vFp932E4Xd0F0wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zXkmIKKp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zXkmIKKp"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso9958055e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 08:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693012; x=1744297812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhJ5g8kBFwNl+XQ2nWiu5GACX6MCWJ6Smtvjb3q8Bto=;
        b=zXkmIKKpoWKGbFoYbwdGvthQe7yCka+T6ZN97cA73Bvd4VJqm4JxzdBhILlH9wQPiC
         FA3DQQcR5Nghzb4xW7vcLEZvyWzwLxCJRv1I+NqFjTy27b6eYdBx8+YvuwHHZ+Vc5cDg
         nK/TL584fOgLuBal/PBangJattCVGn5MW5FlwhMoYBdwkmOdvlFdomBqGOppI/39EbPA
         k2EeHRQaoRjnC8/YbwfksUafBQs4wZ+wcz71bExzQKOkTCtIJBX12vxPEbpVgv940PC/
         AureMuHS199yjTQXLbV5LFLIdmN/e4c21QpWtKfOzs9Bf5arg2mN2yFLJ2n5laAv247g
         wCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693012; x=1744297812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zhJ5g8kBFwNl+XQ2nWiu5GACX6MCWJ6Smtvjb3q8Bto=;
        b=BeZ3fLPwkF0s3APUnCKEP34W7mSOAaQRXN5ZPYTlzTFZtpY5zzIb+Q1P7RWoXRZUbE
         UYxSM+/IOm1aK9gAdg4IwSV04eafnohhzg1poTzU9c/XxcDUVml137sThRvbdJ9CVGkd
         6I//OVA7OcSbBUr7M9qOxCOHJ4Vqj03g9tdlwtfToWgQfLVldroh09zZsvGx40vAepIk
         TYhGUZyNZbgjUsx9azKQklksDSu6SvNjeL0G30uJzL9L9yflH2GA5noIXof228cxMc1a
         S4l+Nl5Boq2zCttJ74x3QZldOrUMv2ypizZWz6fDNzAqNsJNx4W4NIqyPJ6EomeNIenk
         oQ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjcz3/hjScuYCH6LdY2PNtb2OVAgKmX3pgSupl59MyhYQ+ZGFOq5E0ulAsmDjFW96S/bKnTIYOKDlZbBo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8+SQSp+PFTE4VVxlaHmPhg11Mo2ItqZw2h+ijwyh+ex7dmmcf
	ctK+BOtQ8Li8+fyFZvFgg3YCDdbLrKce0kMDBY/hALg9zzJHiQmHAukafdytqyM=
X-Gm-Gg: ASbGncsM/lEtmjT2dr3q2ptqQ+mOfkkL4E+H3HY1fQBHYq/bCK6l67edurW5y73Ltu/
	uHkF4RI6BZu6ZcFSFpdWDi89x+7wDrRm7oX8+wFutlTSyTXU+4O+FKo76fsN1y/YwAevTFJLXD/
	2qrH2UDBYgEUsVdX9ksTaBKUbrwyRnMR3V9YAAsllstoueLx0dbS3pRZMaLipRIDWrdI7aBBM0x
	Mx0y0f+ecX7Pn76xpH5BCxWabHu6QnOPebk2D4y2npV726W4/ChSHo4205kp6n5oS92F8Ukwg6Y
	n6Ggy+ZBnVfA0FU7feIB6OXZY7zLVHg1Sj7QZ0f+Ms+1dgodFCFW4IkIZNLjIA1mZ1Xv1zQgfJ9
	6vnKTyeIA
X-Google-Smtp-Source: AGHT+IHDhBcexcgG0SxAh6e6AVDE03TCQZ+YSRRIFhr8aPiKmaRvD2AOaeBMWRz175FPNNgUcLCquQ==
X-Received: by 2002:a05:600c:5486:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-43db6249aefmr197046525e9.17.1743693012137;
        Thu, 03 Apr 2025 08:10:12 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec16a5776sm24935105e9.22.2025.04.03.08.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 08:10:11 -0700 (PDT)
Message-ID: <c570c99d-53f5-4f77-a730-42e5a2016dc5@linaro.org>
Date: Thu, 3 Apr 2025 17:10:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
To: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
 <20250402154942.3645283-2-daniel.lezcano@linaro.org>
 <64b6d599-fe67-586a-e4b0-73d9b73499de@oss.nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <64b6d599-fe67-586a-e4b0-73d9b73499de@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/04/2025 08:19, Ghennadi Procopciuc wrote:
> On 4/2/2025 6:49 PM, Daniel Lezcano wrote:
> [ ... ]
>> +examples:
>> +  - |
>> +    watchdog@0x40100000 {
>> +        compatible = "nxp,s32g2-swt";
>> +        reg = <0x40100000 0x1000>;
>> +        clocks = <&clks 0x3a>;
>> +        timeout-sec = <10>;
>> +    };
> 
> The S32G reference manual specifies two clocks for the SWT module: one
> for the registers and another for the counter itself. Shouldn't both
> clocks be represented in the bindings?

AFAICS, there are two clocks as described in the documentation for the 
s32g2 page 846, section 23.7.3.3 SWT clocking.

The module and the register clock are fed by the XBAR_DIV3_CLK which is 
an system clock always-on.

The counter is fed by the FIRC_CLK which described as "FIRC_CLK is the 
default clock for the entire system at power-up."

 From my understanding, we should not describe the XBAR_DIV3_CLK as it 
is a system clock.

And the FIRC_CLK is only there to get the clock rate in the driver.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
