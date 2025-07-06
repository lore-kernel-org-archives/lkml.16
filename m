Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EDB846F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 16:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751818091; cv=none; b=QSf3mmBhSfQtwnsFbJ9Eb7cg23Ug//Hc8eemcDsfRgJtAT0+rj39nWxCsmOYdwJJuHT9PZlQWZKdtbJODyosfN4qLaKC1vZ04aqGQ9Jf3mQ8yf3OrvR34t/Tg6n45WQgiHU8oP0KPGWOXnV5rtWMN5tZhHDmixtsGi6KleHq21g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751818091; c=relaxed/simple;
	bh=m2P05b7f+RnhHST+hGm5MW1rRAKUBxgpynsySS/Ybzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CS+d+g+TyUQ/S2ZQWXYjKD09tVCsnC01Fpd71UYtg8UFinz68UHNJ236JqU+R8Y+Fm8tKJtTrzRlSLAxeHhkKwmFK6cuvXgl/YMuyHhnqqPV/rdNrJ7615JjuNWEN4dBS+wIl9LqhDpxMOtFVn8gSaMSmEp5sQL6RUdCCadeJtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=q156y9wE; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="q156y9wE"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-612033bb26cso1302810eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 09:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751818088; x=1752422888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wHGQkqiwnQSHiVoFPqj0gMTlpD+iiYU94AHxqO2NnS0=;
        b=q156y9wEfoPYI88j+YQjIIpxHtWADk/Ka5b44eNm6onCJK3J8g0LdsJigCh3QnORuP
         6NyoJfIQxyEMiMOgPGd7vp91IYh/omtjf8G3ipGGNo4h1oA3OK6kLdcaMCQDIStOkh47
         7ocb+u/O2022esOYpCM0pIebr/13lRk3nDJ848DJnlYAAkHdBFA5P3NUsTZ2YMjSTqqp
         Kg/bNkAT4cm7nnPQ2VnncBN2/oKTxkGb97vZvf48Bn0shy+DQlabiUWuknKliw+Vsp0b
         OZuqZrK4yPZiqXU/c7ktLGRp5PsCCmtJVGNrnQ9xloQ5cFKA7R7QuxdlR9IAVQ7ryVNO
         k1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751818088; x=1752422888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wHGQkqiwnQSHiVoFPqj0gMTlpD+iiYU94AHxqO2NnS0=;
        b=RSUwDg1xa/Ajzz9OCq7JuJn94zpnYTEHd2IHt3o3C/tBg6gZliYgDHwARBwvaVs852
         JdhM2fN/UrdV+nHna2bGEcYWZVkC1sW59KTtZXsZ7kLWkkf3zu45cxlNsjxpjdyeO1jI
         D8f3UbUje1YS9LqzNTFLGZt8w08rC9L9OLZUNIbi7lIj0rywO6slJgTqpsOIFNRIF8FI
         AE61voJ7OWc9ce1NFlIs7vIQqCWLVBbef5KK/JUEQkn5tqs41iBAelyI79q/462xcfIr
         2l9w3NNcu3646t5KaTtN0Qf7dRopGU63H2CfuZpnMKlA4YhUTSjL2gJIxsKbISZe1ahs
         0zvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUluwvF9f/2qRTt57l+bwTn/YsmC9oWb8UVSqeHBIKy2ZcYR7sPg712ZaVmXGZBT6gWxxXxANiEBUFUZtU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykz8SNJKzDXJeF+hJ8xPtnb1qdDM7wLcHGN7BpRx7GyH+tNPIY
	yM2IBuFFYx+02+xWD9gull4g5f+O91JVyU+XYZezjq96evjQvuGj9oVmdyGEdI8iyxM=
X-Gm-Gg: ASbGncvao1JfRTOohrYRUWvdLR2QXgcJNWlMPdI4KXkO5evYyMiBouh+9zX6Jo+F8Ch
	7BC/zbGqL61m+hx/K3ae8iYn8pvckYqHAI8tsI0k7HjhOq/ctvWI/IWldi0BfWbWAOEDgtcmmMm
	W0FXOuvbb45PkeEzsd23CgRmx2jA1Olw48I7/5HjOCD+TRjEnSVIMFJO/7Yy0+9ALEs/zOOakDy
	HJfRB5iBiLi65VOtOVRur700anm8y62kPA+j8wWsdX2xOq05GNhrY/z8pKlT11jwosHC/RuF3m2
	AAYg3BCoM2oF+yvTTilxNBFGSntanH19uz4+O9C29aiZ8tw+ma3rvUF6wKRSyGeJMHgSy6mwPDQ
	t2WVV14HuozrHqO7LIYVChn6s++BDpg3PrbIm
X-Google-Smtp-Source: AGHT+IFibN5etCJU6rb1ylqBk8XweggyERdFs8RllNgfLgWJSWehX2tdvKIukg3/0VvTTCkslckDQw==
X-Received: by 2002:a05:6820:1e06:b0:611:bbad:7b62 with SMTP id 006d021491bc7-613a007a7aamr4697019eaf.3.1751818088301;
        Sun, 06 Jul 2025 09:08:08 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:29a:290f:4321:4624? ([2600:8803:e7e4:1d00:29a:290f:4321:4624])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6138e5ab33dsm1019817eaf.28.2025.07.06.09.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 09:08:06 -0700 (PDT)
