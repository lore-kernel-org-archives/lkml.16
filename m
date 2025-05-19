Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532992D023
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 20:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747685748; cv=none; b=TKvpYoY2R7Ij/M2GdZ/eGOql99vL3uz4lcC2fRs5/+ScO1EgaSV+YhKxNYQ3WA51gD/dChdr1AuHqQcaW9lVMHbi7kF6ltqemHBQHy6YSw1A6ZZhCcUL98wWqcmzRcoDgFLcpUWHDmvv1z29+K9r+xGfS8NgvVLJt9curpXLvsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747685748; c=relaxed/simple;
	bh=8dX8Wr9L4YGOHz+wjN+mZYVu8hwJ3J7H6NpKgGMox/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OjQcSiKZyWDNyYduVs3qxfLSLGCUS0OS4c3V5oPfFj1g+8klA4H5Y7esggxZKVJ8NvPJW+uNbbRLrvNxF821eYVe1dgtWUlDuhysFITeHWdKuRiJhvNURlc0L3A8eZRrvIr08b3o26QWkeA3axFVVlZNbDUtzCThSy7dYLpOtQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=McoLpWvC; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="McoLpWvC"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-72c173211feso1594698a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747685745; x=1748290545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxPqQrqptdt6ZRunnP9xjg4VsQBTXE7UdgcvpQp1vnQ=;
        b=McoLpWvC/nmgl4hDj9EwLeckCAoo+leQLspXx4bh9ImZrQf47pwCUDWTdKRnnHNogn
         ZUtD3L5SEDztK5Jh0rTftRqhzdKLWrKPI981NZWUwZ7IYrWawo2a5NDcbPOyLKibIh/D
         e+N1agNQgVEev7hx8R3jzncgmXsRiCckNodgNn6h5d3+ia+gM+j5F4Q3aOLYKcGyDf2h
         cFnUYjzoWGTG2js1WeQmkm4oJsL+ZnDtAgVathjQb+/7ioGepDPnL/msmyxHZwiAZPPs
         H2S4zU8HBbLKpq3cPmdOvzOHybV1P2RGFzs84TAK0242Ew/v2JEq2w5FJA/h7TJ6WUO2
         KJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747685745; x=1748290545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxPqQrqptdt6ZRunnP9xjg4VsQBTXE7UdgcvpQp1vnQ=;
        b=AHomED3K6lQTnRCovpifzAtXAbgqKJ2BbtEhVao3cEFwRSVF21tjwo3KeQ/pAdR+HR
         HoQduUfYVL7CGiJ7gddHiL/kSxqL1r/gQF7kRI34U53p1ulXt2CVQ93M/kb3yhtApOLq
         20HEf0QIWbxqfL6YP4UVkafbA/ZTKrrXomVDhCAsIwO5TH9LjtHSDXPY10b7GZqqTkYZ
         4Nz4iMjo/GdE9g/wSz75JEMweqo0nAkVAMMioBBsbLUNMyGgKWd7s/BMfg4Mc2/+M1/D
         vWEG7fjimvoKMnW8Aw2JvFl8LPltPPYHc1fCLWoerzk6Tv55PYtVL9QK2mB+Xr6Cn7xT
         SMqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLqHmVGtTZLVOvkYXPeV/M9w0YLKsg4nl/nhIKrH/tSjUTkV8MxmIMytGuLSuGjWcMeVY1t74uvSotCX8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8NGCdO96SrI6EDgI7f4N0GJi5SsyMV5F2cyg6y2C0fMACZFeJ
	NRyHbgB00SZvEU0a3T0xqnadvCGQYdbW6XnKL2dAdi8MIsia7ybugh31P+f5ynS9dws=
X-Gm-Gg: ASbGncuzwmIbxAFzIe4ORMpii0q/FRHWTpBQqIEaK1yz9+al7Fp2Ej7r2ruC87y1dl5
	3S6WtwfRHeYjzxh0WS3Fy7ETCVDKM+SaAcUmScKTItrVo5IzSC3jWwIjqN3rFvvF3FOPgOe5X/r
	8iabj0GFFxOSfDW0ecuDc+qvgQuSnW5m1zeh9atOHJl2ur8AlIqWdU14ACsQrdKDAMt0uq8eeT3
	EGF8Taa0ZnGGo4X9OL6yzLzpFtRUFlqlsIMnDqbANYmxzZ6S5p0cuSQrqqpeehZg4F2f0umszIQ
	TJfmpMpUDAhQY17E5e5CFGzvRGM7CA5O7zMEbwIne5VMPmv1MRL6jA1k8J4h46Hh/y01wF3xgxD
	pY2V9xBxavOKmc+WIJxbWyjrotQrF
X-Google-Smtp-Source: AGHT+IHnM+ogubTeRYfZUDZjML14fl+Syr5GdQv0cHx7rQtXJUm1hDhfIBt4qdixN9KogS4f8h/scQ==
X-Received: by 2002:a05:6830:611c:b0:72b:8297:e988 with SMTP id 46e09a7af769-734f998dc0fmr8973347a34.25.1747685745325;
        Mon, 19 May 2025 13:15:45 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4118:1770:ecaf:ee73? ([2600:8803:e7e4:1d00:4118:1770:ecaf:ee73])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6b5f697sm1541527a34.57.2025.05.19.13.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 13:15:44 -0700 (PDT)
Message-ID: <4843ec52-57e2-418a-b640-8e05ba60959e@baylibre.com>
Date: Mon, 19 May 2025 15:15:43 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/11] iio: adc: ad7768-1: add filter type and
 oversampling ratio attributes
To: 1aff0f813bb3fee55c5483be860b6885abdb81e5.1747175187.git.Jonathan.Santos@analog.com,
 Jonathan Santos <Jonathan.Santos@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, andy@kernel.org,
 nuno.sa@analog.com, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, Pop Paul <paul.pop@analog.com>
References: <cover.1747175187.git.Jonathan.Santos@analog.com>
 <1aff0f813bb3fee55c5483be860b6885abdb81e5.1747175187.git.Jonathan.Santos@analog.com>
 <aCtmt+ozqSRDGQxi@JSANTO12-L01.ad.analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aCtmt+ozqSRDGQxi@JSANTO12-L01.ad.analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/19/25 12:13 PM, Jonathan Santos wrote:
> On 05/15, Jonathan Santos wrote:

...
>> +
>> +/* Decimation Rate range for each filter type */
>> +static const int ad7768_dec_rate_range[][3] = {
>> +	[AD7768_FILTER_SINC5] = { 8, 8, 1024 },
>> +	[AD7768_FILTER_SINC3] = { 32, 32, 163840 },
>> +	[AD7768_FILTER_WIDEBAND] = { 32, 32, 1024 },
>> +	[AD7768_FILTER_SINC3_REJ60] = { 32, 32, 163840 },
>> +};
>> +
> 
> Since we're still discussing some points — is the `step` in 
> `[min step max]` for the IIO range additive or multiplicative? It is not 
> clear on documentation, maybe on purpose or I have missed something.
> 
> Here, decimation/OSR doubles from 8 or 32 for SINC5/WIDEBAND, and is a 
> multiple of 32 for SINC3. So I'm still unsure how to represent this to be
> clear to the user.

Sounds to me like sinc5/wideband should be lists instead of ranges.
It is only 6 values.


