Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462CA1448F2;
	Wed,  9 Apr 2025 04:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744173493; cv=none; b=kf0jilSZycSzo5F7k/ZUim0MPEBxjJzzBQBgzZzsPnIu5zeve2pfqmhaYG8+IOk9x6lqtfsp3Rk2LeDq2I5l5EIY19rdRvdK5oSUm/kFFJ80B/qtk/UlDagyl4Wy0y5RyvVI9hLp5asgYpjanvjRS1oOSoE4TVMUp3MRj44TETs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744173493; c=relaxed/simple;
	bh=yja7eVXE/w/8yVg/IBLKYrzWII7G8Z6nPJ+5nLBJvNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UfcrK2fBQxXB6CSutqmBEsMiZ1pJat4n53WrrfJURTDDY1WyPrvnEiYq3HKwQT/xirjTRsvixRz/eh9Q5hJgB7rKzRVEmlcsMLi4JGvM4o1YCwEPpgQoHQGgTarSaryiZE/KBQA5v1Xta430USJ9DUgpZnFAQ1IA3qSM4WLHHIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apK/tWg8; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apK/tWg8"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b10956398so421228e87.0;
        Tue, 08 Apr 2025 21:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744173489; x=1744778289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+B9j0B+3bS2wkUTXIXFl6jfFAid+CYvzBEBZpVfO4g=;
        b=apK/tWg8f7jTkYAo9oXyRWqxoAqLgasF68v8TFUO6B/9CGK8qfcohWsm85nJPVxJl0
         bE2iS7N5DZ+U0fmXNFxC6dGXcn2PkmvFq6k8Hpw/uOzfsWZeXol0Aiqh2+bNl58MoBGf
         r46Tosyr/YanKdyolwIhWT8bIVoPdhD93hLQJa2gU/d5Mxtr/dYC/kvERy7rwvrtu3tY
         4jLepm5xcP4Ofg9gJ95IEfbW7cViWkKf5hwd/TBgMxqoPkZL5sPbFgHOpACb5/nTwJ0M
         MIiH+ojq0i9740za93YjskyctL84gw4ktJ1ghpqvjCYjE1NCQxWUuHgH7iO9mqU4b1o9
         g/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744173489; x=1744778289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+B9j0B+3bS2wkUTXIXFl6jfFAid+CYvzBEBZpVfO4g=;
        b=DpMTvXbqt/L/TfbFaWdIZArIRMQL9n2/nngfxyOdfBJXUW53VChJNbeUbFQFkbs9U2
         sQMIRAeuRtf59nqPL3Xu3wir3vXrPAQdajAxOVR2AJ/bBO5lg5AG7r3fXboF/YlhXkcE
         1qoci6z7UWEeAKzLd9z6v56bQu6Af5XuYZ7Aq8mokQ86olpkrOpm1yMM9bf9e6I80CGP
         4x4OuwHrtkMYtDz8uk/STHVUQNdXoSj2TgxzAY/TMu/7lyyjkjA/Cy/L+CGPqi6R55CL
         QN36GQ1rqJ6f+00QVImIQ/oureI8YSFoYWUngL2JxIVSLK0uktsMuGP7ln+D2x36npPo
         HOXg==
X-Forwarded-Encrypted: i=1; AJvYcCV+nrSPJTAkEC0dh9vA+SD6QZ2V/8PvP6CdFy5tVr9KUnEolpqNoT6jO0tzWsaxZfpQTxMN5XhhQ4F0@vger.kernel.org, AJvYcCXnskgtuLMrqCADhNwe6F8JBPAlP5vvBYAtHqzAe5zqxUUncClYUhIHcPtkwTmgGrReMwyYvU3vA75zOrC3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ZJoqtzYgsIKbVICKCNac5/lz2LL54JCkMcaWdyPaIgvwk3nd
	4JvrDGlL9tNn4W1sU0ut2uxzZ0wePxab4xGNjm+5D749RwJ9cXZr
X-Gm-Gg: ASbGncvD16elvL23oymQM3kxPxGz882SMtDK9vBy0yJIo4INCc9h5t79Df2kMRjuTMp
	QI49D1Z24Xw5btofH0JcjkpmXfsAT4fKqUAySK3CBt1t6Ke0zEtq9JB7tKUqbIoCi21USnKmm0G
	qFeTMAzLTiKk8yLuGgBc41waQ2lkH1kAfWEPeBx9T3zjjrKFx1zvjwHDsXlUq5E5QnRllheYJ9D
	Kj+uoTHqP9Tr0KVaDbrW2dKVBmKHgOMyg8UgH3765rVG43sX+fPkFWt2ArpPlrFDXTZxYT2NxxU
	nje4BGVQurAxYnNGQeHmaUhck9WiFIpEe39sE5WbA+NzBJ95WwDfxXzy8qTZ1A9ilJVEMgl8ezE
	tysLzVAg91UHKtA15a4Fyw2oeLw==
X-Google-Smtp-Source: AGHT+IF18UpeVIVOwB6F9sl1oa0T8amO49pxC9bggCcRxblKl72lMW2PeXfAbXqk6XOTfjRv9hn+rw==
X-Received: by 2002:a05:6512:2384:b0:549:4ca4:504a with SMTP id 2adb3069b0e04-54c43649bd1mr412795e87.4.1744173489002;
        Tue, 08 Apr 2025 21:38:09 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c45680001sm32106e87.244.2025.04.08.21.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 21:38:07 -0700 (PDT)
Message-ID: <2380773f-7735-4a65-96c4-04931cfc9185@gmail.com>
Date: Wed, 9 Apr 2025 07:38:05 +0300
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
> 
> Let me know when everything else is ready to go.

Hi Lee,

The v3 (link below) should be good to go now. Regulator parts are 
reviewed by Mark and bindings are acked by Conor.
Please note that I translated your 'Ok' above to ACKs - I hope that was 
the right thing to do...

https://lore.kernel.org/all/cover.1744090658.git.mazziesaccount@gmail.com/

Yours
	-- Matti
