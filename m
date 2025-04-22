Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1EF29CB50
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 21:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745358726; cv=none; b=fXeI4wmOckmJTF/bOkd+FNM8gzNZCzaVMLcGWJjVf/sNLUrvAPcEuccq26dAB5ADujtMrUpa7dFY9bXxDvWexFKrKYzcJBv8R6iFiRABe2+HlsNRZ+O+gI7YsSN/1zBATwcMggeKAp7qOf9A+NuZVXa9zE04ldS5ao1stkInz3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745358726; c=relaxed/simple;
	bh=3LybbdQW1iMI36n6qF6wDQCtqVvVWx7aMPmreP0uZNQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=skm0JZOdEjesEpeR3HJoAXXrQW0NvTazDMITFrnOvw9UbI3XFKldNjPGpkcog3l670vEVDvULrEIhP+c73UnUjOkShF3I0iWBC1hg9MZEEUsq6xA0QeojMZ8GBZguhnUVq4gRMvZQoM6gG7PXgVrP1BiycOjUgjHsvuNzbyMaUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PJvKQDhj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PJvKQDhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745358723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=joxllWRMo1gVbEqeWtbqHWjwqROo+sski2Q8YGooCfY=;
	b=PJvKQDhjqrbMIicbOnZHuYhXeftkML3o8zTL0KP/7KOIG0q2cb+9aCnnenr5omyPeabiBO
	eZP9/6nDv8FT/Yyrpqm/CbofI2cGjAw+kPzL4wS3sSHp8C0jp+DJ5tMjjFurFzAtsDmCps
	XFJCDfH6wyUfLjagWAONUKjnoPux/2Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-YahIHoafMKKIL1keyPH-Ow-1; Tue, 22 Apr 2025 17:52:02 -0400
X-MC-Unique: YahIHoafMKKIL1keyPH-Ow-1
X-Mimecast-MFC-AGG-ID: YahIHoafMKKIL1keyPH-Ow_1745358721
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so26859805e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745358721; x=1745963521;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=joxllWRMo1gVbEqeWtbqHWjwqROo+sski2Q8YGooCfY=;
        b=sMxAOBrh/MNjsFjeqc+S5Rc4/qgaVglM5gF4ksGuKEc/N6OGJcVq+cTpz+I+5W0yQS
         vnwZKodvXjoz6ao+T5DAPDK0rnXWN0sWzaEs9Byh+X9+mGMCLX1H9h/NgGBUQ/qqagmT
         EIhNpH6XSvwJ7R6MZ+yQ0R5Q7wMv5WrgTgb6H2eDytIGltxlGUZGFH8lu+ocN/mIblm3
         RUtMndgHwcM6FLEemiGupxkRRyPq3rm7oRqCOn7C36cCiYCcJczgBd8Fp0hlMIfHO1re
         c9DE3swUJo0urI4gwFtZeZS5WM3msdMxW9fATYy17hEUyv0EAc1KEc83selB4RMQ39IH
         hAuw==
X-Forwarded-Encrypted: i=1; AJvYcCUWbCupSu9UEqMutmvpNLohkte/pG9gFYXyfh1ZMXjMVJHVDDdvjBJ4L5B5WARa5awxg3hM4DdW8CPRnvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNNLq8eFkB/YQ15x6GIZgjl0YtDCbXOEww9TKktShmy+cvzKbO
	5WnJBW3ia9ZWEW/C4xtoX4OrPQFO0MeyBj5HNTy0PmhBaG3ohabVrfKobdQ+4uIIRTkQ+hd55Zc
	RVEQjyitDeJh4gVy9oVhWtPHX9hAPKnGNJt8C/ML+z1zSM1+HrK1UKbgaJwvJaQ==
X-Gm-Gg: ASbGncsPA8o4BTGBXixo5CrUt/SVIauZ+t0/X3mkEwgNepo8N+lReROg5wUViYKlkzx
	ixJdESK2+1wwkYLaVhCrRpmZuvZ7+MRyqSUVNgr7yH+j8B0/ww6wQauMrGn5n9Z42NBSSSa/1NY
	pHRfv9E+7j0EaPehpg60l+3KgbAfU7bFtr4paqZbwQjrNdmzyazAvDPW28t4euYBord7NCSyK1M
	2SpIm8IOI/IAeX97IpjtuSI7a6SKtmwgBB2+YHG0K0LLZ00QpYWiyqOvwtpXiTgjNLaJBSqUgdJ
	9iGu+ypGAUU5TaKzbnDl6nFenI6BATX/ycTUo4JrYnn8GGcr1aneMexwObJ7XXf1Gh/Dgw==
X-Received: by 2002:a05:600c:154d:b0:43c:f4b3:b094 with SMTP id 5b1f17b1804b1-4406ab7a726mr134798685e9.6.1745358720934;
        Tue, 22 Apr 2025 14:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTLxTsyxpVT4t0zbtQAWUyHdf9Zx7V24YbCZxhwIqhnPj4RWkalHudFTrHtJPVsV+GXVwc/g==
X-Received: by 2002:a05:600c:154d:b0:43c:f4b3:b094 with SMTP id 5b1f17b1804b1-4406ab7a726mr134798515e9.6.1745358720531;
        Tue, 22 Apr 2025 14:52:00 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d37332sm2604005e9.30.2025.04.22.14.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 14:52:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Philipp Stanner <phasta@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Arnd Bergmann <arnd@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, Philipp Stanner <phasta@kernel.org>
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/cirrus: Use non-hybrid PCI devres API
In-Reply-To: <20250417094009.29297-2-phasta@kernel.org>
References: <20250417094009.29297-2-phasta@kernel.org>
Date: Tue, 22 Apr 2025 23:51:58 +0200
Message-ID: <87frhzc1a9.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Philipp Stanner <phasta@kernel.org> writes:

Hello Philipp,

> cirrus enables its PCI device with pcim_enable_device(). This,
> implicitly, switches the function pci_request_regions() into managed
> mode, where it becomes a devres function.
>
> The PCI subsystem wants to remove this hybrid nature from its
> interfaces. To do so, users of the aforementioned combination of
> functions must be ported to non-hybrid functions.
>
> Replace the call to sometimes-managed pci_request_regions() with one to
> the always-managed pcim_request_all_regions().
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

