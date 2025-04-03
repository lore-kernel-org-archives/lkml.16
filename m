Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34BB245002;
	Thu,  3 Apr 2025 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670784; cv=none; b=Baiz3/3aBn/6wC2W6ES08Uq+gD2PR5vk83UQSNt4ojiQjHabqpFyPsFG49J0oiDdwhMys3GuvyGDlyS+WVnY35/xJGrT6BjhUO4+nHyBCCfe0GpNlQiyDV2eIxuEJ2wwIWfIcs9QS4181ntZYSjD42onw6AJGWcPJWyviKcAids=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670784; c=relaxed/simple;
	bh=QPaUiwAtSIjOX5erc2n6DHnB4qcme2fPnAwrOEI2TJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e87+oR/pbPBzquP3OLxmov92Dq2m7d3ThWV/e8baV2er6zX4fPM506Tr1S4LgCCyLNw6CsDb+tTbaPNfVRaAF96MHfM7NlA4E4BcUbytmD/GQE3b4vqIMLxEJj7IdNBk2LqElL7AvQVfMtLnosEhizSAdgRXa+chGphjaeMbNjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8716E106F;
	Thu,  3 Apr 2025 01:59:44 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB72B3F63F;
	Thu,  3 Apr 2025 01:59:40 -0700 (PDT)
Date: Thu, 3 Apr 2025 09:59:38 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Matthew Bystrin <dev.mbstr@gmail.com>, arm-scmi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Message-ID: <20250403-discreet-tangerine-mink-d5faaf@sudeepholla>
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
 <Z-1gY8mQLznSg5Na@pluto>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-1gY8mQLznSg5Na@pluto>

On Wed, Apr 02, 2025 at 05:05:55PM +0100, Cristian Marussi wrote:
> On Wed, Apr 02, 2025 at 11:59:47AM +0100, Sudeep Holla wrote:
> > On Wed, Apr 02, 2025 at 01:42:54PM +0300, Matthew Bystrin wrote:
> > > Add timeout argument to do_xfer_with_response() with subsequent changes
> > > in corresponding drivers. To maintain backward compatibility use
> > > previous hardcoded timeout value.
> > > 
> 
> Hi Matthew, Sudeep,
> 
> this is something I had my eyes on since a while and never get back to
> it....so thanks for looking at this first of all...
> 
> > > According to SCMI specification [1] there is no defined timeout for
> > > delayed messages in the interface. While hardcoded 2 seconds timeout
> > > might be good enough for existing protocol drivers, moving it to the
> > > function argument may be useful for vendor-specific protocols with
> > > different timing needs.
> > > 
> > 
> > Please post this patch along with the vendor specific protocols mentioned
> > above and with the reasoning as why 2s is not sufficient.
> 
> Ack on this, it would be good to understand why a huge 2 secs is not
> enough...and also...
> 
> > 
> > Also instead of churning up existing users/usage, we can explore to had
> > one with this timeout as alternative if you present and convince the
> > validity of your use-case and the associated timing requirement.
> > 
> 
> ...with the proposed patch (and any kind of alternative API proposed
> by Sudeep) the delayed response timeout becomes a parameter of the method
> do_xfer_with_response() and so, as a consequence, this timoeut becomes
> effectively configurable per-transaction, while usually a timeout is
> commonly configurable per-channel, so valid as a whole for any protocol
> on that channel across the whole platform, AND optionally describable as
> different from the default standard value via DT props (like max-rx-timeout).
> 
> Is this what we want ? (a per-transaction configurable timeout ?)
> 
> If not, it could be an option to make instead this a per-channel optional
> new DT described property so that you can configure globally a different
> delayed timeout.
> 
> If yes, how this new parameter is meant to be used/configured/chosen ?
> on a per-protocol/command basis, unrelated to the specific platform we run on ?
>  

+1 on all the points above. I agree this must be per transport. If it is
per message then you need to think why it needs to sync command. Why can't
it be changed to async or use notification. I am waiting to see the usage
in your vendor protocols to understand it in more detail.

-- 
Regards,
Sudeep
