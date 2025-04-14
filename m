Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C312A2BEC24
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634264; cv=none; b=G/M85Af2/VTbxrd+NzsGO40g3tdSDgunHGAII6l83uMdvedMqtg8o2CSxKC2fKXx966NgWMtNGuH+jDvsdM+L/9eZhj630L/V9+up13albH+jyk9b4gHA9zdCIxzTWw7a6l84FyVHuHtK8V/N7JDKmgRI5cV1DS9g30xhcLAFTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634264; c=relaxed/simple;
	bh=g5pDIKFuMnhCAnUrsaRdvp6NicjK7aW/qhc69uhrDz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZiqqYF/BoJGpe5t/AEFpFfMbnYm2Q59SmKADVFKTf8wtBIHfp9b5u1T9YvxYdYUOH6IhsV7G3CwZRvgq7206BckGdqb0tGPK9e9OJ88U541w/BOKvbOIkv6OWP12OyVSLnp/1Ft9fOBOy4VSrL6iyQ14xqfAyZfFcQixXN+yEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tojz8gCB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tojz8gCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744634261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SiKyFbfPtDBwbfdQO6d76e5qVtN4cbAxoeIPgZEqti0=;
	b=Tojz8gCBjAcDmjTuFQUN2Co6ghyPMNyNbzWDmbF/vH2nvGHrIzelFit5piCCRB66Jyly8p
	O68iMYpdqTCVZX8kK5ni2VsBYTRz44MAPX08rJdSPk0iaUxrklRuqaR7rPelE94QP64at+
	0N/okfejUtzbmGBSc2SZcF/XBI/u8mo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-u-7QoUQgPVaA8vZoeqhhUA-1; Mon, 14 Apr 2025 08:37:40 -0400
X-MC-Unique: u-7QoUQgPVaA8vZoeqhhUA-1
X-Mimecast-MFC-AGG-ID: u-7QoUQgPVaA8vZoeqhhUA_1744634259
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac3d175fe71so300822566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 05:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634259; x=1745239059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SiKyFbfPtDBwbfdQO6d76e5qVtN4cbAxoeIPgZEqti0=;
        b=u9aieVv2WNTZUqiPpMdrrrCtB9qsvEx81VZIs/MVs15C8vQt0ZO4t+6kJyGFmo+fCO
         6lJiDoTBw2WS62bej8Jyg1qkD705ZesweAGWhqREwAr5oXBZDhHIm2mryLpeDL6tYhvi
         0J2bsoOhpEwbC15pTDadGluyZ1nkWvgChdPmKcBUMSRpMi45oESxx0S7LPdhQzDy+UTT
         zRpHknDOIXyGdOM8HWNkRZ1TkUR5RchXI7xZKqy3tp4YoSvc+BVUmVnK05ZaxC+GH0K5
         TuQByHK4qVs9ZmFT/1FbYtuSbhQHAHacQH73d5o1JmX56Qiw1V9DGxhd53COXEFrTcVO
         0Frg==
X-Forwarded-Encrypted: i=1; AJvYcCVZFpankXRb90kj8SD1jf8tyNsU53j8LYuwW0WHLZBoBvy9SNH4lreO/oDc4ynWUTp/JSsCesYM5Bqv/4I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3zt8sWjSe7yhZrtETLLrTHxt3do/R48tDP3qdhK6VcE44XoGT
	W0CBlV1wTIxg/FRA2VNQuXRvgu06jaB9rIoinUb/+JWDxeWgcd5SudbEDN7dKckCcsrFYPRaqG1
	pp285ZIQMVvzP2RKJJuUeAgzudOqHu9ipOrRFc1qoAvhow3Js/WBmZmBKr3EIAZtkCjO1+g==
X-Gm-Gg: ASbGncsQdkiOAfpVxK/py6HRA2fLYNHTyQFBovAfAC6HI/gJMysQ4FJ4TWgH5kXv4z1
	EDfs/me8sW60YbflK2JXWhlju57oGOgiVXWFh1/3CfyrUu/oRDQcx91vxI4FPMl+NSnuct6lpeN
	YeK/XUdiMMui9g3w8yXWVdc+Y99NYcBTFs0ONYMFjQ3j3PhmJq5aT7MIV1szknoW6W1xTnU/vDh
	Lw2aIF87iUgZaeW5AWs6+mt9ViPq7jklbIU5AR7/BlINue4V40dfaPKbLCcvKLpl3dS/l4IsmGK
	fZHgEPSI9R+AZC4=
