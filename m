Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40F725B67C;
	Wed,  9 Apr 2025 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197141; cv=none; b=rqoLS75663/czsYGNtFlpqKldMp8fIgXuE6vjVm8REaOLiL8wSaE1x1vcszhFe015VkyotN5ni8GH2FcMqoGnlAS72jWTa7CjR5kRzIalbsrgibP6XRI39hPgq+36PwQY4rWTL6hfLTRLl45Vd9GIVFN49s2rsG6E9xq77AaIm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197141; c=relaxed/simple;
	bh=DbCo3zQBVGhLx2s27nDfxKdE++jQWAc8ZqVNI5Xdrdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTxZbpOsRMtOgL8PvUXwjhUA1rMAlJhpBGZySAbwjQwilEAT067S90PpQ+ObczVTZqzEFaRJ2xLvJrA6eqOOe0dNz3gmbab2rVfm5vF4Do6jdZYkCsPY7ROpOu+nPr0oQXviIkiZXDgOw4QyOz76n28C1v4ecK9pz6BnDmu06PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B186B1595;
	Wed,  9 Apr 2025 04:12:18 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C69193F694;
	Wed,  9 Apr 2025 04:12:16 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:12:13 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Matthew Bystrin" <dev.mbstr@gmail.com>
Cc: "Cristian Marussi" <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <arm-scmi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	"Philipp Zabel" <p.zabel@pengutronix.de>,
	"Peng Fan" <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Message-ID: <20250409-fierce-astonishing-bug-dd2adb@sudeepholla>
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
 <Z-1gY8mQLznSg5Na@pluto>
 <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>

On Thu, Apr 03, 2025 at 10:50:17PM +0300, Matthew Bystrin wrote:
> Hi Sudeep, Cristian,
> 
> Thanks for having a look on the patch.
> 
> Cristian Marussi, Apr 02, 2025 at 19:05:
> > > Please post this patch along with the vendor specific protocols mentioned
> > > above and with the reasoning as why 2s is not sufficient.
> >
> > Ack on this, it would be good to understand why a huge 2 secs is not
> > enough...and also...
> 
> I've been working on firmware update using SCMI vendor/platform-specific
> extension on FPGA prototype, so not posted it initially. I'm open to share the
> details if needed, but need some extra time for preparations. For now I'm
> posting a brief description of the extension. It has 2 commands:
> 
> - Obtain firmware version number.
> - Update firmware. Firmware image is placed into shared physically contiguous
>   memory, Agent sends to platform micro controller (PuC) physical address and
>   size of the update image to start update procedure. After update is completed
>   (successfully or not) PuC sends delayed response.
> 
> 	Agent ----     start update         ---> Platform uC
> 	Agent <--- update procedure started ---- Platform uC
> 	...
> 	Agent <--- (async) update completed ---- Platform uC
> 
> I've faced timeout problem with the async completion response. And update can't
> be done faster than 10s due to SPI flash write speed limit.
> 

Understood.

> Why not to use notifications?
> 
> First of all, semantics. IIUC notifications can be sent by PuC in any time. This
> is not suitable for updates, because procedure is initiated by an agent, not by
> a platform.
> 

The start update should retain as soon as Platform uC acks the request.
And 2 notifications can be sent out for update procedure started and
completed. I don't see any issue there. What is the semantics you are
talking about ?

> Secondly, code implementing  notification waiting duplicates delayed response
> code. I had implemented it as a proof-of-concept before I prepared this patch.
> 

Even delayed response as some timeout so I would rather prefer to use
notifications in your usecase as it is completely async.

> > > Also instead of churning up existing users/usage, we can explore to had
> > > one with this timeout as alternative if you present and convince the
> > > validity of your use-case and the associated timing requirement.
> > > 
> >
> > ...with the proposed patch (and any kind of alternative API proposed
> > by Sudeep) the delayed response timeout becomes a parameter of the method
> > do_xfer_with_response() and so, as a consequence, this timoeut becomes
> > effectively configurable per-transaction, while usually a timeout is
> > commonly configurable per-channel,
> 
> Totally agree, usually it is. And that's why I didn't change do_xfer() call.
> Here is the thing I want to pay attention to.
> 
> Let's focus on delayed responses. I think delayed response timeout should not be
> defined by transport but rather should be defined by _function_ PuC providing.
> And of course platform and transport could influence on the timeout value.
> 

I think in your case, it is not even transport specific. It is more operation
specific and hence I prefer notifications.

> > so valid as a whole for any protocol
> > on that channel across the whole platform, AND optionally describable as
> > different from the default standard value via DT props (like max-rx-timeout).
> >
> > Is this what we want ? (a per-transaction configurable timeout ?)
> >
> > If not, it could be an option to make instead this a per-channel optional
> > new DT described property so that you can configure globally a different
> > delayed timeout.
> 
> Taking into account my previous comment, I don't think that having a per-channel
> timeout for delayed response would solve the problem in the right way. What
> about having a per-protocol timeout at least?
> 

Yes neither per-transport nor per-protocol timeout will suffice in your case.
This 10s timeout is specific to the update operation and hence use
notification. All other solution is just workarounds not generic solution.

-- 
Regards,
Sudeep
