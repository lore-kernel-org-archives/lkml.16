Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2BA1EBFE0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745363298; cv=none; b=R+ICUWcpSV0GDLQGmzBK1Y8gysAbXLdu67cUyLVp3j8f6DKP80t1Xcw+IWRJm9UzZB3VO8ya+SeB2kyNgaLp82lK7SuPDZivcii41CiOYOhxkGOC1aEhWaUk3uZKkHfocQqrDSKMi6XeQQRVI6fMuxXV1WP2LUKSqadcH5mwKmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745363298; c=relaxed/simple;
	bh=09JfZNRysDpZNh43lUqVnrZWqi9FDO66H8PN59meWmY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nWLFzxEeDkzlzGB8ZN8Sd7Yb0e7i66CXoDwBJRzVuoHKbN8eLflSLhVqiHr8U83UzYl7C+eXIQq9XhhoqKJ/m9ZYXBmwVPqUvn24gJvQotCkpWWOTz9ggOvlKQUIPq2eQjZbRGOBUq0+CBEj9hjra7PPL94rRjiExyx27BV5Fd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gXOcHwUB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gXOcHwUB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745363295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oHDUzgNIkIt52yZH28h239nYED9JWjDSUxQimRHnhyo=;
	b=gXOcHwUBI12hKU+I1WVQ6Z9opNpYJnxkirO4g6vT4zOwNcrc2Ici06tk/tMtjTjIFJBrCq
	FcPiG6+zAdRj4VmQdvHCq5+8Rx6XwMoAuzH2AK8okLeU2CpLYTmksajh0QmUpp639ZujT+
	It+s9fZY1nWnHLY7+ow3mi93M7xEGpE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-xd0CbKzQMTSo3vVhUT10dg-1; Tue, 22 Apr 2025 19:08:14 -0400
X-MC-Unique: xd0CbKzQMTSo3vVhUT10dg-1
X-Mimecast-MFC-AGG-ID: xd0CbKzQMTSo3vVhUT10dg_1745363293
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43947a0919aso41527065e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745363293; x=1745968093;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHDUzgNIkIt52yZH28h239nYED9JWjDSUxQimRHnhyo=;
        b=SX48viEUTZkMshRtHyJZwucL6TpjjoxnSg03Rje4zK0XdcC5sHGM2nU2+W/S/KbmnG
         Tl+sUofkbFpfE5DyWSveu03kCc0J1recKE/qINFSBeatD4JIt9CyklpI8Di+oDuXMgyI
         l1PLQrgO1QuYPZpbz0IcYvFoMgfBuzzqIkW73RknvBSPgypbu7Rv+MOizXYmsEDfjZ2x
         nmapcrgzN5CbYirxOdS1sRDezlZZgmuR3NMK/HTe9oJgh1/FFr904C2nnMRNZMej0vMR
         fMvMPU/ASoziiG1kOCcjOm4Z4MZ7FTsSsYfYDd8JPzZ80L/dVKjYYhTZKEANwY+6470H
         c/MA==
X-Forwarded-Encrypted: i=1; AJvYcCUZLwo4O/ye7pnAjqP7zxfEPDwovh0KTR7S2Rv5cLM6v0l/BLXknZuoyb6lkXJTSm1YMmtgW21xFgE6td8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJLRFyUqhtAUa4sCD6YeQRENgi3tX7jbNJwdBXtxVgf5ApfRXc
	Vb/0jpMG8VDvxwjfgrSczR6xDhWIeVBbOP16/KyV4YSqFub31LGYvKe9a/kqajAI8LfpUSw4izu
	FcHFz8M73gWB42Blvk4ojxHYpW6MlYB/wgtToAMofXhFVJk4DcEtjh+4KM4o2Jw==
