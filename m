Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F7A2D876B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022228; cv=none; b=ewhLDCSxvlxmM7x9b8HSGLHsoPlZcKIOhcLMM8re83wOns3utJOkw/CuIHwyZOml7fuz7nPPInukVLoE9e4pB25dkmUCF2sI6JkZ0HiyqQOWfdPaV6g8GWFIyGBaMWE+1QOeHdUy0cDklZz8SGIEMCm6CdWHvh9CehWkwRrBTzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022228; c=relaxed/simple;
	bh=NnfDTk1pQjGQ6xz9Gx7UhuPMPvkRSW1fzPZMDObvOG0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NGK+ryBDthX7RdAe9bkGHUmEPkaP1Rbw7+FgrUEjfoqunynsYp34m10Twk3jO/2YRgoOMw8gkPr+uRlIwgAj4byTlO4Km06nK3eM511qQzAfkK2WNzBjhD1x6mSj4kT+DnCdZIOr71WCJCVCoOSLmTe1JyHLrVFo2j3I1ON9TDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aClLUdME; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aClLUdME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751022225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mtX7I0GPvovEGFWmWQECoN3Ul3jWpNQVGiKa93vT//s=;
	b=aClLUdMEqah7ZqVxRSPtTgIuCAF8YCBtfkL6DCAu4Cw8sw3R7LYFGAwUO0mK2zwCyVGsfV
	G4/8e76nUphxMZWiQBjErU3sRqr7bImf0bBFey61GdGepP2BSLpoUUL+jm+5MNChDNZMKv
	TSkr0qgKbbuRSyyr3+HHHFvCqVmOu4w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-RozzyyWGNOGiXbQB_2VfqQ-1; Fri, 27 Jun 2025 07:03:44 -0400
X-MC-Unique: RozzyyWGNOGiXbQB_2VfqQ-1
X-Mimecast-MFC-AGG-ID: RozzyyWGNOGiXbQB_2VfqQ_1751022223
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-452ff9e054eso7933735e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751022223; x=1751627023;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mtX7I0GPvovEGFWmWQECoN3Ul3jWpNQVGiKa93vT//s=;
        b=QoxMLNabyCeab7cc5wJEO5fPzll9uVZz2feUlwZzECi6MAwoQ/unHBvo8YGrDqpVUV
         Zlnte1wnU5nNTCyJRS3EcYp/YRu9yyuPOzevI1TjOWdF9LoAjNu0y8o/FrHBYEOwcJiJ
         WKF/hNG/Q+nU+JGPTrgj3+Nx69ZZe288B7kJ6E7egwaiC3b2aivYhpgNvb3Z1W75lFFD
         kJRkcRwE3B4Q8MfrvhQG8I/KQKIte1yjJGscs8mBb6rPmncT+KZceJS0DBaKSjvR8n3R
         rT5mmZg85XC2ztGcOUiELTaNl8VI5NALWULkWfm1c8Dim0sEqgstOFBFVb7HcCN9LvAN
         jpYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2GnGKU7zcF5qf2UZV3qCxMGoiavE58wPETn/dF4v4EyfhUv5ukJ36MPylzLDVINowyIbEsPINf51LBRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSMvXjt99z1zU9K8M8miFWKI9QtxtB7hgHEWbbAL4SmeqbaKrp
	XWjwJfk5Tv1Leo6UKaGphY+n1wYNQSNZS6FxCeL3VdH8+YTMONuq47dpAY8hubimLshK6m7ZeNc
	MXTWB2gUL6iSazq1xm4xNaTETx8+oNEeQAl8MUUVfknmZQA6gxj8x+scYMJChRDAPEg==
X-Gm-Gg: ASbGncvZEt0h/Qd2R0AaF1F6xmvCjaYcDh99+vqn2HCvydOuCimokfrBvdcSTSBhC/K
	wSWjBO3aQZCv1q6YfxN4ax5cEj9UxFOVtqrlvX77KmOFYCQcUkuhkv5crzex4WSJ78y/esFQ2CV
	SmJVcO1WPOHS5jvNDV1+KaJ1cYENYAIErVuuFfchUXU1x7+h9/GsubRJIVHGHQqrMWCkFjnhCKr
	758ne+lyLBRl2DmJsJJW9I7eigMcWlqpXV+kYlJdW3QPOquzf+88b/7dj7AnkvOM18ilaV+xR2M
	KUk0R17tp5mDVl3YFpsr2RPYsefTKnmm9CWA30l52v7paZxyis0u0euFLWBpO+AkAdxZsc1HTmz
	iL0nn
X-Received: by 2002:a05:600c:64c8:b0:450:d3b9:a5fc with SMTP id 5b1f17b1804b1-45392bc7863mr8865535e9.27.1751022223080;
        Fri, 27 Jun 2025 04:03:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9SDcCf+mmOjwZCGWKGJgmV5NZ0wW6bs1ldO0KYcIHLiZMF5li0QSbqyGtLk6UFRI7bW16aw==
X-Received: by 2002:a05:600c:64c8:b0:450:d3b9:a5fc with SMTP id 5b1f17b1804b1-45392bc7863mr8865235e9.27.1751022222610;
        Fri, 27 Jun 2025 04:03:42 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a40766csm47736185e9.32.2025.06.27.04.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:03:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] firmware: sysfb: Don't use "proxy" headers
In-Reply-To: <20250627103454.702606-1-andriy.shevchenko@linux.intel.com>
References: <20250627103454.702606-1-andriy.shevchenko@linux.intel.com>
Date: Fri, 27 Jun 2025 13:03:40 +0200
Message-ID: <87ikkhbg4z.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> Update header inclusions to follow IWYU (Include What You Use)
> principle.
>
> Note that kernel.h is discouraged to be included as it's written
> at the top of that file.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>
> v2: dropped first patch, added tags (Javier, Thomas)
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

