Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D2F38FA3;
	Mon,  7 Apr 2025 05:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744002589; cv=none; b=m8xXs6ENUwXVPqlIob+6TrCGBRfscvzmccvMSOyIl3wbAXgHYoujFZZq3W7ucboh+hsONUrkwxbZbLn/p5s++yBGnL80XRuPJUG/sUDdqYPYdtlIvpFbQGas3WHijqZYOV+JglusaxchA9JToUGEZQxCsIQWBFIbWpfRUiuyBVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744002589; c=relaxed/simple;
	bh=TOcRmAewKpzLaLnd2j86+JSrN+qmHHKC9ipgNM5H8/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcTWgTU6OrR+jOusOYT1T2/lqXJY+AdbXnCPsRJa6qEOQXFaciQdeZsMz3Pp/2PwiGKg2ZJRo5Ks1MWqqSLrbHZVGGFgrYsC3WxepwBZfh9uV+0ewZUEwUr9lbRzNAcdNkkGdC8Cm2G0EMRvkcK7f5axJk/d+J5gHgF1k6fZgZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Carv0U4K; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Carv0U4K"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54993c68ba0so4365181e87.2;
        Sun, 06 Apr 2025 22:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744002585; x=1744607385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15DHILdvgwDmTjhnhh/S9UFdOX4eqaWTZfsAwv/+ioE=;
        b=Carv0U4KK8Fp3CXqyz1eLEayTEsEDWZC0vbcO60XNUPutoPdmgb6KOnyVlTyIaOkN2
         uYh0xVszPZqt1km/5wUk52VNyB1Cjcoh0poolVhd3oGZG9YbhTrsMMQZvH3M5fgmtdyx
         lDhr6mafiQyu6nUJvrgpbTV9J6uHu8bEfkItA5rnypgiNBgz1bk3zK49vd/lMY9bTpgS
         KLJrCFpC5l/+Et7q5yKKAANBa1z/kEtVR7OlaPpHekrClLqCqzBe3npB7hLhbQ6RcEuF
         hVWM/NX/89UukpIMWhwNTofvYWEYeaGcUbLMxY7cf0ufaA0hJCKLnqG47+LPdGeHmsqY
         A4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744002585; x=1744607385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15DHILdvgwDmTjhnhh/S9UFdOX4eqaWTZfsAwv/+ioE=;
        b=RJV31Qx8mFcBXfTh8DdrAMmqw9pHe6rmukIPKt2Jm/EjqvEjMSTktnwBQvm3NF5PON
         R14LMAzh/dVO3nB6D5tcamQM8WFvJ3H4bEq/s2Q/YcH9b+Jua4Yre3Z4VEqZCHCGLP//
         sFhPkj2arV8QDsiKW5lX2TMiPnzk4ZqpsJ/+lIBJbJumCOuMp7+y+jorx7gFRsxW56Yi
         L+3WgkRev1quUomUP/l/waHYzirx0Arw+7U0VszIl/+z4vZpmIzECYSJgZIGDD7LON//
         BW9Asjho7M31IkvfcndtalYioihTuROhsd6WA43F49/DgLylQ/k9y0TRUUm72pmb3Xcg
         mbuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdlpvR7feeD7qDUSROIsECelVWo4Kwzc6ol+RDWbw1gadMzBu/tlM05XD2mWyTzBnJqD5pv7VMlMPlhjbX@vger.kernel.org, AJvYcCWqr9bcV8TfTqmtbUo9cKAPaZbD7RF8SbrfdchVH95oBOczAV2BCUoS5L7TpAru2//51LrG24Fi69GK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4FE5+jsOEhKOE4kvOPla4hRgh/76ewHtFcn5Mv8oiRwBeAtpZ
	TqMoOJefil4pbhE+RWfFy7aN0+3wjjMuoX0p4X89FjcNpCjYde2KeJZu4A==