X-Received: by 2002:a17:906:4fcb:b0:ac2:e748:9f1c with SMTP id a640c23a62f3a-acad34d8a11mr1022074466b.33.1744634258767;
        Mon, 14 Apr 2025 05:37:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/yQtKfvY3m+YbsolB/l62RjfxDtGfAVcXTTZSypAsfSYp22fr/Cl1m3fz6jWAMYAD3wji6A==
X-Received: by 2002:a17:906:4fcb:b0:ac2:e748:9f1c with SMTP id a640c23a62f3a-acad34d8a11mr1022071766b.33.1744634258260;
        Mon, 14 Apr 2025 05:37:38 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb42b4sm907679966b.97.2025.04.14.05.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 05:37:37 -0700 (PDT)
Message-ID: <0e2306d7-3a07-45ad-958f-1039fb10a8cf@redhat.com>
Date: Mon, 14 Apr 2025 14:37:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 hverkuil@xs4all.nl, u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com, hao.yao@intel.com
References: <cfc709a8-85fc-4e44-9dcf-ae3ef7ee0738@redhat.com>
 <c8ae2d43-157c-408a-af89-7248b30d52d1@linux.intel.com>
 <Z_zDGYD1QXZYWwI9@smile.fi.intel.com>
 <d9cab351-4850-42c7-8fee-a9340d157ed9@linux.intel.com>
 <Z_zMMtUdJYpHuny7@smile.fi.intel.com>
 <f10f919e-7bdc-4a01-b131-41bdc9eb6573@intel.com>
 <01570d5d-0bdf-4192-a703-88854e9bcf78@redhat.com>
 <9dc86b0c-b63c-447d-aa2f-953fbccb1d27@redhat.com>
 <Z_z04jMiTg_xW-c2@kekkonen.localdomain>
 <518b1420-a356-4e4b-8422-c2689bc54794@redhat.com>
 <Z_0AX9sdwSAWhzTc@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z_0AX9sdwSAWhzTc@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Apr-25 14:32, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Apr 14, 2025 at 02:21:56PM +0200, Hans de Goede wrote:
>> Hi Sakari,
>>
>> On 14-Apr-25 13:43, Sakari Ailus wrote:
>>> Hans, Dongcheng,
>>>
>>> On Mon, Apr 14, 2025 at 01:09:47PM +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 14-Apr-25 13:04, Hans de Goede wrote:
>>>>> Hi,
>>>>>
>>>>> On 14-Apr-25 11:59, Yan, Dongcheng wrote:
>>>>>> Hi Andy and Hans,
>>>>>>
>>>>>> I found the description of lt6911uxe's GPIO in the spec:
>>>>>> GPIO5 is used as the interrupt signal (50ms low level) to inform SOC
>>>>>> start reading registers from 6911UXE;
>>>>>>
>>>>>> So setting the polarity as GPIO_ACTIVE_LOW is acceptable?
>>>>>
>>>>> Yes that is acceptable, thank you for looking this up.
>>>>
>>>> p.s.
>>>>
>>>> Note that setting GPIO_ACTIVE_LOW will invert the values returned
>>>> by gpiod_get_value(), so if the driver uses that you will need
>>>> to fix this in the driver.
>>>>
>>>> Hmm, thinking more about this, I just realized that this is an
>>>> input pin to the CPU, not an output pin like all other pins
>>>> described by the INT3472 device. I missed that as first.
>>>>
>>>> In that case using GPIO_LOOKUP_FLAGS_DEFAULT as before probably
>>>> makes the most sense. Please add a comment that this is an input
>>>> pin to the INT3472 patch and keep GPIO_LOOKUP_FLAGS_DEFAULT for
>>>> the next version.
>>>
>>> The GPIO_LOOKUP_FLAGS_DEFAULT is the "Linux default", not the hardware or
>>> firmware default so I don't think it's relevant in this context. There's a
>>> single non-GPIO bank driver using it, probably mistakenly.
>>>
>>> I'd also use GPIO_ACTIVE_LOW, for the reason Dongcheng pointed to above.
>>
>> The GPIO being interpreted as active-low is a thing specific to
>> the chip used though. Where as in the future the HPD pin type
>> in the INT3472 device might be used with other chips...
>>
>> Anyways either way is fine with me bu, as mentioned, using GPIO_ACTIVE_LOW
>> will invert the values returned by gpiod_get_value(), for which the driver
>> likely needs to be adjusted.
> 
> The driver appears to ask for both IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
> and it only uses the GPIO for an ISR so it doesn't seem to require driver
> changes IMO. Although this also seems to make the polarit irrelevant, at
> least for this driver.

If the driver does not care about this I would prefer for the INT3472 code to
use GPIO_ACTIVE_HIGH to avoid the inverting behavior of GPIO_ACTIVE_LOW making 
things harder for other future drivers using the hpd pin through the INT3472
glue code.

Regards,

Hans


