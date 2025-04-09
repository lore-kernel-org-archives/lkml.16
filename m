Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA381D54FA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744191842; cv=none; b=GqaDU9tDvuIgj8SzEBrgF0Yqo26w3d4In0SHCPUqLKtSi+rc0m/pZDId7hSgqGzQkjfNMFpblVYwZF2jtYlmofrUMSnr/68Kg7AtEgi/VnkQtnWPADaH3LA2jq7pE5otPk6Yf7DaPpUg1eVN2K35rWCTnq4pxH/sGkjRCRsQdG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744191842; c=relaxed/simple;
	bh=qgbt78J6YUlj9E/mqPX2zDzf7z9lsZzNRFMWS/p05hU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iZDV+HT5P/4oDrSM/sKD1JzhHcEb2fI6OI6pEsQmPSucsUeBVSdQ7g/ge2agODadqYFknuYa8vUgLdTwIfB2sNLKrCjlo7DAPJ/ABVTQqdTwYD3wiH0O4OJEsXu/taeXiz+MFdcUOaX8g48+oHtbBERSTdvwsCYWnsxtKzUM/4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=THwnFTdk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="THwnFTdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744191839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G7znzCj/gfMRbAPJAEPE1rTbQF7vTbZ1Y1hJc3xX8N8=;
	b=THwnFTdkOqieDievgHeG/SqRgOB5nTyJod4QImtnUO/RDqONCjL9zaqIh4RuDhK+TGCoBn
	y4m49+h72h3HN108Yjl+wFSv6pwN19SBFyF9BwezUabSVqPj8uHjkfGqqktKa0gnD3h8ac
	pVQxo9xTsyf02iVppJSFm/YAnWIRAsI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-mDZeD2OAM7K9a5wFofBttA-1; Wed, 09 Apr 2025 05:43:58 -0400
X-MC-Unique: mDZeD2OAM7K9a5wFofBttA-1
X-Mimecast-MFC-AGG-ID: mDZeD2OAM7K9a5wFofBttA_1744191837
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43947a0919aso46050955e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 02:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744191837; x=1744796637;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7znzCj/gfMRbAPJAEPE1rTbQF7vTbZ1Y1hJc3xX8N8=;
        b=df5Yxmr+7ugoT5pjeEQeDDRXNyPoTEwvUzzM1ZQpwULctUmxVJdBSx4qajge3aawyy
         IvWsMhsOX+bo0zzQ9G3DwzK3646HJWKsf2fs/mV/Xz94YKx0Vog1Tphsc7TboswSnu8a
         YXPt8IiY0vaE256XdywCHH+JU1bWVuouTtrOtcGkHmeWvTGG4BPJJ9uDETMLa1imzLvK
         iDz+Hf4so9JfiLxLURZc/PuzwOi5Zlg40Aeho9BVq/v4K2If1iYvGFudcnmUCdvmtx3j
         LrMQ4uJvDdrFj/YpOEFfGKfmy2V+BQFx1PnVuIVvcNGbMulBKNC5aqYT4V5jyEE3Alfo
         w3bg==
X-Forwarded-Encrypted: i=1; AJvYcCWcQqXWpVJ5saiDeypgVF10SgqxAsVemHAAw85IKbhOFYbP4cfkkj5gBVOsAGx1iTpsJEt8X5kRJ5JILt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUojA2nScUxvuvSArNoljH3hIYqd8td5Cv9HWEGtQqHET2cb1n
	hJeWo93BFPhcYMXwZusf0Ynivn3OJAySPgw6uisuj1v4pRY8sAiknrm4efW3Mp/eKmKSPy54ZgM
	2BCxCmbHHrCIeWCqk2ZDdyMwYPwH7fRgUaBX47YQ5oymrdjBAbz+w/hN8/nST+g==
