Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2FC268FE5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744112075; cv=none; b=hUgcyVMa1nirqKsBvyp4ieOZ1NHxu90aJv3eWAt2lMr4zDqKjBYN34fAwF0WJ1e4IBSk69oLarYtxJsp+dAHz9Zk/dS/qtM6np01T5LEy+Z724xtduQdi1xbmC8QQ8mEQMVAFhANCl1GWuIPS+FlYCB0fkrCpikRDAgYMawI/4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744112075; c=relaxed/simple;
	bh=4x59vokfEn4mqffHLLahm5tXLvJ/2uXuqBEPOj6Uy1g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NgaT1fgFSwN81Tm2iRVeRir5jNyfmEczPuEKTrduHrUDGVOEgRnUWFvOZkE+gXxhLEgXGohvNQnY9Miy0HBLgCzvhkMA/TJPi12uq5og4Lg1B+hcAGbqsL8osrWvlBACqsGdo/7F/RSulxFata4xz0h5AguOcVBUW9iTLwZe10U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ypu2W7wq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ypu2W7wq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744112072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PAhKuQb3RoCqJ3z/VKP8lkfDlIZ0rdzLrgCMtYUeatE=;
	b=Ypu2W7wqIpXpuM2lboTZeljw1dYUbG/c8HvAvINS2OtTBJ+uAgIC/aCW72J4Jh1rFXRue0
	iaW1B0L4XKfxQy/TrlaQ79POh37O84/se/MCLzvhOs38Nx8Kumzr0K3dEPjHCyg8AGoXxX
	qIGGD6TEq6MhlN9XWnuiyAtBrd4yCP8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-QphBJrdrPf6ZrfUE36tC1w-1; Tue, 08 Apr 2025 07:34:30 -0400
X-MC-Unique: QphBJrdrPf6ZrfUE36tC1w-1
X-Mimecast-MFC-AGG-ID: QphBJrdrPf6ZrfUE36tC1w_1744112070
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3913f97d115so2696751f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 04:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744112070; x=1744716870;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PAhKuQb3RoCqJ3z/VKP8lkfDlIZ0rdzLrgCMtYUeatE=;
        b=fbK5QEW1WUYjoCSo1FNwIW4wKTy9xIOEiBQTpSfVozn5MUbHqszlWFOypAUt0NMIns
         RlLGeU/8+Dab55r9d7DEmGxMSi4pd3B2zcIAGTa5XpH9gnSzfPmlg3cELLAYhMNq8vuN
         E2NxH6nZTFvGvT50EWKoESzV67xPqfx7lu/limnhMS5pa/dB3s8kVNjQWiUSXwRnOvLp
         R6T8NUl/9Nx0kXq4SXzW/ZaQ1V+4nWWq1iGLTHXF/+ips7t3J73U1wCgzbwaSwK7H+6z
         rGM3WkqPMcMy+fUqQutqVHcMdyJQw+8LAP0Iu9DTPDMs4OiNCYwrqNBsbZqF1CBXfG2x
         anHA==
X-Forwarded-Encrypted: i=1; AJvYcCUkQWyAYx8FdxeKSiJLrzqYxVNcwwJsBQ76PeEzdO/UL8aQSUiF2gKgJ0wlqtAnpvPxg0QxcO9MyROJlVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyICk15SjS78Kur/z08kcAooyn4SqRPoLe51bsY/6ui4ciig2mV
	OE5eyNBbpkZAH77zIDbBs7FeRWzmXZBP7M+IM3fqC8V4M6Z/kb4DAQl6HmWdo8WFXEaB/RlwCYm
	FrdqVZqZQFvdp2Eh1NH0kNM70ruuEe5gwg96L4QjgPvLYdGP3uO/gZx+1dF07pg==
X-Gm-Gg: ASbGncsJP3BJzXY8jG2q1coyStA6IlVv5KGGDzXHMc/1qVsgs1i6HLzbaYikh349pwR
	nNnhb7lo1IATVvewLBvR7nybpqkQXdrL2F5ujU+JjNb4j++QJ5ATeHZK2PIdHVIxeReT3T1YmCX
	tckZ6dvgG7weEdLAwnHNJ8p4FoUDaz7UCe1SvBcPzDjxI+9SRflWiIjBUe0qkdQuPD96CP7C4Pn
	Vxr9EYjW5bs/hmZEbAcnaS3D3scwQqUHLO/Fx7TTzzcll8jE4YlD9klagsYUvGduZrcP8UmNNoA
	KPR4nMphnrCDqmOWkqNchdtPLjREOtISOdD+p8qiRrl1wh9823EJFQ5ALfMUTdsRGFkbFye16Q=
	=
