Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A61535957
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648783; cv=none; b=WpDf92wOJnT5X6frcD06+M3AXUGBWB+SE/RuianhRuk6+2hZNeOil/O4GWF6SQRMm5RbVvBezazWVwkppghqAEnELxkrylOVPPwD8WEK9c0/CwtIAFZkYLeV1to02ScukRjC0YpWbwdhMfbcWYsVq3+4+rEsczAs4biMWXyg97E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648783; c=relaxed/simple;
	bh=dSxij7d3UNEnc03Iwv5weNptcq49Yp5Ww8xB0LEZHn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqjkgqIptyqcvK1dk9M3VEnv8+xVqh149QjbOibUwcgvS+l1kq/lOXBW6WP7rHIyQuSAJINr+AHTQe9ff4JKKVXRoBkyBoIhVS/5Zsnw41mJ6XVsGjdk3sgRJCDg5YLR+AynEnPP0nCP5wkGzya3x62fwzqIDKxoQ3nbCGHK7ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RrUci1Lw; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RrUci1Lw"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad572ba1347so97100866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747648780; x=1748253580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=squm7R0/ZL3X4Ww4+m9myAtwPnq33Yj6/51YuPwNRrA=;
        b=RrUci1Lwi50rXkdR60SsIy/4BWKSs449RUNskN/0F7yQQ284T0Pg9I7Nk2SLs2pbGR
         010wn37lrErfrn9nvFQ8aDWAV2O3ZVXMt4vadNttWUWrQwlPX6/l7VyXT26ypEmeyYqZ
         gXWh28MgocwIIBwmocOGfJUaHq5GYQKIk6HqNCSNOqJU/j8dX58TWPMw0EdtBWCbYBsp
         ChujWVVmcdT4/2BNiHPGtR6g2Ob22JtgkpjT/JZjehmqI+OP3P20x1m3hGQdn0xXpp3a
         t/ZpIVBCy6bRrHMFKMoL8Tx5M522CKRdpyS/NIK4ik9MaItdfWakh5Gz8sGExprdbOT2
         VwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747648780; x=1748253580;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=squm7R0/ZL3X4Ww4+m9myAtwPnq33Yj6/51YuPwNRrA=;
        b=IC4jHzzB5O5XkLFqgl/8S5QfVtUC974GwGQdDd3WIDA6B2dIpkWRXnMCHvLzonMIvS
         k7pNLE/NyPlxJV/VbbG12dM4gzmjqY8bruThlbl6eN4pD3hVNzUVMUKE7YMk3OkM1OQv
         rmPIQINVZbGWpk8bseyzzxjqLFJpkgK78SbWTFxwEpIyWbtKTqUVRL3GwqkQfsWrVTz8
         G5w6fyDfiGGVhuE5s4tJ78EVSe58zEQVR2XnRdSRifuKslT8fzPdw1WtJgTFC/fZysxR
         ngj8VZspGUeb0pb3vj2VMw2KRu9UEzJj6mWg/rpb4P5kSkISuBPf2YGlzWr01W0ECVnj
         5lJw==
X-Forwarded-Encrypted: i=1; AJvYcCUT/5qVpv9U2icO7ETKVJYHWnRn7yWEl7cbtfuY+7SWcSRB6AIw+1Ba9eKH62lYk676eYjqI46t0ltxsD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhXEUn2GJbWyHxsJnVuCgywwpLVWJr8RahBaZWlVOWHEUs9IGy
	FVMK4/Ja1gSkdWyzv8MsVJF74jl1p1Q6LtcVLePfZz+OB2m3/ubJJIRjy4/MtPBkAVM=
