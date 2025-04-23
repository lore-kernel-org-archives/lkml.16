Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DA81F237A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 19:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745437767; cv=none; b=oYFWPzUaW27zZXLSiT0B+knNOgPgD9yzi8TFL9OYChYSrrHe0iik7C+dBiHtTFGPS6Qp8CymF+O+I73wGPUJS9tXh6vsh1bVkkcWr5J60hmJGa5Yzm4zuV2dyoBz95MNCP6JHiU6ImcaD2eSWwX7G1CJwW3lT7pQ8iMVQ0za+Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745437767; c=relaxed/simple;
	bh=qOF7mMGqymGTwp2a6r9zKopxg9iB+v+/vWlmMp0Yhuw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hONhJ/9WZx5HmhKFLdx0fahriuVLmGMTJ7f/H0I+ywrMKPC028eWaFaFJ6fRUvUzG8HAhnNWvUnwLfl1KDb+nuUCqQdjl8G52yMJwtpheEKu2yQO/hRVBHdcQJFziSe7OUzKYYw7nzrO8YVhls0AtKqqQC2Me3Za4ysNZwUrrvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OU4QXFJN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OU4QXFJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745437765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CW5oobOQNyvvT3K29QIOTqiPjFO//Y6rbktPHRqNllQ=;
	b=OU4QXFJNvadOhuFYB5Aw3XD8wfmt/RLW3Zmot+f4LAhM9CMJiKrWc0xjH5l9Vav7H9tfjA
	WCieKO/rkBwfgC8ftKELK4YesviXc+MzKtuVIu3GWMhNhoy9yQDzsVTT8QqETV1bz/ZhMj
	qb9vh38ksm9we0TAgD5Y5HYhQTga9tg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-rYOEFRzNMI2v5F-gMPhI_w-1; Wed, 23 Apr 2025 15:49:20 -0400
X-MC-Unique: rYOEFRzNMI2v5F-gMPhI_w-1
X-Mimecast-MFC-AGG-ID: rYOEFRzNMI2v5F-gMPhI_w_1745437760
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39ef89b862dso94826f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745437759; x=1746042559;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CW5oobOQNyvvT3K29QIOTqiPjFO//Y6rbktPHRqNllQ=;
        b=IhySbTaQKBH1NPhE5JynkpNmwdT5y5xrj5nm/RO9WPxFrsrRynSISzlOiGPMhxLizc
         xt3bf83l3CvbVISxpUYoauxR7BTMkdfm71SXAI2lANUQJOesno4/MZoIpHrJG9t0TrCG
         eWobVGlsJT8YPi2m9VqSfcoW16e3hOV/cMGI2eFKBB9J1LtSQUBGXbRgMlzE7qxS9uDm
         HKypsiL8dfryXp+8L9bxyFTEeRKeIpgKLUsiwG+wvU2rc0bP//duZoIgG6rnGz2F5c/N
         HwpbtHKV029xradpoDh2dnQ/BM2agiXqnD0PALFbe5GYCyj8AMFZyr1NlfEi6pM8NQOE
         sHRw==
X-Forwarded-Encrypted: i=1; AJvYcCVYVJnDOsv9lvRyn2kl6mjRo5Fb7oRT3L6BmU7g8kyEsr9Ij6EI0pIT/T9Hp6wMMv3m6zd01N0JD28rDXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSn2qSB2ZT78l0Pe1JCwk/QUgcPYMegAE3jPTkFiBXMwxD8KyK
	fZuyVnavKrAUB/wXySoTfSl4cw6Vk45qiqL+P8z0+jXm8fu8Bz/qfTOhI95aIwljK6RQIY4yRz5
	hLq9n2YMe6NXSiPT9QmmlnlsuKViVe16B+Xyj49YwIQJXANoVtJWwdUdohYgaVw==
X-Gm-Gg: ASbGncsQZUaSxaTm4C1t+L2bswHo0HoYBShQNOt5VTrWo98ggyGc6nnog8JY4AIZbtQ
	orOP1/94G1DfMo7lB0a6mPxckapUYme9/NoVMXZe94mfzBwScjgYdyayYEDAyWFiEk0tR7QwxHH
	ufw6VEKO7mHxmJGMnELtSthv90GQpLsZuZJYsbi4KRXnNz6PtKR9C/YwPZGz0K5KE+/tE2WV1mg
	LQyTJXkXaukNUtmvA+tEAMe0tUHTA62mFxEz8HMBTcrqWsjl5AArdd9EjpRFBZAj79avxgMEDd/
	sTybHlmFo047l+zKIHd3IPCeZtWAUChyaQIt8We4g9hwS05CJqo4cNKM2sE2aDFmeDjJiA==
X-Received: by 2002:a5d:5986:0:b0:39d:724f:a8ec with SMTP id ffacd0b85a97d-3a06c43700amr713266f8f.44.1745437759694;
        Wed, 23 Apr 2025 12:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6sbVUSbQlqX73+/VhkgOLOaiskfxeP/YLRaHmiCsxzKpxWGgR7NPA0wc62DOWcmh03chLAA==
X-Received: by 2002:a5d:5986:0:b0:39d:724f:a8ec with SMTP id ffacd0b85a97d-3a06c43700amr713251f8f.44.1745437759388;
        Wed, 23 Apr 2025 12:49:19 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d8d191bsm44033205e9.1.2025.04.23.12.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:49:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Thomas Zimmermann
 <tzimmrmann@suse.de>
Subject: Re: [PATCH v6 0/3] Add support for Sitronix ST7571 LCD controller
In-Reply-To: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
Date: Wed, 23 Apr 2025 21:49:17 +0200
Message-ID: <87v7quacaq.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

> This series add support for the ST7571 LCD Controller.
> It is a 4 gray scale dot matrix LCD controller that supports several
> interfaces such as SPI, I2C and a 8bit parallell port.
> The controlelr supports both monochrome and grayscale displays.
>
> This driver only supports the I2C interface, but all common parts could
> easily be put into a common file to be used with other interfaces.
> I only have I2C to test with.
>
> The device is a little defiant, it tends to NAK some commands, but all
> commands takes effect, hence the I2C_M_IGNORE_NAK flag.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

