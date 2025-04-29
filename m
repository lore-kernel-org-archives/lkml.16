Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2962627817E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912558; cv=none; b=NhMp0SHPzh+2ASl3NJknpypm3U7Dh407TuKK3gHcK6LW2dnrJj8RRK4ho0BxI+Ud1LU1js/n95imK/iCfpMItlgGJuYvZIBwVXYAlt6v/xb2p7FHxqn5LatXCocvioz+zy7m5MRd11syBASZBKbXF8hfJtF9GPLKfzVXbauZD1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912558; c=relaxed/simple;
	bh=9qoxCTqikDogAGoeFqSOj3PBA/tkwj/zZCdtoJS9BsQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q28TAtzklx2mvODxc3ptNGu3KDV+6U+JvThMTrqST4VFLwpXmVfCpQtkwRIm0ZeQvSHSGfHeQe6zEr3jf9mJJFc/XskgJmvJT5MhVnqJy6lpCCuWxcKxkL9lPXIUb+IY6W8Lx1XS1iBZdc5Sd4KnE1tkTydNnzCKVi26OqTRxyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LWzgT7jq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LWzgT7jq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745912555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2WJLuJixmXGVbFFRQCzfbjiksJv5N+boviU3Y/WZ0Eg=;
	b=LWzgT7jqa6lGKDPxgMIcp/qs0LapAA6gNrH+cKHabc5C6vgqoOtk183HqT3tmvMKPJq7v4
	oRDb4aRaKtuc3wPC65Z3W4crf7XUEIbxjmoi3PFJy0rOYL4c+huMaQ63oOWDZ9SKV9RUVx
	4q+9fieCeVi245a6nRh9eKnNCAgIKVw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-kBEdIe7EOfuRlztKFHMrMw-1; Tue, 29 Apr 2025 03:42:34 -0400
X-MC-Unique: kBEdIe7EOfuRlztKFHMrMw-1
X-Mimecast-MFC-AGG-ID: kBEdIe7EOfuRlztKFHMrMw_1745912553
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d6c65dc52so40458995e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745912553; x=1746517353;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2WJLuJixmXGVbFFRQCzfbjiksJv5N+boviU3Y/WZ0Eg=;
        b=Ryoiw531Pte7G5lyz8ct9wVAR1bKFhxx46b85HqnwPcveY21VA72KOMjzFBSBQ1ZNj
         Ag+IXB+PX3QqThED0Lps6j098uU1gQjDytYhfH9DAh/4Add24FafbosigvesE6BNmB0E
         lGpD2SeWYrvVOvQBiKSgvQw0o2+fVFjYzjSNvlY9HurK+ORd35EtpOQG7Jgtpph4vAga
         mrB5IWIUvPNTZX3F+VP17p5EhIWY2k0q9r6uQX+5NHmW4oiiu/AMfjK6HgEfFSVOg9gD
         Eu1Yzk9Qezu1GYIyYlgOtuXzG9TxzpmXue3zpmxW4TFXiMrLYmaDlQm3FTkHNMxIn03W
         rnzw==
X-Forwarded-Encrypted: i=1; AJvYcCUPUzyl+rs3Twn7TJUvWwWcwOj4xz+n+24Rtej+SPSuy1mGwAGxVe1r9d5+jGjk/nPjSAbvpreoQJIrCrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRTIA+wOJSIRiq5WQLK0eZHLOIbA/9pPBomKBk49IwW0FgTyNl
	89iO3F4u+1c49F+TNig5W2rnJZt5w7gh+hv/T37fsacK0GZNbmIVxtPhsrn2zAb2HyoX+2sUiAl
	6PwYdr14manI6Lu7YF9Y2NxNe0CGaFyB2jdRbe1TNo7MYUYguleDEpavsMIu2RQ==
X-Gm-Gg: ASbGnctFeQqgCaOkFqmRw3WiovT/lI0MT5Ti8KZBNDNUietoEKP4JWT3dl0GZw0hwBO
	0YrBtygIgvR+NH4Jy3vPpNZf90aVNZzXn8JAL4Uk0/LESrwDuzsG8nHD9PcBc2M3blNrKl+iAxw
	Lv2UEh2wVoNgyelaMfCfn6Z0skfpFfuuUXMyzMFCJxgQH0tVTlbIBIwXTgH4uDHPxMnOw6IzwP1
	uxYbDndAhY46I6KglBsqmHTntHVJD+FKLG5VFJfzkRjAHmI8VrBs3pwQJ9Kl2kfY3A2IeEldegL
	dNhMQ0Ao9Va3pXG5pEWmMMuh2X5QFT0ed6NvCsHFxRMdZZ/naZxS/rhrX4pudd+gEFfqFw==
