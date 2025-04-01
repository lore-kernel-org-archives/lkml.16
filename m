Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3503595D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 01:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743469870; cv=none; b=rrDc1uMtkEMTbA0c0b3rExZFy3jhaXjCTmrpvGiBHGN29rGXs5n9fNuEymuvnK8yyE3ZyUrCAea/TB69Rpmgi91iOG6EJlQm+wmaOsHP+dicYyia7Vrg+aHARQpb4R9SEphp14JSLApDErPFo4P+YS1fbCl50Tw2dm8ZTItUFPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743469870; c=relaxed/simple;
	bh=c4VRjFgdPHYVEXSgwVTJK9NOPjH1pvGIrhY1YvoLmpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sv9uB3QsBI0M4zpKezlgQ8DVhTyB7sI6B4izBL7qR0tjQ6d8er+jUoCZfDvSqqPmn/2ufokJ2noHrPaaCfHwv/AJO4+zfyZ3AaVeM/S70VhsQMMnjtz2rJsEjIbJ5ESA7U8VgCxba+5wVxz0SOkGkGl+eTabJY0wC4aEgLG+YPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=vEZCj0z3; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="vEZCj0z3"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2243803b776so21408105ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1743469868; x=1744074668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lSOCXG/bLgDc7ME6ApTEkqOXZXXVJMqkGl0AyQAQOxU=;
        b=vEZCj0z3Tjcqz6RBOsS5Whdq4AUiNMkctqwkdVKEg9yxZRxzC9Fg6Fv8JMfs9r8UZd
         ACKrNII4bULPCYXSEzFsSaJVb4w/HQdFnBCnU7tkDkjQAzVebmotcu57DI3ERsmlFIK8
         zPZmEPznvvXHGU/lXDLh+yXxyiXZ3CDvxz7iu0C0VkVlAd4dNCAKoxAK2DOSJF+uUThh
         lfFgJSpUENtqATDkE0sSFfAD8R6QceelfQk4Gbtz1RHDpebBHJcO8kTPOcU97Kqo9QBo
         +E6FLFqi/PZdguLMv0Kqa81aNLkAZmqFwkoxGWe820fP5ZN99ld60s+eFFx0lkZO7pVY
         HU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743469868; x=1744074668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSOCXG/bLgDc7ME6ApTEkqOXZXXVJMqkGl0AyQAQOxU=;
        b=HUfxeeR+x3iUGritqN4SmPOD52aaJ6phTMP+I/DcUg6DxC3MSxmiGUzLaxzzIQOZOt
         Gd+rz7K9Al6y1dPSK4sLE+CDBo6xT6Ml6iwHLcrDb03OGPqjbpA+3q+5cX+LFVZhZFU0
         73X+TpUpSxKJK+VppcWAgB6tehwZQcCaE0sH/PDy6ENV3zbCZGPCZivbKpfjkISS75tn
         qkzQLV18rXYJNskD59xv2JA3pQyXQb0uiNFZ6c/4752FqDq2pyFdDLHQgCR3UNUD4BL2
         CNtvmgKvbLkft/IV+1Im5EM/AYSSobPFgNgH2BCqAdvs5pFaONpy6FgvGYOns6tXa0BZ
         Bi3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBL5Oh8mVcU2fQk9jx9ynaRsi0EFe1Q0NazcXxhUSpmoxpmQAIYsf3l6LI2kNohJC7ZUSbR4C+LQRER2w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+HY8TgjpqR0pZxoTYSeKO3sRQyEvf2KFzjuzZAfDea3RvvOpw
	8n5ADP49M/ruqaG7vMGtqFysW+eKROO9p7/kfp9OQHYU/hXuiqU0JPPWUVyn6x8=
X-Gm-Gg: ASbGncuNT3G5OZGbJwF3oVFhY5EDJ7s503suiPzZUehJxWc1hXc/Jnb+uAmc9H67xra
	L/20j/BY/j7ywHBhb7lPSKZUuPoQ1AAo5FRpr0p4SsG0r2MI1+2l500C3VyqrvKINIh9kAOE9z8
	aHb7OhDrY3T3Fvh1SZG605OwhiwXw6SrF9VsRgrf+GeHUpYTyOcyHzOUuiCXaY8kGKrogEyJsQ3
	W0Diq8vQDjPjhHyCnXd4vmEdcB0eoy2DXUY/NgTB5NpIDFgZ+iet+MWLgVYGDK7/KTXDm6Zdgmd
	5QzGii6L7i0CG5qRI5C/be+u4eYP2ISMz7bG1BOpAwC3tFhZc9KgaS+S52uhoXIWcev478YQzUv
	izg00UCDvr0IbxLbR/PpxUE2ZR8u7
