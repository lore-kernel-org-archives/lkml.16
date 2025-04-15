Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FA2190462;
	Tue, 15 Apr 2025 13:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725348; cv=none; b=GaNG868/Rp1lXQhReVU7jJAL6GDPFVWCJPSYPcsnUPygiFfxdK99PDcoopU/7r1DkMEZfxCCC9WNtFHzMmAvMfHNwDSnMeUq21gHJxd2GbJypNB3hvLuaa8BtrR4GHCpv571mvBmpdHdYAPVqYRamlMGxYvhSJeEHpYwHFAthc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725348; c=relaxed/simple;
	bh=8Pwn/PrH1AUchwBpOFvjOyYrEJ+1hQ8GwcrfYgMZPAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpLBwN7tu2ob9RiU1xVSAuH969XjQznXmhn/8ZrvgKEi/ZQy6opedprh6bd34FIe6V5sqX4EDaKzLsfIsoIiR/dX+UEiKRh8cNbRJaDJa/qAh6jKewpawNNitJOFqAkh5rIsXxHI3F7WO2pCbN4QdiAHwHn8hzHtQgFlvUGU7fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5498115A1;
	Tue, 15 Apr 2025 06:55:43 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C62813F694;
	Tue, 15 Apr 2025 06:55:42 -0700 (PDT)
Date: Tue, 15 Apr 2025 14:55:33 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [RFC PATCH 0/3] Introduce SCMI Quirks framework
Message-ID: <Z_5lJA74OugEbB-S@pluto>
References: <20250401122545.1941755-1-cristian.marussi@arm.com>
 <Z-_dMev0v6P4UJ_i@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-_dMev0v6P4UJ_i@hovoldconsulting.com>

On Fri, Apr 04, 2025 at 03:22:57PM +0200, Johan Hovold wrote:
> Hi Cristian,
> 
> On Tue, Apr 01, 2025 at 01:25:42PM +0100, Cristian Marussi wrote:
> 
> > with the increasing adoption of SCMI across arm64 ecosystems, we have to
> > start considering how to deal and take care of out-of-spec SCMI firmware
> > platforms that are actively deployed in the wild, in a consistent manner.
> > 
> > This small series introduces a simple framework, based on static_keys,
> > that allows a user to:
> > 
> > - define a quirk and its matching conditions; quirks can match based on:
> > 
> >   	compatible / Vendor_ID / Sub_Vendor_ID / ImplVersion
> > 
> >   from the longest matching sequence down to the shortest.
> > 
> >   When the SCMI core stack boots it will enable the matching quirks
> >   depending on the information gathered from the platform via Base
> >   protocol: any NULL/0 match condition is ignored during matching and is
> >   interpreted as ANY, so you can decide to match on a very specific
> >   combination of compatibles and FW versions OR simply on a compatible.
> > 
> > - define a quirk code-block: simply a block of code, meant to play the
> >   magic quirk trick, defined in the proximity of where it will be used
> >   and gated by an implicit quirk static-key associated with the defined
> >   quirk
> 
> > Any feedback and testing is very much welcome.
> 
> I'm hitting the below lockdep splat when running with this series and
> the FC quirk enabled.
> 
> Johan
> 
> 
> [    8.399581] ======================================================
> [    8.399582] WARNING: possible circular locking dependency detected
> [    8.399583] 6.14.0 #103 Not tainted
> [    8.399584] ------------------------------------------------------
> [    8.399584] kworker/u49:5/165 is trying to acquire lock:
> [    8.399586] ffff65d004d36320 (&info->protocols_mtx){+.+.}-{4:4}, at: scmi_get_protocol_instance+0x4c/0x5c0
> [    8.399596] 
>                but task is already holding lock:
> [    8.399596] ffff65d00a895348 (&ni->pending_mtx){+.+.}-{4:4}, at: __scmi_event_handler_get_ops+0x70/0x47c
> [    8.399600] 
>                which lock already depends on the new lock.
> 
> [    8.399601] 
>                the existing dependency chain (in reverse order) is:
> [    8.399601] 
>                -> #4 (&ni->pending_mtx){+.+.}-{4:4}:

Hi Johan,

I have reproduced this when running with LOCKDEP and quirks enabled:
it was due to the fact that static_branch_enable() takes a cpu_lock
internally and I was triggering all of this from Base protocol init
which takes a number of other mutexes...

I moved SCMI quirk initialiation after Base protocol initialization
in scmi_probe and it is gone...and indeed was not needed anyway so
early.

I'll post a new V1 for quirks in a short while including this change.

Thanks,
Cristian
