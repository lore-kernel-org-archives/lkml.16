Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5243D21FF5A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 08:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746605049; cv=none; b=jcofORu/yro+xsbN3RS4ZNTTa44hfOEMVz3vv8GgHBqtzo2/AoRlpsMBX5YncWr3z0ZcFLdKSG1bTteN3sT9LQQDvJQRg7b3czS360/d0KI4KZtNrPoJGKWQJ4jHDHN8eWAXjzd3vRw5bdbPozIwwLMar4gdWWaXTteU2RJ399o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746605049; c=relaxed/simple;
	bh=KaqL+wXiWuFD5PVgN//2x9Uy1IykRrC4KAlo3OQSS/Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K5mC/tUzcNsbVioApOdWGpXIrhsaMqZhclFo+j67mnjHdtWIy8J2V82rg9cxZGxrH/ULgz+FhkgQlHHWlvk31h6km0Av6OURaBaJJx0BhgnY1gaBQby2QUu8BCF94MjQ2IhvlxU7tiHbGpl05Htatz/CQSJS+9I+GStSD4KuRK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BVWPEPzy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BVWPEPzy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746605047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1L9rKyoo5gafZgxfVF9TUdVkYjAT0uCnIxL4ynrWXso=;
	b=BVWPEPzyeoIFjXbkH067CNb9ncRLfGXpnqZcxH3n1t4JTWuad0J27q34eQdvBamtjjmegp
	GOfNvjozZOVVW78+QoChXSehtR0zynxjLr0/tZ6eyP4sfcghdK1cOE7U0aKNWbjuoQLkVd
	sEVdYn9pnxBYDKbJnt8YFph5oWhWqSs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-rDBc7BnEM96dp-PCZbZ_Qw-1; Wed, 07 May 2025 04:04:06 -0400
X-MC-Unique: rDBc7BnEM96dp-PCZbZ_Qw-1
X-Mimecast-MFC-AGG-ID: rDBc7BnEM96dp-PCZbZ_Qw_1746605045
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so50665075e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 01:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746605045; x=1747209845;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1L9rKyoo5gafZgxfVF9TUdVkYjAT0uCnIxL4ynrWXso=;
        b=Ifjg/XTGq7hldgJXExytxfWpRf+TNer3Rraad+D2Aoalfoe5Cs8zjXxemQg7h0uvNc
         U0ra3aGUyZPSiUy4xeHXGMYWoNaqjS3NQv8BcAZSjGjJPvA1ZXrOpPV2n20+NbXLH8bI
         Pg2kvs1Thum0LCvyX7qxwknlPMSinwBqOMLtX/vHtmREtNAb6sdcoK2VaaI9V7Zar8q8
         kCIfIDkA8hMgjV1/DxNeMKJe5EbONOE3x2Q7bkXBeAERG09IoTywJi0X0CvjTLfpGMfV
         IqUMTXRSvrx4RfVNIKuNGxewIEsdH9pLZZwP95ZXw1zZRSByYc6B9+t25CF8+bPA5KxB
         Vrqg==
X-Forwarded-Encrypted: i=1; AJvYcCUqhQ/jI6GMlsxGeqm0ZbszmnmNbtN6QF5HUTtH5QU556HOlXgDLVjuqLj5/fSpX3/KxdK/B5IIXTgJgdw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Ww3bVnwVcMWgOJDZsfL3NZ3BH22m0rZkSINjdX2eTIlJq0df
	EKENc75tFn3b/TAYw/7JtzXrZ/TuS7ETDR771ukTqJsAoiQdfSdB0RbVu8hKr5Lre+71IiIqcGy
	WlS/X1TwFrbvCszTRABz0KrfzHbaNCI3ekPQOWZPwP2cNgWOXDeTAgRBrP3tgtg==
X-Gm-Gg: ASbGnctHxSoobmfI+YZtxQOCAuCK7g+f5/QMOBxCjREhDT7mhVu2tdlvKTIGRpiFr/E
	M+o1bzLZqytje21BWJHMxzOiSaXlHTRqw8PvpizOgyz51IRZmlI+pSBPCE6f7ueXr9I6HqL/RXB
	mPARl+OQMGn606L1YwZ7NMsZuv7oaPwmt8tHtu6mEzz33uB3mtVmpZjB+rQPlXRgP5LTk2mLzpc
	gkfdek3+4U6r63RCSl9LKkeLS7zlNrDLp5GfKM/iuN2RbbkbAU0sdxNA9ZPdlOF0HM70SQ1vJkp
	MYSMkQCwBRsBiIQ6pLvuSQnJqQRS0OUlW6PodV/onGa2A6RXzVQnBG4xplYtNziAZBqudA==
X-Received: by 2002:a05:600c:5295:b0:441:b076:fcdf with SMTP id 5b1f17b1804b1-441d44b5e6emr16208365e9.8.1746605045116;
        Wed, 07 May 2025 01:04:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4wUqpShq9lUTv4LL8emvVajX8S6/zH0VVVy1lkz3Elvmc01LNJD4SZDrIMl3WfO7xuH02lQ==
X-Received: by 2002:a05:600c:5295:b0:441:b076:fcdf with SMTP id 5b1f17b1804b1-441d44b5e6emr16208005e9.8.1746605044738;
        Wed, 07 May 2025 01:04:04 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d43d07fbsm21881185e9.10.2025.05.07.01.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:04:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v2] MAINTAINERS: Add entries for drm_panic,
 drm_panic_qr_code and drm_log
In-Reply-To: <20250507075529.263355-1-jfalempe@redhat.com>
References: <20250507075529.263355-1-jfalempe@redhat.com>
Date: Wed, 07 May 2025 10:04:02 +0200
Message-ID: <877c2s26fh.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jocelyn Falempe <jfalempe@redhat.com> writes:

Hello Jocelyn,

> Add myself and Javier as maintainer for drm_panic, drm_panic_qr_code
> and drm_log.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

