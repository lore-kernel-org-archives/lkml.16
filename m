Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97580235BE8;
	Tue, 22 Apr 2025 12:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324298; cv=none; b=S8CQ485FcsQHQZX0RyQG7gR1L/m1gJmMTbSQKBbxSJxva4WHzQexSSpySYvGwEXtFxU/1bXayUEQ695w8Ir4G4NBEX6hlL0v5kSvUBeCbn4+HbRVtJ8Dic9OGAQ09jdNmWc4wgLHpre3aYZe3AM5nF92F+anEPbv6pv7gEARun4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324298; c=relaxed/simple;
	bh=+9I6NME4NYHS0z52hLJtD8uXVIRAnOr7BxIMSTaC1vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czhFLey3bxrdgp8QjaOTdxEsQeLIsFw6WlOEKfIFixj2QYSdITOKaynY7CZlM4NeRx4BLOwJkEXjgMHQeLiiMaWiC+7VWYmsU6ojtEOqY3a2RAzyVFEQDKCgTLW1fPEspaKdkGUZgo6jDkh2YvsbbUCkVsTW2HmcRM4ev7mgJV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVVDhBYP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVVDhBYP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4EFC4CEE9;
	Tue, 22 Apr 2025 12:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745324298;
	bh=+9I6NME4NYHS0z52hLJtD8uXVIRAnOr7BxIMSTaC1vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVVDhBYP+MGSsEAsIBd3rOh40nE6mmk/lhTnIuqZsGG9oVYOPMLP2FqNHlQD8yVqi
	 MECIoxWZ1vBGbUAirsJ0zmTYhpbCm+6yBjmICY+p/lN0m54A/X/uO88RtdwCdCW+3c
	 xiD6x9VPr1xsEerwzK2KjMP0sDX3xlaUNmGWK7Iym3VuXeBt10HTwmHXqpONJKrH+o
	 hQiJ7PfwW8cqIALffxKyQkKyVUugb+GZulzdPdkMGC93fXB0l10A+XZfsaJm2rxSQ8
	 ATmxZgzfIPudOCifJZbgRxfyPMwL3uBu0fJXQ1HUNfUi/4X7QTsxdhSg+JW0zPjYJ0
	 PzxXME8zS7NjQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u7CZr-000000004BV-2UMw;
	Tue, 22 Apr 2025 14:18:16 +0200
Date: Tue, 22 Apr 2025 14:18:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <aAeJB4QGjdVPJIoa@hovoldconsulting.com>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-3-cristian.marussi@arm.com>
 <Z__UJUKaMRoFLYLc@hovoldconsulting.com>
 <Z__cuT5IW0Sbjqpg@pluto>
 <aAC_aPHD4Ik-DW0x@hovoldconsulting.com>
 <aADhoX4Rkx8Eu_er@pluto>
 <20250417-teal-sidewinder-of-courtesy-d0473d@sudeepholla>
 <aAdya5rephGNP_Tw@hovoldconsulting.com>
 <aAd-lIzIGxzxfWXC@pluto>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAd-lIzIGxzxfWXC@pluto>

On Tue, Apr 22, 2025 at 12:33:40PM +0100, Cristian Marussi wrote:
> On Tue, Apr 22, 2025 at 12:41:47PM +0200, Johan Hovold wrote:
> > On Thu, Apr 17, 2025 at 03:41:56PM +0100, Sudeep Holla wrote:
> > > On Thu, Apr 17, 2025 at 12:10:25PM +0100, Cristian Marussi wrote:
> > > > On Thu, Apr 17, 2025 at 10:44:24AM +0200, Johan Hovold wrote:

> > > > > of_machine_is_compatible() can be used to match on any compatible
> > > > > string, but not sure if that fits with your current implementation.
> > > 
> > > I was thinking about the same when I looked at the code. Using it is
> > > more elegant IMO.
> > 
> > It would be more flexible, even if you never intend to accept any quirks
> > that matches for an entire SoC.
> 
> I already have a V2 under test that will define a quirk using a
> __VA_ARGS__ so that you can specify a variable number of compats to
> match against the platform running using of_machine_compatible_match()

Sounds good.

> > My understanding is that the version has been bumped now albeit for
> > other reasons than fixing this particular bug. And since enabling FC for
> > these messages should be safe we will probably be able to match on
> > vendor/impl_version here.
> 
> So what is your latest Firmware version read ? no more 0x20000
> 
> [    0.116746] arm-scmi arm-scmi.0.auto: SCMI Protocol ?? 'Qualcom:' Firmware version ???????

It's still 0x20000 for this platform AFAIU, and that probably won't
change even if the fix for this particular bug makes it into the
firmware for the commercial devices.

Johan
