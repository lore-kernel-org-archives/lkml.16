Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8F9292086
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047853; cv=none; b=I+pzBoK0KZBp+keABku136bnetdq7kmaySTg4JmQ/4Sg0JvGVvqxExHc/En3AeJPpLVdKG1wwn1E9Yh2QqGWHjZic9s753gCClZakVt8slQbG1Avynpw5jP5R0eUwK3xEXw9TSqH9Fa3U53tbGwxQlWYekTGfKsW2X4DanbmiF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047853; c=relaxed/simple;
	bh=U5I5Ahe6JecLKWF9dMl/WGN9UgS8Owuf/L8FewTRsgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VEHXr4zYojKv0md1NGa1jRSHi0RNcBorrXs+GCZRz0GdbzwrmwwaEei4S7miyE/nPmUWTATsSfTn7b/qasZSaoGZCqy4589eXzx47drd2LcoruWlyj97JoTYMXxs+oEoxTMtSWVosIBgGVNfU1kLnrZoE362uAIwEtDAMBOp10I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=LO1AeMzu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="LO1AeMzu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442f9043f56so42800785e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1749047850; x=1749652650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZUBKc30vw5SwfnkHXPZNMm/Ylyi+Jo+Sq09IMYtHNI=;
        b=LO1AeMzuOypb4avrziNOuqWjBGHZdnTOUfLUdLhBbH+YZDmXNqRqPJswTxup/T8ZE1
         +oPMwKvvXQ0fKiwJ7dnZlhQEWSFn0U66WBDGAmMFE5+aAK94OzjMqXzKel2xVti9RF7L
         YJf2IHtGfA59rJTn9oP7P6ESh3fCXerm8d8LI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749047850; x=1749652650;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZUBKc30vw5SwfnkHXPZNMm/Ylyi+Jo+Sq09IMYtHNI=;
        b=XcJ+fAP47QHCNIHYtM/llfxob1XrqOJ5IjBY/J89dUj3eleC/sJTBcUjCitBALCtyc
         3YZRCpzroFhVdhWdwbUFDXiQkpG7x3zAW2YpSIHj2mUzDlYAKYIEzmuASeBAhamPOqrc
         fraK9Mv0QKPcFNcu3Rl+PpVVqa03dsnaD1OByu/rVxwexFZ4fwOtuyD8u6KYQ18Z+bqF
         17mIhcCpu/XxaiYvLZ4XGqL2C4g1aD5pUTGs5EDTt+DnkxIL+5fuhpuq8ThjwSCgy3na
         a4z/CNy1eFtnwDL7R4o7Cuqld2Z1iPY/F6/ZHiD0+XCHlsLPzgUr1dRPwGT2NIpBTQWn
         2xNg==
X-Forwarded-Encrypted: i=1; AJvYcCUGeuht9dFWQEuKZJTzIJUo5Xx39zqLY9n7Iis0qBI8oaSdGq0wYPEvqHOqmgvqYx2vemaht5AzrJbyKDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzschiKZ8M/zWR5MrtvF/ywuIhXyUUnJgFL5QbJ9B4sgZU8SBrQ
	AzHuZ+nZJSW5zeRztiiMcP4U7qYao3YQiPoDroeHGAJ6+jDyeVbh3YGk5BfcJt0V9Tw=
X-Gm-Gg: ASbGncs2OnoVcxBys55vCAxXq+X8qE/pDeV6fmIXIJlkdbFCLKjhi0gWdMxvmg74SXo
	sXz+EDYWXxPGFof2E1Uq3ImaEp1/8aaTblrntSlYU6FTlTrXE8BLvaqAwswqoRUsWTPWK+2gcJL
	pn0yHu5b/pnzfFkcN6kJF8mFz7UsqgRuvOF23N17FDDCH6OZEQ9AymG+4syI9LC3+sSM/m8Zv+S
	EX46+K+duJtyueN0QyncLs83codC1dvgxYFywbjm5G5LquZ5ionjiBTVz2qqwNo9/fTsalEGAyO
	H8g4ZpSKGJOtjIDFnhAXCrxghwH3XWiZ1P1VEeF8W1YslmPVQZvaaLo0/+ubQbRNRBn84CHv2re
	qoSIyoHi0
