Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECD91B0430;
	Mon, 14 Apr 2025 08:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744619920; cv=none; b=O6VL3YxFruPF96VWgrNK8iQDPry+ymDPxwtlzGAxRk4NoUwyxOkBc0HU4P5zz21WnEyKqXGI9qT6flht0I0l3oPsbe8ftDS1bSpRj6snE++VB/8x9jUDPKG0JV54i1FBjZUM86jR0RaLfmPsb6aWRbDcBJgz5JLQdFmltUsx8dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744619920; c=relaxed/simple;
	bh=m1kBBv14YQFegLy/jMqGac/IxtO6hAn6QRq+9k2CLxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgrO2Kn9GDPA4pYxKNVh9hHdUiXyQZbyLhzsj4ShtghIhjFiIKWPREFTQFey27+CUeYER7lRxElco+CQmJ0jK/LQfBtZEI+Pvjibr/7iEn3heyeaUEB/xn5kzzym/LySQ1T8bq+QLHA16W+OOSyHbzXnOpQk1AdmyJ608191i5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CADEA1007;
	Mon, 14 Apr 2025 01:38:35 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96F8B3F694;
	Mon, 14 Apr 2025 01:38:35 -0700 (PDT)
Date: Mon, 14 Apr 2025 09:38:23 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Matthew Bystrin <dev.mbstr@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Message-ID: <Z_zJbRH7vQ0TswGg@pluto>
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
 <Z-1gY8mQLznSg5Na@pluto>
 <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
 <20250409-fierce-astonishing-bug-dd2adb@sudeepholla>
 <D94LGXDHGVBD.1GB1GHOWORHMU@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D94LGXDHGVBD.1GB1GHOWORHMU@gmail.com>

On Sat, Apr 12, 2025 at 01:39:45PM +0300, Matthew Bystrin wrote:
> Sudeep,
> 

Hi Matthew,

> Thanks for taking your time.
> 
> Sudeep Holla, Apr 09, 2025 at 14:12:
> > The start update should retain as soon as Platform uC acks the request.
> > And 2 notifications can be sent out for update procedure started and
> > completed. I don't see any issue there. What is the semantics you are
> > talking about ?
> 
> I'm going to refer to section 4.1.1 from the spec, where stated following about
> delayed responses,
> 
> "Messages sent to indicate completion of the work that is associated with an
> asynchronous command" 
> 
> Compared to notifications,
> 
> "These messages provide notifications of events taking place in the platform.
> Events might include changes in power state, performance state, or other
> platform status"
> 
> So before I implemented mentioned driver I had red this two and had chosen
> delayed responses, because it had seemed more appropriate. Details below.
> 
> > Even delayed response as some timeout so I would rather prefer to use
> > notifications
> 
> Hmm, I see.
> 
> > in your usecase as it is completely async.
> 
> Just to emphasize, according to the spec I don't think that delayed responses
> and events have different degree of asynchrony. The difference is in the
> initiator of 'messaging'. Events are sent by platform to indicate its' state and
> delayed responses are sent to indicate status of previously requested operation.
> 

Delayed reponses are certainly better than notification for completion
of agent initiated actions BUT this does not exclude the usage instead
of a sync-command to start the operation and a notification to signal
its completion...depends really on the case.

The classic example of a needed async-cmd is reading a sensor that takes
a long time due to its own physical nature...

AFAIU, in this case you have an async operation whose completion time is
considerably longer (so you aim to configure a specific timeout for that
specific command) BUT it is also bound to the payload itself that you
are trying to load AND/OR to other platform specific HW charactristics
(like how slow are your flashes in this HW releases...): this means that
while the sensor slowness is stable and predictable, and the timeout can
be fixed a-priori, in this case you risk to have in the future anyway to
have to refine and tune this ad-hoc custom timeout....while you'd have
none of this issue by simply waiting for a notification (ofc you could
have to set a large timeout on your side anyway while waiting for
notifs...)

...unless you plan to dynamically tune the async-cmd timeout at runtime
based on the known payload size (that means more commands to query the
soon-to-be-flahsed payload) but anyway this does NOT solve the fact that
the platform characteristics can influence the length of the operation.

Thanks,
Cristian
