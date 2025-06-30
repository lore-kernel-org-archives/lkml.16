Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6FC2E403
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272856; cv=none; b=G+Gy162up5Hko56nXEn4jUw1wJBioBehX3NXYCz5ve/Ylk5AjUE5vwGrRacQtVtoJbELR0d+ahu1J5EnVC55A3IsijRbWO5HFKV6RzppUXCt09lSAIVjPUaOJRlIIGfjGkBvR4EEgqbukCIpwIaI/FsDf8zgYUW0ggzHfgD6c3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272856; c=relaxed/simple;
	bh=TtvZmKcu5ULV30hDwJa7QtVvX83gJrgmBcIfmoYQekA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XKTjKxri4Ds/KqPsJjfWOn1L4D7ycrSGlM9NR6Dj6ojtA3XhqEBL128eeCVV+yCfgFENNdJBurX+sz0Jmeb7OVRUloJ1FRcoDS4KVRtO/OPrtE5ll2x3dyWYyTH42OrVtvffqSFUB9wPiNdQ9II0laFbfaB4bowoyLS9NmJhXDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h6Pvm/1a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h6Pvm/1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751272853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GbzS3/7wOLVYMQM7fq09DAq/NtYuBLxSJ0uQz6yllZw=;
	b=h6Pvm/1afEJ2Ib8Gx1Xp74IaLTIm/EozgDwhO6Zvyfl3ks0/k2r/JsaYRH8BfT4l9rQ73F
	dQ6P4nrcVjZ4HiT4cT0LJgzg1p436Wq+G9znqKCxa4+x1ISmTy229vpZAjwvbqGQSXodo6
	qXXnWEdUuEgP3zmpgokmKrWUe8YFCGo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-9Xi5y4XpOgaLG103OtkD9w-1; Mon, 30 Jun 2025 04:40:50 -0400
X-MC-Unique: 9Xi5y4XpOgaLG103OtkD9w-1
X-Mimecast-MFC-AGG-ID: 9Xi5y4XpOgaLG103OtkD9w_1751272849
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ae2b7bdc8f6so256509766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272849; x=1751877649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GbzS3/7wOLVYMQM7fq09DAq/NtYuBLxSJ0uQz6yllZw=;
        b=IKqKYAEZy7rJATsa2wvY7Lx0tUKzRl9wuc6YUxK1xZOYiaWWS+/yI2VoIoWI6iEEZ8
         nq0n70/RNlYp1NjSuOFxh0daX5iSoVpnlgJC6ZEW6zNdRjkmklyYah8Xb9+qXuKIuQ6u
         YIT5a3o6orj+9r59V0dxhg/KzWFUW6XbYMubsjQuehzlw23HVnQ0+h/C8P6nRWuj3LXy
         +DTjvyBckaBKdcHwJ13+hTHRDAmOcemaCshkXu6ThslJsBZcUbUkbMOgZgPjTagMdOso
         E3sLcXlLkF9B7E+2PQ4BI3ATApmO83ZRHN+miRjjSPGWyT8q0BFe731LpfnRVBf5k9cJ
         WctA==
X-Forwarded-Encrypted: i=1; AJvYcCV2f8cfe5XQd48aoeuOy86gjVQewjyYRIm2KUibyOfSycA5zhbSlDFeB0lIhfSuV3NtJv8D5iqR1Ut3LcM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+IOdF4C+Ejurkow3fuUHBNAjQe81GqnCX/D4BQQTJmEWi/pw8
	4ErRHpfEwn9aX8WupATN4RN/8Our8qKEVzTvfo0X3M9Lp9vw1JVFkMYKFKK7wJScalDPXrzpnRf
	rcKWfhOnkoEPuVEaMgrC7C9E+ullHHS2sjQhOAXAquE1v2/lENKmBd23qroyqFXcGJA==
X-Gm-Gg: ASbGncsbUfYv8YRZi5QkMsRBDKu/xp0FV4ZUkCDGRAz997OwMF8KL7GhCF70IpHIEhG
	gG248FP1uZWx9cJMXa4h/IE1q8NbNCRFf8eNxJUaFpCZFB3AV8GVsXfQ0/eRuMW0jDFqZIWvGkl
	iPY+7FDX1ILuXps21WVXFXdPJcPHtZ4HtiupyG0hL5PvN1Kwny8QD7/GHNuFApF166UHwYE3uCk
	9Z5YCqBSmyeq6jUJvdc5I3vr4fb3mzvDSnJk4iksdgucTGE3SVdqY8GS3zT0RQ9pCcP7aFO6h+N
	o5Zj+R5gr8t3ri5V7Llzus+nvgdu4rloEC9Kkn8dYqbcSEsaJP2dG8q88UKkXfIIxYrGYZPnRwE
	r+upRBLKDa9w4nR6+vZ45Cg2N/OrygM9H+BtwR4Wo60fD7DYvFpWopCyMPeoiYAAllTx3wXOD/A
	==
X-Received: by 2002:a17:907:3c91:b0:ae3:61ea:31b1 with SMTP id a640c23a62f3a-ae361ea3303mr1065072966b.12.1751272848985;
        Mon, 30 Jun 2025 01:40:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/y7vOHMHZ5AF4xuBNceBfPbSy8M7ATw5UKXH09WWku0rRQgHald4Jy38PCYx58QuWLBfH7g==