X-Gm-Gg: ASbGnctjs8Br5gLcxdsN+g28eVUB7MhAa5aibadA6qDlLNCCPmF/1Uf31IQdbJrxdyU
	Sqcubmpt5xyGH04mtq9daUW+wL0oAHIbb9QAf6H+loCz8wabsDT8dpQfs41yBej0i+JGBX5VK04
	eMx9dMIRIFXhKfZG9EJ/ZCXWjh+nCL81cEcGEh27wW7C6zxQwsIoKaMbjp3D2qL8qf7zZ3J2vU+
	axyg6ldpBeVBzxyp+xZOr23L2DVO2GGn90QYvBiyUd5nqXLn0LTUBso23xhnWYnOQdVQc0iFLTQ
	a2nl4CffX5L035u80cPSSIla1n+ujHQV3Aez0ycn4ugu0Ftq+Fj4fX6fYwE=
X-Google-Smtp-Source: AGHT+IGOf1zbVEfv3sqxO0+3n3nY9cx70R8hKHEv43EChu67h7Euqo+U4eNL1rpDVaHinhCtY9Q/Ag==
X-Received: by 2002:a17:907:72d5:b0:ad5:2077:7a71 with SMTP id a640c23a62f3a-ad52d557911mr1094441466b.30.1747648779618;
        Mon, 19 May 2025 02:59:39 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d498f18sm562159966b.150.2025.05.19.02.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 02:59:39 -0700 (PDT)
Message-ID: <42ae4511-43db-4896-99b3-f203d52433e3@tuxon.dev>
Date: Mon, 19 May 2025 12:59:37 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] iio: rzg2l_adc: Cleanups for rzg2l_adc driver
To: Jonathan Cameron <jic23@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, rafael@kernel.org,
 ulf.hansson@linaro.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bjorn Helgaas <helgaas@kernel.org>
References: <20250324122627.32336-1-claudiu.beznea.uj@bp.renesas.com>
 <20250327153845.6ab73574@jic23-huawei>
 <2025032703-genre-excitable-9473@gregkh>
 <20250330163627.152d76ef@jic23-huawei>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250330163627.152d76ef@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Jonathan, Daniel,

On 30.03.2025 18:36, Jonathan Cameron wrote:
> On Thu, 27 Mar 2025 17:22:20 +0100
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
>> On Thu, Mar 27, 2025 at 03:38:45PM +0000, Jonathan Cameron wrote:
>>> On Mon, 24 Mar 2025 14:26:25 +0200
>>> Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>   
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> Hi,
>>>>
>>>> Series adds some cleanups for the RZ/G2L ADC driver after the support
>>>> for the RZ/G3S SoC.  
>>>
>>> This doesn't address Dmitry's comment or highlight the outstanding
>>> question he had to Greg KH on v3.  
>>> I appreciate you want to get this fixed but I'd rather we got
>>> it 'right' first time!
>>>
>>> Also, please make sure to +CC anyone who engaged with an earlier version.
>>>
>>> For reference of Greg if he sees this, Dmitry was expressing view that
>>> the fix belongs in the bus layer not the individual drivers.
>>> FWIW that feels like the right layer to me as well.
>>>
>>> https://lore.kernel.org/all/Z8k8lDxA53gUJa0n@google.com/#t  
>>
>> As this is a PM question, Rafael would be the best to ask.
> 
> Sure. Perhaps Rafael missed previous discussion, so I've messaged
> him directly to draw his attention to the series.
> 
> Claudiu, please include all relevant people in +CC.  Don't trim
> it down to those effected by a particular solution as has happened
> here. +CC Rafael, Daniel and Ulf.

As the discussion [1] is progressing very slowly:

Jonathan: do you consider having this series as a temporary solution?

Daniel: do you consider having the fix in [2] as a temporary solution (of
course, with the adjustments suggested by Geert)?

There is also [3] for which a similar approach was proposed. From what I
understood from the discussions on [3], Bjorn is OK with the current solution.

I am taking the responsibility to do the necessary adjustments to all these
drivers once there is a resolution for [1].

Thank you,
Claudiu

[1]
https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/
[2]
https://lore.kernel.org/all/20250324135701.179827-3-claudiu.beznea.uj@bp.renesas.com/
[3]
https://lore.kernel.org/all/20250430103236.3511989-6-claudiu.beznea.uj@bp.renesas.com/


