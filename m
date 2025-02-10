Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55B21B425A
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177950; cv=none; b=qoZlwYv6iYAWF8DfzYSKFunO4ARTjN9r2DfGPVj5XPY0qjuxF2PHwBD8SEYY0qulQHC2u0eSmelL0XJ9YLTK2Vd+qRr60AAN19apQukDQyZJuLROIVb9u0YQRA1GpjdLCt16l+7EuGZ0RWxbr1Br+Lw2UJx4Dl5Bk4fRNTno7/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177950; c=relaxed/simple;
	bh=r9kfscMu2nQ0HRBU8e9l53pIAaPhrUF5mA9gkyOUvGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dpgH6ZmpLra9zuvvEYJwpF9wWB6tuYecGUlsfuyVetMgogBPUYgsUtzfCrjTqN52zkLhFxRTFEiPcq7lWwfVmIvO37DT4hiWhLm7f9c7dRNn5BsgCnj7sSSwrNTcH/I5J/0Ujim+FlAPUnVOJWDKMd1PTASzOmA7y0BheuClmMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QKQz9lJh; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QKQz9lJh"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38dcb97e8a3so2201642f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 00:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739177947; x=1739782747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgguTSFnjwWEUxBDa2C5Pf4WCfOFI/5UFo5VErVUJi0=;
        b=QKQz9lJh4MU4d7M+yyZEL3U+fQY/fZe7sKfb1tWuatdbn/tbxwx31c8q8S4Cvc/IdJ
         4H2RgNasN2geJh+pWXv3I6FXwTffx9T2SpweypnvLKQ7nQUarr2sZrNZ8FQLhv7jzfde
         hev4NIWOf1iprkZbItLcR0ynUBiCPMLPoNGUocwu3I+GEekr7420rdfP9y5saow3ekuc
         FHGvQ/hOo3fyDEzfpjhWvulSguero1dQiYg57qQ/DwvWKgXnDWUyeSnJIgIQ926mozve
         F9Ms0+kQCfn6KsWqfIndBEveIe1Ovb6Tc4dtR6HaLd5+SlGL9A3TdsKRcWMXvu22zND1
         vhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739177947; x=1739782747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgguTSFnjwWEUxBDa2C5Pf4WCfOFI/5UFo5VErVUJi0=;
        b=Fj+/if5PDtHAKP0Y5vl2otfbxf4g8BA44g9taqONu32rnzP5my3m8wY0gQ8xw8B3wi
         hP5o/okWHysJZOIBioXceXMRKkSYWxnm9sGlrEVYWnVDOQhRfx5OqEDWy7U2cVyeI6zJ
         w8Yg3j/ug5PSp3AK8q8RDnYtTH9uSp12bXCzFJJFASjbzLZtZ8v5FetrhOaf4Mivcw9T
         Rvh2mWt+XK7B4izsWx7nOsO9wJsnJoIJED4b3eAojrDGuTOR8bswHLKwQ3Y7mVC9/vS1
         WB3Vsw4JBH23Tb3Fab2BcSxfiMknME8r2d551iLr3DFSxGzCeZdUENjMLTCFu8Yy3FsH
         RsiA==
X-Gm-Message-State: AOJu0Yy+QYdGlwhTS7DIcX29f6Q3swgeXsGfmNsjw+RmmCeviOq4jOCK
	oa8VdaLlQsJYkQM6XAODxxGX166eSpRhCpSTtLh9EC7xlkpFzJkKbjPS07A00Cw=
X-Gm-Gg: ASbGncvKjUfSiENAx1uRsL3CfJWyp8dTmPLE6zThlqhGqNncgdRKQ0eYvWwaIDfAC3k
	j0ZrgEl9DGrtt2pnu1r4T806O/QEKrdNZ57j2XiyQrJgwvFlaotK9yvc7H4O/Pzfy+NxRLOrmu0
	MXw3ZIks06k+CCixeUyUxqtM/59GYjLrzRok15M6xnNFSyjuqYIx1Bf37ZaFUq9vhvikJNnhqbs
	7Wn07qLe2owj3rMAN+NGTUkyM1di6fwW7DBw6sQrC93060khfOjfI23abkfsz2A0JcQG0ZKwAA/
	a82IqHMkxGybKWStYcFgyE4Y
X-Google-Smtp-Source: AGHT+IHW35O2w+OVAfjf6xNzfb+RSzDit7DIG4eCcKdu75kyP3tGrbONMFt1iHptvel8q6LbiT3P3Q==
X-Received: by 2002:a5d:6d8d:0:b0:38d:dac3:482f with SMTP id ffacd0b85a97d-38ddac34a13mr3776794f8f.20.1739177946954;
        Mon, 10 Feb 2025 00:59:06 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4d826c6sm6159674f8f.69.2025.02.10.00.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 00:59:06 -0800 (PST)
Message-ID: <503b7ec9-e0b1-4351-aa34-3089b2055eb9@linaro.org>
Date: Mon, 10 Feb 2025 08:59:04 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] firmware: add Exynos ACPM protocol driver
To: Markus Elfring <Markus.Elfring@web.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-team@android.com,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Will McVicker <willmcvicker@google.com>
References: <20250207-gs101-acpm-v7-2-ffd7b2fb15ae@linaro.org>
 <e1fffd3b-d3dd-4f46-b7b6-1f03f934dd30@web.de>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <e1fffd3b-d3dd-4f46-b7b6-1f03f934dd30@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/8/25 3:31 PM, Markus Elfring wrote:
> …
>> +++ b/drivers/firmware/samsung/exynos-acpm.c
>> @@ -0,0 +1,771 @@
> …
>> +static int acpm_dequeue_by_polling(struct acpm_chan *achan,
>> +				   const struct acpm_xfer *xfer)
>> +{
> …
>> +	do {
>> +		mutex_lock(&achan->rx_lock);
>> +		ret = acpm_get_rx(achan, xfer);
>> +		mutex_unlock(&achan->rx_lock);
> …
> 
> Under which circumstances would you become interested to apply a statement
> like “guard(mutex)(&achan->rx_lock);”?
> https://elixir.bootlin.com/linux/v6.13.1/source/include/linux/mutex.h#L201

I'll replace the open-coded mutex handling with cleanup.h guard(mutex)
and scoped_guard(mutex, ...), thanks.

Cheers,
ta
