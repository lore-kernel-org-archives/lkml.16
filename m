Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD8920F091
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276019; cv=none; b=EfKgRHz85mxFHf+50S/GpsJwpzz5GF7OqrEl67qHpSALiY6KWQ0ImgkWLV84Xtp98r4BVVLdVSMoSQSanR30uQXxTkZ1ImdKFHHbln0+lwKuFn6D7BqlnXoDniNOKBPSe2Ohlutm2Pnqi00oj1+HDd/DObWd+iXI2kXiUeEm3Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276019; c=relaxed/simple;
	bh=rP3Dx76c+bhSUe+/MJheYQ026kUVDb++Zh5tJAh2S8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=De3st1McbYrHmJp0JNd7SMMaTby/yDyZ3FLiljrzVUd3UF5HyTe3BTVZXJMhdaD/wsjoiNpjP2KESJj/u+/iLkwSMOxHhZNCxqTwWjgATbnZO64It6vo9LeW3doNEoiJ1SvtnmJ3CkydR8qyKEOzAGQNq+d+bvpTdowDU9j3z5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a4I7MZAY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a4I7MZAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744276016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BER7UYmEw9ixtL0kHFxm0y4uAkw7Au5WEiHbUUwjMi0=;
	b=a4I7MZAY3g3Cvt5V5LVL3E7hjg7b4XKBEp9j0XlAmU86AUI+BvfZF9zWh4JyV33e/kUJpP
	wRjmHCf7IW1t60U5h5nTwK6DCjnhayk5gYvCt0w3Y6Ak8wAJqIclO3t2qN0K/SY9O3bKxk
	bHFCS2np9a+asqaNQWutpaNW17DmH1U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-REbo0uk3N02ytrOFGyzIMw-1; Thu, 10 Apr 2025 05:06:55 -0400
X-MC-Unique: REbo0uk3N02ytrOFGyzIMw-1
X-Mimecast-MFC-AGG-ID: REbo0uk3N02ytrOFGyzIMw_1744276014
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912539665cso929966f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744276014; x=1744880814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BER7UYmEw9ixtL0kHFxm0y4uAkw7Au5WEiHbUUwjMi0=;
        b=t2RBGStiFIId2/gs2Kvk7Fi7t+FT8M+4ovzy8++gzab1K1oX0rDEpi+s/IwxTQdI00
         T6PD4ugQxnYkSiBvq8oqo+1OTFErItyojUIwU1XlXItr6s50WD+uxjVOjfYWJ3ldG0td
         uI+7b0tNTn1KI8H7XQioozN6dQGNTpiosKe8Kb73MnjCpQHpr6yLTensbm1uIn1Fe3Nx
         vW8kf3MccJ9IBpAr6ro1pazYWkK1laa4/hWQ0Tf1zNHFYp310uYaFhgOvF6i9JSBULbg
         ABMVJgWkqqEvaTGtjEIZnT56waxkQnJwghxnFNPhV+u74r7jQZo0NFGxQj2nzNcSn6pJ
         6TjA==
X-Forwarded-Encrypted: i=1; AJvYcCVESVXiBzzLPwbVl62e2Gfir50Hp1+u60uyLSfapFkpHkd3fjeN6VJtOGNv5FGlaDaKaqphDRTx+BwD0kk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBsTPdAoPP4bfGbbZxEmk/yw71EFRWLpXU1D+etUFCel5oehXd
	ECy3tbMXuL6IhGzrI+T93EKhHPSV7kd+fqrwY2MpBgRARuX85MNtePsmVSxEijZtcD8wpj7w2dQ
	zWdxrMJCK9DSa7p0uZlQBlFhY3GVqwW6xPSxPPIH9t6p6QuU/iqvjA5HK9C1PjA==
