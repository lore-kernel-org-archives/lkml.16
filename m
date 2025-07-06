Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F14194A65
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 17:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751823230; cv=none; b=FQHkVYf+NZfteuunpCgYsS1bGnRYeRbhuH1d19re5/K+gU6/+tZex4odZ5tf6ce0TRs2MYeYhXQL6PMXOWQbd0YvX0xOJQY5AdPAM8L/IQwBVQlMYHlvg4TRpcdNjnUuhGGFj8yGdfjm7KRFBeurVi7mC0KlqG+TfNXx5UrAaF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751823230; c=relaxed/simple;
	bh=Cf3yhv/26SqDxXicxC3HfCxus6Z0GxTvozJbfxCLYxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SvDx7K5bUzqVohsfgPg4CuqzvWAMGIn72auTsE/fq4MPUUQcYj84xZvimiR7FwTSQ2VRG9j4xrNSbTMrLBRXDSAJRvFnsSRVdig0M4ybWPf7vblbZ68aPKcm4Ig0pDO57nQe9Y6HL8yMZiSu1Log0RBL2BV5AeYac5PDHm5B4LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rsLL81GE; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rsLL81GE"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2efbbf5a754so1834754fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 10:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751823227; x=1752428027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iWYegh6L0RiKIRDn0gigKG9Sgo7nkwUjvpILFMl9qrA=;
        b=rsLL81GEbrN220e/nBsyOqX1iv6eV5AZrr0ci7op64lpyTUzBg4LThGPlOxpwqIkjF
         vE115efB+BTDjrY8xHC/eZSuphxGhZGuxawpBzwN9WI12k59QniJURiwEmapSV5KA8Ua
         cjH1zZyKt+XOswTEQR2D5ae80ELXVHvgUcoS3h//RplZ8NT1rlFWDCOAjPAp5NC6hBHr
         iCLFOXMfM1YL0Ec0h5APZMLGRuV+r5edYmmeNSvbTu8qU+DkvdglPIdB67dttr2J4kjF
         YJZ7B6exu5ocOqsL8m1xO5dJVPr79tbSVoySn3TzM8YxDXXLr/ATdGvW7BQ5ujRMyUPb
         tEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751823227; x=1752428027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iWYegh6L0RiKIRDn0gigKG9Sgo7nkwUjvpILFMl9qrA=;
        b=EiM+/SbOXEQGgSBzFi+NVpeWCc18oLm5p/eBHFtTmc154mv7b1ziV/PODDk+mYDD1R
         dFO1UCe3SHumn52mxJZHKNOC4GpB7Q9JFmHwebPQnVpwqLh9kyXMhAJCF1jBiVn3ektc
         f2RPlWOSoGZBSn4CkpKBMOEwmaRW4r6Kwg+UVGNO3HosSwbSkFYbbrMwTpa+y469n31z
         eLW3AgPAN4jQXQIn96XsNUoR6DChdrrGfyARcjuZEfNXJOGLIsNDCYreprgvRLmSTm0v
         9vpHipKJfRCiLX6HLSIrMj3O1EgoBImD6QbnYi0Pah3WsqVpMhcE8NBVmoVc0Y0ffp3z
         s+tA==
X-Forwarded-Encrypted: i=1; AJvYcCVv0OfsYnx77aY1l1PNHO8vTLC575uk60HiIlHJ8QBh2E2FdvWl7pp5Y/YeKvVLq1uKl2p8Ab6zuOsl1TI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyHYmLTCJDCDTRq/6YxrAP/xAiQtY4EiE1gsy8+rNcr7PuKiuX
	7o0XfiZBOJkYSuQARxUEKe9gjoyP+qdr0oPDIFucTjpBBox/x/EW3leXQFeK/fz9su1RxPsSghL
	AvZJinHE=
X-Gm-Gg: ASbGncs9ndjg8RgJcKvbnfD0dyX4eglPIbBCXSqO7nCpSZmsr6pgG2lhJKBJHnRi6f2
	crWSMR3QyWeR3CXJDVkaHQNeXoYVItvUa6zqAJ48i7+jA9W8Jj8m/9kQlasxDjhY+YxKjPZAbmJ
	Mcefyf391l0C6xTQqNcXcfYfWcvdUWju7Q0QxOKStqTWU+WqHmv2/VyuDr5fpKtbuBp57wsaEJh
	iCYtM98Q5MgB4K3dq6aWrxE6WD/gbAXMqeWtQzHbPk0/ttd0eQv685gwvSUOIBzFeeeWVDmsqZN
	p6tAfYiEwSipko6uu/6/fFMTfbrki4UwCAhqrEe+Cg5P3weh7JO3XQVpheWERD0cXrYJKoaKr3P
	nDGciNWuRm8Vm51ZPmmAi3+2w1IWULL6NkuLd
X-Google-Smtp-Source: AGHT+IGFXI6bzrMrPoRMAhYisjSnluuvr/OOSlltlBlWMiT0l650MkJrGoqM8KrAt/w/j0aJvDYy4g==
X-Received: by 2002:a05:6870:2406:b0:2d5:2191:c8b3 with SMTP id 586e51a60fabf-2f796dfcf5amr7238271fac.29.1751823227159;
        Sun, 06 Jul 2025 10:33:47 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:29a:290f:4321:4624? ([2600:8803:e7e4:1d00:29a:290f:4321:4624])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2f7901a7a23sm1754154fac.23.2025.07.06.10.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 10:33:46 -0700 (PDT)
