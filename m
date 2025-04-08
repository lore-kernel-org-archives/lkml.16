Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D15325F996;
	Tue,  8 Apr 2025 08:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744099529; cv=none; b=VOCjHAUjrfc4tVnaYvQI9uE+QeAjSaI4hf2DCEejY1JEYfnvSb55yqXzoeGTqNYeCFt97AiZdIKeCVNMa4OWApL60jwKvp7jviq+ZDRlIYVz+MgHPlQClSWOjwwZC5K9NAFu06p/Rc04+3IoFIRCHSQB139jW6hxJM5DjeirQ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744099529; c=relaxed/simple;
	bh=2ppVHmf3lr9m17yQUCa7+XtsozlMQJrpYZVAqzv++Xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d29ok/At6uG6wVmApghLcGtAl19gAAY+6LLLSZVwabvlb7WX0Aj5XHjTd5AskZV8g4EVBAMjxKktNsKM2WahZg6CY3d0ekaJz4i3WiuthUR05DFf0RsngSlwbEZt86msRwjX86yu8WG+ednhzgjCDNc4IlF3pB7el4leekJQjqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1QxLmXb; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1QxLmXb"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30effbfaf61so56310861fa.0;
        Tue, 08 Apr 2025 01:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744099524; x=1744704324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9RbNPrMfTGfYX3/yWaDonxxQD7j4lQW1brIvif8+e8M=;
        b=T1QxLmXb0jpFspX6JXbZDM55NvDtGx1nt/o79dHhGXqZEI9anH+VVuVIYlbd6ovO9K
         bNdwkhcYoSI3kgdys67Bf+mqlCy8B2gt+Xu0OJYUJM9D2Z0B+PGI3vOYsGLUik295ALC
         XIqlVCxHnre/bCBXRjlrXa/2a5QfLpACgk7uRQeKiaWMudaSX1HGR0GzRDJi/BRSAE3l
         Oem/xf99rFoV0S6SDGziEn/u7Rjz2/fB0eynL9vyK5sLfLN7OrUtKDTNBsjGZHZUxryT
         JUrmPPDGRGqeeyxmijW5hXWiNSAkTMnjEKVVehkMKHdphbbEEDTLYl1omRNfTuKCNXgy
         zdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744099524; x=1744704324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9RbNPrMfTGfYX3/yWaDonxxQD7j4lQW1brIvif8+e8M=;
        b=wweQEv4o5hcafDc1YJvQz90h6KEBsuEV7ibhVDaqGtLlBQUzNzIOo0dYFfxEC3zeA9
         i1osT8uw8o4JTpAYUqNJBYHZi8wB/kn5cGeRXEKlfnufi05ZNe8DdHjJyYT3mWZXSe/l
         rnAgZ/AAOodUDPaFTYqB/vYrKiT4K7l6tk25YOUtpB13n8NQgai5IbGmtubIdAWbHPhl
         i8cLo9Ujxj12kCVFjkYTz38bcA2RG3TcaZOIDWr9hXT7D7vPnR/B78ED+1tDiQh1ZTbY
         Fl2KCZEicQkyS+fCaJb4YI3pODd1oueNqlpeZX6TyP5ad3Tq5BmfVhSyE6EROrpFwD4e
         el4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEOL7u0ELr2kIW02G6bPGFk0A8aRThkyh9GhkGhwmrRXijINr32UfZR6OYQ8JKWWxbxRGaGborNDqLlOl4@vger.kernel.org, AJvYcCWNBGmIf1lxS0zk+Wz0KMhoT3S36DbJhQ59E9OqL2HYS46I62P5BaHGPgWp847x3SPnUocs2i0jZhv3@vger.kernel.org
X-Gm-Message-State: AOJu0YyDCG65CC6LcQJXX05fYm1wou7khFFzurZD0foUZBgThfaNER/L
	jjM5O/A7qFCggWGnY0TtXUil/2z7SKH9PZsuwj4r/a1w8o28UhHY
