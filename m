Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734BA2586C3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617335; cv=none; b=ukX2eQA0pL9IGOQetgUagk7z8hmVYoP5AMvzRzvX5XjwAdrEtwxJ392MY4Kw3ytFnUKTwPHm5ivw4Gd/y4rZcfrMCZdzAUHMADBXMJ1FlChSEJ6newAsRjDaSzaIKt4xqOxAHlRHDS5DDi2ErqvlM7h8hGpAqTcYfVSgXA/dx/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617335; c=relaxed/simple;
	bh=wjNxOzatIMQ/Kiz1EXdXpytR1voiNFIQ15IZqnNJ+ec=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FTNuJaa5UaoIY7FVx+rXjqrIB4y4EdNs6BelyHS0sR9T7zycRcVlMcRqr7MWww944NznQVp/VpjJOURsfqrS5lRwTGkSK5PY13PGHir4FLwaZztjMggJtR8FQIb0SePtGN/1B/bEAJ1xnTxqQP+dVJkNoUegScmoB3w6zyiwT/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MECRARLp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MECRARLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744617332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VyGy8TpTRsYSW6wLWDE/VjeSgPcgxN9oD2qpQCJJZhc=;
	b=MECRARLpxztJFVwL14OcqkuKt8I9iSocRGhZuQH4f/rHh6L3k7JBFV6idCZzzECSuLaa6a
	jF9SI3a+VyJXvQfO3otY4ZpQdXGA+7DM8X2zweRi4JIvaMMjosB1jllRVZwnCYKcpKIxCD
	94resalStcP5XOFxQ3c+XpW6iGlUzeo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-g6LhfCPvMFCtyYcdH2Rjlg-1; Mon, 14 Apr 2025 03:55:29 -0400
X-MC-Unique: g6LhfCPvMFCtyYcdH2Rjlg-1
X-Mimecast-MFC-AGG-ID: g6LhfCPvMFCtyYcdH2Rjlg_1744617328
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39141ffa913so2251894f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 00:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744617328; x=1745222128;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VyGy8TpTRsYSW6wLWDE/VjeSgPcgxN9oD2qpQCJJZhc=;
        b=qOcwihhMKtP3YMfzUAC2Lc5f33EueYxLGFV7wwQVdzIVB3uNpq6Em5jhE8ZzYcLxgO
         dChaf8TmAHLG1VMAyYZMZ3s652DX+B0tyIV27NRdwliE6tXuLpg9d7syUquhTcQHGXtx
         jppxxcW1d9Oin8etDnBVJg2lYDBN1gsfsAgBNtWISDKyeBDnhyHp+h5eaJBggjOKoJ/a
         RzIcBdUSCiG0FJuvyaU6p/jXgz7+b6rFucR/spyjESMxAkpYH+C0+hOLjEev1BoOShni
         1nUeVR6eyL8lBdoQ+wlGTMZk0HoqpZ9l6+oZ4SHvV1BYNKL3ZT7UvYS5nMrIMpG4s5qP
         LpDw==
X-Forwarded-Encrypted: i=1; AJvYcCXc8P5jU+o+0i7+1tJjNugWPGiKde+eozAew/4bsKRo8R+0i3mVG576KNMLznGR6CFHPn2DwndSioJ3N0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhZbC2abVR/9ZUYUEzVmT8X6ESYRgKWZAgg9qhLuBGt7El7bVz
	mJpkUsnmoMIe7AHKEIfntmvGVZziD9suan961lPS0+A8HtGn/bM5PsXAXfeV5QErX1rsc36Wbky
	+oflk5B7Xh1zLnPEyhZIkRZV2k/jrDhUCBSEzI+KFnVmSRmEcAT1YW8XYcz81lw==
X-Gm-Gg: ASbGncu5lv/Hj1M7j63hplRMsZQxeSoqU2ZfRXC6fLMmM0GfZUqlMY2igYk65Gz5Ts1
	a4Yu/0jl/9CdJAB8DtEYkDxoJH6U4/ZDC0JZO8qmvCNVfR2Dfzm+VK8DSyK9PsTZHiLuKL6WJcw
	JNscnOkipQjzK1RQK/WKGxVuExjZDbs1gU4nGzZ7fJXC2W4WE7TvAqrT7q2hpo+FvDRjPUs2BNN
	e0fsQmwfzfU4jqJJfdVzQrkh7khFFA0BJ0jo5EUfD6dpsYSOhprwdfvYdYydzrY+n0lz4rOX4YZ
	k9W/yKHK0gDDePOehOdaVghPkRiOXV1jATxUMXBRTffJ
