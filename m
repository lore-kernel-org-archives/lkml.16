Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DBE3FFD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745950436; cv=none; b=DsDkgm+GQEP5IVpK2o6EIWyAZvvgANE/+N56wufX34SCUsTH3x64i2tAk4ugyS/QcNzx4j92tp+juTyw7AFY27VdpnEaSrBjiB4N/RT1EGahfUznKaqd+N94r/cc5qHDXHRYSeQeDpSxXJ0lQanDOO8/Ul5ZH75e9Jbu/6Kxgn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745950436; c=relaxed/simple;
	bh=7KLFhpo7TQ1uAQoOU0I1z3Knl9gIW2GZLoY/PE9dL1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgSV1RrzyCLg/RtDFsNYCsVizEkNViwx0lo8GECrtl7gPXZj9FaNygt4/YVPRknrHsCcBsKPnQ38eKEDunalMtA2mIzIw9sFPOuuiy50M5ylIvYbOhk7MG1LIkigcHa0yEwKAOMloNgEe5inNY6MllvRCRlK0tCJ2sLVBpms+4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aya0qzlz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aya0qzlz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FACC4CEE3;
	Tue, 29 Apr 2025 18:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745950435;
	bh=7KLFhpo7TQ1uAQoOU0I1z3Knl9gIW2GZLoY/PE9dL1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aya0qzlzgpRzNk1R0C3VBxvKNxLBFeeUk+rkLGyhP13c55hQRbWI+wZFwxbzI9bs8
	 wD9R2gm471vipnW8KqETrNRm1IcIOfekxZWPDKyRR4J8ltf4FkR/LzRN1cjfkV4Pgw
	 m/6sq2vzChL8UErMmp+NYwT8eN9rYe9ZB8/Q9ZCOResNz102/RGDNYW334dEr6TrY3
	 654Hu0p4/1+/LHVrk3ZEbaqtKNrinteWfbEABX9VOisX144QELJL5mtG+4/ITt3wcz
	 1Q3ojD3aZyYqBtPxCYorY4gWMrzwXvkkDyGZuzRKcFt665BdzdiGPq90DTwXkb1dKf
	 sKEY8Hy1XasZw==
Date: Tue, 29 Apr 2025 11:13:53 -0700
From: Keith Busch <kbusch@kernel.org>
To: Hannes Reinecke <hare@suse.de>
Cc: Daniel Wagner <dwagner@suse.de>, Guenter Roeck <linux@roeck-us.net>,
	Daniel Wagner <wagi@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] nvme: only allow entering LIVE from CONNECTING state
Message-ID: <aBEW4W40ZelIXfs2@kbusch-mbp>
References: <20250214-nvme-fc-fixes-v1-0-7a05d557d5cc@kernel.org>
 <20250214-nvme-fc-fixes-v1-1-7a05d557d5cc@kernel.org>
 <0134ea15-8d5f-41f7-9e9a-d7e6d82accaa@roeck-us.net>
 <cb46aa83-8033-4d64-a3c7-420172c3f3f5@flourine.local>
 <9763c4cf-8ca5-45d4-b723-270548ca1001@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9763c4cf-8ca5-45d4-b723-270548ca1001@suse.de>

On Mon, Apr 28, 2025 at 03:21:18PM +0200, Hannes Reinecke wrote:
> > diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> > index b502ac07483b..d3c4eacf607f 100644
> > --- a/drivers/nvme/host/core.c
> > +++ b/drivers/nvme/host/core.c
> > @@ -4493,7 +4493,8 @@ static void nvme_fw_act_work(struct work_struct *work)
> >                  msleep(100);
> >          }
> > 
> > -       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
> > +       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_CONNECTING) ||
> > +           !nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
> >                  return;
> > 
> >          nvme_unquiesce_io_queues(ctrl);
> 
> I would rather have a separate state for firmware activation.
> (Ab-)using the 'RESETTING' state here has direct implications
> with the error handler, as for the error handler 'RESETTING'
> means that the error handler has been scheduled.
> Which is not true for firmware activation.

But the point of having firmware activation set the state to RESETTING
was to fence off error handling from trying to schedule a real reset.
The fw activation work schedules its own recovery if it times out, but
we don't want any other recovery action or user requested resets to
proceed while an activation is still pending.
