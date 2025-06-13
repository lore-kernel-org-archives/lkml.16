Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E5F238C06
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749807815; cv=none; b=dLcgRCeeJYfca3Ra4rK5lPPOGPqvTsiPg6JeTNMev9HRLaTXBgqPWbHEL2+FDKwhhss+C0/T2gAEvY0/MRouJA7xLW67Z4ImEvTwJ+qbIoU3KVFxDjdbpZ/AqHXqOzV1BKTaa/flfcAMttrWOyA8FvSuRM88vgHooAKbW22wxOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749807815; c=relaxed/simple;
	bh=KDmI3SzjPp2KgOWUtFfz6WBnZsJ1KnGOl71hkWybfyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ct5lnc/C+Vup6FvG7I7c6j8mXnAIc6rdTDUpRaWtAZ8lu28fy1aRl66OXocb9D8uDOzTINpex6QFNQKdqwTGglo7cY3sPWoJTVNzfuGNzif9iBlsAthhbkVsD8qBRKcVnrPN6yKwZT3TdLQnvXqWI5h3nd/xSsxcr2yjDDDP5yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=adYjx3+i; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="adYjx3+i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RXBjLERF3nlmhC8SMKLj3/cxfoD2dWEsI3qpLnYVqKY=; b=adYjx3+iU9FSzQn/t8PomDO7Pb
	PmOJKa+q7gnJrky/9g0qgG52pH0PguGDTzXpv2kHbnoL4ZTc/UhYAHbjgaTXJwgAAYQ/vJdm53AuB
	oxXwFVUV56p9N725WfTuqdnVRDs2MlqHoF7NdN6be6qpGgXzxobyyBUWtQ8K5Kycpm4066Ui98sjV
	YEW3aeqADhASvaiJO8oXbnnx9RMev+0IWv3etPZ23oef9kLnU6matICzQARBNid62USHcjNVwmTuj
	DgpIucvsAiOBk/KhLXQmzeyvYb87NAb+GQY/sxGXX8UNz25WkyGQZ3ohIA1Q0zMasGNe07VQ7GjVb
	xvj4L8aA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0wa-0000000Cncv-3Yla;
	Fri, 13 Jun 2025 09:43:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 673E730617F; Fri, 13 Jun 2025 11:43:28 +0200 (CEST)
Date: Fri, 13 Jun 2025 11:43:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: mingo@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, clm@meta.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 1/5] sched/deadline: Less agressive dl_server
 handling
Message-ID: <20250613094328.GG2278213@noisy.programming.kicks-ass.net>
References: <20250520094538.086709102@infradead.org>
 <20250520101727.507378961@infradead.org>
 <aD8cwJGQz6iCjhwz@jlelli-thinkpadt14gen4.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD8cwJGQz6iCjhwz@jlelli-thinkpadt14gen4.remote.csb>

On Tue, Jun 03, 2025 at 06:03:12PM +0200, Juri Lelli wrote:
> Hi,
> 

> > @@ -1684,6 +1689,24 @@ void dl_server_stop(struct sched_dl_enti
> >  	dl_se->dl_server_active = 0;
> >  }
> >  
> > +static bool dl_server_stopped(struct sched_dl_entity *dl_se)
> > +{
> > +	if (!dl_se->dl_server_active)
> > +		return false;
> > +
> > +	if (dl_se->dl_server_idle) {
> > +		__dl_server_stop(dl_se);
> > +		return true;
> > +	}
> > +
> > +	dl_se->dl_server_idle = 1;
> > +	return false;
> > +}
> > +
> > +void dl_server_stop(struct sched_dl_entity *dl_se)
> > +{
> > +}
> 
> What if we explicitly set the server to idle (instead of ignoring the
> stop) where this gets called in dequeue_entities()?

That would break thing; we want to detect if it was ever !idle in the
period.

> Also, don't we need to actually stop the server if we are changing its
> parameters from sched_fair_server_write()?

Quite - let me just remove the offending callsites them.

Would this explain this massive regression 0day reported here? Seems
weird.

Anyway, let me go update the patch.
