Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AB325E81E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744208156; cv=none; b=MJ99ldGgKay1j5isuQD3VB3ENoUM4m+khhkNGXeaz0T7ZNaZeRSB4xxqSs3J6KYTA2ANCSI9jg0utUYDD0WbuUT2Li3RFhqaqEyvKcaTyuzJn+uV1eOkGl3XCvm9R/nDa8js0nUsToO3z+oro5sTVFMNTSEpdfKXEWKTPppqiOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744208156; c=relaxed/simple;
	bh=kApXL9M6tO2g0u+nkZcGGRgKPQUBzA5q4YOi2SFdpHk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kkd4BtqONZv4XMUwdyEvDaRb8RJG/ZtT4Tez0jhZuZQlMuDMROjpXBfpFsNHMT9rjifghK9FNSiwraNgUgKx+rjOqsrgCOU54lx6UCWPju3r4Z/JD/wtJ6Byr4YZDQ2li9w6Grp8NmWAYRJs5V7lSHsxIsd3OCWUHDVgGYDpd64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eVvbvets; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eVvbvets"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744208153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jrpHertxVntQ/qY4h1MpBQE3souh5hv0fw5zEOUNKB8=;
	b=eVvbvetszBTFvRW+iwGf2u+yUVDvAjdpD6lqH5N1CaDagIa7wjDU2LVOmje/ar0xxLT2Oy
	HCOqgYzBPLTdB/1yBtFZGnt3LEMDww1mjZmPJ6eQkMnxzQpjtE01rLaFaJPqAeAiCq64TF
	qwMrWZuFayp8rCU0+JgJkDOYvMbconM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-U3GNOIzAOM-ygiSxpWwKtg-1; Wed, 09 Apr 2025 10:15:51 -0400
X-MC-Unique: U3GNOIzAOM-ygiSxpWwKtg-1
X-Mimecast-MFC-AGG-ID: U3GNOIzAOM-ygiSxpWwKtg_1744208150
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so4814465e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 07:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744208150; x=1744812950;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jrpHertxVntQ/qY4h1MpBQE3souh5hv0fw5zEOUNKB8=;
        b=tx6ju3CgrceyteLu81UlsU0TZakSGmpyh38sqb2kWYum6ya1rCIIoDS0FVkNU6QMQE
         LeaZnmBPC+uRpgdmRpt70hAM166ggYLf7sgBwMxhIrVUCAw8pN8VLf/VATRWDtFz6JmG
         jSB3ulgChh1SpcLDeTfGOatazCqbJiqVkZCUuD8W3G4Xj+DCGbdo11TsFGyfasKJ//x3
         ygF8t3JEAUj0tcwP6ZvPMkQakEpqZTwHGC0qqDyjDIvhv1kIz5AdSYg+pOXAfOVIQVxN
         HK5hRD5Ux0Pq4qmD/PhLh9dMRR8VVgZqyDbSAxQneSgRdH3c95kF6WpwIP6+kofplVRC
         TyoA==
X-Forwarded-Encrypted: i=1; AJvYcCVb3HIPTn/wZPHne0+orIMTabtHWICKnQEjgwXmtI4EH8xwHiXqOlak09S5Lft6c8z0not+WDz2PC+9S80=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvwTZiuF21UDdDBQlIw7Va1gh5o+08Htrf2y8xsa4Z/oIBgIsS
	cxvzu5YVTtpdYX/PfuxpP5CTx+aRSIu4b8iuYFMPhzOd7Y2af5gdLPH8mYt6hVlu2CH63kcKQnv
	GRIAJiZZoNc9Nx+7Of2bjuHfmSNi6q9j9FC1pV4eZx/ezrTF60iWI7iqHNPBP0Q==
X-Gm-Gg: ASbGncuRAJjRqSNyHiGdgYA0UYt7YKh8jKDnuIy8rVvY0qfVfUmvkgpYXFKZMKfiJFX
	/d9a9Ezj0oLBHDaGE6BCm3ri5I2ggjKop1UnRyd3ucD4iAjZeDQNeqfokhXIptpLjEa+QCRywbV
	VRvCPxAleN53UGcWIAlQSt3sM3xZGJnSAmEsdHtV+H1vQ9mhKiLo2qGmZNFWKfo8OUXDEyuGw2M
	yv0y2u7JNH7cboKW+f/wSMqEwQu3tSSNnPJVkoj1DE+BKukV6+tGQh/KW5TdNLLS+BdmGZg5Vq+
	slnX9lzZ//MV0RcPb2OR/NdmAJVzObaFShCWRnQ7iWkARriMnyL8l5GkOtsVW/G1pUTFAw==
X-Received: by 2002:a05:600c:ac7:b0:43b:baf7:76e4 with SMTP id 5b1f17b1804b1-43f0e543857mr66192775e9.1.1744208149911;
        Wed, 09 Apr 2025 07:15:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvVp9zrTsV/xYMueZnWj5314rLrL6fBlzCWZ3OqwS70BlFzwTLlcjaEvPa/AvvbpIehmI9Tg==
X-Received: by 2002:a05:600c:ac7:b0:43b:baf7:76e4 with SMTP id 5b1f17b1804b1-43f0e543857mr66192425e9.1.1744208149596;
        Wed, 09 Apr 2025 07:15:49 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fca5sm22156435e9.32.2025.04.09.07.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:15:48 -0700 (PDT)
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
In-Reply-To: <Z_Z1UOan6Qu5d3VM@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
 <Z_YWq4ry6Y-Jgvjq@gmail.com>
 <87bjt5fz51.fsf@minerva.mail-host-address-is-not-set>
 <Z_Z1UOan6Qu5d3VM@gmail.com>
Date: Wed, 09 Apr 2025 16:15:47 +0200
Message-ID: <87zfgpe7zg.fsf@minerva.mail-host-address-is-not-set>
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
> On Wed, Apr 09, 2025 at 11:43:54AM +0200, Javier Martinez Canillas wrote:

[...]

>> 
>> Likely you will need to define more stuff to be specific for each entry, maybe
>> you will need different primary plane update handlers too. Similar to how I had  
>> to do it the ssd130x driver to support all the Solomon OLED controller families:
>> 
>> https://elixir.bootlin.com/linux/v6.11/source/drivers/gpu/drm/solomon/ssd130x.c#L1439
>
> Thanks, that sounds like a good idea.
>
> I've now experimenting with XRGB8888, and, well, it works. I guess.
> The thresholds levels in the all conversion steps for  XRGB8888 -> 8 bit grayscale -> monochrome
> makes my penguin look a bit boring.
>
> But I guess that is expected.
>

Yeah, the XRGB8888 version is a boring indeed comparing with the C1 one...

The drm_fb_xrgb8888_to_mono() helper is very naive and just uses a very
naive midpoint thresholding to choose if the pixel should be 1 or 0. So
there is a lot of information lost there unfortunately.

But that's what I did for ssd130x, to at least have a working driver. Then
support for R1 (for ssd130x family) and R4 (for the ssd132x family) could
be added as follow-ups. I never did it but Geert has some patches for this.

> Please compare
> https://www.marcusfolkesson.se/xrgb8888.png
> and
> https://www.marcusfolkesson.se/c1.png
>

Nice pictures!

>> -- 
>> Best regards,
>> 
>> Javier Martinez Canillas
>> Core Platforms
>> Red Hat
>> 
>
> Best regards,
> Marcus Folkesson

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

