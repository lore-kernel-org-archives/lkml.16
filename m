Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB252171C9
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 14:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749218923; cv=none; b=PprsfgCKMLYdZryQGMM/fqNER7STlGh4W7iiLsRYW7naiB4QIKEygmCahSY2D5npJ/CbGwW2HEUzLm9dVwe+Tm0BHLXgr/afX7rtV1qX0mnUGvVvUA9pwC6TuHmQIiQ2+BBc8GllHcRLXT4b5YjarxK/nGKFYmQPMlcKRQx9OIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749218923; c=relaxed/simple;
	bh=MTgQ3J9CV2Gj/FW9dW6d9onzwqf1Et96suAwCM3gXZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4KPZA+IC/2GgS6HdvpUJ2eMZDqMk0l3kYJJbBdW9iClkWqmXF/kcIlRYedCcIgtzs+WkL92s7tW+moBanD0YSSIqHXUHCu416JJA95ae3VLvUcDPq1GHCcKEU8xHbXSjHmpR8UeuJG41ZTb3oFevIMT1su8dK+BpzLxmnHdbr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=U+y8U0zd; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="U+y8U0zd"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-606bbe60c01so3722713a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 07:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1749218920; x=1749823720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+SrCl/f51Q6wsvIr87A5oDPDHuMVXDJpgKBq/CGFc8=;
        b=U+y8U0zdtPEwUGeCmLxuRyzZYBBOx6RoHzYRsM5+jPLkVo2srDvaKLYViSo7drIw8p
         QDEzMPK2wJKe+mzsKU1lBcARIDhGOkkzhReUgkiapWqKPT3wma68VaR6Ac3/nTq61r4B
         tMVg1yRZ7u8DFsjqXICX8XByElDOm/O6IzF7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749218920; x=1749823720;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+SrCl/f51Q6wsvIr87A5oDPDHuMVXDJpgKBq/CGFc8=;
        b=X+yVbJfNRFx2Q3LJSzW9tlarOiu0ymM8FrFEiqHmxm3R6m5PAlWN+s2UBNj6A9yO1a
         SYX8U7RS7TaQ0a8FsYHxRgTermmLOn+X7MMSxbBPZ91KkctGh1eVFSwNl2DKH30JC5f2
         kS1fH8xghSWwrgN3JGcI6t6DuFHdGVsgc7F4tIkPw8YqBfzPHMwyZ8ogWjsp+zWsqxLb
         916A46z1NVFRBGvXZPo5pGyzOogkGwmu5nZvFXCNn79SkKBMZP3EsyfHnauMoH7rJwzx
         XCu/4ar3w+13yf7bQF+Nl8qCTc/1wHgJkQvSiCnPTGctn5J7VxGo2z/x7nkfpvk//LK+
         Ku9A==
X-Forwarded-Encrypted: i=1; AJvYcCW0e68c24GI5Kl2Tb9E2njxFTQ+wLAzl4uiSvlIdB4P0+ittM1G68V0gDDkgWM0gAowIORYafEMUCgJ/ec=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAvtxbzwmTSmu2Bq3iGa++lKr3nbb/lrT0mSzUPKDRk7BF3f+S
	yvIbEtYxCi6CFTKjhLwx/MjcGAB2TeS3Yf/2FnVzk8GwFGupr/bKrwqa39c5cIIoRqY=
X-Gm-Gg: ASbGncsVor3ycg1uwzp6ANQ5KTvsG7nwhqfe5yxojCO3DikNT8qFk2ihbUlJQ0GYrW+
	6kw+HbPOlCqJFuQThRj3Zz1v0GRent8V+3rwrDzeG2bffcKN5vzWK5OKhr0eIDPyU1Dk12VNoY3
	ERJtBY2+0tfVMDneAuEGY2fITU2/0DY2WJ6MIdn55aW35F9E1YgteEoFafhlZj3ouWPheFOM3Tt
	Jb/PPwWmcEYDJ7jrGcv9aVe1M8rLnbJ3GrO9KMHe/mqcn38m49L7s7e8iq9Bv+anUnyezPXqJS9
	5b3AHWPTE0VB5Z54kqoQnwtKbhkb+t2MxGfyudepsv0X5RetqPvTm4Irac45dd7r/1yOBID4gg=
	=
X-Google-Smtp-Source: AGHT+IHFX0HnsPyTOdDAeUlo2hrNHElBrbc+CU9RgfvFeOrbV0ZvwQiJngadUTVgNhOy+/CArmmCcg==
X-Received: by 2002:a17:907:3da3:b0:ad8:a512:a9fc with SMTP id a640c23a62f3a-ade1a9fd897mr290273966b.42.1749218919860;
        Fri, 06 Jun 2025 07:08:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc3abe0sm122443766b.146.2025.06.06.07.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 07:08:39 -0700 (PDT)
Date: Fri, 6 Jun 2025 16:08:37 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sched: Discourage usage of separate workqueues
Message-ID: <aEL2Za28DVgbfiny@phenom.ffwll.local>
Mail-Followup-To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250604081657.124453-2-phasta@kernel.org>
 <7a09c357-2d28-4dd6-b637-4387cc430938@amd.com>
 <aEBhIzccXBPyt_58@phenom.ffwll.local>
 <aEB4DFFE2C7gElRL@lstrano-desk.jf.intel.com>
 <aEB6GOTlC_Z_Rq8b@cassiopeiae>
 <aEB9/VGHJGnY4+fP@lstrano-desk.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEB9/VGHJGnY4+fP@lstrano-desk.jf.intel.com>
X-Operating-System: Linux phenom 6.12.25-amd64 

On Wed, Jun 04, 2025 at 10:10:21AM -0700, Matthew Brost wrote:
> On Wed, Jun 04, 2025 at 06:53:44PM +0200, Danilo Krummrich wrote:
> > On Wed, Jun 04, 2025 at 09:45:00AM -0700, Matthew Brost wrote:
> > > On Wed, Jun 04, 2025 at 05:07:15PM +0200, Simona Vetter wrote:
> > > > We should definitely document this trick better though, I didn't find any
> > > > place where that was documented.
> > > 
> > > This is a good idea.
> > 
> > I think - and I also mentioned this a few times in the patch series that added
> > the workqueue support - we should also really document the pitfalls of this.
> > 
> > If the scheduler shares a workqueue with the driver, the driver needs to take
> > special care when submitting work that it's not possible to prevent run_job and
> > free_job work from running by doing this.
> > 
> > For instance, if it's a single threaded workqueue and the driver submits work
> > that allocates with GFP_KERNEL, this is a deadlock condition.
> > 
> > More generally, if the driver submits N work that, for instance allocates with
> > GFP_KERNEL, it's also a deadlock condition if N == max_active.
> 
> Can we prime lockdep on scheduler init? e.g.
> 
> fs_reclaim_acquire(GFP_KERNEL);
> workqueue_lockdep_acquire();
> workqueue_lockdep_release();
> fs_reclaim_release(GFP_KERNEL);

+1, this should do the trick. Well strictly need GFP_NORECLAIM, so ideally
the one below for dma_fence.

> In addition to documentation, this would prevent workqueues from being
> used that allocate with GFP_KERNEL.
> 
> Maybe we could use dma_fence_sigaling annotations instead of
> fs_reclaim_acquire, but at one point those gave Xe false lockdep
> positives so use fs_reclaim_acquire in similar cases. Maybe that has
> been fixed though.

Yeah the annotation is busted because it doesn't use the right recursive
version. I thought Thomas Hellstrom had a patch once, but it didn't land
yet.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
