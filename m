Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3564D230BCC
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646069; cv=none; b=UlZodyYhv2YPofV97FIlnNMwFGDBy34vebJNVFZtPCvtFjKa0zaG+UdHPJ7llD8B8v+f0V1DCa6HRg0IiUJmozkZNsWM3Zia/fcGnDczugqa78K0VxV09F0vQuC7e2oi6ubvX9jX2XFt+6qT6b/L3+mkb0f/3dLx0+cP56YQQTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646069; c=relaxed/simple;
	bh=/UdgIEfPGpxPVHP9pNJ2R6tK1SiiUfPaiILmTmF7lZM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A9twSLAptjCrHbGUGNr6y6z1PFym6iIoajj0t0t6iaD5hJYCu7xk6pG4U26feV7MgRNsL8s1zWz4tsHLJGiHvy4tfxZzjugGUoGSLn5bDIf98HHSDyNHyG0Nl64f5hr5eAHeyw06sAv/4bwPa7MphoWQdDe8MNgz1VZt+PoFQss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ktla0cyV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ktla0cyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749646063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dOZUcdwPpJq8280mP/9gOOLvCQ6Km8yMMBj0qUgppIo=;
	b=Ktla0cyVDc75WWj6Sta1veLFPPOnyjjVRZDHxEle5q5JU5VICdn37jz4RnCl+hMcpq/jwy
	b50uNV9hic8wMjKbs46O3JmEVvmu4Qfz89KBq8aNgTIR+2q/nDfXAmuuBLQqMRbmbyp1UW
	pRoZfNF3jiX2Imns9EqauGUaqVhYvvM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-A5W0CkDWNvWitneuHmTzsw-1; Wed, 11 Jun 2025 08:47:41 -0400
X-MC-Unique: A5W0CkDWNvWitneuHmTzsw-1
X-Mimecast-MFC-AGG-ID: A5W0CkDWNvWitneuHmTzsw_1749646060
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so39470825e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646060; x=1750250860;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dOZUcdwPpJq8280mP/9gOOLvCQ6Km8yMMBj0qUgppIo=;
        b=Rn8mQ9SCTYi/6ediA9ng+APw0+fmJKQmAsEbeOvZBPUZDQFAgN3RSdMWsUeq36dZai
         G7i0qZG+HXxfKtEhAZzf8vgnorYY4bg14TrXAujqyw0WRG834Fu2xhbtjG5X80W+F9vg
         GBo6MnbIjORanLyXraY+72HqeEHLQk4dYPfR1Cxp4kpKjoYlXEOK3pcKtcYMxPXzRv7+
         TfyGWLIlCb0N8Xd5XLBw+yDOOq/ywu6jLkmkCqz4eBdCgrQ4I4RpgAnnoRbsBfnhhSqk
         sdJ1HzvoYGpdlDoXy3lOGcNnZJzPcwrw9DUQ9+s7/laSgKgv6fqs9TfJDKlu/aQ6Z0rz
         4cGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiusYPVhuFnd3iIHItLJyjy74bRdFDjFwun6txxSj0XJbkVH3IhdZwjo+BRrhIzUajmVgUbGOf8ZmzVMc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5+3Hf/4JMT1XP/rPMXQb2jpEh3NYie5Y//ltEsU6x8onDPKyo
	P8R56yc4CgjwKLX4sS/CNdA+hZW+q0a/IuGzssA+ymuel5KuX3LC3PvT95YQ0kQhvx9lMEznciL
	QanV1wC0NmAVlNLrrxJKU1W2s41lvWk75Mqxwc999CZfrz/Dt2usdUh4qXVzoX/pjmaqF2XYLhQ
	==
X-Gm-Gg: ASbGnctfK+RrrdxO76B4pd9NmXVT9t9ZDAJf46eFRlg6qmdDRqA7NNiYUGPOHvShNPI
	xqts+leVHd5uk9VXQK0o+Ryca7YowchRDDlJtbgRs1o/5fl1fPT4VG8q/iglXa/2oO90vB2T+OA
	kZIs2UsT2paqzN2zIdJlUyyRVmMuKGitABzCZe/K+9R4w9XDZuzn1DDXxCdQOoWK8eSHHtWtZsS
	TksDpL+H0Nw3S1hRyFUqpRI10A2dTA+ABv0UVmMIf44i9TJ2BnC5TvwjvM8UTvY1NPe9VrM26pe
	29NX588A60FnysOcmVEfQLuEVCefC/ZBvUdPHMFwzddQwTad3U3VLneBQXzhuRHDwbjtvyCA9V+
	46ZO8
X-Received: by 2002:a05:600c:a09:b0:451:e394:8920 with SMTP id 5b1f17b1804b1-453248ca328mr24671725e9.27.1749646060080;
        Wed, 11 Jun 2025 05:47:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqeJnbRJuLZibdCS6f26HyL1EoF9jTLnCUNvqq3xXvU+62w2OxfIQUklEpl/a8SECCwtJYpQ==
X-Received: by 2002:a05:600c:a09:b0:451:e394:8920 with SMTP id 5b1f17b1804b1-453248ca328mr24671465e9.27.1749646059663;
        Wed, 11 Jun 2025 05:47:39 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453252165c6sm20174345e9.29.2025.06.11.05.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:47:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ssd130x: fix ssd132x_clear_screen() columns
In-Reply-To: <20250611111307.1814876-1-jkeeping@inmusicbrands.com>
References: <20250611111307.1814876-1-jkeeping@inmusicbrands.com>
Date: Wed, 11 Jun 2025 14:47:37 +0200
Message-ID: <87y0tycumu.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

John Keeping <jkeeping@inmusicbrands.com> writes:

Hello John,

> The number of columns relates to the width, not the height.  Use the
> correct variable.
>
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index dd2006d51c7a2..eec43d1a55951 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -974,7 +974,7 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
>  
>  static void ssd132x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
>  {
> -	unsigned int columns = DIV_ROUND_UP(ssd130x->height, SSD132X_SEGMENT_WIDTH);
> +	unsigned int columns = DIV_ROUND_UP(ssd130x->width, SSD132X_SEGMENT_WIDTH);
>  	unsigned int height = ssd130x->height;
>  

Ups, indeed. Thanks for fixing it!

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

