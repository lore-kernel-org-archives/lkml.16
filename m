Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301942853FA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291632; cv=none; b=WxZF4CymXaDNByydWlJ2/mN1IZ9Q+RTmTHcJvgvjV/6Pf5IEDlI9hYAQJ2t5h/hWBiF7fMXL/VQlSOYQmAmgxRX/HqgOLK9w1DtM4Y5FTEi8h3Y1NHhiC4YZUB+ZKghiOdEIR+P9cuM9Ls6bxPNDTKeVp4lS8ehV2YiA3q+Svjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291632; c=relaxed/simple;
	bh=3gPfsEXtcRb/g3NXNMRegFnbtp1ZB4qYMxP7JSx39YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGBL98goCxYfVBa6NafSMHJco2EfHcQAC2goBwPtHKZBkvqlxtbANwjyrNCoJqPnBhErYQSkX0ke9QX04dlboyFYcEg6M0YIy1D4+obzwkI3gd0+1F1rL3eR7naJs6pDQK9HSAyopFTl4UaetmZrk1vh9AcvgGXhagQY22REGRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJYwGj1D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJYwGj1D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43820C4CEDD;
	Thu, 10 Apr 2025 13:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744291631;
	bh=3gPfsEXtcRb/g3NXNMRegFnbtp1ZB4qYMxP7JSx39YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJYwGj1Dm3McX0ECCISJLFD1dSHF40isk5OWzxQOYfBlODk553AVJAna7I3h0YDoW
	 L/pFMhyFSHm4FfprhT91HSttTHz//EU2HHHlFOF/mwluuAhCj8mWkfZxzsIqWUwZgB
	 OskGCi7r2TI0e0awqdV8xLupCnq+qYgHUs/uTzPKfaejgKDUny8U34dRGFIxqoqK4p
	 iuZlZApfKY3H+4723azGkpF/Q2XA5w9+F5xFcIYKQcJQ+AudGrqGgtVm+HfTnic525
	 yaSX8QhcFtqulEkMkFR+4L6n+0QZetyknVLQ096MgVqtX/Vx0vtyvv1sHo1hwpDvQM
	 hCpiSSspEyZ7A==
Date: Thu, 10 Apr 2025 15:27:08 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
Message-ID: <Z_fHLM4nWP5XVGBU@localhost.localdomain>
References: <20250410065446.57304-2-gmonaco@redhat.com>
 <87ecy0tob1.ffs@tglx>
 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
 <Z_fBq2AQjzyg8m5w@localhost.localdomain>
 <87wmbsrwca.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wmbsrwca.ffs@tglx>

Le Thu, Apr 10, 2025 at 03:15:49PM +0200, Thomas Gleixner a écrit :
> On Thu, Apr 10 2025 at 15:03, Frederic Weisbecker wrote:
> > Le Thu, Apr 10, 2025 at 12:38:25PM +0200, Gabriele Monaco a écrit :
> > Speaking of, those are two different issues here:
> >
> > * nohz_full CPUs are handled just like idle CPUs. Once the tick is stopped,
> >   the global timers are handled by other CPUs (housekeeping). There is always
> >   one housekeeping CPU that never goes idle.
> >   One subtle thing though: if the nohz_full CPU fires a tick, because there
> >   is a local timer to be handled for example, it will also possibly handle
> >   some global timers along the way. If it happens to be a problem, it should
> >   be easy to resolve.
> >
> > * Domain isolated CPUs are treated just like other CPUs. But there is not
> >   always a housekeeping CPU around. And no guarantee that there is always
> >   a non-idle CPU to take care of global timers.
> 
> That's an insianity.

It works, but it doesn't make much sense arguably.

> 
> >> Thinking about it now, since global timers /can/ start on isolated
> >> cores, that makes them quite different from offline ones and probably
> >> considering them the same is just not the right thing to do..
> >> 
> >> I'm going to have a deeper thought about this whole approach, perhaps
> >> something simpler just preventing migration in that one direction would
> >> suffice.
> >
> > I think we can use your solution, which involves isolating the CPU from tmigr
> > hierarchy. And also always queue global timers to non-isolated targets.
> 
> Why do we have to inflict extra complexity into the timer enqueue path
> instead of preventing the migration to, but not the migration from
> isolated CPUs?

But how do we handle global timers that have been initialized and queued from
isolated CPUs?

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
