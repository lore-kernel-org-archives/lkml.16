Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE38C79E1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084159; cv=none; b=FmnbNZ5RrByPmUnC7vBInKAGME3tv+yL5reFr0ZWHewN4k6OXNBUxObCQdy5E2ufJWfhtdHI+d32A8bu2cK9+OiWrytIXKMQeYrqmAZ+fbn9lslJD5jZu1tOpjO+IWofSNgnxgRtjCMnNccMNCJOReOt5UVEHdbFB/ChubNPzdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084159; c=relaxed/simple;
	bh=sKQ238GbS7f7/akoLDLK81nfpnr+mS62SJhr7zsXEhA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hn6L7tn+bC30FI2BaeflhnJz/MZS0CbVmJzD/pYh0PU+WDZl2wxgx5Q1UwSB1/0epUIepd4uTLztQP33HFQtJvjkW1SvSSZ2B146O54aj0h6mgavKfwcpbHONCTiP4rcqBL2liYjWJwDRY5MKNBJbqNTZI7zAfbTMofzhACnMew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704B7C4CEDD;
	Thu, 27 Mar 2025 14:02:38 +0000 (UTC)
Date: Thu, 27 Mar 2025 10:03:26 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Libo Chen <libo.chen@oracle.com>
Cc: peterz@infradead.org, mgorman@techsingularity.net, longman@redhat.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com, tj@kernel.org
Subject: Re: [PATCH v2 2/2] sched/numa: Add tracepoint that tracks the
 skipping of numa balancing due to cpuset memory pinning
Message-ID: <20250327100326.439823ef@gandalf.local.home>
In-Reply-To: <73227d82-d641-4b95-9ad2-e156f655429e@oracle.com>
References: <20250327002352.203332-1-libo.chen@oracle.com>
	<20250327002352.203332-3-libo.chen@oracle.com>
	<bcba4d76-2c3f-4d11-baf0-02905db953dd@oracle.com>
	<20250326220620.60cec3b6@gandalf.local.home>
	<73227d82-d641-4b95-9ad2-e156f655429e@oracle.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Mar 2025 21:32:32 -0700
Libo Chen <libo.chen@oracle.com> wrote:

> On 3/26/25 19:06, Steven Rostedt wrote:
> > On Wed, 26 Mar 2025 17:40:02 -0700
> > Libo Chen <libo.chen@oracle.com> wrote:
> >   
> >>> +	TP_printk("comm=%s pid=%d tgid=%d ngid=%d mem_node_allowed_mask=%lx",    
> >>
> >>
> >> I cannot find a way to print out nodemask_t nicely here with %*pbl.
> >> So I fall back to just raw hex value. Will be grateful if someone
> >> knows a better way to print nodemask nicely in a tracepoint    
> > 
> > Ug.
> > 
> > I guess I need to add support for that. Both in the boot verifier as well
> > as in libtraceevent.
> >   
> 
> That will be fantastic, I think this is quite useful.

I'm curious to what was broken. Just the user space side? Or was the kernel
side broken too?

I notice that i2c_write has "[%*phD]" which means it worked, and also
skipped out on the verification tests. This should be fixed.

But trace-cmd and perf will not be able to print that out either.

Now %*pbl works in the kernel (not checked), but probably doesn't work for
trace-cmd.

-- Steve
