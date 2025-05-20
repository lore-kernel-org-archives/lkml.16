Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAAE1EB5FC
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747730726; cv=none; b=ihragm9iti+hiCu6i5nDkQJz9cwH55cjP/Wic6jrytWtnHia+MBVIYf8cIhalYxARJoCJgTEnOryRd1pLWFA+Dr7QQHSu3fSXGSJx1PWnVY2SurkXds/xpdU5Nxkj067XOMVwi/1aUQTNNL5m+MLP3q9SUDZF7hwX6CjWADykGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747730726; c=relaxed/simple;
	bh=M6rykNVaNEufQyGJphEvjzOlSqtLgnbiM/1lT8YpmXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBnuR5GQ39dLCijcWMer8R5uDXkC+BqpenRQSZq3pS6NZKqstQjFarDtXVEJcS99YLllGwWHZccSohHfTop5h7p7eHmegukcX5yzmzYOi45ebVTKukSW4/zO++RT9r6UtDbSHsmZPUD5Wr4o42vPUs8q3xKs0THQsfITs2rhJWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KzN1/62q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KzN1/62q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747730722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PU9q+sl5/SDqyyxCnki0P2uIbGsJnsHMmzIuLZ6LVTw=;
	b=KzN1/62qucK5xNUBKCktSTBKbdH1zqFcHLvABeNIqKW9npcmr+EK3AQlLxvK+cnnlhn3bq
	PC5Y2nYePh3jKu7ZsBzQRQSBRipGl4H7XpMHAW/Dsx1a+FhvSsY2hxSG/MEtOXU2gxltio
	NIWP6h5ZJFOTZkCSZ9C5TkYP0nVIh+0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-8BfaKvVeMnKfnsnAaV6JqQ-1; Tue, 20 May 2025 04:45:20 -0400
X-MC-Unique: 8BfaKvVeMnKfnsnAaV6JqQ-1
X-Mimecast-MFC-AGG-ID: 8BfaKvVeMnKfnsnAaV6JqQ_1747730719
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-601df3b434cso1815170a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747730719; x=1748335519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PU9q+sl5/SDqyyxCnki0P2uIbGsJnsHMmzIuLZ6LVTw=;
        b=Fmj8hcedCPocmTa8uArfoNB2J2aLSGbYjcqQ7kJziAEiOJGmygsN9G6yh2Ax5vdjP0
         VcsMJ37KH0W8nlwH8MnseIUVww1pmr3TGXQv5+FTvyyKchfH3Fyn5KOv03Rd46XVcarc
         KvgQORTp6JdjmZ93xL4Ax0+U+c6av9DZddQg7DgWHC29tZVsmKRUhkVDXTWM7cXwgpp/
         yL4zJ2sS0ls6OFhZnmHYGzkLLkqKP1jItQZxzGdY8DCjvqSsjtNwPGKJyRstPjDCsml9
         /dgLDeM6u76A/8ApFCg5xzPF+TQi0391wcZQLTPMvQI9DA1Pn65lF96mtk0ugoCFAKPP
         Ogjw==
X-Forwarded-Encrypted: i=1; AJvYcCUdDhmWvJIJCFkM9qRUcJhSQRFLPlN5wyYSw6eaqVJCnNUBTHIItQuSgBhpe4JmJxE98ECBDQMb7c57tDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyysC+601Q/2v4eSWjOwRHg5ZRh+Q+TcKXCA5alRdt5g2w4xsJB
	WuX85MW4+S2MnGsei3ZGLHYXckOrwqlhjA/AwzlQYOXH5y/cvjYgreDSFGhodXgZdmIYiPVtVsW
	ypzvVmsnZeEwtl1Rf2hx4vWM15F9WEQZixlhuT+gUAxQkkgUxdaFrQg1t3hrOXaWUyw==
X-Gm-Gg: ASbGncvvVWsjJx+6oWypcMG5VTyArEex/C4XdstC69Q2E3+M88ZaAf0YsEZY2mO/feO
	r3kbnESCvq+EoURNoKFCVNE1QH8BT6mfTzr++5bGcj7LjWVPHFXs8Fahe6k8GGsW3ttawK/opRu
	I2obRrMCgBzsNVb1r99FwDLC4zaDYr7BnVnZ8uvLRxde6LsVoQbym7HXRODrr1v+nuy2VaCS1n/
	lVrctLYdhtciPwHSqnOYugoiy5ifQACXpCfjVXM8vCPiPqTzwtua1HH43Gs//bqIDjwOWBs2rSo
	prVDOIvxZgIZxLG7MqNq1/3iOdAQE1ARjYoAi8bdf3+gppxZr4l+DCqURsavU0Bq63arIDK177n
	w94mrGTA8kjBAEZthNOcx0QM4SRYZFI6pOP0BOavEx4X5z0GMZVn848DosUV8rA==
X-Received: by 2002:a05:6402:2804:b0:5f6:d403:fb20 with SMTP id 4fb4d7f45d1cf-6008a5ab495mr13844974a12.8.1747730719425;
        Tue, 20 May 2025 01:45:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9CGzVP2K+ea5INUct/2Z6K9Dsh9iqu/eeHcNLnNYky1QflD44xXcUwx7lfu5I/B/1qexdBw==