X-Gm-Gg: ASbGncv+83bPv2t5YdTtRnqUcJO1fH3FatFzT18d1dw6djL9qvvYSXKNajrvoQE8Khr
	eJMKKWiHLtOravruGE9Aba7P8DKaVpN3SdQ4bzmRI9wbzPuYs7VT94/R4B1sOKKR50hpjqET6Cu
	zuoa6SnkTq0pzXingO0phyOP0FWJyxqNMtSj2zPITFhvmRnIRPHRLGxMZjw90SzleXytYkeQ578
	g1n432Qa8+wb5TpRSob7xI6bxQ5wTq3AX2xdETKnFchaQLBWAOHNE5yZ625zJ9BP51c3AiNNEwe
	zzLG8xJRSOkrGTYf6PDPTi+7Ct/VNOmf1L9/kEm12TQBKAGHs5gQa+PzdQ==
X-Google-Smtp-Source: AGHT+IEkAvq73Uy7BGO3rzFjCskyJl1DBlIcf3jZyB3KR5grfXemkv771D9nyg47NLtYCmIHr8N1Tw==
X-Received: by 2002:a2e:9e4b:0:b0:30b:e73e:e472 with SMTP id 38308e7fff4ca-30f35ee19d8mr6099961fa.14.1744099524017;
        Tue, 08 Apr 2025 01:05:24 -0700 (PDT)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f03125862sm19378111fa.3.2025.04.08.01.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 01:05:23 -0700 (PDT)
Message-ID: <ddd8882f-05b6-40f0-9a26-ab21d9644364@gmail.com>
Date: Tue, 8 Apr 2025 11:05:21 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] Support ROHM Scalable PMIC family
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1742802856.git.mazziesaccount@gmail.com>
 <20250404154355.GH372032@google.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250404154355.GH372032@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2025 18:43, Lee Jones wrote:
> On Mon, 24 Mar 2025, Matti Vaittinen wrote:
> 
>> Support ROHM BD96802, BD96805 and BD96806 PMICs
>>
>> The ROHM BD96801 [1] and BD96805 [2] are almost identical PMICs what comes
>> to the digital interface. Main difference is voltage tuning range.
>> Supporting BD96805 with BD96801 drivers is mostly just a matter of being
>> able to differentiate the PMICs (done based on the devicetree
>> compatible) and then providing separate voltage tables.
>>
>> The ROHM BD96802 [3] is a companion PMIC which is intended to be used to
>> provide more capacity on systems where the BD96801 alone is not
>> sufficient. Startup sequence of these PMICs can be synchronized in
>> hardware level, and there seems to be some mechanisms which allow
>> delivering the companion PMIC (BD96802) status to the main PMIC
>> (BD96801/BD96805). This patch series does treat the companion PMIC(s) as
>> individual PMICs and allows using them from software point of view as a
>> stand alone ICs. From the digital point of view, the BD96802 is a subset
>> of BD96801, providing only buck1 and buck2 regulators. Please see the
>> data sheet
>>
>> The ROHM BD96806 [4] is similar to the BD96802, except that it does also
>> provide different voltage tuning ranges.
>>
>> This series adds basic voltage monitoring and control as well as a
>> watchdog support for these PMICs using the BD96801 drivers.
>>
>> Similarly to the BD96801, these PMICs too have a few configurations
>> which can only be done when the PMIC is in STBY state. Similarly to the
>> BD96801, doing these configurations isn't supported by the driver. The
>> original BD96801 RFC [5] driver should be able to cover those
>> configurations, if modified to support these models.
>>
>> [1]: ROHM BD96801 data sheet:
>> https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/product_brief_bd96801qxx-c-e.pdf
>> [2]: ROHM BD96805 data sheet:
>> https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/product_brief_bd96805qxx-c-e.pdf
>> [3]: ROHM BD96802 data sheet:
>> https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/product_brief_bd96802qxx-c-e.pdf
>> [4]: ROHM BD96806 data sheet:
>> https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/product_brief_bd96806qxx-c-e.pdf
>> [5]: Original BD96801 RFC:
>> https://lore.kernel.org/all/cover.1712058690.git.mazziesaccount@gmail.com/
>>
>> Revision history:
>>
>> v1 => v2: MFD driver changes after review by Lee
>>   - Use enum for chip type instead of picking the data directly from the
>>     of_match_data.
>>   - rename "chip data" variable 'cd' to more widely used 'ddata'.
>>   link to v1:
>>    https://lore.kernel.org/all/cover.1741864404.git.mazziesaccount@gmail.com/

> 
> The MFD stuff looks okay to me now.
> 
> Let me know when everything else is ready to go.
> 

I'll treat this as an ACK for the V3. Please, let me know if that's not 
Okay.

Yours,
	-- Matti
