Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CAA256C7C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742282; cv=none; b=Y+RSNaVHG2ASg2jxARlVloCtl7qd5iUKpcq3k7TkILQ2SK7wz9O4wwjLgOsNb6WePaSJ/YZ1XgzqH5AkfCS4lBu2QgzQcT49qS4XHg48WH5UA1Tx8dnKVUbNifhs7RPcKl4s1oUNPGafgTesU9WbG8yENAjlo4+1Q5xTtpfuAZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742282; c=relaxed/simple;
	bh=H5AXH6AjSFVJtfqOdZnZSx9Rs/PN7fL6rlcePjJOXq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nvMC9Y9/mJ8itz2Xk6Br6jbqxV1y/bNQ/mSW+rp7vr8PxnYrk+K8Q0la+KSAWQQ7+tmSOMsF+O803hzZpHEuQ+e4gta/UH7zZ7UCysxqkMFBLuSaz16ccanqXy8zwhGGRSPf+Vwi5r0jVo6Wi6V0Y9Y/4ELoTmMuZ19g4fx7yX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1qQ2O8ZI; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1qQ2O8ZI"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so250735241.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749742278; x=1750347078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sb0DG68kqsOtJjiQeRDCa6cNRwoIg8RT6b2RdywqaM0=;
        b=1qQ2O8ZIA8NfjdOWHN2lZgyDpIBQ0djlGAZlWf7sfXsrQBjE2OWY114CAZ7XDyd/92
         I/pyV7JfVPrtn9J9cdC83nHctGRAevItfZTAX13AtEIwOLoXavoKY1vvwQua4LVVmsgs
         dHnb1qSAD4xoltOxoSPcw2xxU7TtOoCkzl7ysSE5zMASS60/eDQFv7gzdk2aZ3VwYkqi
         PcE1SlM29/5L7mHVnJ7K4I/MLHPRxVs16zwnKo27IpFmJ8B63S7tK6jFFeWIMWUpXgO8
         n/oujmALkDhm7Xcoq7w3+UjIdqLFXWQWW1G75aivNf86ie/U1kEM6IBmyTsL764XvxwQ
         dpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742278; x=1750347078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sb0DG68kqsOtJjiQeRDCa6cNRwoIg8RT6b2RdywqaM0=;
        b=VGTb0otWPwuYkxyhKH4wwOOvl2a2q5zbyICkTw7a5LLhg8rt2D0IK2HS6PyYQzPY2z
         q2GgoYBnfhGbdFV/PUhDcwdCkd9kzUp5jc+fVK1GycA5UEyyW6BMiH0yxfYoKVmpPUD+
         186oA9vdr719APNTteIWSDEamLpwAK263Ax8tizNClQStzp1ui43mKqqpDcLer60/Kq3
         YFto1OzTZd+pz5SpvhCTg7dUSnn/uucqEp2hxQJo1C2UxXhvJB+K7RI7yO4+scNCok0n
         PMaiYeF4Yciev57Psc+hfN5MpuYI1s6+n1gChWkZxllDKVnEHb1i46orbq8xHEZAR89I
         Jniw==
X-Forwarded-Encrypted: i=1; AJvYcCUGYHjvbxG0k1zuUrEWkgOjmCr47Zul4dfjQ38TMPGspDp1KwhRyNv9mT/SsBdIZ8cVfTckAKZlvuX0HFI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9b4M72PB2lSzUcOQntwdEvGsRiH8ssCDrL7U2/O5SskkgLZX5
	U7Sl/Te3aOhKZjjMAOzqEOXszCwRyakdssHNKS8VhbkeB/TB+7sQHHSbUU93UDQVmpDdkPrDB1O
	2JfRG
X-Gm-Gg: ASbGnculY7SThG9cqTI0UJ8H86CFNfjJxRj73mtwjVzPYwuhzDFM8wKZEExAVJlsgrZ
	pfnq83kbKti6FY4Vqn/w1pxMcwXAqZ9KFL7KDZyrl0auOUbqscSiTAHExamaFy2PVrHLbQ5LzQc
	o9w1/JpWLIC9pCiB4F8aHYPPNUqK176R/jkCrovy/Pr2Phx1FigEnE9m4RzPVshvYW3BXjS6whl
	M6Z/u0HGymS88vtVl2MqSHpNIlgHCOm0pDwxPQin/3fwHaxq0/SmkiT6GeOlLGYHz73BQWrB2ow
	mfNB5TSTIhIgOfUykjK0TF8pSX9SSHWwxNz/WFmXpAXDDbyD45OO6NWjEj4CXUCYlqfhVijBUWb
	QBzsO41o7fQ3tm+gNwhF6Z0aXi+igLW0EiF0zDZY=
X-Google-Smtp-Source: AGHT+IEXk1MEAgn3GWL0UwcEnAB3sN4qw0YAKFMnUzzUstHuY7HcHFRe28KwG1k2QdtmDL8omNeQEA==
X-Received: by 2002:a05:6870:702c:b0:2c1:44a9:fc16 with SMTP id 586e51a60fabf-2ead0619abamr220359fac.38.1749742267689;
        Thu, 12 Jun 2025 08:31:07 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4753:719f:673f:547c? ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eab891b2b9sm327301fac.14.2025.06.12.08.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 08:31:07 -0700 (PDT)
Message-ID: <fcd1af23-7d8b-4a0f-bae1-5a60f8876269@baylibre.com>
Date: Thu, 12 Jun 2025 10:31:04 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] iio: amplifiers: ada4250: use
 devm_regulator_get_enable_read_voltage()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-0-bf85ddea79f2@baylibre.com>
 <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-3-bf85ddea79f2@baylibre.com>
 <aErQEn5sdf25Vlvi@smile.fi.intel.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aErQEn5sdf25Vlvi@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/25 8:03 AM, Andy Shevchenko wrote:
> On Wed, Jun 11, 2025 at 04:33:03PM -0500, David Lechner wrote:
>> Use devm_regulator_get_enable_read_voltage() to simplify the code.
>>
>> Replace 1000000 with MICRO while we are touching this for better
>> readability.
> 
> ...
> 
>> -	voltage_v = DIV_ROUND_CLOSEST(voltage_v, 1000000);
>> +	voltage_v = DIV_ROUND_CLOSEST(st->avdd_uv, MICRO);
> 
> Side note. I'm always worry about CLOSEST choice when it's related to voltage
> or current. Imagine the table which gives you 5, 3.3, and 1.2. If it happens to
> be closest to higher value, it may damage HW forever.
> 

The rounding to volts seems strange to me too, but I could not find a public
datasheet for this part, so I wasn't able to determine what the "right" thing
to do is. It sounds like this is just some sort of small gain/offset calibration,
so I don't think there is any serious problem here, like it could damage the part.
So I will have to leave it to someone with the part and the datasheet to figure
out if there is actually a problem here.
