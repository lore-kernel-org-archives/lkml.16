Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED81038F80;
	Thu, 10 Apr 2025 08:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272767; cv=none; b=aKs0lF8Xe88p/Bha4L477y5fpjbwrBG53VFwslARc2PZmclNWnSsm34QrXDwx2ZWWhi6Cva5bxaw2RYLJbB8G0y599J4ikKumq3dh64Esg1QqhUmy0FpOVZt6M3MRMOwBYsq2/ZhrnSyxeM/M0oFpVSayuS7VTHIkxvYh9PB2/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272767; c=relaxed/simple;
	bh=3AoGDgwNV7KMGShci6YGW6agw+iL/mF/817ug3TjIhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTFERKzDEDMZEWQpWTpEF0yJNR+wHFuttI8k9U60X8dpQnaze1e189WmwMJmXoezbeS6DxcDjJ+u7dAXGyIg4ob9LjVeuHOV4M+I3zAlRi26q+rpuRoiMUFsZvUTN0Rue/BYK9o9qIRhz4Z4G7Estuq3BEWT9deBff36Y/V0W3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjDJKemL; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjDJKemL"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5497590ffbbso519154e87.1;
        Thu, 10 Apr 2025 01:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744272764; x=1744877564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Grl2X0AdNCCi9R+lafeqWzTVoLK8D9dH81pG+O46x74=;
        b=bjDJKemLa40gTOGc+AnJ7saXosPCiYvAKRihVooLxIKnzaF5OEdt1czDi/eicyhDij
         NV3OpQDdiVC5qOEowIE2Y2c7+8de8ar/frrvwzVT74hmmub+zqwFiA8dpMEPy7kSYoqo
         WkCdRpeEOzkCd1InxtdR0ze4wuEfigh4zujHQWHMAbpLQZKWJBNmh7ugNDxkS4W50DVC
         Zi3NP1BV06iNILMSRAqUaBKI5wxbrI24uqOiSTTuxxKgMuL3IvTMcmmvAc6xYo8C/jaC
         EwCuLiVW+V7/T1aPGvDWw07fHyEBrDcpqZRHoSg9rjkzu8IN5Ht7aLWH5Fk+1crkRcJF
         zbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744272764; x=1744877564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Grl2X0AdNCCi9R+lafeqWzTVoLK8D9dH81pG+O46x74=;
        b=j33YVol8s29Y8ts48Hc2dm213UWhhwhvjQ/qR4C/Dh0Uo+dVq5lZxXbz4XGZVvf9Cb
         BYUxS2B7VySO1pTr0DtsoldcBWi80TNnSxORGh8nOvyB3RKrRQwe+PxaxtxPc4/hdv2n
         rEda4wMslb5wruUrjtrffXbZ9L6GuLnuwdScXDL0EmGh6yvkgFFkhFv9Zmfz/lEr8Hpt
         RVRnC0CvVeK/WCbhpQ41Y91NZym6b0HBTo/btnnx/dgMGMaSQvMmhMqxoH+7nG+mPECC
         oPuFQ6e+jg7j7RZsbAIbhRdOwiLXuS7z9wmmDxM66p4F8fQvQVNB3hbM3FlKyyM1QJYP
         6mpA==
X-Forwarded-Encrypted: i=1; AJvYcCUvv+AEWAVhU1qwJoc5QeF3ZKZS/AuEGE4TQi+nEDlIBpyg4Cufg6mkeX9YBAQgnVt0ZravTvQJmNNA@vger.kernel.org, AJvYcCVccEeq7z6dpCJSSkVbCeuGB3qmL3akRE2e4k8kuR21BNGj5HDjM31b4BjU6a9NCXMoJkF8TVVBkAFOL2VX@vger.kernel.org
X-Gm-Message-State: AOJu0YxLdkbCwzubhKVMDRqTgj9N8fULSbjbcpKmpIFipMnXXbbdyzkA
	AJbyKPWz7NTKJDN5qM6Hq/nwtKnxJZriC4TiKE4RYIYU33PdtER/
X-Gm-Gg: ASbGncspvjzeuc1P6lsmI8e+P5rxcvTWmgGZH4jS2GACnAeENBw+idNaguWGB+x+Job
	mGq2mp2c0gOr8nBNQoGPrk84TQXDtTGPDA4EeG9OeYiNjM5bErwWjyA97bGplaaPFkN4dp1zonO
	JhNDb8TLB8cA/8DgKB1Ml+PgdqDspYIxVa/fYYmvSM5AtIEfIKA7OdTOcjUfEOEBHdm/6iloK4y
	ua5pm+vvKQFaq+H6WJwt+1GLnx53MNScmA51I7uht9tA3d9XUcCmTppITA11+Oc3zO8NVNi+D5d
	QRelmxHPJb9Ey+bPgTTB8e0BzuMAijGB26hTl1dtI3GwtX6BYR7q5SDfd9y/gjVzSaHoJWCDh+v
	WDGU227pnsuUN9DJLVHT50A==
X-Google-Smtp-Source: AGHT+IFWmbEOh1Nr1upe9f78hm2o5YATKFuyEjVt78HlmgXqCdbv9VFkmZ3/3po0lLSijlz1ag+8lw==
X-Received: by 2002:a05:6512:158d:b0:549:8f06:8229 with SMTP id 2adb3069b0e04-54d3c64a477mr420491e87.49.1744272763705;
        Thu, 10 Apr 2025 01:12:43 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035c9sm71061e87.125.2025.04.10.01.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 01:12:43 -0700 (PDT)
Message-ID: <ea291459-5c25-40bc-997a-490fe2a42a12@gmail.com>
Date: Thu, 10 Apr 2025 11:12:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/14] Support ROHM Scalable PMIC family
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1744090658.git.mazziesaccount@gmail.com>
 <20250410075817.GN372032@google.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250410075817.GN372032@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2025 10:58, Lee Jones wrote:
> On Tue, 08 Apr 2025, Matti Vaittinen wrote:
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
>> v2 => v3:
>>   - Fix BD96806 voltages
>>   - Use defines for voltages to ease spotting (copy-paste) errors in
>>     regulator descs
>>   - Use lowercase node names in the BD96802 dt-binding
>> v1 => v2: MFD driver changes after review by Lee
>>   - Use enum for chip type instead of picking the data directly from the
>>     of_match_data.
>>   - rename "chip data" variable 'cd' to more widely used 'ddata'.
>>   link to v1:
>>    https://lore.kernel.org/all/cover.1741864404.git.mazziesaccount@gmail.com/
>>
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
>>
>>   .../bindings/mfd/rohm,bd96801-pmic.yaml       |  10 +-
>>   .../bindings/mfd/rohm,bd96802-pmic.yaml       | 101 ++++
>>   .../regulator/rohm,bd96802-regulator.yaml     |  44 ++
>>   MAINTAINERS                                   |   1 +
>>   drivers/mfd/rohm-bd96801.c                    | 565 ++++++++++++++----
>>   drivers/regulator/bd96801-regulator.c         | 455 ++++++++++++--
>>   include/linux/mfd/rohm-bd96801.h              |   2 +
>>   include/linux/mfd/rohm-bd96802.h              |  74 +++
>>   include/linux/mfd/rohm-generic.h              |   3 +
>>   9 files changed, 1073 insertions(+), 182 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd96802-pmic.yaml
>>   create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd96802-regulator.yaml
>>   create mode 100644 include/linux/mfd/rohm-bd96802.h
> 
> This set good to go now?

Yes :)

Yours,
	-- Matti