Message-ID: <c3e6402c-7cfe-45c1-9f28-f131cd94aa05@baylibre.com>
Date: Sun, 6 Jul 2025 12:33:45 -0500
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
 <78342e10-7211-44de-8a92-40872a69b60d@baylibre.com>
 <20250706175725.39e79105@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250706175725.39e79105@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/6/25 11:57 AM, Jonathan Cameron wrote:
> On Sun, 6 Jul 2025 11:08:06 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 7/6/25 5:15 AM, Jonathan Cameron wrote:
>>> On Fri, 4 Jul 2025 12:04:04 -0500
>>> David Lechner <dlechner@baylibre.com> wrote:
>>>   
>>>> On 7/4/25 11:21 AM, David Lechner wrote:  
>>>>> Fix the num_slots value for most chips in the ad7173 driver. The correct
>>>>> value is the number of CHANNELx registers on the chip.
>>>>>
>>>>> In commit 4310e15b3140 ("iio: adc: ad7173: don't make copy of
>>>>> ad_sigma_delta_info struct"), we refactored struct ad_sigma_delta_info
>>>>> to be static const data instead of being dynamically populated during
>>>>> driver probe. However, there was an existing bug in commit 76a1e6a42802
>>>>> ("iio: adc: ad7173: add AD7173 driver") where num_slots was incorrectly
>>>>> set to the number of CONFIGx registers instead of the number of
>>>>> CHANNELx registers. This bug was partially propagated to the refactored
>>>>> code in that the 16-channel chips were only given 8 slots instead of
>>>>> 16 although we did managed to fix the 8-channel chips and one of the
>>>>> 4-channel chips in that commit. However, we botched two of the 4-channel
>>>>> chips and ended up incorrectly giving them 8 slots during the
>>>>> refactoring.
>>>>>
>>>>> This patch fixes that mistake on the 4-channel chips and also
>>>>> corrects the 16-channel chips to have 16 slots.
>>>>>
>>>>> Fixes: 4310e15b3140 ("iio: adc: ad7173: don't make copy of ad_sigma_delta_info struct")
>>>>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Improve commit message.
>>>>> - Link to v1: https://lore.kernel.org/r/20250703-iio-adc-ad7173-fix-num_slots-on-most-chips-v1-1-326c5d113e15@baylibre.com
>>>>> ---
>>>>>  drivers/iio/adc/ad7173.c | 37 +++++++++++++++++++++++++++----------
>>>>>  1 file changed, 27 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/iio/adc/ad7173.c b/drivers/iio/adc/ad7173.c
>>>>> index dd9fa35555c79ead5a1b88d1dc6cc3db122502be..9c197cea11eb955becf4b9b97246379fa9c5da13 100644
>>>>> --- a/drivers/iio/adc/ad7173.c
>>>>> +++ b/drivers/iio/adc/ad7173.c
>>>>> @@ -771,10 +771,27 @@ static const struct ad_sigma_delta_info ad7173_sigma_delta_info_8_slots = {
>>>>>  	.num_slots = 8,
>>>>>  };
>>>>>  
>>>>> +static const struct ad_sigma_delta_info ad7173_sigma_delta_info_16_slots = {
>>>>> +	.set_channel = ad7173_set_channel,
>>>>> +	.append_status = ad7173_append_status,
>>>>> +	.disable_all = ad7173_disable_all,
>>>>> +	.disable_one = ad7173_disable_one,
>>>>> +	.set_mode = ad7173_set_mode,
>>>>> +	.has_registers = true,
>>>>> +	.has_named_irqs = true,    
>>>>  
>>>>> +	.supports_spi_offload = true,    
>>>>
>>>> Well drat, I was too quick with the update and the bots [1] noticed that
>>>> this conflicts with the in-flight patch that added this field [2].
>>>>
>>>> I guess we can drop this one line, but then the other patch will wait
>>>> until this fix makes its way back into the togreg/testing branches.  
>>>
>>> I'm lost - what would you prefer we do here?  For now I have [2] on my
>>> tree but can drop just that one patch if it unwinds this complexity.  
>>
>> I was hoping you would tell me. :-p
>>
>> In any case, we should apply this patch, with the supports_spi_offload
>> line dropped, first so that it backports cleanly to the stable release(s).
>>
>> But where to apply this patch depends on if you are planning on doing
>> another fixes-togreg this release cycle or not. Or we could just opt
>> to take the slow path to avoid the dependency dance and just apply
>> both patches to iio/togreg and let it make it's way to stable after
>> the next merge cycle.
> 
> I'll almost certainly do another fixes pull, but it might not get into upstream
> of my togreg branch fast enough. 
> 
> For now is just dropping patch 12 from the main series enough to avoid the
> conflict?  If so send me a clean version of this and I'll apply that to the
> fixes-togreg branch and we can hopefully get a round trip to pick up patch 12
> on top of it.

Yes. Drop patch 12 and I will send a new version of both patches. This
one can be applied to fixes and the other can wait.

> 
> Thanks,
> 
> Jonathan
> 
>>
>>>>
>>>> [1]: https://lore.kernel.org/linux-iio/202507050018.iWEJiG04-lkp@intel.com/
>>>> [2]: https://lore.kernel.org/linux-iio/20250701-iio-adc-ad7173-add-spi-offload-support-v3-12-42abb83e3dac@baylibre.com/
>>>>  
>>>>> +	.addr_shift = 0,
>>>>> +	.read_mask = BIT(6),
>>>>> +	.status_ch_mask = GENMASK(3, 0),
>>>>> +	.data_reg = AD7173_REG_DATA,
>>>>> +	.num_resetclks = 64,
>>>>> +	.num_slots = 16,
>>>>> +};
>>>>> +    
>>>>  
>>>   
>>
> 

