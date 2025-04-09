Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41FC1DFE22
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179092; cv=none; b=FC6UibtePQdwB12tZnQTIeR1iHkTXpCmeKunwoCc4PNfBrEqKR8KH7UXAVGKgobCC6XoHWCiPlpkwQ/ZNt+lTu0Agje/S+0eCaRI3FnW99esdRzPauoU0T3ba4CZKyXlmMTB2cq/CFd3cCnbVzmx/pL5bybp9JXzvZpN9xu9RPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179092; c=relaxed/simple;
	bh=409tm8dP71xcML+rgqcgeadxO3pXn5Cf4iI+BblzUX8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YmUmyc7YxmMgp5vazLlChdkxDW9hgCUXHiopSU5iyxl3yLvZUukoFNFOh6wcMEGk6rDlwuzMtNUGJp/BgNUkSolGKqaRswlXZHpfYojaYTBrtR3NcNjQcCCDzn5+GIckSgJ3FkLTOvvuDyIJCfqCKToBDtQ8okn8OODHCL+8LD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RJRbz6Fi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RJRbz6Fi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744179089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FkGJe1evrgUVlR6KJxJhudUWP1DF0JGYcQqiM6RClM0=;
	b=RJRbz6FiYTQc8EFi8SY19jCC94jxMSkkJpS9G1HeHzg4nrG+BpvVC15rgfJT22eaEwMzuj
	qXp/pPKnEL0FIIObVaOAiuEtd2//rBT27JNN+zTgjUlaO2V/9VZ+xLniu+oECs/kKH9WH0
	Xh9tV5xG1lskc+1Q3XZOpWHfcy2uH8E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-EB6lNAu9O1qAQaSm6h6xog-1; Wed, 09 Apr 2025 02:11:27 -0400
X-MC-Unique: EB6lNAu9O1qAQaSm6h6xog-1
X-Mimecast-MFC-AGG-ID: EB6lNAu9O1qAQaSm6h6xog_1744179086
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso45400815e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744179086; x=1744783886;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FkGJe1evrgUVlR6KJxJhudUWP1DF0JGYcQqiM6RClM0=;
        b=tp7h+UxM8QgFymt4fo5FSVZWXzNFz6bbyezdwrR8L2mZ6YN6aNdUNZQ5STlsICBUKO
         1JqsZIxFPHRbkQBRk1FIBsveGbKtPncCVryRmKLJsMaF4k63yAfhlzinvZtIYMNj7VVX
         oFeqlVsvvMXs6AExA6a1BPkYXbfOSu01WmSAWOh2da8zUS/BokPNxL9guhGby6sfbhxb
         De2qfM4jU2Zjol9ZBp148rTKgmc2T3YAnHzNsoZ9QdI8FI+obZKjz8vsgvWjEHjKmFRX
         Arscp3STmJHGFV6En2ZP8OfJzZb/jLRlvaxUjyN6dihK3vH2j06J681ecCkk27M+PF4S
         flYg==
X-Forwarded-Encrypted: i=1; AJvYcCVwhAGNWnYKF2+ZGHLPpL06NwlsyexCWwaC9IMexv5nwvxwwpajm7I1V55buLbUl7/UDOH4RM0SKRsWNsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEFG9RxBHvcCSLqVFW0J7FWVZmN8xwJMXHinRtGgqL/vs7Ae9u
	SKtMYLCmdt6HLqImy0heDDI9WWPS3DeBUF+Q0Wvx2Ftnkg/XzBxpW0jeu+C/YdxC+c2p+bjdSzj
	J/fTTBmo0mWcd3LGPMjw0bmp/8lHoByiV7H+lhd9x+2ADdodYGNGi6lezXjvXrg==
X-Gm-Gg: ASbGncs6vYHEY83/omf2ogKczxuRXetFBgJI6TOwQmJK4DHac7UorEYLpJCmwW6EJWw
	P8b9OMrDhqFTkDGZUdMYahWoi6I/GTHZ+a1oKpRfhDyw/ptZZVG4iRQU2JH0qdt8lrb+NKNTkyx
	6UM1eWrPPvTFD3pqUUJEcpkGbPoNbaOP+m8YXRYZKqPw6dMPopA8LozQ6tudrUXT5BPzifjy0A+
	Ck4istR/jLQaZUmBkAu6XBz/9T5FXZfkKS5+lx+vB5P7uE6uUD5z2/eIFyyHliv5ukLAuPQDnmY
	LhAxCYbWhs+0EL+cfWFNLe4Iv//nnmkq3W0d3Ibn
X-Received: by 2002:a05:600c:154a:b0:43d:300f:fa51 with SMTP id 5b1f17b1804b1-43f1eca7bcemr12685725e9.9.1744179086138;
        Tue, 08 Apr 2025 23:11:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSLZG2TBuSXmab/YseLnbp2IIg80r1qZhkNHXeucJ53UNHusBlv/XxTzUgia33RxlF3w3lcA==