X-Gm-Gg: ASbGncutgd7jmrdYizqZa8X+4fDw2fss5Ta0C40N1fruXXO3aHFJ5NK838M78x7wbtb
	VVkKxGOIQd68Gy8WwuEPtQ7Ydjc1DqDJoSYYOk57XUhGOpvHwb83G8mFtLhE62QIWgGDy2Ej5sc
	5sTaIRHENUh/MbtxMs6wJAkfC5SE5qAq4i6a0y51O8SHjGOKJ0VBl/aXXTif+QB3jZpXoycXL0g
	GBGx37dHX/va3QR6icYt30k9vvZesmfQWCemq4cmph9HIbLtclcXenxhxug7YowFn7u8creF5rH
	JwGyQ0HX6P51lQfSySVsYY8hmghuL86OCzhB28pV0JxaX00zpBlhc9+KN7qEoGdEoVqSdA==
X-Received: by 2002:a5d:64c4:0:b0:391:3915:cffb with SMTP id ffacd0b85a97d-39d885612a7mr1577987f8f.43.1744191836702;
        Wed, 09 Apr 2025 02:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGu4u3BK/v6GJbjaLAKLe1GqebFBXWq85va/hCAimH4+nbm9+X2gTzlrwLpJ0IJFLslffWkQ==
X-Received: by 2002:a5d:64c4:0:b0:391:3915:cffb with SMTP id ffacd0b85a97d-39d885612a7mr1577958f8f.43.1744191836268;
        Wed, 09 Apr 2025 02:43:56 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f113csm1113919f8f.69.2025.04.09.02.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 02:43:55 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas
 Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
In-Reply-To: <Z_YWq4ry6Y-Jgvjq@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
 <Z_YWq4ry6Y-Jgvjq@gmail.com>
Date: Wed, 09 Apr 2025 11:43:54 +0200
Message-ID: <87bjt5fz51.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

[...]

>> 
>> That's a god question, I don't really know...
>> 
>> But fbdev does support XRGB8888, which may be another good reason to add
>> it and make it the default format. Yes, it will cause an unnecessary pixel
>> format conversion but the I2C transport is so slow anyways that compute is
>> not the bottleneck when using these small displays.
>
> Hrm, I now realised that I have another issue.
> Not all LCDs that will be attached to the ST7571 controller will be
> grayscale.
> The display I've attached to the ST7571 is a monochrome LCD for example.
>

Oh, that's very interesting. This means that vendors are using a more capable IC
(i.e: ST7571) for display controllers + LCD panels board designs, even where they
could had used a less capable one (i.e: ST7765). That is, using an IC that supports
2-bit grayscale when they could just used one that only supported monochrome pixels.

From a quick search, I found for example this one from SinoCrystal:

https://displaysino.com/product_details/SC128128012-V01.html

> Maybe the right way to do it is to only support XRGB8888 and specify 
> if the display is monochrome or grayscale in the device tree.
>
> Or do you have any good suggestions?
>

I don't know the proper way to handle this, but what I would do is to include
the actual boards as entries in the OF device ID table instead of just the ICs.

And then for each entry you can specify what formats are supported, e.g:

static const uint32_t monochrome_formats[] = {
	DRM_FORMAT_XRGB8888,
        DRM_FORMAT_R1
};

static const uint32_t grayscale_formats[] = {
	DRM_FORMAT_XRGB8888,
        DRM_FORMAT_R1
        DRM_FORMAT_R2
};

static const struct of_device_id st7571_of_match[] = {
	/* monochrome displays */
	{
		.compatible = "sinocrystal,sc128128012-v01",
		.data = monochrome_formats,
	},
...
        /* grayscale displays */
	{
		.compatible = "foo,bar",
		.data = grayscale_formats,
	},
};

and then in your probe callback, you can get the correct format list for
the device matched. Something like the following for example:

static int st7571_probe(struct i2c_client *client) {
       const uint32_t *formats = device_get_match_data(client->dev);
       ...

       ret = drm_universal_plane_init(..., formats, ...);
       ...
};

Likely you will need to define more stuff to be specific for each entry, maybe
you will need different primary plane update handlers too. Similar to how I had  
to do it the ssd130x driver to support all the Solomon OLED controller families:

https://elixir.bootlin.com/linux/v6.11/source/drivers/gpu/drm/solomon/ssd130x.c#L1439

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