X-Google-Smtp-Source: AGHT+IF77XDVBkS67KTLmSK0T5wkUceKrc8aauvlRs0sDvEgKEf7a7UPbdimhlaAcpzc3R8z8tPcyQ==
X-Received: by 2002:a05:600c:1548:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-451f0a72bf1mr31835005e9.9.1749047849792;
        Wed, 04 Jun 2025 07:37:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f90c40sm204287965e9.2.2025.06.04.07.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 07:37:29 -0700 (PDT)
Date: Wed, 4 Jun 2025 16:37:27 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm: add overview diagram for drm stack
Message-ID: <aEBaJ5zMHfzhpdlz@phenom.ffwll.local>
Mail-Followup-To: Bagas Sanjaya <bagasdotme@gmail.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250601-drm-doc-updates-v4-1-e7c46821e009@gmail.com>
 <aDz-Pq4eMAYmzqsJ@archie.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDz-Pq4eMAYmzqsJ@archie.me>
X-Operating-System: Linux phenom 6.12.25-amd64 

On Mon, Jun 02, 2025 at 08:28:30AM +0700, Bagas Sanjaya wrote:
> On Sun, Jun 01, 2025 at 06:18:47PM -0400, Abdulrasaq Lawani wrote:
> > Add an overview diagram of Linux DRM architecture for
> > graphics and compute to introduction.rst
> > 
> > Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
> > ---
> > <snipped>...
> > diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
> > index 3cd0c8860b949408ed570d3f9384edd5f03df002..a8d3f953a470180b395ec52a45d0f3f4561424e0 100644
> > --- a/Documentation/gpu/introduction.rst
> > +++ b/Documentation/gpu/introduction.rst
> > @@ -14,7 +14,45 @@ including the TTM memory manager, output configuration and mode setting,
> >  and the new vblank internals, in addition to all the regular features
> >  found in current kernels.
> >  
> > -[Insert diagram of typical DRM stack here]
> > +Overview of the Linux DRM Architecture
> > +--------------------------------------
> > +::
> > +
> > +        +-----------------------------+
> > +        |     User-space Apps         |
> > +        | (Games, Browsers, ML, etc.) |
> > +        +-----------------------------+
> > +                      |
> > +                      v
> > +        +---------------------------------------+
> > +        |    Graphics APIs   |   Compute APIs   |
> > +        |  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
> > +        +---------------------------------------+
> > +                |                   |
> > +                v                   v
> > +        +---------------------+  +-----------------------+
> > +        |  User-space Driver  |  |    Compute Runtime    |
> > +        |  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
> > +        +---------------------+  +-----------------------+
> > +                |                   |
> > +                +--------+----------+
> > +                         |
> > +                         v
> > +                +-----------------------+
> > +                |   libdrm (DRM API)    |
> > +                +-----------------------+
> > +                          |
> > +                          v
> > +        +-------------------------------------------+
> > +        |     Kernel DRM/KMS Driver (i915, amdgpu,  |
> > +        |     nouveau, etc.)                        |
> > +        +-------------------------------------------+
> > +                |                       |
> > +                v                       v
> > +        +----------------+     +-------------------+
> > +        | GPU Display HW |     | GPU Compute Units |
> > +        +----------------+     +-------------------+
> > +

I'm a bit late to the party, apologies. I'm not sure how much use there is
in an extremely simplified diagram like this, least because it's really
incomplete and leaves out the entire display and compositor side.

My idea was that we'd instead link to the large pile of introductory and
overview talks further down in this file, if people want to get an
overview over what drm does.

If you want I guess you could add some links to the relevant wikipedia
pages, I think they also do a fairly decent job of explaining the big
picture.

Thanks, Sima


> >  
> >  Style Guidelines
> >  ================
> > 
> 
> The patch LGTM, thanks!
> 
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> 
> -- 
> An old man doll... just what I always wanted! - Clara



-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
