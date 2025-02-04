Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DF7208989
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 10:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738664962; cv=none; b=dyjUPKmuoXzJv2Ppd7USf3YPHm16mVcflLW9OrJ2TsrX4GwLC4RVKw1DY/Ie7NeOBsk81lFAJaAN7bDfca3XhCv8dMMMlAQKWYvJo4XSBlPgU/uGihq8/2BkQAk1w4tHNGF/DrZt6MtH9xp+O5Bn+i0/epuf/QA/JtAvreJRpmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738664962; c=relaxed/simple;
	bh=rl2itgJRoXg5B61icDyM6OxezwRO95fU8KG7QF5eCgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4fjjeCYyB+E373zxIpKnX0eoPsRIkJwFBc+66u436159oOhUMs5Lw+ZJ4Vxn1nrKa1vr05mEeo8yNBjjGklUrBjAR5m4ruw2ZzdRHLnxG5d1jLIYMwncTtM4guYAPo5eJe8mNP/fcOSUYyfiVmR9BVz9cpTsU7TUsvOb0dOvck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=KsZGBgNH; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="KsZGBgNH"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38db10ab86cso21677f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 02:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738664959; x=1739269759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTYKk2hp5ZkC/HKiCXz2/2xF3prSkAzoF86kxm9Tnc4=;
        b=KsZGBgNH1geAGeeN82+6TBYEJ9lND+ZfBRxHCQv0lhgIOLvkRlSOCKSNUCi0OwK+X3
         8iRXZmvYd5z5gMyrNZODusRm/q7Bch/BV92TgjB+F8+LROfCHwKLtCEeax96UYDdbkQv
         oz9yl5Qriv9twdsb+n8wqnFE9iKA20PiCGsnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738664959; x=1739269759;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTYKk2hp5ZkC/HKiCXz2/2xF3prSkAzoF86kxm9Tnc4=;
        b=EaYAMzXjcXWuPy2/72G26OhoMpqJYue8jGDtK++klrrIvPWsVCGrBYIqsrSJYZbw2v
         QzJ4bUprsUIjV8pHX3yT93KmA/3N4nsUQc5HAueX9UJa0s5V1Q9DCCJTo6ANFkpg2ph5
         B+wBGQhkCIhAuT6VOKqvSUTj2ubJ6a6CsTN96eHn3FDiJC1iwD+5OJtEiEFxAT1rRG1s
         6JXASRPE0a9yrduUzt1/3eCXN3XZmMB7uRO4RaY4JgEjkvcJ3MTMD3BxXmTxVpEMZH+g
         RRM7NdXWNTztfwzWzf4VPf1pMDqjPxdIIfUAwU58ypZId/+4/jAIj7hKTb4vgs5J543K
         8UuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCG2Dzbm58UMWFxFnKiePuDR5s2tk90BpLlbN2b0PU3sp7Je3uDSuqDD5RxBOWAAaa18ZwPL7IFOB24W4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzekw3Eknseq6a+/ScMDici7jbkTyxoKiwJhzWHMbAeQfc6MeF3
	9uGXWhGwxDDSIMzK8bPiuPcgtxPxr/w+wmaU/U4WUNAUnppmfS8+6SwuhJW/0g5/NMoX9TcLzuE
	I
X-Gm-Gg: ASbGncvvIUoqqNJqOX9U0lfIPklGgVALtmiSOBQzaCjVhfwfLj8nxNX08WswDkIgjt8
	NhfEtBzS+PgrDzAGgNZRDRa6AehwzWd9y/lZxRDnDGS5AJc7MGQ1c7g5wS+XuwZPGTT58T/P+yK
	qIglsu5nlPRzgiO84Z71rVWZfjwD1sy5lXoOwndaDGPgNhlN2qb8NGQX1ITHBURmkf3TNyHrLmS
	9foBUmmHMi6KlAqYN72SRP4IcfqfKB2q3wq+gOSu6sAptsiFrfHh3JizhVJXmm+QOFt6c7IG7Hs
	nUbogy6XZGqg3umw+5W1xPwTbCQ=
X-Google-Smtp-Source: AGHT+IH0ABG3sbko57fw07W4SD47FSfJVdSGiS6f5kcfoCJiNKM78OfezLJxwCUa2AYLSFcDarZ8QQ==
X-Received: by 2002:a5d:6d09:0:b0:385:fae7:fe50 with SMTP id ffacd0b85a97d-38c5209128bmr19595106f8f.42.1738664958647;
        Tue, 04 Feb 2025 02:29:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1016a1sm15414535f8f.21.2025.02.04.02.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 02:29:18 -0800 (PST)
Date: Tue, 4 Feb 2025 11:29:15 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] DRM: small improvements
Message-ID: <Z6Hr-2rYhL96TgB0@phenom.ffwll.local>
Mail-Followup-To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250204-drm-small-improvements-v4-0-d6bbc92f12f1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-drm-small-improvements-v4-0-d6bbc92f12f1@bootlin.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Tue, Feb 04, 2025 at 09:51:57AM +0100, Luca Ceresoli wrote:
> This series brings small improvements to the DRM documentation and logging.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I've seen these fly by a few times ... is there no one at bootlin with
drm-misc commit rights who can push these for you? That's how I at least
expected these to land a few revisions ago.

Cheers, Sima

> ---
> Changes in v4:
> - Removed pathches 3 and 4 because the added warning has false positives
>   when cleaning up a connector in the init error path
> - Updated acked-by tags
> - Link to v3: https://lore.kernel.org/r/20241111-drm-small-improvements-v3-0-a9f576111b41@bootlin.com
> 
> Changes in v3:
> - patch 3: various fixes suggested by Jani Nikula and kernel test robot
> - Updated reviewed-by tags
> - Link to v2: https://lore.kernel.org/r/20241106-drm-small-improvements-v2-0-f6e2aef86719@bootlin.com
> 
> Changes in v2:
> - Added patches 3 and 4
> - Updated reviewed-by tags
> - Link to v1: https://lore.kernel.org/r/20241018-drm-small-improvements-v1-0-cc316e1a98c9@bootlin.com
> 
> ---
> Luca Ceresoli (2):
>       drm/drm_mode_object: fix typo in kerneldoc
>       drm/atomic-helper: improve CRTC enabled/connectors mismatch logging message
> 
>  drivers/gpu/drm/drm_atomic_helper.c | 5 +++--
>  include/drm/drm_mode_object.h       | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20241018-drm-small-improvements-1d104cc10280
> 
> Best regards,
> -- 
> Luca Ceresoli <luca.ceresoli@bootlin.com>
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