X-Received: by 2002:a17:907:3c91:b0:ae3:61ea:31b1 with SMTP id a640c23a62f3a-ae361ea3303mr1065069566b.12.1751272848439;
        Mon, 30 Jun 2025 01:40:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae362cbf19asm547457166b.128.2025.06.30.01.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 01:40:47 -0700 (PDT)
Message-ID: <e534d496-6ce0-46c8-835d-94b3346446a7@redhat.com>
Date: Mon, 30 Jun 2025 10:40:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
 <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
 <1129bc60-f9cb-40be-9869-8ffa3b3c9748@kernel.org>
 <8a3ad930-bfb1-4531-9d34-fdf7d437f352@redhat.com>
 <85521ded-734d-48e8-8f76-c57739102ded@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <85521ded-734d-48e8-8f76-c57739102ded@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 30-Jun-25 10:24 AM, Krzysztof Kozlowski wrote:
> On 29/06/2025 14:07, Hans de Goede wrote:
>> Hi Krzysztof,
>>
>> On 28-Jun-25 1:49 PM, Krzysztof Kozlowski wrote:
>>> On 27/06/2025 11:48, Luca Weiss wrote:
>>>> Hi Krzysztof,
>>>>
>>>> On Fri Jun 27, 2025 at 10:08 AM CEST, Krzysztof Kozlowski wrote:
>>>>> On Mon, Jun 23, 2025 at 08:44:45AM +0200, Luca Weiss wrote:
>>>>>> Document the interconnects property which is a list of interconnect
>>>>>> paths that is used by the framebuffer and therefore needs to be kept
>>>>>> alive when the framebuffer is being used.
>>>>>>
>>>>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/display/simple-framebuffer.yaml | 3 +++
>>>>>>  1 file changed, 3 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>>>> index 296500f9da05e296dbbeec50ba5186b6b30aaffc..f0fa0ef23d91043dfb2b220c654b80e2e80850cd 100644
>>>>>> --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>>>> @@ -79,6 +79,9 @@ properties:
>>>>>>    power-domains:
>>>>>>      description: List of power domains used by the framebuffer.
>>>>>>  
>>>>>> +  interconnects:
>>>>>> +    description: List of interconnect paths used by the framebuffer.
>>>>>> +
>>>>>
>>>>> maxItems: 1, or this is not a simple FB anymore. Anything which needs
>>>>> some sort of resources in unknown way is not simple anymore. You need
>>>>> device specific bindings.
>>>>
>>>> The bindings support an arbitrary number of clocks, regulators,
>>>> power-domains. Why should I artificially limit the interconnects to only
>>>> one?
>>>
>>> And IMO they should not. Bindings are not supposed to be generic.
>>
>> The simplefb binding is a binding to allow keeping the firmware, e.g.
>> uboot setup framebuffer alive to e.g. show a boot splash until
>> the native display-engine drive loads. Needing display-engine
>> specific bindings totally contradicts the whole goal of 
> 
> No, it does not. DT is well designed for that through expressing
> compatibility. I did not say you cannot have generic fallback for simple
> use case.
> 
> But this (and previous patchset) grows this into generic binding ONLY
> and that is not correct.

I think that it is important here to notice that this is not
a generic fallback binding, this is not and will never be
intended to replace have a proper binding for
the display-engine.

This is just a way to give the kernel access to the firmware
setup framebuffer to e.g. show a bootsplash but also fatal
kernel errors until the real display-engine driver loads.

Note sometimes the whole framebuffer memory is not touched
at all and the sole reason for having a driver attach to
the simplefb node early on is just to keep the resources
needed to keep the panel lit up around (on) until the real
display-engine driver comes along to claim those resources.

This avoids the display going black if the display-engine
driver only binds after the kernel starts turning off
unused resources, this typically happens when the display-engine
driver is a module.

>> It is generic by nature and I really do not see how clocks and
>> regulators are any different then interconnects here.
> 
> Yeah, they are also wrong. I already commented on this.
> 
>>
>> Note that we had a huge discussion about adding clock
>> and regulators to simplefb many years ago with pretty
>> much the same arguments against doing so. In the end it was
>> decided to add regulator and clocks support to the simplefb
>> bindings and non of the feared problems with e.g. ordening
>> of turning things on happened.
>>
>> A big part of this is that the claiming of clks / regulators /
>> interconnects by the simplefb driver is there to keep things on,
>> so it happens before the kernel starts tuning off unused resources
>> IOW everything is already up and running and this really is about
>> avoiding turning things off.
> 
> No one asks to drop them from the driver. I only want specific front
> compatible which will list and constrain the properties. It is not
> contradictory to your statements, U-boot support, driver support. I
> really do not see ANY argument why this cannot follow standard DT rules.

So what you are saying is that you want something like:

framebuffer0: framebuffer@1d385000 {
	compatible = "qcom.simple-framebuffer-sm8650-mdss", "simple-framebuffer";
}

and that the binding for qcom.simple-framebuffer-sm8650-mdss
can then list interconnects ?

Regards,

Hans




