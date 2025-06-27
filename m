Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA031D7984
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751016869; cv=none; b=sfk+/dsiyhiwCfWSXV1rdp0pOMSPBp3ggKVhD5NCK7lcq6+dTLCHBuoPCucnW5j11D3enEhptiniDS/eXP9nQ3wTkLQW4o9Wnro9pSPKhbcnHdnxmk5x466HIGsIpr22VFtVxLL5Vwie+HB4pms1Y4EX8yngDI6bRZjkUTmtqZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751016869; c=relaxed/simple;
	bh=KYwKumebLU7vouPwDz0pFAxYAfSftkxxV7k5VcYaT2Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JrxHRNu1PzjT9L1xPO644643srlfJqhSIb8kl9XO4DE+Rk8nNBzfIbkZnggXZQRJ07SC8L87lf3P4pQ5+sF3IuHndSN07S2vNzUS8AFRI4TnBiX/8JmhbMj8TFFeOGpV2hQvSi31/dw3vRAZps3U+opdsWE0TuSWzgFFh2sOCQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LVZMfpB9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LVZMfpB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751016865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GA/faM89fqza/JPWzignIqj4mTHl260Ge7B0hqmCV6c=;
	b=LVZMfpB9bCjT0uwDApFvkYaXqeAtKQlObtiX6vXNzRxeNJv/yHmfWc+pKIZW6PFCUPlOaY
	aquj0pww5lsm1IqKaQG3sWBxVWLr64bCGNhOnOtBI1xMvA9jlI5VOFDF7PQwZYe4c7ShU5
	ZJEb4dP5V0lRYJc9t8+q7RkJqu11g4M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-Sox6GpzQN3-sxYVL1s8PCQ-1; Fri, 27 Jun 2025 05:34:24 -0400
X-MC-Unique: Sox6GpzQN3-sxYVL1s8PCQ-1
X-Mimecast-MFC-AGG-ID: Sox6GpzQN3-sxYVL1s8PCQ_1751016863
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4eb6fcd88so1193405f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751016863; x=1751621663;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GA/faM89fqza/JPWzignIqj4mTHl260Ge7B0hqmCV6c=;
        b=SvcTQq94JrgtK14byH89R9okgR4VtsYlN43Y+DjNu6gfl7Omuz+56K4ZaETbRQnJXY
         Wx3XZY9BaNiABqpYsCgRlIt3ajTXKZvq0sPnQVPPO5yOFvH5+bLf+QSgKcTnTj+gHNno
         NYTF6qmGZ/bSeNFjIx2YAwDuWDRGDi1WTcX10Ps1FSOHsPgtFvBdDqE/TA0VCVhkLN1H
         Dy5waMdwRH/SmznfEzacs27Dx9VESF/qkzv55lVEm8yMMqYBaC6x06sM4uhkOzpuTlRC
         Qu9bDld/g8eV+JV8KudyOAmmv/zXvf6GD3vzvID2Qdv3jEdnT4l4O3xKKVv1JsVExiNt
         KLIg==
X-Forwarded-Encrypted: i=1; AJvYcCWcoCAjGr/tWrW6Iu791QyL/p/0h/Mi+gLxrvZTlqLiHRJnuV5NCoqKgidz/zTSz9xaiYUXVkn8KYXDpy4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy24jnEdSop76VcmoA1iKeNgD6RbXGqXOxeDAt/O9d1DV9CoauZ
	8B7o0Zq3TOVyjZI4tVUcIcY09PehPfAAdn4mCYqWHgCZkeG3MgG7LyfT4w0tzSJVC1sWjcXogu4
	j1HEeqWWVhIVjKPYypJoihpZFW302qfVSk6iX5qCjCwaRoulIC8PHn12bF749N7gu/Q==
X-Gm-Gg: ASbGncs8DamAm2Kf8TvlQxzA3OndqMTeulZtjlU+C3EYMTXL6yPdLBu7WNi6oOQK5KD
	yfxl/EU81PNV6td9WU9mzi9dev3F4KRkFH6XOxwOwpq+0p4H8Fy+WUjUKdFrfLLkZgCZgMrMgYn
	ceb8X04F0skyI2ALBBuqIqW4dRYKvgHE2L5ebQmCA9nP7P6nwodN4v1SikAsM/kIPHTwCAqpEa6
	SU3uwjn8RFvMoxKL2WkBIChJxTVb/dEV1p18MvnP7N6e4V5GUM2Ls38x+Lkg5w1IUYYnm0wWS75
	IoD0Mj602KOA/scv8SrLO8LCAwAdbNDyBWy9n7geB2jfBa8vnHPcCJPHB5rEc+Lti0jnq3I/4Gb
	zfg9u
X-Received: by 2002:a05:6000:2105:b0:3a8:6262:6ef5 with SMTP id ffacd0b85a97d-3a8f435df28mr2250310f8f.10.1751016863099;
        Fri, 27 Jun 2025 02:34:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErDQYLAsVdQskj+qDkpuTXjfRaYntMfK00HJYs5CjmNngTpYMOdmhr/am0qKyG1vWCzguzVA==
X-Received: by 2002:a05:6000:2105:b0:3a8:6262:6ef5 with SMTP id ffacd0b85a97d-3a8f435df28mr2250273f8f.10.1751016862604;
        Fri, 27 Jun 2025 02:34:22 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f92esm2211331f8f.90.2025.06.27.02.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:34:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Anusha
 Srivatsa <asrivats@redhat.com>, Francesco Dolcini <francesco@dolcini.it>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] drm/mipi-dsi: Add dev_is_mipi_dsi function
In-Reply-To: <20250627-manipulative-condor-of-faith-389bce@houat>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
 <20250626-drm-panel-simple-fixes-v2-1-5afcaa608bdc@kernel.org>
 <87cyapd08f.fsf@minerva.mail-host-address-is-not-set>
 <20250627-manipulative-condor-of-faith-389bce@houat>
Date: Fri, 27 Jun 2025 11:34:20 +0200
Message-ID: <87tt41bk9v.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Maxime Ripard <mripard@kernel.org> writes:

> On Fri, Jun 27, 2025 at 11:04:16AM +0200, Javier Martinez Canillas wrote:
>> Maxime Ripard <mripard@kernel.org> writes:
>> 

[...]

>> 
>> Usually I prefer to have static inline functions instead of macros to have
>> type checking. I see that this header has a mix of both, so I don't have a
>> strong opinion on what to use in this case.
>> 
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Thanks for your review!
>
> For the record, it's also how the platform bus defines its equivalent
> macro, so that's why I went with it.
>

Got it. I think is OK.

> Maxime

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