X-Google-Smtp-Source: AGHT+IFLfpDROybDyATP4hEqXJeYrPhcFQxWBwYKhCahugcasGxplhhifiK5A1Cetc20wuxbo6MSnA==
X-Received: by 2002:a17:902:9689:b0:224:584:6f04 with SMTP id d9443c01a7336-2292f95d89bmr122418275ad.18.1743469868573;
        Mon, 31 Mar 2025 18:11:08 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-60-96.pa.nsw.optusnet.com.au. [49.181.60.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73971063d24sm7614688b3a.86.2025.03.31.18.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 18:11:08 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98)
	(envelope-from <david@fromorbit.com>)
	id 1tzQ9g-00000002u8k-2xKY;
	Tue, 01 Apr 2025 12:11:04 +1100
Date: Tue, 1 Apr 2025 12:11:04 +1100
From: Dave Chinner <david@fromorbit.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, jack@suse.cz,
	Ard Biesheuvel <ardb@kernel.org>, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	mcgrof@kernel.org, hch@infradead.org, rafael@kernel.org,
	djwong@kernel.org, pavel@kernel.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, boqun.feng@gmail.com
Subject: Re: [PATCH 3/6] xfs: replace kthread freezing with auto fs freezing
Message-ID: <Z-s9KG-URzB9DwUb@dread.disaster.area>
References: <20250401-work-freeze-v1-0-d000611d4ab0@kernel.org>
 <20250401-work-freeze-v1-3-d000611d4ab0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401-work-freeze-v1-3-d000611d4ab0@kernel.org>

On Tue, Apr 01, 2025 at 02:32:48AM +0200, Christian Brauner wrote:
> From: Luis Chamberlain <mcgrof@kernel.org>
> 
> The kernel power management now supports allowing the VFS
> to handle filesystem freezing freezes and thawing. Take advantage
> of that and remove the kthread freezing. This is needed so that we
> properly really stop IO in flight without races after userspace
> has been frozen. Without this we rely on kthread freezing and
> its semantics are loose and error prone.
> 
> The filesystem therefore is in charge of properly dealing with
> quiescing of the filesystem through its callbacks if it thinks
> it knows better than how the VFS handles it.
> 
.....

> diff --git a/fs/xfs/xfs_trans_ail.c b/fs/xfs/xfs_trans_ail.c
> index 0fcb1828e598..ad8183db0780 100644
> --- a/fs/xfs/xfs_trans_ail.c
> +++ b/fs/xfs/xfs_trans_ail.c
> @@ -636,7 +636,6 @@ xfsaild(
>  	unsigned int	noreclaim_flag;
>  
>  	noreclaim_flag = memalloc_noreclaim_save();
> -	set_freezable();
>  
>  	while (1) {
>  		/*
> @@ -695,8 +694,6 @@ xfsaild(
>  
>  		__set_current_state(TASK_RUNNING);
>  
> -		try_to_freeze();
> -
>  		tout = xfsaild_push(ailp);
>  	}
>  

So what about the TASK_FREEZABLE flag that is set in this code
before sleeping?

i.e. this code before we schedule():

                if (tout && tout <= 20)
                        set_current_state(TASK_KILLABLE|TASK_FREEZABLE);
                else
                        set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);

Shouldn't TASK_FREEZABLE go away, too?

> diff --git a/fs/xfs/xfs_zone_gc.c b/fs/xfs/xfs_zone_gc.c
> index c5136ea9bb1d..1875b6551ab0 100644
> --- a/fs/xfs/xfs_zone_gc.c
> +++ b/fs/xfs/xfs_zone_gc.c
> @@ -993,7 +993,6 @@ xfs_zone_gc_handle_work(
>  	}
>  
>  	__set_current_state(TASK_RUNNING);
> -	try_to_freeze();
>  
>  	if (reset_list)
>  		xfs_zone_gc_reset_zones(data, reset_list);
> @@ -1041,7 +1040,6 @@ xfs_zoned_gcd(
>  	unsigned int		nofs_flag;
>  
>  	nofs_flag = memalloc_nofs_save();
> -	set_freezable();
>  
>  	for (;;) {
>  		set_current_state(TASK_INTERRUPTIBLE | TASK_FREEZABLE);

Same question here for this newly merged code, too...

-Dave.
-- 
Dave Chinner
david@fromorbit.com
