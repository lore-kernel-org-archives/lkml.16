Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE384A1E;
	Mon,  5 May 2025 00:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746406379; cv=none; b=FqGdJOj/Z1x16djcYDcchoYJu3hhzLsTlpXIS/414cdrXjPSHFJtJCD34v7gTEvXOlp5iMQ1ePTwp4vlyo/TUQh0Ee8KxZ3/zl4oJKyEOA0sfo2TqbFoxojgPiDRrTwiYkMDUZ5hRdTjSJMXuI7lgwQeBqCLP2eQQsFduVX3UpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746406379; c=relaxed/simple;
	bh=Ff8+ycrDbgltWpfag1xmu+OvIgzMfwttSCSl/YOWphM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eu0eUSVZzcoIjEUjPSaX1n0/3ZxIrs4KcrPFNJCtzKM2kbblH8tubQe30G1W+7Ki3IR0bI9uR01dRCzb3/PLGelPGnTa9wSyUtFmhu2FeONQgaCQv7XmXEwJMawtjlJxwd2PKOLx/DhqXit5f8sAXe2ftVOUp1fmhEnXDeDw9Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRN/vJBt; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRN/vJBt"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476ac73c76fso44604921cf.0;
        Sun, 04 May 2025 17:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746406376; x=1747011176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3cOM8UgYVEzjO+LX6y6P1c8tSmP2BnZ7R53s/jgWTo=;
        b=aRN/vJBtdxnekrDRyVFaN8xaBowLVhlbikkWhYv4uZvPA0krX3g+tOTN8+Qy31bPzo
         +6UuwDmbL1DACJ+HnHWMb7KbImskABTB2Ji5EzYI4k5XWxU7Hys9QY/EF9eIffqK5nvK
         /uKMejgJGeX2+nB1/sB8DOqrtMSAM3RzjiX+vQZQa10eWLXw6nHiSVnjHH7xtR57uQZC
         oBtjK46kZ/zLIT2s1V+3dhai33KiPjrupBXlO7xTIVOYR6onAN7H7KiMvU8se1iEI9Z0
         S7XnihQxxHkjrKQOTeWw6lfxC8q8e/QIHqYlmxAFmqJND17XTT0m2Z5qdgeb+14Q0TsC
         0T1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746406376; x=1747011176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3cOM8UgYVEzjO+LX6y6P1c8tSmP2BnZ7R53s/jgWTo=;
        b=BQhc6vr0VGNQMjeFI8OHvUaa+ZePobH8VYrbhWnQo3JKUOKPcp20Xr98CdRm8ZBkwE
         woKNQBNKjhso2mJaM9GI3np9xaufvj9L9573pmtR2A/qhFL7kRp9tXazb0227e7Z4nga
         9Nib3SXYAFhrewyibsjTHuZSmpUoL4PIymi3PVn/b953I5v1omDnAPK3sucNn4guuhss
         AUpHWcR7yuGZcJVvCeFNBeOlRpEvHlTFn1XFQ68nanzEGX4N5CmPNlsTXCIhfjP8xM4g
         KJJxl2tkg0/ICnZSNAmqhmgBAUBi+KROwkdcH6DZqW/RtAU0KMPIjbLvOV+Rkmgxo+AW
         02lA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ2xziJ5PJmz3sFEytX8stPa+/lNt5ZLMPfZwcgAYSjhgG4jdv7p8jaNUMFuqKTH5p4EIWeL5xVkKO@vger.kernel.org, AJvYcCXf9Y+SAQr0JPA+9WRvQHMC3THafKs12zoeOyp6J33M5yBWH2eivNXqZ/5R4wgG3Aq1BLglU+SZ0xL0H9cU@vger.kernel.org
X-Gm-Message-State: AOJu0YzITd/SaNP6c3GZS/14VKJy8MnnPWuccJVEhc71afvYL+A12R4t
	jC1HhxEtXsc/gBj6iGcm1PRUtIgGxQeR3et60CU6uhbbqdJ0Wrp1
X-Gm-Gg: ASbGncsDmHbwZ6H4Wbk2gAcFeqZyh3gHbojFXLlvxidgYmv7/v570p0usR6U3X+sloy
	HbXdObuf20UUT9DWlyTtgu3Woa4AmMFO62ZbW1iLqcmdxZTZYfZN1a61PrNzAm01DGe259bhGis
	U+hIHLtvS5PKxf8jnx1zdCK9r8dJkRPQ51QbMCH89LLFmSMj+uINEhnjpAfmOKkzF2IdjhkxcYH
	N+HQLfWHqlZiIjcf97Jh+xteED9+4kn3wyVHO0mxVd5VW2GbqzSofVmd6WbqSzdauEH0PtAD+lo
	IRw8uFxsc1i8m6WzocYA3zA7UmRw0rZtdXak8TB7VmFNEeAqm7VK+fl82n004N26c4kgZBvn
X-Google-Smtp-Source: AGHT+IGJdthXgAH8QrvMlL42VzE25U39WrDfXOB2+MAS7inWWA1D5Cqtf8YC21jMm4oGub/7c2h8dg==
X-Received: by 2002:a05:622a:4308:b0:48f:5a65:b98f with SMTP id d75a77b69052e-48f5a65d728mr29417741cf.19.1746406376239;
        Sun, 04 May 2025 17:52:56 -0700 (PDT)
Received: from [192.168.21.149] ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48b98d0ef33sm50637471cf.74.2025.05.04.17.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 17:52:55 -0700 (PDT)
Message-ID: <44a4aef7-9d23-4a6e-a228-39bfd3e2a308@gmail.com>
Date: Sun, 4 May 2025 20:52:54 -0400
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
 <46cbdabd-b0ed-4c9b-9f01-4d2d8eceac24@gmail.com>
 <13407dae-4c73-48a9-846e-92f08449bc4d@lunn.ch>
Content-Language: en-US
From: John Clark <inindev@gmail.com>
In-Reply-To: <13407dae-4c73-48a9-846e-92f08449bc4d@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/4/25 8:45 PM, Andrew Lunn wrote:
>>> What PHY is it? Are you using the correct PHY driver for it, or
>>> genphy?
>>>
>> MAE0621A-Q3C
>> http://www.maxio-tech.com/product/12928/12929/12930/12931.html
> 
> Mainline does not have a PHY driver for this. So nothing is
> controlling the delays in the PHY. So what you have above works by
> luck, and is likely to break once there is a PHY driver. So i suggest
> you drop the Ethernet nodes for the moment.
> 
The chip claims to be a pin-for-pin clone of the rtl8211f. Empirical 
testing has demonstrated it to be extremely stable. Without networking 
IO the board is very difficult to develop against. I can disable 
networking if that is the consensus.

> There does appear to be a PHY driver here:
> 
> https://github.com/CoreELEC/linux-amlogic/blob/5.15.153_202501/drivers/net/phy/maxio.c
> 
> but it has a number of things wrong with it. You might want to search
> around and see if there are any cleaner versions around, or if anybody
> is working on upstreaming a driver for this PHY.
> 
> 	Andrew