X-Received: by 2002:a05:600c:154a:b0:43d:300f:fa51 with SMTP id 5b1f17b1804b1-43f1eca7bcemr12685485e9.9.1744179085800;
        Tue, 08 Apr 2025 23:11:25 -0700 (PDT)
Received: from localhost ([185.124.31.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecb20sm9182735e9.3.2025.04.08.23.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:11:25 -0700 (PDT)
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
In-Reply-To: <Z_Uin2dvmbantQU4@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
Date: Wed, 09 Apr 2025 08:11:23 +0200
Message-ID: <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

> Hello Javier,
>
> Thank you for your review and suggestions.
>
> On Tue, Apr 08, 2025 at 12:44:46PM +0200, Javier Martinez Canillas wrote:
>> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>> 
>> Hello Marcus,
>> 
>> > Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
>> > The controller has a SPI, I2C and 8bit parallel interface, this
>> > driver is for the I2C interface only.
>> >
>> 
>> I would structure the driver differently. For example, what was done
>> for the Solomon SSD130X display controllers, that also support these
>> three interfaces:
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/solomon
>> 
>> Basically, it was split in a ssd130x.c module that's agnostic of the
>> transport interface and implements all the core logic for the driver.
>> 
>> And a set of different modules that have the interface specific bits:
>> ssd130x-i2c.c and ssd130x-spi.c.
>> 
>> That way, adding for example SPI support to your driver would be quite
>> trivial and won't require any refactoring. Specially since you already
>> are using regmap, which abstracts away the I2C interface bits.
>
> Yes, I had in mind to start looking into this after the initial version.
> The driver is writtin in this in mind, everything that is common for all
> interfaces is easy to move out.
>

Yes, I noticed that and the reason why I mentioned the file layout used in
the ssd130x driver. If was meant to only be an I2C driver then I think it
would be a good candidate for the tiny sub-dir (that is for small drivers
that can be implemented in a single file).

But as said, it's OK for me too if you start in tiny and then refactor it
to be moved to a sitronix vendor sub-dir.

[...]

>> > +static int st7571_set_pixel_format(struct st7571_device *st7571,
>> > +				   u32 pixel_format)
>> > +{
>> > +	switch (pixel_format) {
>> > +	case DRM_FORMAT_C1:
>> > +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_BLACKWHITE);
>> > +	case DRM_FORMAT_C2:
>> > +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_GRAY);
>> > +	default:
>> > +		return -EINVAL;
>> > +	}
>> 
>> These should be DRM_FORMAT_R1 and DRM_FORMAT_R2 and not C{1,2}. The former
>> is for displays have a single color (i.e: grey) while the latter is when a
>> pixel can have different color, whose values are defined by a CLUT table.
>> 
>
> I see.
> Does fbdev only works with CLUT formats? I get this error when I switch
> to DRM_FORMAT_R{1,2}:
>
> [drm] Initialized st7571 1.0.0 for 0-003f on minor 0
> st7571 0-003f: [drm] format C1   little-endian (0x20203143) not supported
> st7571 0-003f: [drm] No compatible format found
> st7571 0-003f: [drm] *ERROR* fbdev: Failed to setup emulation (ret=-22)
>
>

That's a god question, I don't really know...

But fbdev does support XRGB8888, which may be another good reason to add
it and make it the default format. Yes, it will cause an unnecessary pixel
format conversion but the I2C transport is so slow anyways that compute is
not the bottleneck when using these small displays.

>> ...
>> 
>> > +
>> > +static const uint32_t st7571_primary_plane_formats[] = {
>> > +	DRM_FORMAT_C1,
>> > +	DRM_FORMAT_C2,
>> > +};
>> > +
>> 
>> I would add a DRM_FORMAT_XRGB8888 format. This will allow your display to
>> be compatible with any user-space. Your st7571_fb_blit_rect() can then do
>> a pixel format conversion from XRGB8888 to the native pixel format.
>
> This were discussed in v2, but there were limitations in the helper
> functions that we currently have.
>

Indeed, will need a drm_fb_xrgb8888_to_gray2() for R2. There is already a
drm_fb_xrgb8888_to_mono() as mentioned that you can use for R1. 

> I will look into how this could be implemented in a generic way, but maybe that is
> something for a follow up patch?
>

Yes, it could be a follow-up patch. It just helps to have XRGB8888 support for
compatibility reasons (the fbdev issue you found is another example of this).

[...]

>> > +
>> > +static void st7571_remove(struct i2c_client *client)
>> > +{
>> > +	struct st7571_device *st7571 = i2c_get_clientdata(client);
>> > +
>> > +	drm_dev_unplug(&st7571->dev);
>> 
>> I think you are missing a drm_atomic_helper_shutdown() here.
>
> This is a change for v3. As the device has been unplugged already, it
> won't do anything, so I removed it.
>
> Isn't it right to do so?
>
>

It seems I was wrong on this and your implementation is correct. I talked
with Thomas yesterday and he clarified it to me.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

