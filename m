Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6CD1D6194
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 17:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745085567; cv=none; b=EnDWpnpZ3B5SrDvow6YOsE18gcTiqN++oETF4FJFqHxW/jj2rnMc6rWAtOUCRBWo+luyUHoz3b+tf9TtP6vUmc9AXuAAqBKnP+ddqLkNMoYbxorqvpX1Dt2HKU5tK5rCgTslZZlQKPHhii+OWT/kAMH/YKCuIzlZdXSnf7uwrxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745085567; c=relaxed/simple;
	bh=loa3ZAk98fhExGreOeZfWaBVIuP0spjL0QRNRXHFInk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nsOY7XtNUpTzr36dmgo40ae+lvSEU4BI9IcdGgRP+LreZlWXGzgyohh6sNGNcWF+y2E89sz7xHlcGhpls8ES6bP3ieTrJR+8dPkzvxCzRWAERyEPQE4Aimsr1DYalPlmls+m8WQViphYwfqP7OUbLWoyrndE9CH21+rUlb4QUmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ln1WftwC; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ln1WftwC"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-60406de9cbfso945171eaf.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 10:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745085565; x=1745690365; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cnKkaunDg3dQk+CBekNNA4Y8Jf2sXD/RRi4cvuDwGr8=;
        b=ln1WftwCOJOloDZzGkC5U7+Gfun8qoD0n7rn/nKxuI33vzpE3qAWIfsVWY7w/VxKgg
         ZLjfDsBhnzSvpXPtva+vX5T1KXqPnHQXV8kUmYqDG5kd4wjWb9bDmZcY5m/jydqJ1ntG
         9XdPkDSy8NopE/tfegfieqtdvrQOQBZMBo2DlTeMXFoz0PqMQU2AFhcIQaEC+TX0MfFE
         OKPd1ypek71d6tzl9rZwIa2HhcXnar3SMyvWOySdjvn5AzdXndbAskNkeX8sOA9fX961
         7rqT1O9AF6ctwuoeHqpelUq+DYEUIqaCMTfgMp7QwCc1bT3rZvIbuCKsHI1Kj4OEfr30
         erfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745085565; x=1745690365;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cnKkaunDg3dQk+CBekNNA4Y8Jf2sXD/RRi4cvuDwGr8=;
        b=RGrXK9Ew5zQcPNcDMggzOUsULxF4Q2L4A9irF9DjvQS7AOVUckyYwhV6cPxeNKsbCn
         8rvCN7IF9pO5RoKwNgrhu/DDo3nNe1+GX4P7UpHnEtGYkWIS4eZy0PhhF4jxPjF4HqUQ
         Rgc0KBo2ZNrbR1VkTkvRGQSPUKVQjpHWrMM0wfR1I5WHFW93jssjOZ6n2uEZQ04fOJZr
         Vod9oSN5iObtVp0QHD7U08KGTeEHeAsTKPdlb/68WkKaFrfL5x0VyxcGnbw5FSitpYrr
         em0kWqbW9M2twxUXqnmz3+xNhhLL4287u0dktF6S6f+VsJI/90nCSOw+AvgWXOw5dvKf
         0w4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXv2CTSOIMYv2xfk0jcPPRC/1HH1ZSeGIGs3vnk/oKfAeZdBopINh51UH4vJeSavbH4bFjbXzc7stgRGUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlmWyw6GvlVtBm5pM5GFeiFgYlefC3F0eLETj2eKXuhMA3zmX6
	GR+Ps0WGDI1we8sP292Dj7c5bBxMp8eSH48WNw0WaCNqM4B4vVyEFK89fO+X6ew=
X-Gm-Gg: ASbGnct0+WfOx8VzDttwaW7kvK/YdG/x1lvUmuV0h+u+ozN7jlMBfytusWkfl0hpXtL
	9yntGL1aSpRMZG4E1EEto1DdTIHqU4+yHIjhfFkbYPdxGWTax886d3Mp+e612eAgFlxGD8rzcXD
	TZ6C6COh95vhyOmVo1wAJIUd9VSuunxjW25adEPF61eYwKyacf5NEc7uV7vZwp0KZsGWmHTHhDN
	OO29fxwhXgbq1f3C+q5H29asiN89PpYmucEhuLvNQDbcF5VGpMD/24s1NPejJQAKpIj19m1ZGJL
	YmNhRkgs9t8r1WMavnC5F/Kw5hh/0Mv3YzLmTJAaFw3tRC2NpcZvs+5lapm2xlrRdTB0nO1jor8
	b0ZRYyJWbQo7uByJApU+ijik=
X-Google-Smtp-Source: AGHT+IE2D5qncdnG7FkcjLIJjmUIbO0uuju/gqzyq/hCHB8+uhQUtCCkihQNGxoVbkVtsyhdlp3dwg==
X-Received: by 2002:a05:6870:b617:b0:29e:6bdb:e362 with SMTP id 586e51a60fabf-2d526a8744emr3496875fac.17.1745085564736;
        Sat, 19 Apr 2025 10:59:24 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:79a:b8ae:edee:ec5? ([2600:8803:e7e4:1d00:79a:b8ae:edee:ec5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7300489abecsm768104a34.59.2025.04.19.10.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 10:59:24 -0700 (PDT)
Message-ID: <71282f99-ae6c-463f-bd62-1e0664a549e1@baylibre.com>
Date: Sat, 19 Apr 2025 12:59:23 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] iio: adc: ad7380: use IIO_DECLARE_BUFFER_WITH_TS
To: Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com>
 <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-3-ee0c62a33a0f@baylibre.com>
 <aAPRh7f0M9fA3U5a@smile.fi.intel.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <aAPRh7f0M9fA3U5a@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/19/25 11:38 AM, Andy Shevchenko wrote:
> On Fri, Apr 18, 2025 at 05:58:34PM -0500, David Lechner wrote:
>> Use IIO_DECLARE_BUFFER_WITH_TS to declare the buffer that gets used with
>> iio_push_to_buffers_with_ts(). This makes the code a bit easier to read
>> and understand.
> 
> ...
> 
>> -	u8 scan_data[ALIGN(MAX_NUM_CHANNELS * sizeof(u32), sizeof(s64))
>> -			   + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
>> +	IIO_DECLARE_BUFFER_WITH_TS(u8, scan_data, MAX_NUM_CHANNELS * sizeof(u32))
>> +		__aligned(IIO_DMA_MINALIGN);
> 
> Why u8 and not u32?
> 

Because this driver supports many chips, some need u16 and some u32.
