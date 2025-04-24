Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0173419CD16
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745477124; cv=none; b=af/ur89Vqw+Rwf52s21r+dJKjuYKolWWGMiD6YqwLqc82V1eRYGAFpsQ2j3Dkvq2rhKb9R7xodxxchaeHNvRzbUD9fDBFelZuSjVrsLyMqqGEAIPOUvF2lfXLahObv3xKO02n9eDFIZ62OUZ2lM+B1aMsbkK5l8nNTT5PLDqS7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745477124; c=relaxed/simple;
	bh=rxQ/FT1RVgEYXI8LhtSiH/h2NrZKgMEBIO0ICa05QuM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nSZR6iyulF/6RXptlGXotw0WBj8WcmHctAtB/SvbaeRqwuH4CjzvQGvkfBEb5BuIHUnaHGLYUXhlkMCpskztd2j3aIjxVldh+BcGpCXSENAsZ7luL4ZSdfrKpHI5phl+RYn9dvELJelIZCV8ImKKkhNnirX/0jUoMEfhrx3EhzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ec7r7s2m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ec7r7s2m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745477122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qry02Jna1PBtzsWWvIZILFK6/+S37RFrn9UY0skeI+c=;
	b=ec7r7s2mMUngGzRoNoHmTOh25BfZgwfYx4aOlNoY5d1NKh8PlCiwITAVErStzm/0o13VXJ
	Tny+7hl3IopBv7egqGZygzvv+U+1rePq0cbFols9mCM09Oa2PtL8t2EqhZc7/hkx1lK4BW
	ybMal0M2I0eFdXUq99YITNufmR7CpDA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-42dSUAGjPsmW2P3LTi1yiA-1; Thu, 24 Apr 2025 02:45:19 -0400
X-MC-Unique: 42dSUAGjPsmW2P3LTi1yiA-1
X-Mimecast-MFC-AGG-ID: 42dSUAGjPsmW2P3LTi1yiA_1745477118
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43eed325461so2819135e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745477118; x=1746081918;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qry02Jna1PBtzsWWvIZILFK6/+S37RFrn9UY0skeI+c=;
        b=myKKJC3b3+3r0gdN9l2KAVYb1L9J1MMxMSKNTSVesiK4Q0VrU/en7chnx7MmJv5tCV
         xrAzZJcHmebw2H4hItmLlElBkbzwarQca5JscFRP73eqC7WZF8It4A1SsBp5IrMd/Ft3
         EZGlPF5NrQHit5BEne8UZO47atpGagy4xKetAJaBLSygTHpGOSjYSq9/EOrYgy2JfXl2
         4AHvEyrREOAyT/ZQFXADjrfAH3TZHCnv1DBdv1GNFVxmscfOVAJkbc8AcIvX3KsZvOS5
         KaujuXnjDpPMz3rHaH4jLvPXdNKIXNTsTb/VOWHwPSpAeK7H+verF+Wl1oyKrRh/fvfN
         MBeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoqG5orTlWCpnqHXBDigEJA3jzSapSmJnRiC4GMD3n6wrB606H/16evBWhdPAwtoVYHBIGHiExNXDFdWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVOxzlwyLl5XdT9l2TqyNDrDnz2vLzYwxUX2/6beJni6IZ1FiO
	X7ndW6kBSzmvKk5C4S/t53Kl/4ted1ooaM2p4xnHXagjzk7/9VL44eolBRqTnfa2UqGpqqryxw2
	T3Se8f9Wd6O089vMi/KlcPgkFsTkrucbNczpEqEi8V0ziXKBWBI3fmUtD/0uuAA==
X-Gm-Gg: ASbGncvg7QlKzY4yFGYksZ4CL4SEnfZwNeFIrmw9AYuUvCMZRWi1yn0OB1TWAfBgTB9
	bTZANL/f/H74PvtDiZVpmXIhX30diecoUAlKmDBROyQyUV4vl50yB60l3YA7V+wonljxL5FcNXr
	k54ueMI4+sJteBtnFNyhk4NzRD0dH9haH01r6qYG1y5NP24rvV7w8XWYUsY78I+uh47e2AVYdbz
	1VPipyRXvqPvClFS6B1nBkbnE5z12t/k0o3BEn6J2uYOdblIb4jBxk7nSw9oCJ78A1RLTwGNuA4
	IJWHiAuXRTa0WmKQgF+zNeuyM2+rQiJGNkTvP4P7KOWgrZUnMmXcoSnXX3//S+VGbCRwEg==
X-Received: by 2002:a05:600c:3487:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-4409bd050f9mr12158115e9.3.1745477118458;
        Wed, 23 Apr 2025 23:45:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwbNdfCqgffEIdROOn7ufwYiYIlZP1WbjZdiw5JEvm9+u5qpIj14gNnOoTiUF1Ibt/YIL6PQ==
X-Received: by 2002:a05:600c:3487:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-4409bd050f9mr12157895e9.3.1745477118044;
        Wed, 23 Apr 2025 23:45:18 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d0a7802sm46104405e9.1.2025.04.23.23.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:45:16 -0700 (PDT)
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
In-Reply-To: <aAnb_97kxSDvDcdd@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <aAnb_97kxSDvDcdd@gmail.com>
Date: Thu, 24 Apr 2025 08:45:15 +0200
Message-ID: <87zfg6xdl0.fsf@minerva.mail-host-address-is-not-set>
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
>> 
>> > Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
>> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>> > ---
>> >  drivers/gpu/drm/tiny/Kconfig      |  11 +
>> >  drivers/gpu/drm/tiny/Makefile     |   1 +
>> >  drivers/gpu/drm/tiny/st7571-i2c.c | 721 ++++++++++++++++++++++++++++++++++++++
>> 
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
>
> I'm looking into moving all the (tiny) Sitronix drivers into their own

Great!

> subdirectory.
> When doing that, should I replace the TINYDRM part with DRM for those drivers?
> E.g. CONFIG_TINYDRM_ST7735R -> CONFIG_DRM_ST7735R.
>

I would drop the TINY prefix. That's also why I thought that your new
driver not having TINY in its Kconfig symbol name was the correct call. 

> Or do we want to keep the config name intact?
>
> Best regards,
> Marcus Folkesson

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

