Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3D227F013
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751014256; cv=none; b=a5KZxgp5FzE/pJUIKgHVT5OAiA3ZToFQ9MzYPWS5FX3SFguByxM0IuV6k3dpRPgYvPNWe/QIi2Q8UFE0zrE5zlx6Wp0GK4mSh2R4AMrtEZctK0J2VmlbwnuJCfpxufhzv2En0JU3MNv0izKdiQeGOTejDi/rFkh7paptIuj1aaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751014256; c=relaxed/simple;
	bh=YkpEUHT41WQqx7y+f37T05/GWaTVsSShl5t9HQQ1vuc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VVPC66+HP/XYCiLe/w4yRVscpKbEslZRHJAqiM6v1VOLGlamspiE0MYFe34m5SaNh+y9OYmE4RIGdc2vJNnrfBdIRwYZ1RejIG6iKD2emG59d5UeXNA1hD1Zgj44O+ZGB49uGKrRixMMtPffgIrIYJbTIcaYw9H95/KHkRYFEQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VdSOHQ0L; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VdSOHQ0L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751014253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ReqtPQPZuynpPpuvR3wKtoK8Qv/uthGzjSx/FWJvxIw=;
	b=VdSOHQ0LtVw3XphMl93DkxIHrHJzJmqcRi86H+7Y/+gIJVEB8wsiFuRArnUrj/4L6S6dPC
	oriConOp9jq0M4Dcq1waHVj2iFIgWapbTXSjzXbtZvXgh0nLht5vDoxevY1jOnOWOficoX
	I65YX4kaBg3W8cZvkaUxLfRVWgSIFLk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-7qmbPTMrOV6rGJMUlNsSkg-1; Fri, 27 Jun 2025 04:50:52 -0400
X-MC-Unique: 7qmbPTMrOV6rGJMUlNsSkg-1
X-Mimecast-MFC-AGG-ID: 7qmbPTMrOV6rGJMUlNsSkg_1751014251
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso808651f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 01:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751014250; x=1751619050;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ReqtPQPZuynpPpuvR3wKtoK8Qv/uthGzjSx/FWJvxIw=;
        b=GKb674cNrdBeIACbpG91YpahPNIwdp4BRUBbQzDSLbYaMilrcYlVKC+/M0kgAdetgZ
         uD3ZCKxpL1dVL+aZHoY3mefboGEiY/NpplxHlecYZh9doLYKQ4XHh92gdSUQ5x/m+308
         kicpAozfaJWczvD3jqBZcXNWuo5Wn9JNBZu/62R7RHOi18DpNK0Xcde/haK92MJPzA53
         iioYFhXOeb72noTW/jXFf+W8wMahon8xuL1vXE/NE4KLrG6BdZ2R6RqcdFzxP9Cc+Edk
         wUC1mgkvDzAisWosfK5m3gW92eYs4U4ZUrYyDS7sK5MTU4IZ1ZE9Vuq3o/8Bsgq0ktXd
         I8Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWzAVlv3MxThkaujt7PbDb+p5Rj5PVcYpakoPYzfdRU8K6bFp5b7TzcSBh9/jis5KiPqQeYinBeVaxcyk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrvRDjEBghyO6ZPjkVGhC7Bz+RN0OGLMi7WXfRgO5mxD2hG0Yq
	XdYRWIXAsPdHlY0t1ODAIkfDP4d9eHeUsbyp9FoJzfKZRoF/F6ver+HdhGDcxW9/rb4t2jCHfwn
	QrlcIztpKQDH51E1UvroVc/90BxubJ71oQCVboVYG/Wc5lBJewfq5uaMiw4UUw6j8t/L/Ew1T8g
	==
X-Gm-Gg: ASbGncuc+L9ecGe67tqFHtksExtl95zfSRer0/m/0qy1PzXmGoQ/IHOgO8pCRANOaWM
	reYWuiAOeE0Xn+q9MEdLA8iEeWKVgwM5M7cPB6Tj/MArmDuRqUdoNsHdF0kqYm7vZ6dtc9hrLHF
	bUqPFHDYyzbcOFZJaFnl5L/241LBQ68rsCgm15tlT+ArYn4efNBE/xwq9GZCh2Olb9bdVO96daZ
	Szvfok5qBNegxMQ+8QS85m0ojauOkbBglQTkGK/9EZh0bs8UFwFXAYIDVHrvAR05POm5Nwsfc0N
	MEtXzuR5NYyqhKTpjkJHU30NJpHMtg+4+pEKA32dy6ppnpdIS92MEEFMw3kfHQZtWIGT0pvUyTH
	04Ftk
X-Received: by 2002:a05:6000:23c6:b0:3a3:7987:945f with SMTP id ffacd0b85a97d-3a8ffeb4059mr1334445f8f.57.1751014250305;
        Fri, 27 Jun 2025 01:50:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGosAHh6wG2YWG6Pd5KssGRidpTbYqrmLPTbfUfSLFVXEHNkTHsVJz8y2jSB35dDR4lyfaNVA==
X-Received: by 2002:a05:6000:23c6:b0:3a3:7987:945f with SMTP id ffacd0b85a97d-3a8ffeb4059mr1334423f8f.57.1751014249818;
        Fri, 27 Jun 2025 01:50:49 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59628sm2058886f8f.81.2025.06.27.01.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:50:49 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/2] firmware: sysfb: Unorphan sysfb files
In-Reply-To: <20250626172039.329052-2-andriy.shevchenko@linux.intel.com>
References: <20250626172039.329052-1-andriy.shevchenko@linux.intel.com>
 <20250626172039.329052-2-andriy.shevchenko@linux.intel.com>
Date: Fri, 27 Jun 2025 10:50:48 +0200
Message-ID: <87ikkhd0uv.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

Hello Andy,

> The commit d391c5827107 ("drivers/firmware: move x86 Generic
> System Framebuffers support") moved some code to the common
> folders and effectively orphaned it without any reason. Put
> it back under DRM MISC record.
>

What do you mean that it was "orphaned without any reason" ? There were no
regex matchs for the old file paths in MAINTAINERS either before that commit.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8dc0f6609d1f..c2c7aa594160 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7973,10 +7973,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/
>  F:	Documentation/devicetree/bindings/gpu/
>  F:	Documentation/gpu/
> +F:	drivers/firmware/sysfb*.c

I would prefer these to be in the "DRM DRIVER FOR FIRMWARE FRAMEBUFFERS"
entry instead of "DRM DRIVERS" since the former is what has most of the
code for the sysfb infrastructure.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