Message-ID: <78342e10-7211-44de-8a92-40872a69b60d@baylibre.com>
Date: Sun, 6 Jul 2025 11:08:06 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iio: adc: ad7173: fix num_slots
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250704-iio-adc-ad7173-fix-num_slots-on-most-chips-v2-1-a74941609143@baylibre.com>
 <f023c92b-183c-4157-a6eb-ff722dfd716a@baylibre.com>
 <20250706111529.360a3095@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250706111529.360a3095@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/6/25 5:15 AM, Jonathan Cameron wrote:
> On Fri, 4 Jul 2025 12:04:04 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 7/4/25 11:21 AM, David Lechner wrote:
>>> Fix the num_slots value for most chips in the ad7173 driver. The correct
>>> value is the number of CHANNELx registers on the chip.
>>>
>>> In commit 4310e15b3140 ("iio: adc: ad7173: don't make copy of
>>> ad_sigma_delta_info struct"), we refactored struct ad_sigma_delta_info
>>> to be static const data instead of being dynamically populated during
>>> driver probe. However, there was an existing bug in commit 76a1e6a42802
>>> ("iio: adc: ad7173: add AD7173 driver") where num_slots was incorrectly
>>> set to the number of CONFIGx registers instead of the number of
>>> CHANNELx registers. This bug was partially propagated to the refactored
>>> code in that the 16-channel chips were only given 8 slots instead of
>>> 16 although we did managed to fix the 8-channel chips and one of the
>>> 4-channel chips in that commit. However, we botched two of the 4-channel
>>> chips and ended up incorrectly giving them 8 slots during the
>>> refactoring.
>>>
>>> This patch fixes that mistake on the 4-channel chips and also
>>> corrects the 16-channel chips to have 16 slots.
>>>
>>> Fixes: 4310e15b3140 ("iio: adc: ad7173: don't make copy of ad_sigma_delta_info struct")
>>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>>> ---
>>> Changes in v2:
>>> - Improve commit message.
>>> - Link to v1: https://lore.kernel.org/r/20250703-iio-adc-ad7173-fix-num_slots-on-most-chips-v1-1-326c5d113e15@baylibre.com
>>> ---
>>>  drivers/iio/adc/ad7173.c | 37 +++++++++++++++++++++++++++----------
>>>  1 file changed, 27 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/iio/adc/ad7173.c b/drivers/iio/adc/ad7173.c
>>> index dd9fa35555c79ead5a1b88d1dc6cc3db122502be..9c197cea11eb955becf4b9b97246379fa9c5da13 100644
>>> --- a/drivers/iio/adc/ad7173.c
>>> +++ b/drivers/iio/adc/ad7173.c
>>> @@ -771,10 +771,27 @@ static const struct ad_sigma_delta_info ad7173_sigma_delta_info_8_slots = {
>>>  	.num_slots = 8,
>>>  };
>>>  
>>> +static const struct ad_sigma_delta_info ad7173_sigma_delta_info_16_slots = {
>>> +	.set_channel = ad7173_set_channel,
>>> +	.append_status = ad7173_append_status,
>>> +	.disable_all = ad7173_disable_all,
>>> +	.disable_one = ad7173_disable_one,
>>> +	.set_mode = ad7173_set_mode,
>>> +	.has_registers = true,
>>> +	.has_named_irqs = true,  
>>
>>> +	.supports_spi_offload = true,  
>>
>> Well drat, I was too quick with the update and the bots [1] noticed that
>> this conflicts with the in-flight patch that added this field [2].
>>
>> I guess we can drop this one line, but then the other patch will wait
>> until this fix makes its way back into the togreg/testing branches.
> 
> I'm lost - what would you prefer we do here?  For now I have [2] on my
> tree but can drop just that one patch if it unwinds this complexity.

I was hoping you would tell me. :-p

In any case, we should apply this patch, with the supports_spi_offload
line dropped, first so that it backports cleanly to the stable release(s).

But where to apply this patch depends on if you are planning on doing
another fixes-togreg this release cycle or not. Or we could just opt
to take the slow path to avoid the dependency dance and just apply
both patches to iio/togreg and let it make it's way to stable after
the next merge cycle.

>>
>> [1]: https://lore.kernel.org/linux-iio/202507050018.iWEJiG04-lkp@intel.com/
>> [2]: https://lore.kernel.org/linux-iio/20250701-iio-adc-ad7173-add-spi-offload-support-v3-12-42abb83e3dac@baylibre.com/
>>
>>> +	.addr_shift = 0,
>>> +	.read_mask = BIT(6),
>>> +	.status_ch_mask = GENMASK(3, 0),
>>> +	.data_reg = AD7173_REG_DATA,
>>> +	.num_resetclks = 64,
>>> +	.num_slots = 16,
>>> +};
>>> +  
>>
> 

