Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3791E87B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 18:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743706471; cv=none; b=Medbtumu6xaRFVbmuV3mfvjovRL4YRLCl7H467DSsAiZwOwHN4vStn6uNEa3j3qUDMpN2qDT1Wc0OLRsZDpO4LVRh50wUWuYdK8WuIFo/9SwK1Ud5w3tQFhWN7wXjkD28bChXKjBaGNYc8+ZrGx2GOvNOW6UwEC3i6uToRr9v1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743706471; c=relaxed/simple;
	bh=/k/KLhCMR3xk7gx7WHIcjzaHeZtzSv67GmzQZu8H+64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A81eHmakSUsgzaU5m+lkxO1HQzQq0LnD0OYKC0otUu+SdIpnd1S8FF0DX26KJytiuM94vVvBJdyMMbJN1aVcFUR7S5V0vlzy411C6DIKBsnLseX9l6qREMqPkRo2H2zLPiOEcwdU4kB7kMgUae2oTLz8RKeFwUUTiMZbyGlMCWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJB/nE7m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJB/nE7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC365C4CEE3;
	Thu,  3 Apr 2025 18:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743706471;
	bh=/k/KLhCMR3xk7gx7WHIcjzaHeZtzSv67GmzQZu8H+64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJB/nE7mXHfF0UoItt9RU288X6ugKRgbrvJOW5t3ygEA8BPghYqoNDVmAdAEDb5SH
	 QsqWTXZvXiXO0V6hO2t7xwpxGmowvTI3LIdMdT0rKkQ/Bx+L7gqD3KobfaBtCNLY41
	 RZa0if9GU5q/cO+wMI6BqiSeJH1IP0y14e5DXm7iBFQ0C/tRhGb+G68sAU8KLMSRUb
	 qmP14/HRyo58a7nZZc49IJuc9Qf5MQLpPGN6Sndx0mK6eybKbALz8LDeS7E+zbVGFw
	 BBUL23DRO49pLmPhej3JhwTfs/yF+VcB+gkPcBnbvqPQQLQyg/bGTU4YkBLCHb/Jgz
	 6Tv9QNKzjxnHw==
Date: Thu, 3 Apr 2025 08:54:29 -1000
From: Tejun Heo <tj@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: Better document teardown for delayed_work
Message-ID: <Z-7ZZThD2i2-yw8R@slm.duckdns.org>
References: <20250403083155.37931-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403083155.37931-2-phasta@kernel.org>

Hello,

On Thu, Apr 03, 2025 at 10:31:56AM +0200, Philipp Stanner wrote:
> destroy_workqueue() does not ensure that non-pending work submitted with
> queue_delayed_work() gets cancelled. The caller has to ensure that
> manually.
> 
> Add this information about delayed_work in destroy_workqueue()'s
> docstring.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Hi,
> 
> I have seen this WARN_ON [1] fire in my code for testing the DRM GPU
> Scheduler, where a (non-delayed) work_item from workqueue A submits
> delayed_work to workqueue B [2].
> 
> From my experience so far and reading the documentation, I didn't expect
> this to happen.
> 
> Assuming this is wanted behavior (?), I propose documenting this more
> explicitly. Or could it be possible to modify destroy_workqueue() so
> that it takes care of submitted delayed_work()?

This is definitely not a "wanted" behavior. The problem is that delayed work
items are only linked on the timer side and we don't have a way to list all
timers that are queued for work items on a specific workqueue, and there's
no way of adding that without incurring extra overhead. Maybe that'd be a
worthwhile trade-off to make, I don't know.

Can you please fortify the text a bit with the fact that this isn't a
desirable behavior but workqueue currently doesn't have a way of locating
the delayed timers queued on its behalf?

Thanks.

-- 
tejun
