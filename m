Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A6528FFDB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744628995; cv=none; b=RSENjXR8SxK7savZ/fgtsE0bff7yrZsPMrGrEB4YkJix9BrJWnvEF71egXOEPyY1twvanosNcJo+F74mMjoIWJputkZ+oDEMNsQgmjeon9VR58+6UxhfyeN/+nB108h3nqsZ5LcKhiKzP7Q+XzDldt4sg9xysB2xC/bqmZcDT9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744628995; c=relaxed/simple;
	bh=CTY5r8KsLONqqiIQOLtlLzZwtpPySekbjApCx+N651o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=AMKeKFJM+n1fiq1YD8sSfLUP++qj6+U3KDwZotRRMBCTrMvJ/6RF8FR0uMQwk1OMwL+t4Pv/ZZk/yAhDWrrqFK/Htg7vGN5f3vMi0MDzMcvC/4ZbNCy0YFxYeqw8liLMsEGaPy7tH1B5S2eZueupASX7YtkSHWB58Ik4kvYnUac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gB8O/T96; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gB8O/T96"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744628992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IGfTm189wQxLftSmWt/VbmlqdT7kXzGRtujmBz9DJhM=;
	b=gB8O/T96Yeklwhmpy/nFpBFh7JU4cjbaYBEEeNjdmuSWtzX6JdmqKSQ0tqflmhCid1Nn3T
	m02JpLxbMKpvw1m5KPaMltYBo0c1WPyGfZkKEcZ9OakFXkBvam6ZxnH1/PNhiQiS0fSCKD
	MVLrOIxAOpycv+GH28htFhyZJwC7JVU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-TR5vP2tNOzuapkCj3gA4Fw-1; Mon, 14 Apr 2025 07:09:51 -0400
X-MC-Unique: TR5vP2tNOzuapkCj3gA4Fw-1
X-Mimecast-MFC-AGG-ID: TR5vP2tNOzuapkCj3gA4Fw_1744628990
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac3d89cc4f3so276866566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 04:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744628989; x=1745233789;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGfTm189wQxLftSmWt/VbmlqdT7kXzGRtujmBz9DJhM=;
        b=epq1rVpGdiCKThMDVI7bjAu26ECsRVg3kk5h24x3xLHaKmzCSFHuzBr1CWz6DCVFat
         tFAD7YxzMVa5+QO8Ms751ROrfJybXeEYZuPNgnzqUcM89pPFOzmjz1W4MrMDkgOx25BP
         hbWKCh1YBKSi8tChltpsxFl/U40NVCU4sbMoXsU/SIe/SlrGc8Djb+LZbiDwj7LAYb7f
         h9Y0ci6qPDFM1i+4mgOS6syIV8eB7kSLN1H6YWBU2HrzED+CpthMoOuKNfHBAAl6kS+G
         TxSoMsrwKsq2sujDQ1CcDMWPcQgnIvuVSOqx/dkMXhC/TBA2oO32J4eK33NJHrvFHrpK
         bQyQ==
X-Gm-Message-State: AOJu0Ywtn8Z4hhgMcZ91q3Ziv8YvGwbiNDSMF4S5I1wZaVaJIVrA5kFa
	XjC2vsbOVl+e6rYizVD4lmIEzFt+g1LL/fRU5peXHYj3BvGKeM179OHfAbSwHjkN5LBJRLA5yKw
	M71+Uh4McpQ8DfcuoCNJ7cuPhRTbHLGJkCM+GaYYjrKcZG9wXQVtugpWxRXh2IA==
X-Gm-Gg: ASbGncvYGFD8qGWF0F4iqlsYhIgaFcS+U94yYWG3lVkG6dLuvfG+kqjtg5x7Xg7b+rR
	sePKhyUaCi62g1sKi8u8Jpsofo2KfUFF33gAHglGom50/5+Bi3JA191xpF4kBZOObvAXBebSQ4g
	J95W4qRNiOSGozBFf+1/lip78ndvCW97ncSLMj399z//LZyK/VZ8VHUK0xgJuTzdLcMEm0SFy91
	cQ7Hp2fCen8qA0SnpsB9EmCD8Nfo9TSFlyNbp77F9o4pZ/wJBOG4tgURxiDKW98etM+TovIQbal
	TxanYBzhv8heNfk=
X-Received: by 2002:a17:907:cd0e:b0:ac7:75b0:67d9 with SMTP id a640c23a62f3a-acad342ec56mr1110292766b.4.1744628989497;
        Mon, 14 Apr 2025 04:09:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXZ//+K6pXWOdLRzzacgZoVSeWkGd02/XpF14CKFZZBeVHqIy99b5waUBdnC6Vx5V40PLEqQ==
X-Received: by 2002:a17:907:cd0e:b0:ac7:75b0:67d9 with SMTP id a640c23a62f3a-acad342ec56mr1110287966b.4.1744628988936;
        Mon, 14 Apr 2025 04:09:48 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f526ca6sm4879020a12.68.2025.04.14.04.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 04:09:48 -0700 (PDT)
