Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCAB23741;
	Tue, 24 Jun 2025 14:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775287; cv=none; b=j9WG4vON15GPI0XtYOIj4RRTfMQ9nT3eZ3Jl6mf2kOLDYT16P1xko9VEdND0VI3YQaNaD95DM1aEODaPbSwZoi8ETf9VPEUf+/exhPPaW1ShRVEUWKDg8PL7mPWySfKND/2AK5nUKOf436byEC36QP6En4xMffxLDlqrHCMiUDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775287; c=relaxed/simple;
	bh=Y+hz6pOWMqXMvYs2L7W3FOPGg3Z5NPFgIsnld4FIlO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QH/7wzRCXtAXm8r5ERvFB29lp6RBGOtC8F03XOnUbnFCNykd6fEEhE+YyLb6VhMxn9h+oQlbbL/T8RVhyHOooh+ai+YyeoyHQJPZAEEZ6T6RLiBSnbJfVZJ85HZYaa1Mfv9VMu0Nd5AQbqXgC1QT1i1DjKsBEtz65ViGPHVrLgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2317113E;
	Tue, 24 Jun 2025 07:27:46 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A8B13F58B;
	Tue, 24 Jun 2025 07:28:03 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:27:56 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Su Hui <suhui@nfschina.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, tony.luck@intel.com,
	reinette.chatre@intel.com, james.morse@arm.com,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fs/resctrl: using guard to simplify lock/unlock code
Message-ID: <aFq12y2R/KV4UKyT@e133380.arm.com>
References: <aFlvTt+GGSIqgOKH@e133380.arm.com>
 <cf505dc6-c123-44fd-9ee6-5aac4764f905@nfschina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf505dc6-c123-44fd-9ee6-5aac4764f905@nfschina.com>

Hi,

On Tue, Jun 24, 2025 at 10:46:24AM +0800, Su Hui wrote:
> On 2025/6/23 23:14, Dave Martin wrote:
> > Hi,
> > 
> > On Mon, Jun 23, 2025 at 07:25:41PM +0800, Su Hui wrote:
> > > Using guard() to replace *unlock* label. guard() is better than goto
> > > unlock patterns and is more concise. No functional changes.
> > > 
> > > Signed-off-by: Su Hui <suhui@nfschina.com>
> > How were these cases chosen?
> I chosen the code  that match with "*unlock*:" label.

Right -- that was what I guessed, but thanks for confirming.

> > 
> > I notice that this patch only handles some straightforward mutex_unlock()
> > cases.  There are other opportunities in some places -- particularly
> > alloc/free patterns.
> Yes, as Dan mentioned[1], there are too many these patterns and I'm not sure
> how
> much value we can get to do this things. This patch is a try that using
> guard() to
> remove some  lock/unlock pattern and simplify the lock code.

Agreed.  guard() is not a bad thing, but it's probably easier to use it
cleanly when writing new code.  Backporting it into existing code might
be worthwhile it it clearly makes the code simpler or fixes bugs, but
these cases in resctrl feel like they don't bring a lot of benefit.

> > Overall, I'm not totally convinced that backporting the guard()
> > infrastructure into code that wasn't originally written to use it is
> > always worthwhile.
> > 
> > If the code is simple, there is not much benefit.  Otherwise, there is
> > a significant chance of unintentionally changing the behaviour of the
> > code (though the exercise may be useful if it identifies actual bugs).
> > 
> > Either way, such changes will get in the way of people who are rebasing
> > on top of this code.
> Got it, it's ok to omit this patch. It seems this patch has not enough
> value.
> > FWIW, this patch looks OK though, and the diffstat looks reasonable.
> > Since this code was recently moved into fs/, diff context noise may be
> > less of a concern.
> Maybe only for some complex lock/unlock code, guard() can bring some value.
> Thanks for your advice!
> 
> [1] https://lore.kernel.org/all/d07fe2d9-3548-43fc-b430-2947eee3145b@suswa.mountain/
> 
> Regards,
> Su Hui
> 
Fair enough.  Considering how guard() _might_ be used can be a useful
exercise, even if the changes are not adopted everywhere.

Cheers
---Dave
> 
> 
