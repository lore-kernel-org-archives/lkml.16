Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F039D20AF66
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369697; cv=none; b=Slp4TV32mQpcsQEGZkuHvhAN20i0fEmDNgOGmq8CvT2XpMGGXDe/aglbnqALBxSZmdePb1RsdMlX0XZKnK4TMIdNXTdTvHGYPuUd/UkFoYQQxYY6JT+mLQXzR1FMkxothW1MrdH+bkAdoXaF8XUGE+FFjagvv4BHyDB4x567xzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369697; c=relaxed/simple;
	bh=XnWf18T4aDc2xmNps0it2JLrQ9AKau7dBuKwdDKj6zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPKh2eLLa/pC8lqm+DdZaBpidh24PRMOgS2gf4wiAX2ES5eI8E70Bj/AXHvWLgq2qXGLvT927f3kximGJ0cxxjEyxgn2fChSNzMXHDRDNHILTNiI9Ap7yvUn3oDz/dnoINHPePdKTw28j6LZQ3Y6RBABCGOH3fUSdTAs9DNPFxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyGoBPYB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyGoBPYB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF32BC4CEEA;
	Fri, 11 Apr 2025 11:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744369695;
	bh=XnWf18T4aDc2xmNps0it2JLrQ9AKau7dBuKwdDKj6zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dyGoBPYBNvz7vzJ1/ucwrebmsgt1MrVYBzyUbG6S/gx4cA5hYAGFVNGIMXrewXIiY
	 wmCKjFCDUliOvMo+AXMElY9iaxEL61dHP5lMYU/adTVxXjvk9hqqThiB367HNQ3hgK
	 XReqfvhwqX2kFdrpSDeMhJnmqetg8qQQhZ9V33sxpLOXOZ6nhgSBU2Hu1IxoGO7Bi2
	 JOaNeCYWiH2qfg9W4mwSQeSQOXCLuYq99P6x/XwXf5IPHql1xWRFN2ezVWaLdpKggm
	 OjO5zQnKHBScQqMErg4QOI74gzO+kOARfI40m1n177cLW51RdLkGLsDrhoI6t3w9oX
	 54ITeqWvlxJcg==
Date: Fri, 11 Apr 2025 13:08:12 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Alex Shi <seakeel@gmail.com>
Cc: alexs@kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 2/4] sched/isolation: clean up housekeeping_cpu
Message-ID: <Z_j4HIVRUcF-TwDP@pavilion.home>
References: <20250410092423.9831-1-alexs@kernel.org>
 <20250410092423.9831-2-alexs@kernel.org>
 <Z_fFlstqFYGPFLEB@localhost.localdomain>
 <CAJy-Am=oORjnBx09phsBCkNxF+bK_CyWA_eBMHUG0WdE9pb63A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJy-Am=oORjnBx09phsBCkNxF+bK_CyWA_eBMHUG0WdE9pb63A@mail.gmail.com>

Le Fri, Apr 11, 2025 at 08:58:45AM +0800, Alex Shi a écrit :
> Frederic Weisbecker <frederic@kernel.org> 于2025年4月10日周四 21:20写道：
> >
> > Le Thu, Apr 10, 2025 at 05:24:17PM +0800, alexs@kernel.org a écrit :
> > > From: Alex Shi <alexs@kernel.org>
> > >
> > > housekeeping_test_cpu will check 'housekeeping_overridden' again in
> > > itself so we don't need do it again outside. just call
> > > housekeeping_test_cpu is fine.
> >
> > The point is to do it in the headers, so there is no function
> > call in the off case.
> 
> Thanks for comments, Frederic,
> But the function is 'inline', and further more, the
> CONFIG_CPU_ISOLATION is in defconfig
> and most of puplar popular Linux vendor. So it still be compiled.

housekeeping_cpu() is inline and does the static branch test, which is
most of the time off. If it's on, then we enter the slow path and call
the real function housekeeping_test_cpu().

So the point is to optimize the fast path, which 99.999% of the uses
since nohz_full is a rare workload.

But housekeeping_test_cpu() is still built on most distros just in case
a distro user ever needs nohz_full.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