X-Received: by 2002:a05:6402:2804:b0:5f6:d403:fb20 with SMTP id 4fb4d7f45d1cf-6008a5ab495mr13844950a12.8.1747730719016;
        Tue, 20 May 2025 01:45:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d4f2f06sm6835581a12.9.2025.05.20.01.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:45:18 -0700 (PDT)
Message-ID: <1fe6d5fa-d379-4b1b-832c-31923d729833@redhat.com>
Date: Tue, 20 May 2025 10:45:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4] media: v4l2-common: Add a helper for obtaining the
 clock producer
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Daniel Scally <dan.scally@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
 tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
 hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com, naush@raspberrypi.com,
 mchehab@kernel.org, dave.stevenson@raspberrypi.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250321130329.342236-1-mehdi.djait@linux.intel.com>
 <f467e4a8-fcb2-4345-b8f7-7557c1a7552b@redhat.com>
 <dhbbpogydqclblzpd2qn2tr2cyyh5gq5cgostzbiq6ygsixj46@oopsp75svt4c>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <dhbbpogydqclblzpd2qn2tr2cyyh5gq5cgostzbiq6ygsixj46@oopsp75svt4c>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mehdi,

On 14-May-25 10:25 AM, Mehdi Djait wrote:
> Hello Hans,
> 
> thank you for the comment.
> 
> On Sat, May 10, 2025 at 04:21:09PM +0200, Hans de Goede wrote:
>> Hi Mehdi,
>>
>> On 21-Mar-25 2:03 PM, Mehdi Djait wrote:
>>> Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
>>> platforms to retrieve a reference to the clock producer from firmware.
>>>
>>> This helper behaves the same as clk_get_optional() except where there is
>>> no clock producer like in ACPI-based platforms.
>>>
>>> For ACPI-based platforms the function will read the "clock-frequency"
>>> ACPI _DSD property and register a fixed frequency clock with the frequency
>>> indicated in the property.
>>>
>>> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
>>
>> This certainly looks quite useful, thank you for working
>> on this.
>>
>> Note on some IPU3 platforms where the clk is provided by
>> a clk-generator which is part of a special sensor-PMIC
>> the situation is a bit more complicated.
>>
>> Basically if there is both a clk provider and a clock-frequency
>> property then the clock-frequency value should be set as freq
>> to the clk-provider, see:
>>
> 
> is it even possible to get a reference to the clock producer in ACPI
> systems or am I missing something here ?

Yes in some special cases it is possible to get a reference to
a clock provider on ACPI. E.g. one is provided by:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/intel/int3472/tps68470.c

on x86 ACPI systems using that sensor PMIC such as the
"Microsoft Surface Go" and "Microsoft Surface Go 2"

> Here is what I gathered online for the discussion leading to this patch:
> ----------------------------------------------------------------------------------------------------------------------------------------------
> ClockInput resource added to ACPI v6.5: https://uefi.org/specs/ACPI/6.5/19_ASL_Reference.html#clockinput-clock-input-resource-descriptor-macro
> - commit adding ClockInput resource to acpica: https://github.com/acpica/acpica/commit/661feab5ee01a34af95a389a18c82e79f1aba05a
> - commit kernel upstream: 520d4a0ee5b6d9c7a1258ace6caa13a94ac35ef8 "ACPICA: add support
>   for ClockInput resource (v6.5)"

Ah I see where the confusion is coming from, the clk-provider does not come
directly from ACPI, it comes from the PMIC driver and the PMIC driver also
adds a clk-lookup table entry to associate it with the PMIC.

> this does not mean we can use it: I found this out-of-tree patch to supports fixed clock sources
> https://github.com/niyas-sait/linux-acpi/blob/main/0001-acpi-add-clock-bindings-for-fixed-clock-resources.patch
> it was not sent to the acpi mailing list. It was mentioned in this
> dicussion: https://lore.kernel.org/linux-kernel/78763d69bae04204b2af37201b09f8b5@huawei.com/
>
> Another interesting link: https://linaro.atlassian.net/wiki/spaces/CLIENTPC/pages/28822175758/ACPI+Clock+Input+Resources
> ----------------------------------------------------------------------------------------------------------------------------------------------
> 
> link for the dicussion: https://lore.kernel.org/linux-media/20250220154909.152538-1-mehdi.djait@linux.intel.com/

These 2 links are not relevant, the clk-provider is not directly coming from
ACPI instead the clk is registered by the PMIC driver for the clk-generator
part of the PMIC.


>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/i2c/ov8865.c#n3020
>>
>> for an example of a driver which handles this case.
> 
> So if I understood the above correctly: in the ov8865 IPU3/ACPI case:
> 
> 1) sensor->extclk is NULL because the clock producer is not available in
> ACPI systems. ClockInput() ACPI resource was introduced to acpica after
> the ov8865 patch and the resource is not even being used in the upstream kernel.

In this specific case it will be not NULL because the PMIC driver
provides a clk-provider and creates a clk-lookup to match that
to the ov8865 sensor.

> 2) the sensor->extclk_rate will be set from reading
> the clock-frequency _DSD property in:
> 
> 	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency", &rate);

This bit is correct, the special thing here is that the PMIC
clk-provider is programmable so the sensor-driver needs to
set it to the rate returned by reading "clock-frequency"/

So basically first call both:

1. devm_get_clk()
2. fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency", &rate);

and in the special case when *both* succeed do a clk_set_rate()
call on the returned clk setting it to "rate".

Regards,

Hans



