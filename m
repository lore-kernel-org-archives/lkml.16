Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFEF12FF69
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 03:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747019669; cv=none; b=lZsk5Qxb+A1RmPm3w13+iRk0ksfmsESLDzoPsMST3ann2cduopg/9sRT13NwPQ6ORYLHHxUGXNBov6OVmWhoql09A8zdj2TYQwocKeGC/BPHomNExTRP5CMhOGPONEyCtnLnp+piqJ2wEsvYCIcp63PrhsP85dTEhmiQjmaav7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747019669; c=relaxed/simple;
	bh=4mpSRFC0/eu0nwnwSjD+nRSM9tueDwUllL/+kSfSSjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D84k32E6HP+7Nm/EtgRdfE2lnUTO3feyNhnMqLAiRsOUVlcMgyzJM2IwzgHzLrdI9EkzafBSuRcdnIrvuCpaH/LCo4qEdy3RWopyqGD07180dNTx8Fj0lFthBAVV05ZVoEA8FZYdijyW3IvB7oVMsJd8xNkJ4EpSvUb8zrcL3nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=AGuMCG2F; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="AGuMCG2F"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747019663; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=UK5H6GFMQus8MuRNBerfdY5X8Y8UyPcPoIwyixkyfa8=;
	b=AGuMCG2FHGg7488GFEV5yv/CH6brfo+0ZEM6KhmJHoIXfv1YzdWxUJXjY5UgbRd215UqwID90STSpA+3ZrteJekaVBdEwLmqgY/B752At7WtPK0ultdm+J/221jGfOPjrw8l/j/KkyyESpIOubXwvgj/nMS0mtI+043pDwl0D9A=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WaCr82K_1747019663 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 12 May 2025 11:14:23 +0800
Date: Mon, 12 May 2025 11:14:22 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, linux-kernel@vger.kernel.org,
	mhiramat@kernel.org, llong@redhat.com
Subject: Re: [PATCH v1 0/3]  generalize panic_print's dump function to be
 used by other kernel parts
Message-ID: <aCFnjmRWwBjgV2Hv@U-2FWC9VHC-2323.local>
References: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
 <20250511184617.85d5fe22fde831c1edb8321c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250511184617.85d5fe22fde831c1edb8321c@linux-foundation.org>

Hi Andrew,

Thanks for the review!

On Sun, May 11, 2025 at 06:46:17PM -0700, Andrew Morton wrote:
> On Sun, 11 May 2025 16:52:51 +0800 Feng Tang <feng.tang@linux.alibaba.com> wrote:
> 
> > When working on kernel stability issues, panic, task-hung and 
> > software/hardware lockup are frequently met. And to debug them, user
> > may need lots of system information at that time, like task call stacks,
> > lock info, memory info etc. 
> > 
> > panic case already has panic_print_sys_info() for this purpose, and has
> > a 'panic_print' bitmask to control what kinds of information is needed,
> > which is also helpful to debug other task-hung and lockup cases.
> > 
> > So this patchset extract the function out, and make it usable for other
> > cases which also need system info for debugging. 
> > 
> > Locally these have been used in our bug chasing for stablility issues
> > and was helpful.
> 
> Truth.  Our responses to panics, oopses, WARNs, BUGs, OOMs etc seem
> quite poorly organized.  Some effort to clean up (and document!) all of
> this sounds good.
> 
> My vote is to permit the display of every scrap of information we can
> think of in all situations.  And then to permit users to select which of
> that information is to be displayed under each situation.

Good point! Maybe one future todo is to add a gloabl system info dump
function with ONE global knob for selecting different kinds of information,
which could be embedded into some cases you mentioned above.

> As for this patchset - sounds good to me.  For now I'll await input
> from reviewers.

Thank you!

- Feng
