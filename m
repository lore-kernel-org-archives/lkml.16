Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9CB647
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745085438; cv=none; b=ZWXOAmvQby9xItQNLob50NmktIEahHWgc5NZOCJoirEgu4+QxhyN1ym8u+aPcpSAzC8Lg3RJ4mhAd+ci5EOpmyrQfXQn8KMyc845ebAFVzVVJI+ELZkcX/uF0RktG9TuDzG0se9fdLj91rSiELuZHEJpW3dp2tTCHfjGLGfE1bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745085438; c=relaxed/simple;
	bh=mmlxa8Rk/7RKZ2bVqNvnj28XwEsEz6g/FUP9UUVflxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C2DsinPo2OYJ0MmaRfGUASnmDMWJsWFvddo6z0RppuPGP4FFri4AU26ySbfRqQ8pwlxcqZcwyGb4M0O3e/sCygQdkV4EK2NcMR82+/QC6GhF6t6o9423SPG/xr3vHdU9zWOL5Jqdat+lC1OrjSelFqipUqZB/5dCFX0XROy4FCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OpNwLcRN; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OpNwLcRN"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3fea67e64caso1717391b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 10:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745085434; x=1745690234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jwv9dp5ITGuQ5J1GUX4sJX0dj0mGjzAgFo3XEGjECnw=;
        b=OpNwLcRNJFsRBkdqDyZM9QvjFqVeWy2SHMSkUFT2oFDvCBi01TcU9vS19EiFnfkMg3
         3LHugh1xsOBzmUUl8tLUSykGc/V+aZkaOWK8rk76i3Tmr8CAOTsiYUgQ3Wnh6Bf7V+UK
         cII2CfUsTqwQ3G78DFAyIgEe//NGu4X6trCTg4KcPct2u8QwpDm2Dt2tcgK/zTvPz8su
         I0kq837dF4qKRzkgMij9BnQcMlZQQ9WB9aY17qDnS1KqLIAsaGIkyIU0RyDPGNNW5sb1
         tN30GjccbHFPAVJmFMQmoKE87xcNVx+8msKjkSykT2hI0l39Y0DvZymm0YdVFl2WA2xg
         1Slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745085434; x=1745690234;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jwv9dp5ITGuQ5J1GUX4sJX0dj0mGjzAgFo3XEGjECnw=;
        b=oUJfKIT3ibnoZxLddSkT8XehtNOXmQKrJqwnc3jt4KFkeGPj6pxBVuunq2hCP0Ud11
         4iTpLs7T2WHkaz4o6EMy3jlRHjRtGlbaRc0NXyvmPBcvhsvo2pbB0ZH7dwaqbywXBOm0
         OlWMJFgKe83iSsDkT9/3HyFhdGI4KZEQ64VthN/8gx+NWSm8b3bv1353iHhXyRc3xNRa
         sKn2/kwrYWdOY5+TqOLbr7wWlfnJ/z5Oaai4J1ewHcvklWcb5MVNiwRbNvFz2yw8WXcH
         1eppbsl8TAOlZQOM8W73onn/+JyqWO0pE7cif94DbVQQDatezSiWiwdzKko85Wmf7Sge
         0pPA==
X-Forwarded-Encrypted: i=1; AJvYcCWyfVQorclkkBbBIuIWsucdGo9ppvjl3nyPoGSfL0rE5+o2gYabfX9PQTF5/DhrswY/pWBmtDPVv/acZLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV3VFi8SSU3xQdp+EPQSJKYtXi7u07Mabn2Lwngk7/XxD/jsLF
	r7IYRocPuTeRQSY/82mXemu4FUuxlv/aiBXf//WBwZy5BSkocHPiXIs942eK/RI=
X-Gm-Gg: ASbGncuUfRRga5usnswpVowFqabopF+nU357mfsGeWyY5Io2bAFiYhLZ9mVrXoCfqpY
	AR8Xz2FFc/bBPMsSWxG0DnvXhFSclbBRN2wsRpws2eQRBxQIPqcX9aarUB12qxhd2bzFODuOkS6
	9cIyCQvuABkDK1Nz5q8Jl7GZYbdDJlP4CV6BxvyF3kBsU6+75/SGxvKaIOimrEmZaB15abVUFs5
	S/ahQatEViPgq5LaAAVd5u9IteuTFrqxyVpZSG13gvFnYOvr0uhbu4c8mYwaXds/0/REajYE0+g
	sYEHV/k3s7mxEbklx1uK+AoyIzFmPgWCL2lYqk1mEGOWBvUhQslpCrxbm1qxcquYI6axXdZJEYF
	Mm/zuxnO635A8
X-Google-Smtp-Source: AGHT+IFzVhDW/P9qqVJQTA9B6IABAVJUcp+fnfDJo98mF1L/yBiLAzFMirsdskXPwrDNOMkJjIWNrw==
X-Received: by 2002:a05:6808:8214:b0:3f7:28ac:8068 with SMTP id 5614622812f47-401c09534a2mr3337213b6e.13.1745085434363;
        Sat, 19 Apr 2025 10:57:14 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:79a:b8ae:edee:ec5? ([2600:8803:e7e4:1d00:79a:b8ae:edee:ec5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401beeee213sm789037b6e.27.2025.04.19.10.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 10:57:13 -0700 (PDT)
Message-ID: <a834e345-6d44-4fe6-a3ed-cc856e9dc4d3@baylibre.com>
Date: Sat, 19 Apr 2025 12:57:11 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] iio: adc: ad4695: use IIO_DECLARE_BUFFER_WITH_TS
To: Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com>
 <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-2-ee0c62a33a0f@baylibre.com>
 <aAPRbb93lJrnEE5l@smile.fi.intel.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <aAPRbb93lJrnEE5l@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/19/25 11:38 AM, Andy Shevchenko wrote:
> On Fri, Apr 18, 2025 at 05:58:33PM -0500, David Lechner wrote:
>> Use IIO_DECLARE_BUFFER_WITH_TS to declare the buffer that gets used with
>> iio_push_to_buffers_with_ts(). This makes the code a bit easier to read
>> and understand.
>>
>> AD4695_MAX_CHANNEL_SIZE macro is dropped since it was making the line
>> too long and didn't add that much value.
>>
>> AD4695_MAX_CHANNELS + 2 is changed to AD4695_MAX_CHANNELS + 1 because
>> previously we were overallocating. AD4695_MAX_CHANNELS is the number of
>> of voltage channels and + 1 is for the temperature channel.
> 
> ...
> 
>> -/* Max size of 1 raw sample in bytes. */
>> -#define AD4695_MAX_CHANNEL_SIZE		2
> 
>>  	/* Raw conversion data received. */
>> -	u8 buf[ALIGN((AD4695_MAX_CHANNELS + 2) * AD4695_MAX_CHANNEL_SIZE,
>> -		     sizeof(s64)) + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
>> +	IIO_DECLARE_BUFFER_WITH_TS(u8, buf, (AD4695_MAX_CHANNELS + 1) * 2)
>> +		__aligned(IIO_DMA_MINALIGN);
> 
> I would rather expect this to be properly written as u16 / __le16 / __be16
> instead of playing tricks with u8.
> 
> With all comments given so far I would expect here something like:
> 
> 	IIO_DECLARE_BUFFER_WITH_TS(u16, buf, AD4695_MAX_CHANNELS + 1);
> 
> 

We would have to make significant changes to the driver to allow u16 instead
of u8. I don't remember why I did it that way in the first place, but I consider
changing it out of scope for this patch.
