Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76231DED72
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743494689; cv=none; b=CMVymEOkZJ4suBUDk5fcTLMwUiYZtj8lTIOL86hqquzs8Nd8hUMPK/OkSTWXLgnvepW0Oo3DD5AStfAxWOcdabeLtCpjdCIMS3BCJhS8D8pDy9UOTmJyxHquoH9Y2VJdKjUudiYO++D9C2YaqnvdjIe0Kxy7D2e9lNb6cP6+qq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743494689; c=relaxed/simple;
	bh=uoqxFn461uJWatWNv82EkPSO4xUwOaxQli24YjB0PeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRdDwre4xXkLL6NAdRS36YUjMqGSNQuCzmhw0WiEm6GjtFj3xgEAsKYmpkHAekvLfQPC7rsVLr4/LKBAkrVtdDIGlc3/B/esyMq5r5GXLN6JnQwOuC7DgxJIILiL296gCX8yGsqXKW2YbZotDkTIXddUwDCfxq8rtYTCAOUiJKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlaCAqZ2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlaCAqZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D89DC4CEE4;
	Tue,  1 Apr 2025 08:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743494688;
	bh=uoqxFn461uJWatWNv82EkPSO4xUwOaxQli24YjB0PeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BlaCAqZ2x2jEYsaQmJv6sm81CPlhaB7/gaMCm0g4fkiQCqeIN0Sli9xRtH+qCpiUG
	 wRuqZLB5yJZM2ybvhcux8Bk+aM/B92QPnUTbZW4AGXwUbR+cPz5RkHx9BrRSdUlnPN
	 9tz6z32IMGsXt5+lxq9gjGSVsGRQgPmIAfmdxw/uQlt2BNyjW3KhJTwwfe71OiCJA2
	 oUBo3ri7HyMO+Ivt4MqRZnMU3yT3R/WvXMbfjo9vpKyzil5arq3pQ3qci8UchxPUlt
	 8nBqBNOWmioyzzWDaiQV0Zs6ORAosaTYSZ9VO7G7/RY2bd5oVgD13S8NvWuRbNkl3P
	 jVV/dRrNTDWPw==
Date: Tue, 1 Apr 2025 10:04:43 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Keith Busch <kbusch@kernel.org>
Cc: Kamaljit Singh <kamaljit.singh1@wdc.com>, axboe@kernel.dk, hch@lst.de,
	sagi@grimberg.me, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, niklas.cassel@wdc.com,
	damien.lemoal@wdc.com
Subject: Re: [PATCH v1 1/1] nvme: add admin controller support. prohibit ioq
 creation for admin & disco ctrlrs
Message-ID: <Z-ueG-wTibsSu5lK@ryzen>
References: <20250328213640.798910-1-kamaljit.singh1@wdc.com>
 <20250328213640.798910-2-kamaljit.singh1@wdc.com>
 <Z-qur5YnK2ZtiRR3@kbusch-mbp.dhcp.thefacebook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-qur5YnK2ZtiRR3@kbusch-mbp.dhcp.thefacebook.com>

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
> 
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
> 

Good question.

My initial proposal was simply to override the user provided value
to 1 (admin queue only) in case of admin (or discovery) controller.

The check for queue_count < 2 should be in a separate patch, if we
want that check at all. But to be honest, the code did previously
allow an I/O controller with just the admin queue and no I/O queues.
Thus, without a commit message explaining clearly why we should start
to disallow an I/O controller with just the admin queue, I think that
additional check is wrong.


Kind regards,
Niklas
