Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AD41E572F;
	Thu, 10 Apr 2025 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272499; cv=none; b=Xt6HAiJAjKusiDRxDVxZs3+HMEk6SUasReD6hPN4crk9QuZfFiJjO3TSBjn0dvXiVLzB8BxrTLsaKU5GxF3a2jXAMcGIfeoT9Pmx4t90KqxMby9zYBWdnb+sgKAZEetaKzPgOiVC38ceCubFuFAMZwA9dkA4tdsMCOWYwcPGpbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272499; c=relaxed/simple;
	bh=8ND6dqJylzytwK8QGY61NBtBW3bbGF9AnqUq6PCX2cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQOXj4TC4SSmixLxhrsuxNFivRY0UFiH/IpFQAB5PHzBQhCC42kq0jQcnTShHI/DUeDrQR7YdPTp+rziFZWjzGk1tSyIav2YToLZ6QPsmdvEEmMK4G6hz990xIAwZnf2HwDQY+I62TvAgN8nnscC6dUySWyiiPJQlKT6Rd/MWBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etC/ghh+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etC/ghh+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 355EFC4CEDD;
	Thu, 10 Apr 2025 08:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744272499;
	bh=8ND6dqJylzytwK8QGY61NBtBW3bbGF9AnqUq6PCX2cA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=etC/ghh+hxK8w7jbzUsZMabc6XyIzS5CT4Mg7Fa7JrIL5CyE1k2PVwADgAFE9Vean
	 /0aYjyCiEReq33iNmBth8wdQ2Nh5tYasEmVOc6J07KJ+LzQkWTqUyZs9Rl0TLenf2o
	 riSY3QobJLrHdYdAGrHu8KJivKEY6d5RZfDXb7yzEC8GbDZVy1znKo4POOMqT+69gW
	 rTR843N8sbkhlXfRYMPovrzBekXMQA+E3bajLciYq6oa8idjQRxqJK0DSNEDbSeW4S
	 5blEih3PumxcILI8AMhng0P5Z/d7bzOb6KXm1VBfxZawaNRApNjonNqMHmcA7EhlaQ
	 YuimoL7vdE6zA==
Date: Thu, 10 Apr 2025 10:08:12 +0200
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
Message-ID: <Z/d8bP9GceSVpJAU@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-22-1f26db465f8d@kernel.org>
 <87jz7ttb7l.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jz7ttb7l.ffs@tglx>

On Wed, Apr 09, 2025 at 08:57:02PM +0200, Thomas Gleixner wrote:
> On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
> > +	guard(mutex)(&its->dev_alloc_lock);
> > +
> > +	its_dev = gicv5_its_find_device(its, device_id);
> > +	if (IS_ERR(its_dev))
> > +		return PTR_ERR(its_dev);
> > +
> > +	ret = gicv5_its_alloc_eventid(its_dev, nr_irqs, &event_id_base);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = iommu_dma_prepare_msi(info->desc,
> > +				    its->its_trans_phys_base);
> > +	if (ret)
> > +		goto out_eventid;
> 
> As 0-day already complained, guard() and goto does not mix. the simple
> solution is to do
> 
> foo()
>         guard()
>         return __foo();
> 
> Then you can put the gotos into __foo()

Yes even though its usage in this function IIUC is technically fine,
there are other kernel functions where the guard(mutex) is at the
function entry with gotos that follow.

Regardless, bad idea to mix them, as documented, thanks.

Side note: the bug the bot caught is because I moved the guard(mutex)
lower in the function and incidentally got past gotos (and gcc did not
catch it, it has to go up to W=2 to barf).

Anyway - as I mentioned in the cover letter, the current IWB driver
design, (patch 23 - where the guard(mutex) bug is and more readl_poll_*
boilerplate :), sorry), is a bit of a question (should I move it to
DOMAIN_BUS_WIRED_TO_MSI with the fixed eventid caveat to solve somehow),
or is it OK "as-is", treating it basically as an ITS hardcoded plugin ?

Thank you very much for having a look.

Lorenzo
