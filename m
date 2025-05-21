Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5CD635
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747807577; cv=none; b=aCm5VGwYIx7+G6mvsVcxOOrBdA5hnn2MrBLGRIj4C4pOBO6ut/XTdhID7mTH2ESjAlgW3NAVOP+9vMyHDGYDRzfPH6VlWJUIwUeYRH1iTbYK5ox2SSjcaSG05CHQAFDyS3I7nbsAR/9Au2Iy6EhqyeX+7MMPqjOnTx/K7Mzj/NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747807577; c=relaxed/simple;
	bh=Sv6ILvaJa+fw9Od09i4qiDcqE8ahmFmFZ7k95KwTEYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvPWyqWTMQEWCQ2JCiYc+GQt2wjp5cRIA5zv0pxrlNzphsFPQOfG5SY+iA7BtSMy2j2GSQ/kMgglBwP+cZygxuOebBNLtDSS6wbViHsQvyp0+e6FAO77beZmD29CI1E+5NUmWNgP0ORPUQWqKfsyz8gn8tcmzAvk5QkZPu+XIj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vf/w0K7P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vf/w0K7P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C31C4CEE4;
	Wed, 21 May 2025 06:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747807576;
	bh=Sv6ILvaJa+fw9Od09i4qiDcqE8ahmFmFZ7k95KwTEYQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Vf/w0K7PfAG4fI5mQh+y+HDF6+QaBKQYj0h/Vge8Gq2UUlIHztEiboZgJiMo5ycwX
	 I1WfFY2rNI+DHDt5UgH+ndcODV8CcCe69DOjGITtuYOr0AxqUKv8RGXtdSrrrdm5yd
	 h/1DaTVDexdo9y9PJOWhG0ofwsc7Mi19JEZrL17i0sgZ5eWgNSjoWJOGbuMdr+rSlU
	 IioSlQgYUfN2j3hwT4q4RyVYD+H6pKDj1tfo9N0R/mlq64+3n2YDskGBS5LLwfmdBB
	 rWOlWWxOgf/Bf+C169T752BbYMWiu5+0xCcob1siizk8v7DVO4jGvhjkX2YT2ycZgM
	 eRx0EnzrLZbSQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 3E78FCE08F4; Tue, 20 May 2025 23:06:16 -0700 (PDT)
Date: Tue, 20 May 2025 23:06:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: John Ogness <john.ogness@linutronix.de>,
	LKML <linux-kernel@vger.kernel.org>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>
Subject: Re: printk NMI splat on boot
Message-ID: <fe455126-7b33-4246-b626-44ef33013765@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <a93e1a96-3685-41c3-8979-472b20dfca14@kernel.dk>
 <84a577t590.fsf@jogness.linutronix.de>
 <c99232fa-e861-48ec-8438-028e61d3b744@kernel.dk>
 <36ccb46d-5041-47ce-b419-f49ccaeece9b@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36ccb46d-5041-47ce-b419-f49ccaeece9b@kernel.dk>

On Tue, May 20, 2025 at 02:41:40PM -0600, Jens Axboe wrote:
> On 5/20/25 2:18 PM, Jens Axboe wrote:
> >> What values are you using for CONFIG_RCU_EXP_CPU_STALL_TIMEOUT and
> >> CONFIG_RCU_CPU_STALL_TIMEOUT?
> > 
> > CONFIG_RCU_CPU_STALL_TIMEOUT=21
> > CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=2
> 
> This was =20 btw, guess it could cut a bit too much...

Just confirming that setting CONFIG_RCU_EXP_CPU_STALL_TIMEOUT to two
milliseconds is more than a bit on the aggressive side.  ;-)

Setting it to 20 milliseconds is OK for smartphone-class devices, but
to the best of my knowledge, setting it less than 21 seconds (as in
21,000 milliseconds) has not been tested on any other platform.

> Changed them to:
> 
> CONFIG_RCU_CPU_STALL_TIMEOUT=100
> CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
> 
> and complaining is gone.

This makes it take the default, which in this case would be the specified
CONFIG_RCU_CPU_STALL_TIMEOUT value of 100 seconds.  Which is an unusually
long timeout -- mainline these days is 21 seconds and some distros still
use the old value of 60 seconds.

							Thanx, Paul
