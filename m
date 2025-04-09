Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8468254B09;
	Wed,  9 Apr 2025 13:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744205831; cv=none; b=dQeqgfjSzWK2zm6GShulXf72bzwQaj9Yqeb20Y90KAk39mP+dmTqUheu8Xcq7wUWUHY8VLAXsYjQmBoAi8bJha0n5xVYXf/ZSAfRYSNYAaeqqm23DBxNLQOyu6gAc9MIHBeXj4//M563cePOxEVqFeTvDEL0ITYRWp5sC5GAnMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744205831; c=relaxed/simple;
	bh=UlHnIINK3hXAnc8dnyHTZc+hOC/0RUhg2HMmsTBNBvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1rb7CFGAEk9RHkscvrWikmBlIGJcwAQIQv9La6gXOv/NBXvhuVTkoPMU965cDxf6gUaaAsJUCtKBtKa6oC4vdSvP9SneZHh0ohLTn2ZZKi9wof0SaMYEQZHjnKbpfphJye/tw5PeASBX2iYliRvSVpg5b5wHa4KsNbA+LrhP1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILIPoAv/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILIPoAv/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C86C4CEE3;
	Wed,  9 Apr 2025 13:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744205831;
	bh=UlHnIINK3hXAnc8dnyHTZc+hOC/0RUhg2HMmsTBNBvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILIPoAv/k7LqaCUhdE9DT97eKEnh8gzljrWqTZUEgt0Zqrm26HXMPSSMaHBp8g58D
	 VWtvrXZTpUiTYt50lvqCct3gyKyXfqeNckgRPROtWqSfpEEczJgwVuDXRCdFbNMcXm
	 cqNLqTSAK9Gsuvo9NfAecngtROsehcrPMbKvAfZ0MdmRAh2xiCEC9vTAE2MhQOw2nu
	 Uw6XFf+iXXOtt4bj4cPwimB/7bw9CVluBI+xYZ6Soige28t6Pih25LtEHuPsY/K9qC
	 tE0w+jXQJDZh/z/rydjNp3R5Ae7yVWlQH3t6ZO3GKwOJVtGr8M760vpBN04ATZdCyO
	 ya6oReDMOGCjw==
Date: Wed, 9 Apr 2025 15:37:04 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 22/24] irqchip/gic-v5: Add GICv5 ITS support
Message-ID: <Z/Z4AFYNQmxTApYi@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-22-1f26db465f8d@kernel.org>
 <87tt6xtwnp.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tt6xtwnp.ffs@tglx>

On Wed, Apr 09, 2025 at 01:13:46PM +0200, Thomas Gleixner wrote:
> On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
> >  
> > +void gicv5_irs_syncr(void)
> > +{
> > +	u32 syncr;
> > +	u32 statusr;
> > +	int ret;
> > +	struct gicv5_irs_chip_data *irs_data;
> > +
> > +	irs_data = list_first_entry_or_null(&irs_nodes,
> > +					    struct gicv5_irs_chip_data, entry);
> > +	if (WARN_ON(!irs_data))
> > +		return;
> > +
> > +	syncr = FIELD_PREP(GICV5_IRS_SYNCR_SYNC, 1);
> > +	irs_writel(irs_data, syncr, GICV5_IRS_SYNCR);
> > +
> > +	ret = readl_relaxed_poll_timeout_atomic(
> > +			irs_data->irs_base + GICV5_IRS_SYNC_STATUSR, statusr,
> > +			FIELD_GET(GICV5_IRS_SYNC_STATUSR_IDLE, statusr), 1,
> > +			USEC_PER_SEC);
> > +
> > +	if (ret == -ETIMEDOUT)
> > +		pr_err_ratelimited("SYNCR timeout...\n");
> 
> This timeout poll thing looks very familiar by now. Third variant :)
> 
> > +static int gicv5_its_wait_for_invalidation(struct gicv5_its_chip_data *its)
> > +{
> > +	int ret;
> > +	u32 statusr;
> > +
> > +	ret = readl_relaxed_poll_timeout_atomic(
> > +			its->its_base + GICV5_ITS_STATUSR, statusr,
> > +			FIELD_GET(GICV5_ITS_STATUSR_IDLE, statusr), 1,
> > +			USEC_PER_SEC);
> > +
> > +	if (ret == -ETIMEDOUT)
> > +		pr_err_ratelimited("STATUSR timeout...\n");
> > +
> > +	return ret;
> > +}
> 
> And number four follows suit :)
> 
> > +
> > +static void gicv5_its_syncr(struct gicv5_its_chip_data *its,
> > +			    struct gicv5_its_dev *its_dev)
> > +{
> > +	int ret;
> > +	u64 syncr;
> > +	u32 statusr;
> > +
> > +	syncr = FIELD_PREP(GICV5_ITS_SYNCR_SYNC, 1) |
> > +		FIELD_PREP(GICV5_ITS_SYNCR_DEVICEID, its_dev->device_id);
> > +
> > +	its_writeq(its, syncr, GICV5_ITS_SYNCR);
> > +
> > +	ret = readl_relaxed_poll_timeout_atomic(
> > +			its->its_base + GICV5_ITS_SYNC_STATUSR, statusr,
> > +			FIELD_GET(GICV5_ITS_SYNC_STATUSR_IDLE, statusr), 1,
> > +			USEC_PER_SEC);
> > +
> > +	if (ret == -ETIMEDOUT)
> > +		pr_err_ratelimited("SYNCR timeout...\n");
> > +}
> 
> Along with #5 

No question about it, I will consolidate them as much as I can, I
noticed while implementing them then focused on getting the driver
functionality in place and forgot to create a single function,
apologies.

Thanks,
Lorenzo