X-Received: by 2002:a05:600c:8112:b0:43c:f78d:82eb with SMTP id 5b1f17b1804b1-441ad3c708dmr15682195e9.15.1745912553173;
        Tue, 29 Apr 2025 00:42:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrbaa16eT2YfJ2I3RUri8LVtJfxyLH1l9EZ6S6qHzSHeygChD6UMBwtMMJT+K8rzP90d6d3Q==
X-Received: by 2002:a05:600c:8112:b0:43c:f78d:82eb with SMTP id 5b1f17b1804b1-441ad3c708dmr15681895e9.15.1745912552856;
        Tue, 29 Apr 2025 00:42:32 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad112sm179026395e9.24.2025.04.29.00.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 00:42:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Marcus Folkesson
 <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas
 Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v6 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
In-Reply-To: <CAMuHMdWWzE-ADAfXiNxbDOSur5n5zF1NkcB7Pab0_pq2-Q85=A@mail.gmail.com>
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
 <20250423-st7571-v6-2-e9519e3c4ec4@gmail.com>
 <CAMuHMdUsP5gcTyvqJM4OUFL3VutzDrX-V23uYRfnfgzotD8+rg@mail.gmail.com>
 <aBBukAqH3SKV9_Gl@gmail.com>
 <CAMuHMdWWzE-ADAfXiNxbDOSur5n5zF1NkcB7Pab0_pq2-Q85=A@mail.gmail.com>
Date: Tue, 29 Apr 2025 09:42:30 +0200
Message-ID: <87zffzza55.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Marcus,
>
> On Tue, 29 Apr 2025 at 08:15, Marcus Folkesson
> <marcus.folkesson@gmail.com> wrote:
>> On Thu, Apr 24, 2025 at 10:38:33AM +0200, Geert Uytterhoeven wrote:
>>
>> [...]
>>
>> > > +                       /*
>> > > +                        * As the display supports grayscale, all pixels must be written as two bits
>> > > +                        * even if the format is monochrome.
>> > > +                        *
>> > > +                        * The bit values maps to the following grayscale:
>> > > +                        * 0 0 = White
>> > > +                        * 0 1 = Light gray
>> > > +                        * 1 0 = Dark gray
>> > > +                        * 1 1 = Black
>> >
>> > That is not R2, but D2?
>> > include/uapi/drm/drm_fourcc.h:
>> >
>> >     /* 2 bpp Red (direct relationship between channel value and brightness) */
>> >     #define DRM_FORMAT_R2             fourcc_code('R', '2', ' ', ' ')
>> > /* [7:0] R0:R1:R2:R3 2:2:2:2 four pixels/byte */
>> >
>> >     /* 2 bpp Darkness (inverse relationship between channel value and
>> > brightness) */
>> >     #define DRM_FORMAT_D2             fourcc_code('D', '2', ' ', ' ')
>> > /* [7:0] D0:D1:D2:D3 2:2:2:2 four pixels/byte */
>> >
>> > So the driver actually supports D1 and D2, and XRGB8888 should be
>> > inverted while converting to monochrome (and grayscale, which is not
>> > yet implemented).
>>
>> The display supports "reverse" grayscale, so the mapping becomes
>> 1 1 = White
>> 1 0 = Light gray
>> 0 1 = Dark gray
>> 0 0 = Black
>> instead.
>>
>> So I will probably add support for D1 and D2 formats and invert the
>> pixels for the R1, R2 and XRGB8888 formats.
>>
>> Could that work or are there any side effects that I should be aware of?
>
> That should work fine.

Agree.

> Note that you do not have to support R1 and R2, as they are non-native.
> AFAIK XRGB8888 is the only format all drivers must support.
>
> Gr{oetje,eeting}s,
>

That's correct. The driver should only support D1 and D2 as native formats
and (emulated) XRGB8888 for compatibility with existing user-space. No need
to support R1 and R2 since the controller does not support these formats.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