X-Received: by 2002:adf:b605:0:b0:391:21e2:ec3b with SMTP id ffacd0b85a97d-39d820ab5a7mr1911490f8f.3.1744112069652;
        Tue, 08 Apr 2025 04:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF7dCMQ395WPISkch1rK8BCQ56JHVKYbHjaY16C0nZdn5ezaBn6zxMmjhUxzXiNWxckPpQoA==
X-Received: by 2002:adf:b605:0:b0:391:21e2:ec3b with SMTP id ffacd0b85a97d-39d820ab5a7mr1911463f8f.3.1744112069287;
        Tue, 08 Apr 2025 04:34:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d9cfsm14619063f8f.78.2025.04.08.04.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:34:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
In-Reply-To: <c4669293-0d56-4bdd-9075-01281042b002@suse.de>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <c4669293-0d56-4bdd-9075-01281042b002@suse.de>
Date: Tue, 08 Apr 2025 13:34:27 +0200
Message-ID: <87iknega4c.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi,
>
> lots of good points in the review.
>
> Am 08.04.25 um 12:44 schrieb Javier Martinez Canillas:
> [...]
>>> Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
>>> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>>> ---
>>>   drivers/gpu/drm/tiny/Kconfig      |  11 +
>>>   drivers/gpu/drm/tiny/Makefile     |   1 +
>>>   drivers/gpu/drm/tiny/st7571-i2c.c | 721 ++++++++++++++++++++++++++++++++++++++
>> I personally think that the tiny sub-directory is slowly becoming a
>> dumping ground for small drivers. Instead, maybe we should create a
>> drivers/gpu/drm/sitronix/ sub-dir and put all Sitronix drivers there?
>>
>> So far we have drivers in tiny for: ST7735R, ST7586 and ST7571 with
>> your driver. And also have a few more Sitronix drivers in the panel
>> sub-directory (although those likely should remain there).
>>
>> I have a ST7565S and plan to write a driver for it. And I know someone
>> who is working on a ST7920 driver. That would be 5 Sitronix drivers and
>> the reason why I think that a dedicated sub-dir would be more organized.
>>
>> Maybe there's even common code among these drivers and could be reused?
>>
>> Just a thought though, it's OK to keep your driver as-is and we could do
>> refactor / move drivers around as follow-up if agreed that is desirable.
>
> That sounds like a good idea. But the other existing drivers are based 
> on mipi-dbi helpers, while this one isn't. Not sure if that's important 
> somehow.
>

Yeah, I don't know. In any case, the driver / module name is not an ABI so
we can always move around the files later if needed.

>>
>>>   3 files changed, 733 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
>>> index 94cbdb1337c07f1628a33599a7130369b9d59d98..33a69aea4232c5ca7a04b1fe18bb424e0fded697 100644
>>> --- a/drivers/gpu/drm/tiny/Kconfig
>>> +++ b/drivers/gpu/drm/tiny/Kconfig
>>> @@ -232,6 +232,17 @@ config TINYDRM_ST7586
>>>   
> [...]
>>> +
>>> +static const uint32_t st7571_primary_plane_formats[] = {
>>> +	DRM_FORMAT_C1,
>>> +	DRM_FORMAT_C2,
>>> +};
>>> +
>> I would add a DRM_FORMAT_XRGB8888 format. This will allow your display to
>> be compatible with any user-space. Your st7571_fb_blit_rect() can then do
>> a pixel format conversion from XRGB8888 to the native pixel format.
>
> It would be a starting point for XRGB8888 on C1/R1. I always wanted to 
> reimplement drm_fb_xrgb8888_to_mono() [1] with the generic _xfrm_ 
> helpers. Once the generic helpers can do such low-bit formats, C2 would 
> also work easily.
>
> [1] 
> https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/gpu/drm/drm_format_helper.c#L1114
>

Agreed. But even in its current form that helper is what I had in mind and
what is used by the ssd130x driver too for XRGB8888 -> R1 conversion. There
is no drm_fb_xrgb8888_to_gray2(), but that could be added as a part of this
driver series.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

