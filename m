Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D251DED76
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 18:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743706790; cv=none; b=dnjG4HFMc2vFA9JGgIZ/7G4lydK8mDJGsj5xhMxct6D+zDkbExFEys8FuiPy/cdeanICD3Ke2uFh41vRF49V1S5S4gEgpuZEl+QcwUkhcM5C1bIvZPhg86HLraWZt+u3a+RRVqf/MDTWYIlp+saVHgR9bNz++2wG0eTDg0vBodM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743706790; c=relaxed/simple;
	bh=6CfGUQI1hD4EaUW52YQ6sJ3ErXhwmEaa5YfDJzOh0Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgrLzphswW9XEsfft7IxNtHZ9G7cBi7UG3t6qFl0pXO3YvlZlz6SrRnyfyIOxNVBNWRf8q1+Eipgktupe0gipUexeXv6T/dplQriBqXb1dXnPDW7aItx9O53Mfd450pgZ8KkB4++DbXou7IBS0cRlE3ZKGtYSNB603Racu9z054=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZw5u8+Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZw5u8+Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C509CC4CEE3;
	Thu,  3 Apr 2025 18:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743706790;
	bh=6CfGUQI1hD4EaUW52YQ6sJ3ErXhwmEaa5YfDJzOh0Gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZw5u8+YTSgB/geEfq2Qguz/4mFMTI4yg9I9FeNMUqGBSsETPIiSyxyyQauRAICfW
	 e4bh+mknKeohOh6ttjGp4KqU7H7yjhbUuh6hTHjLRA4DvdI7x13r+xYrznNWooUgWS
	 3Kwo2OQJsovk3jBXNZzvlDoIRtUnxHjCQ2mDFwZvxi6P1QGltbpanFHtTCb2BsteX7
	 v6w1AvCFrbSqzjPgTCXhWKvEmC5neOVSY+6zfRDxl+frylU+gOgLLybifZbwn+m0/W
	 LlTu1Y2k2Z5xwaAfkikMU/h8OWHy/TVHuMyJ0Z5g/iizhun6evtp0AFWP3eQquLB4c
	 H2LXCgb9DUEog==
Date: Thu, 3 Apr 2025 12:59:48 -0600
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Kamaljit Singh <kamaljit.singh1@wdc.com>, axboe@kernel.dk,
	sagi@grimberg.me, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, niklas.cassel@wdc.com,
	damien.lemoal@wdc.com
Subject: Re: [PATCH v1 1/1] nvme: add admin controller support. prohibit ioq
 creation for admin & disco ctrlrs
Message-ID: <Z-7apFKJK5u-7xL9@kbusch-mbp>
References: <20250328213640.798910-1-kamaljit.singh1@wdc.com>
 <20250328213640.798910-2-kamaljit.singh1@wdc.com>
 <Z-qur5YnK2ZtiRR3@kbusch-mbp.dhcp.thefacebook.com>
 <20250403044901.GD22803@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403044901.GD22803@lst.de>

On Thu, Apr 03, 2025 at 06:49:01AM +0200, Christoph Hellwig wrote:
> On Mon, Mar 31, 2025 at 09:03:11AM -0600, Keith Busch wrote:
> > On Fri, Mar 28, 2025 at 02:36:40PM -0700, Kamaljit Singh wrote:
> > > -static inline bool nvme_discovery_ctrl(struct nvme_ctrl *ctrl)
> > > -{
> > > -	return ctrl->opts && ctrl->opts->discovery_nqn;
> > > -}
> > > -
> > 
> > I suppose it's fine to rename this function with an nvmf_ prefix, but
> > it's not really related to the rest of the patch and makes the diff
> > larger than necessary.
> 
> It isn't, nvmf_ is really for code in the fabrics library and not used
> by core code.

Yes, I'm not suggesting to use "nvmf_" in the core. This function checks
for ctrl->ops, which only applies to fabrics, so this is a fabrics
specific function that could belong there instead of the core, is all
I'm saying. Not that I'd recommend making such a move in this patch...
