Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E222C2569
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745361425; cv=none; b=VZF62E3k++UWFDJvkOvBKnQ3v8rffEWchGU0w6A7HUOyp049AZaqk6aOF7ZqU/JRd+9oyHJgtsyMLxklD/+9JK9ud7eg0T4feQ1UtEsMNo+BpM1heHqLD9v8W+7/uDegpd408n7AYUn1XNolELpA3OOVm+N9jqH1dTjt2Dv8Fog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745361425; c=relaxed/simple;
	bh=edrSoU/7ttYT1N9uHXGev19DEKDxe8wPMLxCuvyp7cI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i3vvCoRgNLL8D8D0TiMs5RKJdvRJnnOdv1plzMqhHbaZ++povz54KkORZpphQcWkhLggwi24Be9YyyqKkocfHp0vV+FTktmV5hVc2bch5os3BZXMb0UIyi5ke/2zh+Zwkk0yohdAyOPAQVaN4Mjjj5hyDtf7ucVgGWfxgwGz1BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=abEdhaKY; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="abEdhaKY"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7300069c447so2451165a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745361422; x=1745966222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GFEryJTJrYlbNEPG6EOeE5cZYQCM6sOwjcE6fp5zhZc=;
        b=abEdhaKYN1x8l05/su0heXu8/eMrKo1Q51fubhImCPcjYNYKVCFlalQdgjg+S4crHJ
         N+EoOKIw2pTkhIb1TahbQKje0Z2VAO9c+iUE2UcvgFIx0sNOgVQfVyifnWFNxL4SCWcs
         sSLNe389pAbedh5oG91N5ix8/tClR8gX+ITyeldn9g0FnwlqjdpA5dXSXx6mVJ9dyR9I
         LtkwXnsq2BGiuoWVQ8X+LLnIMHM+AT8n+ieAK6UUEUCOPMlZxvQFBvlYXluhiY6eG7Nu
         0oc7T6g9mNoRq6rz7r8yMynMpANuWG6sZPV2gtOWTVbqLiCe/wNhDdhR79Cjc/fBzm3r
         I0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745361422; x=1745966222;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFEryJTJrYlbNEPG6EOeE5cZYQCM6sOwjcE6fp5zhZc=;
        b=nogB4owyc5efngdSnLuJaSMTLCLJ2nE27uSxY3heMXzbQUy6LDxlBR+gENgy/pAQfh
         Ew7Qqy0zKswvo14wviIdLBjJAzhlREo7bMGhsX9xncORGxCJNKqaoF7RYuDEHoqu7aIU
         uaZjUOIJ495to2PUq8h4IkvZOAOI4q1fIatII/n/xu3PiC2PMuNFmkSQTmJ/sWrBfjKR
         Z58/FCnJ6uM2o5QE4U8VrPkH7axV9+wVH/WHoGFzhE22XFagb1NdWhnQHiJXSoHFO+7H
         JF5j/ndb31VlacVC+hucHm7/gk6SNC/ySaIUVfDnrWAQOuuOldSO2CcPdPUUd4LJxRDJ
         +9XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGU81ktiTkc8FT2GWqm26OoeCOEPcocyINhAICTpbv7Zl+AhletJwLzmJV8AvsPVIMyfaMc4bmQbl5Q+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxurkXiYb/nLScuVqq/HPzq2FR+T/7RhbzCTbQ6DZt8sj+QzC13
	26/2uqwBrW3t2oBo5DAfeUPuqXaHVK6ovgyAJbxzLd0n/zXXWi36Lqv2jNxu2TY=
X-Gm-Gg: ASbGncvLKeu0ujEN2DLew5YlNqhaqYD50azLPKKb3FgPGobcTxUxQ1+hA7A0J0MWhuy
	toSRYR3W70qmuVqsrBSk/YpqfMMELZeP96prTtEKTWzp/uxLSedhRuCKur32yt1SGJIBeAf4lxm
	QWE/1cmYzy07tiqQuqWEHOzADPvUuzf4EPpAlwCVbJcvY2PEdaB7QPUPuMuhm44iJWep0oO52Ep
	EydbWguquicyv5O90fyargNWRly16Tt0PrAupANl7HCWifM9whj+fCQHbkK+yWPdSesK5rN+C2J
	B7gaKvcXQbpMimWw3SsjQTsVhU+SppUnRqIKv3USjZfdyHOXpy3Ekv3f8H+M7RCwU3XaNZwPyzc
	dSKEeRsUaEOan5ip6Ww==
X-Google-Smtp-Source: AGHT+IGgff0HbnynsiGyzAMNRyImRsk0W8jB40NIbqdBsgqXBc+HF8ytnQSIYbKf3QzD5ZMhIHryIQ==
X-Received: by 2002:a05:6830:601a:b0:72b:9d8d:5881 with SMTP id 46e09a7af769-73006336191mr12246352a34.28.1745361422741;
        Tue, 22 Apr 2025 15:37:02 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3? ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730047afc11sm2208277a34.25.2025.04.22.15.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 15:37:02 -0700 (PDT)
Message-ID: <f0948adc-8130-4417-8c59-f0b52a7a0e01@baylibre.com>
Date: Tue, 22 Apr 2025 17:37:01 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
 <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
 <CAHp75VeuNhfJrNAZZwY2tEHte=UPHLOPNUz7y_J20xv2+_Zdeg@mail.gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <CAHp75VeuNhfJrNAZZwY2tEHte=UPHLOPNUz7y_J20xv2+_Zdeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/22/25 5:30 PM, Andy Shevchenko wrote:
> On Wed, Apr 23, 2025 at 1:08 AM David Lechner <dlechner@baylibre.com> wrote:
>>

...

>> +_Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) == 0,
> 
> Why not static_assert() ? Because of the message? But static_assert()
> supports messages AFAICS.
> 
>> +       "macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp alignment");
> 

I just knew that was standard C. But I support BUILD_BUG_ON_MSG or static_assert
would work just as well here.
