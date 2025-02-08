Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C536FBF
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739006168; cv=none; b=Xlt/KjTvds+g3fy3PA/BERYrf3mcELpfxLpskzQOaDRGbDHzOYWGF/wzZkeD2q2gS2TjosSM99jT0XcGnf7GX6pVXd/FiORYeedAbDvUOXx6NCrgeo7yK2Xvq6TZD6fz26cmoJRgFHgUBl2gsUPds89DXbWjJurfMhdVYDFkVjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739006168; c=relaxed/simple;
	bh=yTUWrKlbQ5GD/xLT4drcM54EhpoAr6SkF3Y3n/CpXjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1ksjZbzkLWdn3O9SUYlMEkPX55MbkEWh89jGaCsrWSOZZqzLLXaYOLalLHb8wBEOxHC/ycsO33lIUbuyR0Jo6fod3a+H1AgkVIvDWPz0ehQ/SJGbSHS+MkdqwR27BxD+5k/qT5r3kNt0tPPQCHWUz2kZl4kNO7XvvDtQIYerG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=V6pw2YRq; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="V6pw2YRq"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f464b9a27so43129565ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 01:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739006166; x=1739610966; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nvJCWy4EMuDIOueWrbTN3LkRGm5dA+GTUOq10vklDNE=;
        b=V6pw2YRq3xr8SGJdIX3lXJ6Xp/RFIgP4iA0gK2WYZnYPgSsJl4gHf0j/FjfxGuRX/g
         ktt+0aNmpj+Yg0+VaNouA7qvDWRKF4Uc63ZGMHF/aFGZESZTowsCv06nN0hR4AmL7/34
         wPdGhk/CofF4qyEG9ELq8z1t+Nk+OQEHUDmkTXZ/lRB/xDDP6Q73NDx35lCXDaA53Zte
         tjhJJtXdtShF5mI6qiqOkDuOuySF6IJ0esl0eAE54nHos/+S7QHeaWWsmGSqZzaYs8Ee
         +aDygWtfERPAltP2Aznm9yJQt7CuATKHaS3KD2dnIf/icrW1l1Sx6m671m06m9YE9Gdp
         fGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739006166; x=1739610966;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nvJCWy4EMuDIOueWrbTN3LkRGm5dA+GTUOq10vklDNE=;
        b=Wn9d6S/sJUbmt0WYFKtpIapgAvdFcTzKZIMBRxvQyYG0AJ7HPGtG4q5cVKTiP/6lpV
         ucOoweRkNb3mJ9rUwzN+Qtb6d8S7c+/kLrBr1JK2yv+j9432lpIk9Qsez31UsfWm51oA
         aaVr3v+OWIBhmVhzR/9krc9pP0ZDkdiiqFNB3bx6sZEZeG5cpXpD7gMylAL8nmsMFNFm
         FupQkCm/vSyzVrkovvTgXE3DcTE6tVT50ZaDGcAhMVlq8AfyI4oaxFSSR0w5K33axSqM
         TVQOnYWD2yl4RJCORk6OrNqhlXP0vLqwBLrh7jyRl25byhb/vafpJXCuXawQG4r3NkSI
         H3zg==
X-Forwarded-Encrypted: i=1; AJvYcCUKa/Ac54cf6Hne+lQXZEI5zVcz4ELlUWFH7aGuPd07eji42bVqBb1qLeegN7fFazuapeQ6TkUhTKrH8h4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWMRB4Ml7oQV9Isw4sWvmVbE4EeVDlLLlpKimyl4U/ZUces4Vf
	GX0+kyNZNyOi8ZNzdUI2EP7tB2dz4SEJ7haCwrQF4v6ShXu9Z+GVEvBcKANtwFkpyD2yH4k3SC0
	fCmRAiw==
X-Gm-Gg: ASbGncsjBAGqP5SBmDjbNXQqSOg10wsKQqAP1BNSuf/B2HEM49ka2dziNvf0lb8pGhN
	x7RAQimtpQmwdmzVOkzLcQ0FJvKjEvCXbL5IcGu1DospCqAMWFpV9HuS3Xu4/TC29/0qlhtW92P
	rk5AIWqEvuk39m6RZ214ZGimiNp5MgonNABYzL2NOxAp5WZ3tA5BPHf1f9ofm21LivcdYsqFymE
	7w5oT2WmgbATmfej8N5Ho6jSXZl3YG2HHaEaNdJvi7mZjczjJYHhUZ3gtdox880jYgs0lO9eHnU
	Di2lmRawLQCgyAqVSzLyLKmN9Jc=
