Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877382620D1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028869; cv=none; b=WrypGSQ1DZMVQI1s3z+bSQ5xdeaCxi2u1TQUje0oTrdlfdNROydUAs0H+XsYHb46wB0wl/Dpxe3KZAFYDUhvRnOTObNSG3Q8TkJen2RD+WQeFr7/x4KgOLGUxzYaAr0MUkkf4fDLJqmCLTWO4/J48ApUEIfniZVQ8UyDfpng5Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028869; c=relaxed/simple;
	bh=ztJ1qVRMMagag+wC13p4HUDW3suqzL28jWsWXtbMhdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+ABKI9PhvAgU46EIjVsmahLdStRQzGjPIBZrJyJu+8BMjubIs82l08bdKCgSyC1L4Qu9ZBDG24kfSHuNBNG0irJuZJdm+tYefsttrw/IaomCjVrPXUOOGJUU1r2dzR/scLR/8vcWIReJz4WLCdk+XquCg2gCLALG5maZ8eCEOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gujX5eAg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gujX5eAg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCFEC4CEE7;
	Wed, 30 Apr 2025 16:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746028869;
	bh=ztJ1qVRMMagag+wC13p4HUDW3suqzL28jWsWXtbMhdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gujX5eAgPtuIvqEnE34MKXNf+8PCCp9YbP4hBEWgAg8YGfmBlMzUbmrAVgd+8qfcF
	 mEG65l+HeJGEv/U05DS3np+tMbYsB3yUiJfS6iguKEgGkbXRlSdEF6ifgoKhWOaeCe
	 G9FKwq2C9G4EcIbeXF6LTHsVTcoP1QW7ajgKUeRyZEHXhrjbogFvwQ9Awm1CujvcaI
	 nTMbws2ozut/JZDk8YWmodmZu7UV+7OKMpXLvVjJgmybtP4gOVL73ItBtR34BoR9Pk
	 HiTQEB1/Yw5PXK1TgRbBv9oSii0HTHSgi3f4YwgYE+HgKcvwQgjaOGMFTPUFFe8ftF
	 2IK9cp+3jBYww==
Date: Wed, 30 Apr 2025 09:01:06 -0700
From: Keith Busch <kbusch@kernel.org>
To: Daniel Wagner <dwagner@suse.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Hannes Reinecke <hare@suse.de>,
	Daniel Wagner <wagi@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] nvme: only allow entering LIVE from CONNECTING state
Message-ID: <aBJJQoOBhaXj7P36@kbusch-mbp>
References: <20250214-nvme-fc-fixes-v1-0-7a05d557d5cc@kernel.org>
 <20250214-nvme-fc-fixes-v1-1-7a05d557d5cc@kernel.org>
 <0134ea15-8d5f-41f7-9e9a-d7e6d82accaa@roeck-us.net>
 <cb46aa83-8033-4d64-a3c7-420172c3f3f5@flourine.local>
 <9763c4cf-8ca5-45d4-b723-270548ca1001@suse.de>
 <aBEW4W40ZelIXfs2@kbusch-mbp>
 <253e0551-d4d7-4ffe-8842-daecf1f6c753@roeck-us.net>
 <aBEdkUky_-bfgISv@kbusch-mbp>
 <8121b8d6-2b30-4086-b2fb-bce354f203dc@flourine.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8121b8d6-2b30-4086-b2fb-bce354f203dc@flourine.local>

On Wed, Apr 30, 2025 at 08:43:04AM +0200, Daniel Wagner wrote:
> On Tue, Apr 29, 2025 at 11:42:25AM -0700, Keith Busch wrote:
> > On Tue, Apr 29, 2025 at 11:23:25AM -0700, Guenter Roeck wrote:
> > > On 4/29/25 11:13, Keith Busch wrote:
> > > > On Mon, Apr 28, 2025 at 03:21:18PM +0200, Hannes Reinecke wrote:
> > > > > > diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> > > > > > index b502ac07483b..d3c4eacf607f 100644
> > > > > > --- a/drivers/nvme/host/core.c
> > > > > > +++ b/drivers/nvme/host/core.c
> > > > > > @@ -4493,7 +4493,8 @@ static void nvme_fw_act_work(struct work_struct *work)
> > > > > >                   msleep(100);
> > > > > >           }
> > > > > > 
> > > > > > -       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
> > > > > > +       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_CONNECTING) ||
> > > > > > +           !nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
> > > > > >                   return;
> > > > > > 
> > > > > >           nvme_unquiesce_io_queues(ctrl);
> > > > > 
> > > > > I would rather have a separate state for firmware activation.
> > > > > (Ab-)using the 'RESETTING' state here has direct implications
> > > > > with the error handler, as for the error handler 'RESETTING'
> > > > > means that the error handler has been scheduled.
> > > > > Which is not true for firmware activation.
> > > > 
> > > > But the point of having firmware activation set the state to RESETTING
> > > > was to fence off error handling from trying to schedule a real reset.
> > > > The fw activation work schedules its own recovery if it times out, but
> > > > we don't want any other recovery action or user requested resets to
> > > > proceed while an activation is still pending.
> > > 
> > > Not only that; there are various checks against NVME_CTRL_RESETTING
> > > sprinkled through the code. What is the impact of introducing a new state
> > > without handling all those checks ?
> > 
> > Good point, bad things will happen if these checks are not updated to
> > know about the new state. For example, nvme-pci will attempt aborting IO
> > or disabling the controller on a timeout instead of restarting the timer
> > as desired.
> > 
> > Can we just revert the commit that prevented the RESETTING -> LIVE
> > transtion for now?
> 
> Unfortunately, it will break the FC error handling again(*). The
> simplest fix is right above, add the transition from RESETTING to
> CONNECTING and then to LIVE, IMO.

Gotcha, yes, that looks like the simplest fix for the current release
then. We need to be careful with adding new states, so we can revisit
Hannes' suggestion for 6.16 if we really want to split this.

If you send the simple fix as a formal patch, please add my review and
the "Fixes:" tag.

Reviewed-by: Keith Busch <kbusch@kernel.org>