X-Gm-Gg: ASbGnctHqHmTTmD1I5P1FflS10LTS6XfEVjWALBSjjfVLdA7McaJJ3gZ46VQHrtOTCX
	ZPh8KPw1aRCMjIQO96MzRSBWwyrUM82gv7hL3V82mP1P4EyFPmJ4OE1lTHI5WF68bMOqA4Zuzoa
	ME4ljpwe+tvvLgOvixakcwlvY+qOMn2exl8ajI1Hf8JlQPXC/865pPqdMKPi5n7xStPZVS7Cp0y
	QZvcH1q3E/WXsF6ftUq6aeDMCM4LSttHgbhpEwmdyMUzd4nPDh8dj1oFl67VawlmkihUEcTpNnj
	SdiTWp2JFYdft0xtxb4mwwwlXG01V4ciiBdVcDIVEiCaKZ6mwjyCrz64KMwcmBAS2w7MvMVCgJM
	GaE/oFXtGh0riQMxjn1cHxYNALw==
X-Google-Smtp-Source: AGHT+IEeVdRWtDbmlDwucy3+7umdQuSdpeDu7wo4IM8msmlcEeuZhtu7qNaMvPmIDtRm1JKjguT2Lg==
X-Received: by 2002:ac2:4c4b:0:b0:545:62c:4b13 with SMTP id 2adb3069b0e04-54c227f8ed8mr2620730e87.40.1744002585162;
        Sun, 06 Apr 2025 22:09:45 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab61fsm1120006e87.34.2025.04.06.22.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 22:09:43 -0700 (PDT)
Message-ID: <2d18b7bc-7d94-4e45-8c7d-9a8acf4089eb@gmail.com>
Date: Mon, 7 Apr 2025 08:09:41 +0300
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
>>
>> ---
>>
>> Matti Vaittinen (14):
>>    dt-bindings: regulator: Add ROHM BD96802 PMIC
>>    dt-bindings: mfd: Add ROHM BD96802 PMIC
>>    dt-bindings: mfd: bd96801: Add ROHM BD96805
>>    dt-bindings: mfd: bd96802: Add ROHM BD96806
>>    mfd: rohm-bd96801: Add chip info
>>    mfd: bd96801: Drop IC name from the regulator IRQ resources
>>    regulator: bd96801: Drop IC name from the IRQ resources
>>    mfd: rohm-bd96801: Support ROHM BD96802
>>    regulator: bd96801: Support ROHM BD96802
>>    mfd: bd96801: Support ROHM BD96805
>>    regulator: bd96801: Support ROHM BD96805 PMIC
>>    mfd: bd96801: Support ROHM BD96806
>>    regulator: bd96801: Support ROHM BD96806 PMIC
>>    MAINTAINERS: Add BD96802 specific header
> 
> Adding support for 3 new devices in one set!
> 
> You don't like making things easy for yourself (or us) do you!  =:-)

Well, adding the BD96805 and the BD96806 were _very_ minor changes. More 
or less just adding new voltage range tables. (After the support for 
different ICs was done for the BD96802). All of the ICs, BD96801,2,5 and 
6 are 'same family' of "scalable PMICs" - which all share similar 
digital logic. Hence, bundling them into one series didn't seem like too 
big if a chunk.

> 
>>   .../bindings/mfd/rohm,bd96801-pmic.yaml       |  10 +-
>>   .../bindings/mfd/rohm,bd96802-pmic.yaml       | 101 ++++
>>   .../regulator/rohm,bd96802-regulator.yaml     |  44 ++
>>   MAINTAINERS                                   |   1 +
>>   drivers/mfd/rohm-bd96801.c                    | 565 ++++++++++++++----
>>   drivers/regulator/bd96801-regulator.c         | 447 ++++++++++++--
>>   include/linux/mfd/rohm-bd96801.h              |   2 +
>>   include/linux/mfd/rohm-bd96802.h              |  74 +++
>>   include/linux/mfd/rohm-generic.h              |   3 +
>>   9 files changed, 1065 insertions(+), 182 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd96802-pmic.yaml
>>   create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd96802-regulator.yaml
>>   create mode 100644 include/linux/mfd/rohm-bd96802.h
> 
> The MFD stuff looks okay to me now.

Thanks! I'll translate this to ACK tag for the v3 :) Please, let me know 
if you feel that's not Ok.

> Let me know when everything else is ready to go.

I still need Mark's ack for the patches 7 and 9, and I need to fix the 
voltages for BD96806 - meaning at least 1 more version.

Yours,
	-- Matti