X-Received: by 2002:a05:6000:2586:b0:39c:e28:5f0d with SMTP id ffacd0b85a97d-39ea52171d4mr8935039f8f.25.1744617327906;
        Mon, 14 Apr 2025 00:55:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETQUkn0hF6FLm9NcXpYwCxUXih2R9GqT9ocdhEggOG/wqrLcDmZ7Cdgh4Umo12Ue468Vucbw==
X-Received: by 2002:a05:6000:2586:b0:39c:e28:5f0d with SMTP id ffacd0b85a97d-39ea52171d4mr8935008f8f.25.1744617327462;
        Mon, 14 Apr 2025 00:55:27 -0700 (PDT)
Received: from localhost ([2a01:cb1d:968a:da00:a3a9:3006:4689:68f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cdfdsm10378556f8f.61.2025.04.14.00.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 00:55:26 -0700 (PDT)
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
In-Reply-To: <Z_oOkb2Lx3HNhnSK@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
 <Z_YWq4ry6Y-Jgvjq@gmail.com>
 <87bjt5fz51.fsf@minerva.mail-host-address-is-not-set>
 <Z_iwspuiYAhARS6Y@gmail.com>
 <875xjb2jeg.fsf@minerva.mail-host-address-is-not-set>
 <Z_oOkb2Lx3HNhnSK@gmail.com>
Date: Mon, 14 Apr 2025 09:55:25 +0200
Message-ID: <87v7r76utu.fsf@minerva.mail-host-address-is-not-set>
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

>> >
>> > A comment for v4:
>> >
>> > I think I will go for a property in the device tree. I've implemented
>> > board entries as above, but I'm not satisfied for two reasons:
>> >
>> > 1. All other properties like display size and resolution are already
>> >    specified in the device tree. If I add entries for specific boards,
>> >    these properties will be somehow redundant and not as generic.
>> >
>> > 2. I could not find a ST7571 with a grayscale display as a off-the-shelf
>> >    product.
>> 
>> Sure, that makes sense to me.
>> 
>> Can I ask if you could still add reasonable default values that could be set
>> in the device ID .data fields ?
>> 
>> As mentioned, I've a ST7567 based LCD and a WIP driver for it. But I could
>> just drop that and use your driver, since AFAICT the expected display data
>> RAM format is exactly the same than when using monochrome for the ST7571.
>> 
>> But due the ST7567 only supporting R1, it would be silly to always have to
>> define a property in the DT node given that does not support other format.
>
> Sure!
> I've looked at the ST7567 datasheet and it seems indeed to be a very similar.
> Both in pixel format and registers are the same.
>

Thanks for confirming, that was my understanding too.

> I think specify a init-function (as those will differ) and constraints will
> be enough to handle both chips.
>
> I will prepare .data with something like this
>
> struct st7571_panel_constraints {
> 	u32 min_nlines;
> 	u32 max_nlines;
> 	u32 min_ncols;
> 	u32 max_ncols;
> 	bool support_grayscale;
> };
>
> struct st7571_panel_data {
> 	int (*init)(struct st7571_device *st7571);
> 	struct st7571_panel_constraints constraints;
> };
>
> struct st7571_panel_data st7571_data = {
> 	.init = st7571_lcd_init,
> 	.constraints = {
> 		.min_nlines = 1,
> 		.max_nlines = 128,
> 		.min_ncols = 128,
> 		.max_ncols = 128,
> 		.support_grayscale = true,
> 	},
> };
>
> static const struct of_device_id st7571_of_match[] = {
> 	{ .compatible = "sitronix,st7571", .data = &st7571_data },
> 	{},
> };
>

That's great! Exactly what I had in mind.

>
> I can add an entry for the ST7567 when everything is in place.
> The chip does not support the I2C interface, so it has to wait until

Yes, but there are designs with carrier boards that support I2C. For
example, I have  [1] and [2]. The former comes with an I2C interface
and uses the ST7567S IC variant, while the latter comes with a 4-wire
SPI interface and uses a ST7567P IC variant.

But don't worry about it. Since I've these displays and your driver now
allows for different IC families after adding the mentioned indirection
layer, it should be very trivial for me to add support for these on top.

> I've split up the driver though, which will be right after this series.
>

Nice, thanks again.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