X-Google-Smtp-Source: AGHT+IH9LMRe9AjHdNUfp2Yrb0ZiOIbt3KV7vcDcJeBZyl80We0ELLIq9YFH/aC5JlHj5VwpG1tojQ==
X-Received: by 2002:a05:6a20:d706:b0:1e0:ca1c:8581 with SMTP id adf61e73a8af0-1ee03a8dbb8mr12087904637.21.1739006165903;
        Sat, 08 Feb 2025 01:16:05 -0800 (PST)
Received: from bytedance ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7307bfc03efsm311772b3a.160.2025.02.08.01.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 01:16:05 -0800 (PST)
Date: Sat, 8 Feb 2025 17:15:59 +0800
From: Zhaoyu Liu <liuzhaoyu.zackary@bytedance.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	ray.huang@amd.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ttm: use ttm_resource_unevictable() to replace
 pin_count and swapped
Message-ID: <20250208091559.GA118571@bytedance>
References: <20250126093256.GA688734@bytedance>
 <bea1a3a0-c6d4-4941-9dd9-73f0756ef17b@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bea1a3a0-c6d4-4941-9dd9-73f0756ef17b@amd.com>

On Tue, Feb 04, 2025 at 08:59:08AM +0100, Christian König wrote:
> Am 26.01.25 um 10:32 schrieb Zhaoyu Liu:
> > TTM always uses pin_count and ttm_resource_is_swapped() together to
> > determine whether a BO is unevictable.
> > Now use ttm_resource_unevictable() to replace them.
> > 
> > Signed-off-by: Zhaoyu Liu <liuzhaoyu.zackary@bytedance.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> I will pick this up for drm-misc-next.
> 

Thanks,
but I don't see it in drm-misc-next(https://cgit.freedesktop.org/drm/drm-misc/log),
is it not merged yet?

---
All The Best

> > ---
> >   drivers/gpu/drm/ttm/ttm_resource.c | 15 ++++++++++-----
> >   1 file changed, 10 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> > index cc29bbf3eabb..a8f9f7ed6c6e 100644
> > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> > @@ -252,11 +252,16 @@ static bool ttm_resource_is_swapped(struct ttm_resource *res, struct ttm_buffer_
> >   	return ttm_tt_is_swapped(bo->ttm);
> >   }
> > +static bool ttm_resource_unevictable(struct ttm_resource *res, struct ttm_buffer_object *bo)
> > +{
> > +	return bo->pin_count || ttm_resource_is_swapped(res, bo);
> > +}
> > +
> >   /* Add the resource to a bulk move if the BO is configured for it */
> >   void ttm_resource_add_bulk_move(struct ttm_resource *res,
> >   				struct ttm_buffer_object *bo)
> >   {
> > -	if (bo->bulk_move && !bo->pin_count && !ttm_resource_is_swapped(res, bo))
> > +	if (bo->bulk_move && !ttm_resource_unevictable(res, bo))
> >   		ttm_lru_bulk_move_add(bo->bulk_move, res);
> >   }
> > @@ -264,7 +269,7 @@ void ttm_resource_add_bulk_move(struct ttm_resource *res,
> >   void ttm_resource_del_bulk_move(struct ttm_resource *res,
> >   				struct ttm_buffer_object *bo)
> >   {
> > -	if (bo->bulk_move && !bo->pin_count && !ttm_resource_is_swapped(res, bo))
> > +	if (bo->bulk_move && !ttm_resource_unevictable(res, bo))
> >   		ttm_lru_bulk_move_del(bo->bulk_move, res);
> >   }
> > @@ -276,10 +281,10 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
> >   	lockdep_assert_held(&bo->bdev->lru_lock);
> > -	if (bo->pin_count || ttm_resource_is_swapped(res, bo)) {
> > +	if (ttm_resource_unevictable(res, bo)) {
> >   		list_move_tail(&res->lru.link, &bdev->unevictable);
> > -	} else	if (bo->bulk_move) {
> > +	} else if (bo->bulk_move) {
> >   		struct ttm_lru_bulk_move_pos *pos =
> >   			ttm_lru_bulk_move_pos(bo->bulk_move, res);
> > @@ -318,7 +323,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
> >   	man = ttm_manager_type(bo->bdev, place->mem_type);
> >   	spin_lock(&bo->bdev->lru_lock);
> > -	if (bo->pin_count || ttm_resource_is_swapped(res, bo))
> > +	if (ttm_resource_unevictable(res, bo))
> >   		list_add_tail(&res->lru.link, &bo->bdev->unevictable);
> >   	else
> >   		list_add_tail(&res->lru.link, &man->lru[bo->priority]);
> 