Message-ID: <9dc86b0c-b63c-447d-aa2f-953fbccb1d27@redhat.com>
Date: Mon, 14 Apr 2025 13:09:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
From: Hans de Goede <hdegoede@redhat.com>
To: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com, stable@vger.kernel.org, hao.yao@intel.com
References: <20250411082357.392713-1-dongcheng.yan@intel.com>
 <cfc709a8-85fc-4e44-9dcf-ae3ef7ee0738@redhat.com>
 <c8ae2d43-157c-408a-af89-7248b30d52d1@linux.intel.com>
 <Z_zDGYD1QXZYWwI9@smile.fi.intel.com>
 <d9cab351-4850-42c7-8fee-a9340d157ed9@linux.intel.com>
 <Z_zMMtUdJYpHuny7@smile.fi.intel.com>
 <f10f919e-7bdc-4a01-b131-41bdc9eb6573@intel.com>
 <01570d5d-0bdf-4192-a703-88854e9bcf78@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <01570d5d-0bdf-4192-a703-88854e9bcf78@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Apr-25 13:04, Hans de Goede wrote:
> Hi,
> 
> On 14-Apr-25 11:59, Yan, Dongcheng wrote:
>> Hi Andy and Hans,
>>
>> I found the description of lt6911uxe's GPIO in the spec:
>> GPIO5 is used as the interrupt signal (50ms low level) to inform SOC
>> start reading registers from 6911UXE;
>>
>> So setting the polarity as GPIO_ACTIVE_LOW is acceptable?
> 
> Yes that is acceptable, thank you for looking this up.

p.s.

Note that setting GPIO_ACTIVE_LOW will invert the values returned
by gpiod_get_value(), so if the driver uses that you will need
to fix this in the driver.

Hmm, thinking more about this, I just realized that this is an
input pin to the CPU, not an output pin like all other pins
described by the INT3472 device. I missed that as first.

In that case using GPIO_LOOKUP_FLAGS_DEFAULT as before probably
makes the most sense. Please add a comment that this is an input
pin to the INT3472 patch and keep GPIO_LOOKUP_FLAGS_DEFAULT for
the next version.

Regards,

Hans




> 
> Regards,
> 
> Hans
> 
> 
> 
>> We used RISING and FALLING in irq(not GPIO) to ensure that HDMI events
>> will not be lost to the greatest extent possible.
>>
>> Thanks,
>> Dongcheng
>>
>> On 4/14/2025 4:49 PM, Andy Shevchenko wrote:
>>> On Mon, Apr 14, 2025 at 04:40:26PM +0800, Yan, Dongcheng wrote:
>>>> On 4/14/2025 4:11 PM, Andy Shevchenko wrote:
>>>>> On Mon, Apr 14, 2025 at 03:52:50PM +0800, Yan, Dongcheng wrote:
>>>>>> On 4/11/2025 4:33 PM, Hans de Goede wrote:
>>>>>>> On 11-Apr-25 10:23 AM, Dongcheng Yan wrote:
>>>
>>> ...
>>>
>>>>>>>> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
>>>>>>>> +		*con_id = "hpd";
>>>>>>>> +		*gpio_flags = GPIO_LOOKUP_FLAGS_DEFAULT;
>>>>>>>
>>>>>>> This looks wrong, we really need to clearly provide a polarity
>>>>>>> here since the ACPI GPIO resources do not provide one.
>>>>>>>
>>>>>> I tested gpio_flags=GPIO_LOOKUP_FLAGS_DEFAULT/HIGH/LOW, the lt6911uxe
>>>>>> driver can pass the test and work normally.
>>>>>
>>>>> I doubt you tested that correctly. It's impossible to have level triggered
>>>>> event to work with either polarity. It might be also a bug in the code lurking
>>>>> somewhere, but it would be unlikely (taking into account amount of systems
>>>>> relying on this).
>>>>>
>>>>> Is it edge triggered event?
>>>>>
>>>>
>>>> It is an edge triggered event in lt6911uxe. In order to better adapt to
>>>> other uses, "hpd" is meaningful to specify a polarity here.
>>>>
>>>> In lt6911uxe, GPIO "hpd" is used as irq, and set irq-flag to
>>>> IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT. So no matter
>>>> rising or falling, driver can work normally.
>>>> "
>>>> ret = request_threaded_irq(gpiod_to_irq(lt6911uxe->irq_gpio),	NULL,
>>>> lt6911uxe_threaded_irq_fn, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
>>>> IRQF_ONESHOT, NULL, lt6911uxe);
>>>> "
>>>
>>> So, the driver must not override the firmware, if there is no bugs.
>>> So, why do you even use those flags there? It seems like a bad code
>>> in the driver that doesn't look correct to me.
>>>
>>
> 

