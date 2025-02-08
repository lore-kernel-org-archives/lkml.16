Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005E6522F
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 02:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738980978; cv=none; b=tuusrO/Urb4QPUWSw2Hv3M1RtOvB6CsS+0Q76+xg85qfb8Rl5BInblOs/kN7blHfvx+nuRuE7sxNURJqOwMB/zQ4UZNGLeI8hdo52qEb5YZsYYWm3Q5xMAZ1reozufAR2U+b4jfUfpHeGQDTwewFXwrBAK4GO9qdB/xmx74gg9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738980978; c=relaxed/simple;
	bh=oDwPg6LWoq4eJHulw7WxIyD8EgA7G25toTodQ5Nf/B8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdDI5+zNGoJbuepSlcjdRoH3QnblVKjhpcTV5y+kJVWiaDQqo1Hp7SL7HzTbk5IAeBlDBxkVYD9b5V4/hhCiTPWdnITWUeB+Xfqr4nL/MlPWRbOqpjCf7c4W2RLx25oMRYNHBg5JrLxeUS7SA299VIzVv7Rl03cGusyRLJc9vto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RM2ECmO+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RM2ECmO+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9D7C4CED1;
	Sat,  8 Feb 2025 02:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738980977;
	bh=oDwPg6LWoq4eJHulw7WxIyD8EgA7G25toTodQ5Nf/B8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RM2ECmO+guAP5shzZtSUktOxpjeS5cjGff7q87HtPDQ4oU+ODpm/2t1Z7+OqMff++
	 Myspnj4yNVebc1X+IgP09Nc5RACf6VkCoMGyKAQ9E/8kxX/Sd+hFNECShYTFlp/lY+
	 +83r80lk+AauGxC0HXMwdQrc53YNDCI68jtKbqRvqLYdnAYqSdvXOdUQfDwNZjJQTb
	 lvqaYf/uclPyV+MRl9GVa2t3up81BIzYvC+H+7WSXR72pluK7tEeC37nlkHKOt/5Ct
	 5dcfoYDIcq/6TI4yMlGE6t6OAu6noQywlVEFQ73cBlc7orjXLjX6bu/Ff/SCNf5m55
	 96qzEK2tJKylQ==
Date: Fri, 7 Feb 2025 18:16:15 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Yonghong Song <yonghong.song@linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>, Song Liu <song@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Kernel Team <kernel-team@fb.com>
Subject: Re: objtool failure caused some kernel functionality not working
Message-ID: <20250208021615.nzvppgspxyttx6eo@jpoimboe>
References: <0bf90fc0-2287-4ce0-b810-6e383e695981@linux.dev>
 <20250130082532.mvfz5v2ikqixtesc@jpoimboe>
 <14c56104-074e-4449-abd6-1290ec506390@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <14c56104-074e-4449-abd6-1290ec506390@linux.dev>

On Thu, Jan 30, 2025 at 08:30:52AM -0800, Yonghong Song wrote:
> > I actually have a fix for that, can you try this?
> > 
> >    https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?h=objtool/core&id=fbb454b7bb39955c324693e73a5cf7e448632553
> 
> I applied the above fix and now the kernel works fine and /sys/kernel/debug/tracing/available_filter_functions
> can display tracable functions properly.
> 
> The fix is in your personal branch. Any plan to send it to upstream repo?
> 
> The fix also makes sense to me. So
> 
> Tested-by: Yonghong Song <yonghong.song@linux.dev>
> Acked-by: Yonghong Song <yonghong.song@linux.dev>

Yes, planning to move that patch into the -tip tree soon.

Peter, are you able to do that?  I have it in my objtool/core branch
right now but maybe it should actually go into tip urgent?

-- 
Josh
