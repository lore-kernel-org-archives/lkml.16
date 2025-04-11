Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FFD296166
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360016; cv=none; b=pdGXnNKLBzCklRklC3/VUQn+8aiNgjvAQ0WLHpCiMPZy183zMjMxnt+0zvwf3yTE4K7cK22SBgvjqZabXu5DF19vLT9c8z+CEzxN6huF0/HyLcTFyxqANUENYxUwrprkEQStlZU6Y5HEpfKrfxMgpuJdlytbuYfUiJMaK2+Mn4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360016; c=relaxed/simple;
	bh=VoFoSA0jg7hSIJLOIKHXHZX0zceZ/JT2UFZrRC+wD4M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C/TSJtzUGZ9vbM/g24ZWC4OrO7Cts2zQst+orGoHQY6bKYDFWbMYqxgJ0Jbt5ojIjNAb+kixZXlPPOYpsAjDeZACU5a7CBvfoahWvppwegloEOGMsOoW3hMElX2vyfyRxpSehA1+C+sQfs528mbOnmPvEy/JDr1UtvCSzFa3zxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Deq50/M4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Deq50/M4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744360013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=00Q0S17WmRjZl0Npwk/8K6zLHrHsysPjv1qRjdhJKjc=;
	b=Deq50/M45+WmS6DvqYPmrlk/2XmJ2ICTZkuFYL+FKlletJRPkBRIwUmO8Sz6gZx70tb8yo
	lPZaxoLFaVNbbYCSKY1bqzw5k83JVSQ3gHFfj3tRZW1/dEeoXmk6rH21LDpZc6ZjfoDt4g
	pW/6yLG8WGCIDYds7NQY+9wui6ujKt0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-eytAFm7OO1OS55dS-iRuWg-1; Fri, 11 Apr 2025 04:26:51 -0400
X-MC-Unique: eytAFm7OO1OS55dS-iRuWg-1
X-Mimecast-MFC-AGG-ID: eytAFm7OO1OS55dS-iRuWg_1744360010
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so8852105e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360010; x=1744964810;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00Q0S17WmRjZl0Npwk/8K6zLHrHsysPjv1qRjdhJKjc=;
        b=KRdcfH7Jd9ZtTunm9VSjLF0Z9hSstGx3qR1+mH5FNZWOsE6/LHANaiZJ5V81GisHog
         0IeK6PYQY3qlNbmuen5m2HjSEQ3w6QcauUoKKeFq8QlTNQ1+LTmjR2mID6nL45r5EbkH
         8mpStcxUtkGVWVFYkcTEbSGAZKZawuHVTGiO2cLdjah3FHpgISyfbMQtxjtSW3gxOr6N
         o7neJiwna4M/3TlTYUsJUTWlcGL3Ym5vSsEFnzkmEmjKvjuyPX6Sk+PCSLy+EOXtofAk
         zQfB18XiEGpCdP2vOReXdqhyMRgPXD7q+tFg86qRsPsIipPANY8nRA44NsnBOiEYwn4T
         pGsw==
X-Forwarded-Encrypted: i=1; AJvYcCUbNMXIWHLsTZFtBy5ZpL3PqOW2rNJPcBcV2EfrXFL2lBZgiXwM5FH85c9UST4R7UKCFemzlF6dlXTrhQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8xOTbgcgm4mgugPRA2tyqmTLuFacSoBuvANYW9+dotZgSdIZh
	3gJqXVJux/TyxUXrCTr5U+54XptoqfKjn4zxLm+dAKDojhVncwfje8g8lrdEtx/ieFoWdABsrUe
	MvmKTjA9QGefSZZ7oowA13MZ0ZKb6lIV+2y40esDt1vYPdneXhkSbUd2lRCdWpg==
X-Gm-Gg: ASbGncuaAIa7nHBjdBAqAnxwMdXhqJVVqQGdA8jyZ8An0f/8OZdpA5pTFfrZc+pvVf0
	gUuknwpADA4D4q8y5Nb27Sy/3sLu5kYzxYtdhfr+UrgyZ7ZALfM6+job8fsYg0/8/OcS3aUbdy7
	5aamGupjNKmCYdSpi3/PiyDEPFOD33Ckerd7dtzy0VaIEbjp8BvU/QkMoeuCAQ65/biwQGGyEjH
	PzjFDHPnQwZQv6ojXQIcdxraFZ8vdMfCF+5MVX32oD02Y+CI2t/e5TgeL3ArOLkS3j9y/AN6c9v
	HyjpuJuS+j99XFaOdAx+TsyZ1qU+j3gnXaU+WakGZT8Wq5Xsy+3pfW8n20h7sE7TO2YP3w==
X-Received: by 2002:a05:600c:698c:b0:43d:49eb:963f with SMTP id 5b1f17b1804b1-43f3a9a70aemr14225985e9.24.1744360010169;
        Fri, 11 Apr 2025 01:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZKb6d7+fqXZ7A3CJpuhmceu1xTasq+foZTV7ndHM9hXVFEaFi7ujrGUL6mhaYAsYNAIUYKA==
X-Received: by 2002:a05:600c:698c:b0:43d:49eb:963f with SMTP id 5b1f17b1804b1-43f3a9a70aemr14225655e9.24.1744360009817;
        Fri, 11 Apr 2025 01:26:49 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c49f7sm74871495e9.17.2025.04.11.01.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 01:26:49 -0700 (PDT)
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
In-Reply-To: <Z_iwspuiYAhARS6Y@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
 <Z_YWq4ry6Y-Jgvjq@gmail.com>
 <87bjt5fz51.fsf@minerva.mail-host-address-is-not-set>
 <Z_iwspuiYAhARS6Y@gmail.com>
Date: Fri, 11 Apr 2025 10:26:47 +0200
Message-ID: <875xjb2jeg.fsf@minerva.mail-host-address-is-not-set>
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

>> static const struct of_device_id st7571_of_match[] = {
>> 	/* monochrome displays */
>> 	{
>> 		.compatible = "sinocrystal,sc128128012-v01",
>> 		.data = monochrome_formats,
>> 	},
>> ...
>>         /* grayscale displays */
>> 	{
>> 		.compatible = "foo,bar",
>> 		.data = grayscale_formats,
>> 	},
>> };
>
> A comment for v4:
>
> I think I will go for a property in the device tree. I've implemented
> board entries as above, but I'm not satisfied for two reasons:
>
> 1. All other properties like display size and resolution are already
>    specified in the device tree. If I add entries for specific boards,
>    these properties will be somehow redundant and not as generic.
>
> 2. I could not find a ST7571 with a grayscale display as a off-the-shelf
>    product.

Sure, that makes sense to me.

Can I ask if you could still add reasonable default values that could be set
in the device ID .data fields ?

As mentioned, I've a ST7567 based LCD and a WIP driver for it. But I could
just drop that and use your driver, since AFAICT the expected display data
RAM format is exactly the same than when using monochrome for the ST7571.

But due the ST7567 only supporting R1, it would be silly to always have to
define a property in the DT node given that does not support other format.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

