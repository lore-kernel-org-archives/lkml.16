Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E817A227E97
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745941219; cv=none; b=miuRKpvDoiVOR13gc25Pls0aziuHb9+EkW3VGSY9URwWBmCwyZ/GMP/q/ZgSiAQ6WWYXJqrGsSTEluDNwslVn99TqqTIWpMHPrfLKRPsr0pyQf/6HNEQMnP8pVwcvv51ram/uHnmsKwVxmFf5T3gvWzCuzZ9YynALFgBwxEYp64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745941219; c=relaxed/simple;
	bh=ZSlaSOOnAD2Cp1tBIlvme8AqpEDC6hlg0gqvRaVTa9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMBemEw7Bff9rfnXSUvyvjXR+0dN5rv8OI5MTzfRjeyDZsX6rn56Q710xq1SrxfC4CjDnGexVOPlzFWoWzmawNw7l50jal6MsGzXGX3pgyoJWtYHVNa4vbDTet5Igl0vQ9RsFT/xT04b0L+TPc0elQ0CQ5tUUzdZ17F52f/Gmjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YcjTq8pj; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YcjTq8pj"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3fea0363284so4130333b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745941217; x=1746546017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKHZLFnrfagn8Gc44g2MZTpXJ9t5oidezhlrUDWVs0Y=;
        b=YcjTq8pjS1P3iyQIQa+y+f0PTT18kC5URqpqC9eSdoczJ6mSQCMKAsI7zZbclH4vdV
         HqaQfHUEd7ZmdewTEWlob4/Yo7EF5XyM8iH2A4SKgdq/Der4dxzrXCW3zsXwDofH2gHj
         3+gBjYxeR3a2bCKBoKBdhdY+hU++Cvw32RsEZ/x6ZmbGygg1VyCTEyNzKp0r+EDN6drJ
         jjYYPGdxTvwkPHX6c5FAZ0D7+2jhC9wQLn1z5mw0SJTVzYcyzXmGZm7e1QEMOf/IIPkj
         CTcD37u/Qmw9ggMLLHLLW7v41et1kE4yrw33wtRjv7LA17ZtgYwBPY6G5jJ9WdrBg74H
         pSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745941217; x=1746546017;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKHZLFnrfagn8Gc44g2MZTpXJ9t5oidezhlrUDWVs0Y=;
        b=gGWYYsaqDeeDM/mfqUpz1VeOeHuLX0wpiHcZiawyk+RHWCGi1bimvW3jYiHpaxNYM7
         Ji4KFfNZd/HKaS0dsqIDN2GaOxDlcWB0dmOarx+nimaZaQ8X9pk2uw74ClFwaEg4vDAV
         5IzVif03D3sp7UYOYJkhmkRYZ0hhYF9QkfIr91QfFl1DeuId01069qcR8nwUj0UJ3TgK
         TXpZTGE8mznyclxue1Pvgq6T7tVDT4a3KjEP/uPehRP1tYTDf9t4msSrxvdn4Mcmam48
         dAc5LGhOXv0x9f3qZR+2sW8n8UEuReE6/+FtOj4tJGZKvarulVfyYcPMpy6/andblLPa
         zvUg==
X-Forwarded-Encrypted: i=1; AJvYcCXU+PKIPjLwWNZaT5DJMUK4/4efqMqltwz3/Dzprvn7kozZpBfKuCCNe279CPoyJgmmYMoLW+WW/TM+wq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YytZUyT3pPv5VJoSudVZI8w7Bci8+9dzK5pYsDbsimGwIQxJvl+
	527L08AYzKwlD9pWwAR5cLgxW1rU5P2Chn5fMc+u9DUgkrxM9Xns16v8eK1osNM=
X-Gm-Gg: ASbGncv/TmJcpqTuhGgV5cVLIm/vv7jLKOyku3QXm+GXJGpVldoRlIEH2eYF1pj4O9I
	IPVfPP837p2KCvx72LnTAD5m6cTwzv3tasD9SgCkzbW2UdTECGpthjeZXn9UHu6/Z6jMZxNW4z0
	tizsliEpYV9LH6ZUHULOjcqci64c2PFTcUloRzrCSiDowvAOb/knC5lMU9m/ORUGkLouqX9fPtw
	fMhGN9w9HE7DcyPCgWgAWrYnIQWbh0Dez7PowieiyOtelKuKKgzAy1q9FYxFI2LrrnIpHeG8cO2
	K9RYl5l5tKYd6/eWQQHECRa/Il5RS125bx21yxhDN2YMQrfNxiUbIAsi2l8MJP7Mk7tKL/A1RnX
	TpUfIySVh5nnt6ap/AogyiuirXC5l
X-Google-Smtp-Source: AGHT+IEoUSoJwOEaMAzGJzx8g+iEjy8VILrk9/hm7FHFKGMS1oJnNn7zWdRkCw1+SUiqaiAkTKDS6w==
X-Received: by 2002:a05:6808:2214:b0:400:7dd3:2dbe with SMTP id 5614622812f47-402110303f0mr1770338b6e.14.1745941216954;
        Tue, 29 Apr 2025 08:40:16 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6? ([2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40212c4d567sm293636b6e.43.2025.04.29.08.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 08:40:16 -0700 (PDT)
Message-ID: <5aa4d76f-6f16-40ae-9dbf-767c63aa0a3d@baylibre.com>
Date: Tue, 29 Apr 2025 10:40:14 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] Documentation: ABI: add oversampling frequency in
 sysfs-bus-iio
To: Jorge Marques <gastmaier@gmail.com>, Andy Shevchenko <andy@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pwm@vger.kernel.org
References: <20250422-iio-driver-ad4052-v2-0-638af47e9eb3@analog.com>
 <20250422-iio-driver-ad4052-v2-1-638af47e9eb3@analog.com>
 <aAe6u6NhAsgjaL5_@smile.fi.intel.com>
 <c3i7g273lgvx7rpihzq6r7exxxnglbwrqwfryyz6ciqo52tszf@cvi7pz4bmkvq>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <c3i7g273lgvx7rpihzq6r7exxxnglbwrqwfryyz6ciqo52tszf@cvi7pz4bmkvq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/25 8:47 AM, Jorge Marques wrote:
> 
> Hi Andy,
> 
> I agree with your suggestion, and in this case the appropriate kernel
> version is 3.10.
> 
>>
>>> +What:		/sys/bus/iio/devices/iio:deviceX/oversampling_frequency
>>> +KernelVersion:	6.15
>>
>> Then why don't you put the real version of the first release that has it?
>>
>>> +Contact:	linux-iio@vger.kernel.org
>>> +Description:
>>> +		Some devices have internal clocks for oversampling.
>>> +		Sets the resulting frequency in Hz to trigger a conversion used by
>>> +		the oversampling filter.
>>> +		If the device has a fixed internal clock or is computed based on
>>> +		the sampling frequency parameter, the parameter is read only.
>>> +
>>> +What:		/sys/bus/iio/devices/iio:deviceX/oversampling_frequency_available
>>> +KernelVersion:	6.15
>>
>> Ditto.
>>
>>> +Contact:	linux-iio@vger.kernel.org
>>> +Description:
>>> +		Hardware dependent values supported by the oversampling
>>> +		frequency.


I don't see oversampling_frequency used in any existing driver, so how could
it be introduced in kernel 3.10? I think you confuse it with
events/sampling_frequency.

oversampling_frequency is new and so 6.16 should be correct if Jonathan picks
this up in the next few weeks, otherwise it will be 6.17.

