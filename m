Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F44815533F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745506216; cv=none; b=gFK7VPgFJnizJKF2JUnQyeWkbcpWlDiTf4FHhDGdKMBq/ehtiNLLWvVl4vEx4xuknqM99xNE3LkEaNni9r1KmXg/v0O9bZTCtlKeTEdz4PpOyhtWxkxbdzxXqtWErqtwhsY0ZjUH7WEZJPMviu5NkPy/DSfBs2mxQxzocIQg+ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745506216; c=relaxed/simple;
	bh=2Qi1X2wV66kBR7ygccoeXfSaX/YHmo5Z5Yf5J05Hrnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQLSbx4vyk3XBFWb3Gve+BcpJKFDqpdQU9BA4EAwu8tUqo0ok2aJnZAE6CpWn8mOvpvca/kvzk+rw9eJJc2bMaBDYisXRkxMpgH6spBQepYhRmQT0iEVG3VCquZQlR5JTFG69G+urh5lfReEkj37KODm5Qt+IYZKihjqdH1z2VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Nr4pd4D2; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Nr4pd4D2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=YjpXgRpWlie3nhUpkIBO8PbIJqJF6f6xuXD5Vo6dKLk=; b=Nr4pd4D2RRdqU3qS
	FoRqDTjUb3bVXqrUZ4Utexrrlomo82+grWdiEb+9+iB7IIvVw51zUGq1eJ61E5cJF5HbXZGc3NGjW
	uONY7rAWk+Ag9Ly0cTZvzj0NdtkWaj++mYLni+mScGQKRQpIOXozGDCv+3Kpq8XuB+n0MKdm+ta8V
	uVhKmqpNHq8YhVI2H06NACBPCai6RkKI1YareY2dRcfj9EGJtUzLAUz05ptxtoUi9wz0FK1In5CIv
	dWNq19qsvCJAEInsyxdXwswM8vf5JKqgdztdkFGgkMD5CKo2oXXOx5PxC3NvLi0CYKEnYrpJbAoAE
	v/As6Gk3CpU0LfrjBw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1u7xts-00Ddmv-1u;
	Thu, 24 Apr 2025 14:50:04 +0000
Date: Thu, 24 Apr 2025 14:50:04 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	alexander.deucher@amd.com, harry.wentland@amd.com,
	sunpeng.li@amd.com, siqueira@igalia.com, christian.koenig@amd.com,
	airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/radeon: Remove unused radeon_doorbell_free
Message-ID: <aApPnAA_QLYhNn71@gallifrey>
References: <20250418002117.130612-1-linux@treblig.org>
 <20250418002117.130612-3-linux@treblig.org>
 <ab85b3c9-46cc-4148-9de5-dcaabea130ea@wanadoo.fr>
 <CADnq5_MrEQ2XGbNho6xd9Um0R6kEEpZBeu0e-97o6-D=juD0gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_MrEQ2XGbNho6xd9Um0R6kEEpZBeu0e-97o6-D=juD0gw@mail.gmail.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 14:49:51 up 351 days,  2:03,  1 user,  load average: 0.04, 0.02,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Alex Deucher (alexdeucher@gmail.com) wrote:
> On Fri, Apr 18, 2025 at 2:18 AM Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
> >
> > Le 18/04/2025 à 02:21, linux@treblig.org a écrit :
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > >
> > > radeon_doorbell_free() was added in 2013 by
> > > commit 75efdee11b5d ("drm/radeon: implement simple doorbell page
> > > allocator")
> > > but never used.
> >
> > Hi,
> >
> > I think than instead of being removed, it should be used in the error
> > handling path of cik_init() and in cik_fini().
> 
> Yes, ideally.  Care to make a patch to fix that?

I can have a look at that.

Dave

> Thanks,
> 
> Alex
> 
> >
> > CJ
> >
> > >
> > > Remove it.
> > >
> > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > ---
> > >   drivers/gpu/drm/radeon/radeon.h        |  1 -
> > >   drivers/gpu/drm/radeon/radeon_device.c | 14 --------------
> > >   2 files changed, 15 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> > > index 8605c074d9f7..58111fdf520d 100644
> > > --- a/drivers/gpu/drm/radeon/radeon.h
> > > +++ b/drivers/gpu/drm/radeon/radeon.h
> > > @@ -686,7 +686,6 @@ struct radeon_doorbell {
> > >   };
> > >
> > >   int radeon_doorbell_get(struct radeon_device *rdev, u32 *page);
> > > -void radeon_doorbell_free(struct radeon_device *rdev, u32 doorbell);
> > >
> > >   /*
> > >    * IRQS.
> > > diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> > > index bbd39348a7ab..4127ffb4bb6f 100644
> > > --- a/drivers/gpu/drm/radeon/radeon_device.c
> > > +++ b/drivers/gpu/drm/radeon/radeon_device.c
> > > @@ -392,20 +392,6 @@ int radeon_doorbell_get(struct radeon_device *rdev, u32 *doorbell)
> > >       }
> > >   }
> > >
> > > -/**
> > > - * radeon_doorbell_free - Free a doorbell entry
> > > - *
> > > - * @rdev: radeon_device pointer
> > > - * @doorbell: doorbell index
> > > - *
> > > - * Free a doorbell allocated for use by the driver (all asics)
> > > - */
> > > -void radeon_doorbell_free(struct radeon_device *rdev, u32 doorbell)
> > > -{
> > > -     if (doorbell < rdev->doorbell.num_doorbells)
> > > -             __clear_bit(doorbell, rdev->doorbell.used);
> > > -}
> > > -
> > >   /*
> > >    * radeon_wb_*()
> > >    * Writeback is the method by which the GPU updates special pages
> >
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
