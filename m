Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6780CA64
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 04:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743655748; cv=none; b=ciLv+nYdXSoV6x5/TZK1n/vNEGba9+6AheDKqOtVoGruuxYGJsonHu9/28MaKDgCQI1ToLwv2q8YQCJvmb6eUo/DUsp1eaCGxIkrsa1wyWHKmdUlP74fVGhD0pHkMBVKPONsvnrh5B/eybfPpN1eRxCbORZwUOorhgWwvpys+8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743655748; c=relaxed/simple;
	bh=xX8zcljIOeP3MOPK4jfQbrTuLabTqW/5zoKDVNChLwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbOUO0mQ5HgoRNXBWByFPLFWrT1+hr7pPMsFnuenDBy0gIW8PRgADafBhJYaT0Ov1T5EMwabB2vAlwU2fevb6cLDyxKL8suxQl0fZSmHKZEgRvYqrKeo+52McFDgIWShBQNIdpjd9hOWPuGc2fDoCfakt9tjpAuPf2YVkyVav5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1FC6568C7B; Thu,  3 Apr 2025 06:49:02 +0200 (CEST)
Date: Thu, 3 Apr 2025 06:49:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Kamaljit Singh <kamaljit.singh1@wdc.com>, axboe@kernel.dk, hch@lst.de,
	sagi@grimberg.me, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, niklas.cassel@wdc.com,
	damien.lemoal@wdc.com
Subject: Re: [PATCH v1 1/1] nvme: add admin controller support. prohibit
 ioq creation for admin & disco ctrlrs
Message-ID: <20250403044901.GD22803@lst.de>
References: <20250328213640.798910-1-kamaljit.singh1@wdc.com> <20250328213640.798910-2-kamaljit.singh1@wdc.com> <Z-qur5YnK2ZtiRR3@kbusch-mbp.dhcp.thefacebook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-qur5YnK2ZtiRR3@kbusch-mbp.dhcp.thefacebook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Mar 31, 2025 at 09:03:11AM -0600, Keith Busch wrote:
> On Fri, Mar 28, 2025 at 02:36:40PM -0700, Kamaljit Singh wrote:
> > -static inline bool nvme_discovery_ctrl(struct nvme_ctrl *ctrl)
> > -{
> > -	return ctrl->opts && ctrl->opts->discovery_nqn;
> > -}
> > -
> 
> I suppose it's fine to rename this function with an nvmf_ prefix, but
> it's not really related to the rest of the patch and makes the diff
> larger than necessary.

It isn't, nvmf_ is really for code in the fabrics library and not used
by core code.

> > +	/* An admin or discovery controller has one admin queue, but no I/O queues */
> > +	if (nvme_admin_ctrl(&ctrl->ctrl) || nvmf_discovery_ctrl(&ctrl->ctrl)) {
> > +		ctrl->ctrl.queue_count = 1;
> > +	} else if (ctrl->ctrl.queue_count < 2) {
> > +		/* I/O controller with no I/O queues is not allowed */
> > +		ret = -EOPNOTSUPP;
> > +		dev_err(ctrl->ctrl.device,
> > +			"I/O controller doesn't allow zero I/O queues!\n");
> > +		goto destroy_admin;
> > +	}
> 
> The queue_count comes from the user. If the user provides a bad value
> for an IO controller, you're erroring. If they provide a bad value for a
> discovery or admin controller, you override the value. Why the different
> behavior?

Also we historically do allow I/O controllers without I/O queues to
allow for various kinds of recovery action.  So I don't think we
should change that.
