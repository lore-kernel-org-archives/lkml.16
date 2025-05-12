Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD2EA934
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747042639; cv=none; b=C69ZcfzaU8+cnzIjFis9wYLH4IbVcDmPoyt0sXCWLGMoh6c/cvOUVN7e1AparywwHhxKO4IvrsTh4Fynh9mApkRMfaDUb9zsyfOWL2vkkNUKNeBq+JWBzT5R/eAGjH1phrrHjtwPkKqCjaow/khrFL0Fv4cg1gJlARJGEkZMpt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747042639; c=relaxed/simple;
	bh=m0AzemlCVposxD/c6AnWJV4VTDs9rmHM2mIyXwX3WN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxagdG++ldMbFA6hg4obwaQ+tYndQIPmmG4Pk1SO0LBrm0td4IczMZi5anJu3Yj/9pV1tIyzoSEF1uiyWmRqM5AE3ou5TEgXl6zzS2UUteq6cyKDmepIctqNWWNJYJZbrw3zyZAnFC5uWP9stb8ZvHLodIh6HDH6oe39VpkG8CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=JCzhHIjp; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="JCzhHIjp"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747042627; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=4vjfopWyqLn6FdBYlkTgXwuwbSpEHmIfc3wqa7UrOSQ=;
	b=JCzhHIjpcTOiImQLeA4NVf4GzJkxb3vLC7/enrOgDpelwgHSSidFgtn183nfsbP9QUWGOCF9ETevjcW/rJ/gQkjV61r5SzSr3rNrHS2qbI/tofHnjxX6iVh1pXEeinGSvylmwTLyxdtz8HlT3Cf7Z2afwjhNTalgKoOoivTZ70M=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WaH38C1_1747042309 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 12 May 2025 17:31:50 +0800
Date: Mon, 12 May 2025 17:31:49 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	mhiramat@kernel.org, llong@redhat.com
Subject: Re: [PATCH v1 0/3] generalize panic_print's dump function to be used
 by other kernel parts
Message-ID: <aCHABVT4g75G3l1k@U-2FWC9VHC-2323.local>
References: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
 <20250511184617.85d5fe22fde831c1edb8321c@linux-foundation.org>
 <aCFnjmRWwBjgV2Hv@U-2FWC9VHC-2323.local>
 <1a5bc420-c716-4d0b-b767-32adf32f4958@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1a5bc420-c716-4d0b-b767-32adf32f4958@linux.dev>

On Mon, May 12, 2025 at 04:23:30PM +0800, Lance Yang wrote:
> 
> 
> On 2025/5/12 11:14, Feng Tang wrote:
> > Hi Andrew,
> > 
> > Thanks for the review!
> > 
> > On Sun, May 11, 2025 at 06:46:17PM -0700, Andrew Morton wrote:
> > > On Sun, 11 May 2025 16:52:51 +0800 Feng Tang <feng.tang@linux.alibaba.com> wrote:
> > > 
> > > > When working on kernel stability issues, panic, task-hung and
> > > > software/hardware lockup are frequently met. And to debug them, user
> > > > may need lots of system information at that time, like task call stacks,
> > > > lock info, memory info etc.
> > > > 
> > > > panic case already has panic_print_sys_info() for this purpose, and has
> > > > a 'panic_print' bitmask to control what kinds of information is needed,
> > > > which is also helpful to debug other task-hung and lockup cases.
> > > > 
> > > > So this patchset extract the function out, and make it usable for other
> > > > cases which also need system info for debugging.
> > > > 
> > > > Locally these have been used in our bug chasing for stablility issues
> > > > and was helpful.
> > > 
> > > Truth.  Our responses to panics, oopses, WARNs, BUGs, OOMs etc seem
> > > quite poorly organized.  Some effort to clean up (and document!) all of
> > > this sounds good.
> > > 
> > > My vote is to permit the display of every scrap of information we can
> > > think of in all situations.  And then to permit users to select which of
> > > that information is to be displayed under each situation.
> 
> Completely agreed. The tricky part is making a global knob that works for
> all situations without breaking userspace, but it's a better system-wide
> approach ;)
> 
> > 
> > Good point! Maybe one future todo is to add a gloabl system info dump
> > function with ONE global knob for selecting different kinds of information,
> > which could be embedded into some cases you mentioned above.
> 
> IMHO, for features with their own knobs, we need:
> a) The global knob (if enabled) turns on all related feature-level knobs,
> b) while still allowing users to manually override individual knobs.
> 
> Something like:
> 
> If SYS_PRINT_ALL_CPU_BT (global knob) is on, it enables
> hung_task_all_cpu_backtrace
> for hung-task situation automatically. But users can still disable it via
> hung_task_all_cpu_backtrace.
> 
> Anyway, the global knob (when set) controls all feature-level knobs, but
> they can override it if explicitly set ;)

Yes, it makes sense for parts which already has its own user space
control knob.

What I proposed is a todo mostly for other parts than panic/hungtask
in this patchset, as these parts have some special handling required,
like panic need to handle printk-replay for kexec case. 

Thanks,
Feng
