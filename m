Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031D01E9B04
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744830358; cv=none; b=abJQpZ42yrDmvgrs60ncUvXSxP9SsEmh+EX4SlhnL6V9PEZcozt5+xGFedCSaIzjXvneTPlKW1PyyQa3gVmU+FLSiH8N34eNBuYHHxRPuwQ3Yi0SAFVrAxHQEQSS8Uqs+YfrBWmVKP7DLeIXZcW7lF3yHFtSWGz5C2lWYUAldO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744830358; c=relaxed/simple;
	bh=qyd67BAKaYWZUDvANErh2i3XImfJJeyQJRp9yFHD+SY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nEIc1amLMppAAdV/2nckTohO2iAgEX3Sgdv7p32sjYQl2TRnCIqvTQUuSuggDVHa4onO420fwwLpWoT4BuSV6HYQHU7l18Dx+Bpxxh93tHHYOCoB85MRYxO9rMOTePpUltDM9CzNCIgCUUK9ZZOHKaLseUOH8T+et2L69RVrfQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7225C4CEE2;
	Wed, 16 Apr 2025 19:05:55 +0000 (UTC)
Date: Wed, 16 Apr 2025 15:07:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [mainline]Kernel crash while running ftrace selftest
Message-ID: <20250416150732.131ac838@gandalf.local.home>
In-Reply-To: <aeeb5e4e-7dd0-41a9-85d6-8fd415746595@linux.ibm.com>
References: <1db64a42-626d-4b3a-be08-c65e47333ce2@linux.ibm.com>
	<20250416110253.62056f4f@batman.local.home>
	<aeeb5e4e-7dd0-41a9-85d6-8fd415746595@linux.ibm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Apr 2025 22:36:11 +0530
Venkat Rao Bagalkote <venkat88@linux.ibm.com> wrote:

> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index a8a02868b435..777574fa3095 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> > @@ -3625,8 +3625,8 @@ static int rebuild_hashes(struct ftrace_hash **filter_hash, struct ftrace_hash *
> >    */
> >   int ftrace_shutdown_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, int command)
> >   {
> > -	struct ftrace_hash *filter_hash;
> > -	struct ftrace_hash *notrace_hash;
> > +	struct ftrace_hash *filter_hash = EMPTY_HASH;
> > +	struct ftrace_hash *notrace_hash = EMPTY_HASH;
> >   	int ret;
> >   
> >   	if (unlikely(ftrace_disabled))  
> 
> 
> Hello Steve,
> 
> Issue still persists with the above patch.
> 

Damn!

I know you are testing PPC but can you send me your config. I can't
reproduce it on x86, but it could be some tracing options you have enable
or disabled that I don't.

Thanks,

-- Steve
