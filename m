Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3DA120F066;
	Tue, 29 Apr 2025 10:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745923777; cv=none; b=N5GhXOepRwLoCeHqDko7NYtGJnSpDbGWFkC9gSVa+JBFPrlp4N7LG8fJlyatPdH5RwQBwTKxRjsQGZYUIJzzZtFCSeJeeo7M72H5VNmQ+oFwFqc/7rGkelDxGYHjAG1kIEYEQvANvOqLeP07Ib/u+rmwRBWciaxV8bxemCieIfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745923777; c=relaxed/simple;
	bh=gJYIy0rT1pS92CfwMp/9AvqL8J2Nn0/W3JuKsM+jx6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iiq1uqhASqMHE5XWdea8k+2XdrpLEXlNnso7sXPvGJMBVXn7MCA5t4Qy3cz2lzD+or2mGOEiLXKHVQ2URj17WsU0iONbyfVNgGS/NOQ1EXbJzuFVanQIunDGiM8mDupKii9x3zohSg9GzD8HKeVCxCFCHPftpzCv+9i0Y/BU0Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37F261515;
	Tue, 29 Apr 2025 03:49:28 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBAB33F66E;
	Tue, 29 Apr 2025 03:49:32 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:49:29 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH v2 4/4] [NOT FOR UPSTREAM] firmware: arm_scmi: quirk:
 Ignore FC bit in attributes
Message-ID: <aBCuuUC01i7zflnA@pluto>
References: <20250425125250.1847711-1-cristian.marussi@arm.com>
 <20250425125250.1847711-5-cristian.marussi@arm.com>
 <aA5DVxP7n5GDFxoO@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA5DVxP7n5GDFxoO@hovoldconsulting.com>

On Sun, Apr 27, 2025 at 04:46:47PM +0200, Johan Hovold wrote:
> On Fri, Apr 25, 2025 at 01:52:50PM +0100, Cristian Marussi wrote:
> > Some platform misreported the support of FastChannel when queried: ignore
> > that bit on selected platforms.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > Match features has to be set-up properly before upstreaming this.
> > Ideally the out-of-spec firmware should be matched with a quirk matching
> > pattern based on Vendor/SubVendor/ImplVersion....but it is NOT clear if the
> > platform at hand will ship with future fixed firmwares where the ImplVersion
> > field is properly handled.
> > If we cannot be sure about that, we should fallback to a compatible match.
> > 
> > v1 -> v2
> > - use multiple compats quirks syntax
> > 
> > RFC->V1
> > - fix QUIRKS conditions
> 
> >  /* Global Quirks Definitions */
> >  DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
> > +DEFINE_SCMI_QUIRK(perf_level_get_fc_force,
> > +		  "bad-vend", NULL, "0x20000-", "bad-compat", "bad-compat-2");
> 
> Still works when matching on vendor and version (and/or machine or SoC
> compatible):
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> 
> I think we can go ahead and merge this based on vendor and version
> "0x20000-".
> 
> Depending on what Sibi finds out, or if it turns out to be needed, we
> can always add an upper version bound later.

Sure...sounds good.
Please post your final tested patch on top on my V3 as said elsewhere.

Thanks,
Cristian