X-Gm-Gg: ASbGncuELhDT2oxNS2jfmkb1OMXTh3m9AMnXs2QiJtxVUZZW7pZqoCqtmCPTYjGBh2g
	vzeIyD9shSC1PCjWONm89JOBGBaWDvO6pjPFeoGUVdyT+n6d89JuP1KxLjelHNNbmaEUB6d+Cbp
	P+u4YLBhjr7/x3jevJntxat0gXdH3eXsTTGeUdxqko9ojzAMXspg9SCzWVYAZCKoPU7p1qUiOWE
	RdM7XZZ1DYaUyrEMVKi8sghQFfFwbtyNcAKJHNoNzlQVKRcp2A4TJOKcjFwN6oOdy70WCXr/YUG
	fP/FuCazOeJUu+QJeTydUXGJJzPmOF8KRrRCvgY/6kPeCcVk8dX7nqRgRNKaWxGogqeBPg==
X-Received: by 2002:a05:6000:401e:b0:391:3f4f:a172 with SMTP id ffacd0b85a97d-39efbb02156mr12229442f8f.49.1745363292887;
        Tue, 22 Apr 2025 16:08:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8TR1dgi0jfTyn+XkCD1/F2vnpkNNPRVQ8DBT1e3D7cQcfX9kUyX5kJoKFqBRRqD5LJn9IAQ==
X-Received: by 2002:a05:6000:401e:b0:391:3f4f:a172 with SMTP id ffacd0b85a97d-39efbb02156mr12229433f8f.49.1745363292560;
        Tue, 22 Apr 2025 16:08:12 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43bf2csm16808121f8f.51.2025.04.22.16.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 16:08:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v4 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
In-Reply-To: <20250415-st7571-v4-2-8b5c9be8bae7@gmail.com>
References: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
 <20250415-st7571-v4-2-8b5c9be8bae7@gmail.com>
Date: Wed, 23 Apr 2025 01:08:11 +0200
Message-ID: <871ptjbxr8.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

> Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> The controller has a SPI, I2C and 8bit parallel interface, this
> driver is for the I2C interface only.
>
> Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

[...]

> +#define ST7571_SET_COLUMN_LSB(c)		(0x00 | ((c) & 0xf))
> +#define ST7571_SET_COLUMN_MSB(c)		(0x10 | ((c) >> 4))
> +#define ST7571_SET_COM0_LSB(x)			((x) & 0x7f)
> +#define ST7571_SET_COM0_MSB			(0x44)
> +#define ST7571_SET_COM_SCAN_DIR(d)		(0xc0 | (((d) << 3) & 0x8))

You could also use the GENMASK() and FIELD_PREP() macros for these, e.g:

#define ST7571_SET_COLUMN_LSB(c)		(0x00 | FIELD_PREP(GENMASK(3, 0), (c)))
#define ST7571_SET_COLUMN_MSB(c)		(0x10 | FIELD_PREP(GENMASK(3, 0), (c) >> 4))
#define ST7571_SET_COM0_LSB(x)			(FIELD_PREP(GENMASK(6, 0), (x)))
#define ST7571_SET_COM0_MSB			(0x44)
#define ST7571_SET_COM_SCAN_DIR(d)		(0xc0 | FIELD_PREP(GENMASK(3, 3), (d)))

[...]

Maybe a comment here that this function only exists due regmap expecting
both a .write and .read handler even for devices that are write only, e.g:

/* The st7571 driver does not read registers but regmap expects a .read */
> +static int st7571_regmap_read(void *context, const void *reg_buf,
> +			       size_t reg_size, void *val_buf, size_t val_size)
> +{
> +	return -EOPNOTSUPP;
> +}
> +

[...]

> +static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb, struct drm_rect *rect)
> +{

[...]

> +	for (int y = rect->y1; y < rect->y2; y += ST7571_PAGE_HEIGHT) {
> +		for (int x = x1; x < x2; x++)
> +			row[x] = st7571_transform_xy(st7571->hwbuf, x, y);
> +
> +		st7571_set_position(st7571, rect->x1, y);
> +
> +		/* TODO: Investige why we can't write multiple bytes at once */
> +		for (int x = x1; x < x2; x++) {
> +			regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
> +
> +			/* Write monochrome formats twice */

Why this is needed ?

> +			if (format == DRM_FORMAT_R1 || format == DRM_FORMAT_XRGB8888)
> +				regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
> +		}
> +	}
> +
> +	return 0;
> +}
> +

The driver looks great to me now, thanks a lot for taking my comments into account!

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

