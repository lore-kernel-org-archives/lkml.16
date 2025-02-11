Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114A12505A2;
	Tue, 11 Feb 2025 15:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288255; cv=none; b=h55wDlbQg3hruo2xY520ioPBHBLEFS4dOsQgliiaYXyddndY4tkQfIsVz9reWFlPGK9rGtvL9S3P6CCEGKBLrmsq+L4JyaX4w/X9i2Z3owB6FExlKiqJi0Ols2rLrSA15Q7f9uqBNBKhgi7jLIcSyxGTqayw4TAgn1ZXT2hWv6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288255; c=relaxed/simple;
	bh=T+bps5vHX+0/4CMQQbLbDVeyrf17Yn8s0JKweDkIYZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2jPAdmvoGKVuPZevbHiy+OEEWJU+yOuJ5ZqERfQonQC5NJwSSVp20bvqQUTAIlR9+eLjvrG1UW/Kwo4mpP5RYHRCQ1VQmgO75SH4knTFDxMlbNv5b5p5HpkzFDvmCcD93ne8sUSZvlTW3csFwn063r6mHNJxfwnG9YEgwm9j3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6793A13D5;
	Tue, 11 Feb 2025 07:37:53 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2AF43F5A1;
	Tue, 11 Feb 2025 07:37:30 -0800 (PST)
Date: Tue, 11 Feb 2025 15:37:27 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: jack21 <jackhuang021@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	Huangjie <huangjie1663@phytium.com.cn>
Subject: Re: [PATCH] dirvers: scmi: poll again when transfer reach timeout
Message-ID: <Z6tutxs2UE7vjjJ6@bogus>
References: <20250123083323.2363749-1-jackhuang021@gmail.com>
 <f0fbc4cf-21ae-4332-8842-73f0467d16ff@stanley.mountain>
 <Z5KdJa0QOIYIIRv4@pluto>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5KdJa0QOIYIIRv4@pluto>

On Thu, Jan 23, 2025 at 07:48:53PM +0000, Cristian Marussi wrote:
> On Thu, Jan 23, 2025 at 01:38:30PM +0300, Dan Carpenter wrote:
> > s/dirvers/drivers/
> > 
> > On Thu, Jan 23, 2025 at 04:33:24PM +0800, jack21 wrote:
> > > From: Huangjie <huangjie1663@phytium.com.cn>
> > > 
> > > spin_until_cond() not really hold a spin lock, possible timeout may occur
> > > in preemption kernel when preempted after spin_until_cond().
> > > 
> > > We check status again when reach timeout is reached to prevent incorrect
> > > jugement of timeout.
> > > 
> 
> Hi,
> 
> probably another not so short email of mine :P ... 
> 
> > 
> > I suspect the real issue is that we exit the spin loop when
> > try_wait_for_completion(&xfer->done) is true.  Probably we should add
> > that as a Fixes tag?:
> > 
> 
> The Kernel SCMI stack, acting as an SCMI agent have to cope with the
> possible (even though rare) scenario of receiving Out of Order messages
> when dealing with async commands...
> 
> ...IOW, what to do if, after having issued an AsycnCmd, the Delayed response
> is received BEFORE the corresponding immediate reply to the initial request:
> such a wicked (and rare) situation could be the result of a misbehaving
> platform server OR simply due to parallellization of activies on the A2P
> and P2A on some transports, i.e. platform sent reply and delayed_response
> in the correct order but the transport delivered those OoO, being
> transmitted on 2 discinct physical  channels...hard but not impossible.
> 
> Kernel side we address this OoO scenario by assuming that, if a valid
> Delayed Response to a in-flight Async-cmd is received on teh P2A chan,
> before the immediate A2P reply, the transaction itself is good and we
> can progress by just logging and ignoring/swallowing the missing
> immediate-reply, that will probably arrive later, and just carry on
> processing the Delayed Response.
> 
> In order to do that, we maintain, in fact, a per-message state-machine,
> and inside scmi_msg_response_validate(), when we detect the OoO condition,
> we cause the wait-for-immediate-reply to terminate by issuing forcibly a
> complete(xfer->done)....
> 
> ...this works straight away for the non-polled IRQ transactions since
> causes the wait_for_completion() to terminate cleanly, BUT in order to
> cut-short also the busy-wait in the polling case we need that additional
> try_wait_for_completion()....so as not to spin forever for a message
> that we dont care anymore...
> [ note that any late arriving immediate-reply will be in teh future
>  discarded at this point]
> 
> For this reason, I think that this patch, while correctly checking the
> poll_done() condition when the spinloop terminates for the reason
> explained in the commit-message, it should also check if the loop was not
> instead forcibly terminated by the OoO scenario...if not, we will end up
> considering the polling to have timeout, while instead it was forcibly
> terminated by the OoO state machine complete() and just want to ignore
> such missing message...
> 
> So what about instead of checking (untested):
> 
> +	if (!completion_done(&xfer->done) &&
> +	    !info->desc->ops->poll_done(cinfo, xfer))

Were you able to check this ? I am waiting to hear back from you on this.

-- 
Regards,
Sudeep
