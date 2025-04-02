Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D4AB674
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 18:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743617792; cv=none; b=NGHc2JABgCx6L1XRmmm+0+9OFUC/DntoGkXKVZH8WcUIZ2AsAHQRya+xjhqVUMz4g3UVdqGUooiSfQ5skefU7G7QN7XHl74dNC+DjNG6ypELboqcxgf0FEN5HaS2AgI+iODOcldqeYTTznM0aau8JYoj5TQtKyZ/Dqpx/Nze4mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743617792; c=relaxed/simple;
	bh=w7PrYtRAx4c/uDv7ZWUo0w6QoO2+YwivCacOGOGF7i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1ariz7HXwFxq0uYIsJfDsVjVANzamo6XraOFgAAjDbdkbq+/flxUJPyWkEqNIQ3s5acNy2wt0cuUM3ix72QTvoeQYkQzzMSzDULoYppQACIeY/gycnrLLeHw0Fad/PyUYEANKDp5dOgfXXVgkiyjAvX+XzPwp8HeoyRKCvBsEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mouyiy9w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mouyiy9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAADC4CEDD;
	Wed,  2 Apr 2025 18:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743617791;
	bh=w7PrYtRAx4c/uDv7ZWUo0w6QoO2+YwivCacOGOGF7i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mouyiy9wZJJsAr0LsAFR9W+IniWXifkNvjNqbpROb8gKjYi1IA37qE7nd+EofLFvz
	 XmnFQoIa62Ea672CmZk6qoev3YtYz4czB/3rHHufWRs6ZYn5URJ/rEPatBfa3OotzT
	 UwjmXfkMUwu2DW/XGCDON3T/B1bLGejdDMYpeSyQ11c5S3SBRS83tc6ddZaolGk8qY
	 bLX32pgoWdmJMuL1iWNqZYCc6kUjBBwrodKSw8DfeJ9lsOPNk7+CHpNkFewf2yeMQ2
	 DWJFSAbSqqTDiu/tu8LoD8OLMKwtH2wu+Y/GPKHHuy/PUS7EDD2RC1ySkZBfW9l7DP
	 Sr4jDkd64K/QA==
Date: Wed, 2 Apr 2025 08:16:30 -1000
From: Tejun Heo <tj@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	open list <linux-kernel@vger.kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] workqueue: Always use wq_select_unbound_cpu() for
 WORK_CPU_UNBOUND.
Message-ID: <Z-1-_hOEzp9st1wg@slm.duckdns.org>
References: <20250221112003.1dSuoGyc@linutronix.de>
 <Z7iSboU-05uMJ7-e@localhost.localdomain>
 <Z7iuUObJGgZtsaJe@slm.duckdns.org>
 <20250226161847.eYrJFpIg@linutronix.de>
 <Z79E_gbWm9j9bkfR@slm.duckdns.org>
 <Z-1oj4zCByGN38J2@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-1oj4zCByGN38J2@localhost.localdomain>

Hello, Frederic.

On Wed, Apr 02, 2025 at 06:40:47PM +0200, Frederic Weisbecker wrote:
> > If we're renaming, I'd deprecate the schedule_*() interface and always use
> > queue_*() and maybe:
> > 
> > - Replace WQ_UNBOUND with its complement WQ_PERCPU.
> 
> This one scares us a bit. Currently the default for alloc_workqueue() is
> WQ_PERCPU. After that the default will be the reverse. Even if this
> happens as a single patch treewide change, there will be conflicts
> in the merge window with new users coming up that will happen to be
> unbound whenever they were not intended to.
> 
> But there is a way out of that if we are patient:
> 
> 1) For one release, do a treewide change that introduces WQ_PERCPU and apply
>    it to all relevant users. Keep WQ_UNBOUND around for now and warn if neither
>    WQ_PERCPU nor WQ_UNBOUND has been passed (this and grep/coccinelle will catch
>    missed patches from other trees after the merge window).
> 
> 2) Once that complete, remove WQ_UNBOUND and its uses on the next release.
> 
> How does that sound?

Yeah, that sounds way safer.

> > - Add WQ_PREFER_PERCPU.
> 
> This can be done afterward case by case.
> 
> > - Rename system_wq -> system_percpu_wq.
> > - Add system_prefer_percpu_wq.
> > - Rename system_unbound_wq -> system_dfl_wq.
> 
> Easy steps.

Sounds great to me.

Thanks.

-- 
tejun
