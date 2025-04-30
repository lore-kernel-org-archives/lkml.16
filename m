Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B571525C80B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018043; cv=none; b=ljsEJU7ohmmFFz2SmYspFHWMh5OGZ0rFXvSX91xFh/PRkrQjxVh3k/eGUBL6xd9gXlO14D56VIK3URDW371ifEvPm8VU31SWSC0zwd1KHPkVmKZFBxa8aCeYo/zf0RrLQr1nmPQ5dWNlk3K+t0LxQMk8kROFcTXilslUl5OzM+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018043; c=relaxed/simple;
	bh=syXoLLXHr977EGJnWjj8cAMJU/MDa2l+qntNRkfaxW8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nJmmkJm1puPZ7QcUEvCgxk6fBZhQX1bKIinIqkFbsYBPfPMXPY6lJNphzA5Ez7+ASD4mjSrBp/vdpuXVXnFa0IzxLsf4Kpgu8REx4q1baDQklMBrl0wd8vEuLukpYhnOfh0LthhlSF6nt48FMo+HRjUgYuf2ixo17uQ3aU0sbV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dXGzfKoR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dXGzfKoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746018040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N/BSZJgZ5YRpAxetTo3M4XK6veqR7rUZVtf0IcGSTdo=;
	b=dXGzfKoRhBNqoc/G5b7bXSbcgH5quBL545ZWMVuoqo4tYvZJamTnZqFpKnEwqEK0rUwZeV
	A0KR9UE3XT1Be9W+2Iw8RZ+jAvxA1WxDAeH1NL8k23dxyk52Ep6vi2chQXGMbGOyb/4rXJ
	W/ivqUAPLte5v0XZWVM0IxOC5MDv6Uk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-vwBONGypPde5HoS_s087Cw-1; Wed, 30 Apr 2025 09:00:38 -0400
X-MC-Unique: vwBONGypPde5HoS_s087Cw-1
X-Mimecast-MFC-AGG-ID: vwBONGypPde5HoS_s087Cw_1746018037
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-391492acb59so3398186f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018037; x=1746622837;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/BSZJgZ5YRpAxetTo3M4XK6veqR7rUZVtf0IcGSTdo=;
        b=Hh7ZmQm5SZ0PC7D7ghJMrQYNPwgJyh7uwGRqe+ANKJyW3ZXoy4SuqOKeUT6uzn2+Ic
         RFRxBZ7ePKGXwyPYhZfQOAWRMmT7umVgcOOTO9b+Gk4Q6xUBAadkZ44V8+whZ0dV3aKQ
         1tMpCZ0KHVM/VIKKy407oeUaqrpedqgqVQKLeKNkoGGTWZOr6z+S2vVpoHLAdCiG8eDw
         6D/eTLz8ANBgamcJkOHPjriwKrzRJdHE6DVwKOqLg/l9sg4Ml+Ij2A0Z7tLKVCX1yMF0
         /oplEDLCFyk/48wec7xDqqGvd2fSmeH6JkbOJx/Y5Ps2uvZwSQP+JeDsGacck28DgztW
         nO3A==
X-Forwarded-Encrypted: i=1; AJvYcCXJKPYwDPkU4UCBR9azOdKC2gMVJRGValUn4v9hFmie9UXPtRCA6XgWShi2zd/JmFfQVx/HDXCjcxeZtoc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1prBgx+vJ/bdLL6LtEd34d0MADdnKcqeup3lDIJJgOFEIOXhL
	l/IEc7bRHaEUTs7DGtZm72sbvW+W02JcQmFpOEi00/9bETHhxG5amwY3huZB0n4Idzoqd1pTLJd
	QIatAbtgN3RFEOWpJSg7Rt+q2im49Dk5JYj2uONL5OpNew2jQBzBQE1XGxKbDnw==
X-Gm-Gg: ASbGncuA5VwpP8pQDC7Kv6lrMgxv+mqIqu19REuJEwwl+5bS2m1OSfn+gJxrNs1FhNc
	SBqXtTJzpy6DS5XQ9H7wQ8nJP/xqCUzqa4VDLYtlQf6wZo1gxDHHWu8IWevylB6kkk4OohDWSRG
	Y+U6++UavdQxr/fcHlTHw6umGSqMuC/KXwVyv6zeZIov8Hk0SkhDwc9uluhM9iRcqlECNi1FzTJ
	7ot5RT++CRMPPndWkuk8/5V+ZEWfpN/qYFNpOrgE8l9/ecjMv45E9clo56pwtntgd0AXOO+1WSA
	zYWTWnoe8Jm0PQwY5SjjJUoyBgIjWxfsZRgRl0HvYks7pvanOM2b7W7OHJh07I1rwzB2pA==
X-Received: by 2002:a5d:598c:0:b0:3a0:7a5d:bbff with SMTP id ffacd0b85a97d-3a08f752666mr2847934f8f.7.1746018035224;
        Wed, 30 Apr 2025 06:00:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH00zIXR/QJpX2r62x/BnijgtG/melnBE3UE7Sv8nmaQkGLGVWABf71hYp4Wd9Pcm+gpDIP2g==
X-Received: by 2002:a5d:598c:0:b0:3a0:7a5d:bbff with SMTP id ffacd0b85a97d-3a08f752666mr2847668f8f.7.1746018032433;
        Wed, 30 Apr 2025 06:00:32 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5cffasm17192690f8f.96.2025.04.30.06.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:00:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Marcus Folkesson
 <marcus.folkesson@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/st7571-i2c: Fix IS_ERR() vs NULL checks in
 probe()
In-Reply-To: <87msbxzuhh.fsf@minerva.mail-host-address-is-not-set>
References: <aBHZYgPPPYY-J8Vd@stanley.mountain>
 <87msbxzuhh.fsf@minerva.mail-host-address-is-not-set>
Date: Wed, 30 Apr 2025 15:00:30 +0200
Message-ID: <87jz71ztw1.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Javier Martinez Canillas <javierm@redhat.com> writes:

> Dan Carpenter <dan.carpenter@linaro.org> writes:
>
> Hello Dan,
>
>> The devm_kzalloc() function returns NULL on failure, not error pointers.
>> Also printing an error message for kmalloc() failures is against kernel
>> style so just return -ENOMEM without printing a message.  (Kmalloc
>> already prints a message).
>>
>> Fixes: 4b35f0f41ee2 ("drm/st7571-i2c: add support for Sitronix ST7571 LCD controller")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> ---
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