X-Gm-Gg: ASbGncvSzNk5BE4MKmQbvnCqoGZ0XK5iO+w41aTXiwZ04faZ+q+99LMu2o1PUoVCZzs
	lUmuGKvM1O1XRtyfTk16cTwZ9MwNIBMKMDMN+C2yf9Q3Meg1nfmOLiV0UKgzSUAVp1ftSg/1tn4
	x3IqqdOxjJdsE0ZU9wmc7biNMa5QoQ2Lx3PYyjFV7OA6WQMu5hhIwFn0H0YSizu3zWSHGCsKmpG
	HzSQzqc4tRSEzzI2Jvw/5WHf3EMEnPFDcCvv1EI7pnh7sBG38bpdMpCqU7T829w0bI2270BWubw
	DIG7zv4scEsKC9h4w5D5Z9TdR9Ngpmp4fv3U0W5/UPuH2HdquIA=
X-Received: by 2002:a05:6000:4287:b0:39c:dfa:e86c with SMTP id ffacd0b85a97d-39d8f46abb1mr1575661f8f.13.1744276013612;
        Thu, 10 Apr 2025 02:06:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDTPklJCzw4HNfyygiYcYENKvKTw3MdqacWTlMUzZ5L20Mra+gQEivLdIL/Z2Qjq+OZ/HoFw==
X-Received: by 2002:a05:6000:4287:b0:39c:dfa:e86c with SMTP id ffacd0b85a97d-39d8f46abb1mr1575628f8f.13.1744276013103;
        Thu, 10 Apr 2025 02:06:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2c53sm43898445e9.14.2025.04.10.02.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 02:06:52 -0700 (PDT)
Message-ID: <009a1a7b-594b-4709-b9bc-068b2e6aa922@redhat.com>
Date: Thu, 10 Apr 2025 11:06:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] drm/panic: Add support to scanout buffer as array
 of pages
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ryosuke Yasuoka <ryasuoka@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Wei Yang <richard.weiyang@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, John Ogness
 <john.ogness@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250407140138.162383-1-jfalempe@redhat.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250407140138.162383-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2025 15:42, Jocelyn Falempe wrote:
> Some drivers like virtio-gpu, don't map the scanout buffer in the
> kernel. Calling vmap() in a panic handler is not safe, and writing an
> atomic_vmap() API is more complex than expected [1].
> So instead, pass the array of pages of the scanout buffer to the
> panic handler, and map only one page at a time to draw the pixels.
> This is obviously slow, but acceptable for a panic handler.
> As kmap_local_page() is not safe to call from a panic handler,
> introduce a kmap_local_page_try_from_panic() that will avoid unsafe
> operations.

I applied both patches to drm-misc/drm-misc-next.

Thanks for the reviews.

> 
> [1] https://lore.kernel.org/dri-devel/20250305152555.318159-1-ryasuoka@redhat.com/
> 
> v2:
>   * Add kmap_local_page_try_from_panic() (Simona Vetter)
>   * Correctly handle the case if kmap_local_page_try_from_panic()
>     returns NULL
>   * Check that the current page is not NULL before trying to map it.
>   * Add a comment in struct drm_scanout_buffer, that the array of
>     pages shouldn't be allocated in the get_scanout_buffer() callback.
> 
> v3:
>   * Replace DRM_WARN_ONCE with pr_debug_once (Simona Vetter)
>   * Add a comment in kmap_local_page_try_from_panic() (Thomas Gleixner)
> 
> Jocelyn Falempe (2):
>    mm/kmap: Add kmap_local_page_try_from_panic()
>    drm/panic: Add support to scanout buffer as array of pages
> 
>   drivers/gpu/drm/drm_panic.c      | 142 +++++++++++++++++++++++++++++--
>   include/drm/drm_panic.h          |  12 ++-
>   include/linux/highmem-internal.h |  13 +++
>   3 files changed, 160 insertions(+), 7 deletions(-)
> 
> 
> base-commit: fbe43810d563a293e3de301141d33caf1f5d5c5a

