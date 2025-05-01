Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FF934545
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 12:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746101249; cv=none; b=T+pNLjdBNe6gjXnGtXaSVPkbeJXPFGTFkG0O7sd++/ZCuQGm+7XufDKdCYP4dgyeOtBeYbi/+9Rk3tFiKIpVCNG7QvWdfKNCyGBgJsnVwjf4gjvUThbu6Di49cpT0K4A9uinHRJ2qcOGQ3HN3EeX+bevR5r7O5hUoCUh7rYx5AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746101249; c=relaxed/simple;
	bh=nYWKMlrN7nUMWoQrNWt1atvghiAb/Y1JOYkV8ZBjkhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsLw/PR6CX/O1ACxZeDRNq69nm2kHN+QAutURjUnaNbJQSOxQ+r0ZBYwVrVJqGo54Y/bLiuGzeTQp6RSWCHCgv0UIuXrO/1oadIGcROnoz+MSmIHbbMRM8fvG7z2K2x/aBo+XB8+PqSFcj/OLfutnvDZFdcJR5y7N+1+kD63F20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3Ygz/iY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3Ygz/iY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2EDDC4CEE4;
	Thu,  1 May 2025 12:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746101249;
	bh=nYWKMlrN7nUMWoQrNWt1atvghiAb/Y1JOYkV8ZBjkhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3Ygz/iYD2716ylGkwUU0zvDHbhj8KJ6zmrq6R242NF2mg2r4dAUr4sc2Ju8Z3mx4
	 AibKMMJ4P0HGBp3HWQv6Csn9mWqWutMlwdCUFwJCES6qxN7hfvQswCyzzH3RhqolRV
	 SCZ027Mb4KjlQZ9Nixe+5TnnUDj58Wi1ODaMcEed9v+ncXDSSLXi5tM4MRjOztoQft
	 ZI5QfLxmSVoaB+K2UbRvm+n9gE9wnsgiQWAqyuPDEqQBO+ryJg6szX1CnvhiDv3AVf
	 EaEOn2sQvfKU1+L0BevefjRghIk/yW1XwSPRbRVqWFjPZINzxz31WEix16bf3vrPDU
	 5KA/H70ZDsS+w==
Date: Thu, 1 May 2025 13:07:25 +0100
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Peter Tyser <ptyser@xes-inc.com>, Purva Yeshi <purvayeshi550@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] mfd: lpc_ich: Fix ARRAY_SIZE usage for
 apl_gpio_resources
Message-ID: <20250501120725.GJ1567507@google.com>
References: <20250322131841.31711-1-purvayeshi550@gmail.com>
 <174377238828.330559.7652024137546009839.b4-ty@kernel.org>
 <aAqKcn25bkrjIiLF@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAqKcn25bkrjIiLF@black.fi.intel.com>

On Thu, 24 Apr 2025, Andy Shevchenko wrote:

> On Fri, Apr 04, 2025 at 02:13:08PM +0100, Lee Jones wrote:
> > On Sat, 22 Mar 2025 18:48:41 +0530, Purva Yeshi wrote:
> > > Fix warning detected by smatch tool:
> > > drivers/mfd/lpc_ich.c:194:34: error: strange non-value function or array
> > > drivers/mfd/lpc_ich.c:194:34: error: missing type information
> > > drivers/mfd/lpc_ich.c:201:34: error: strange non-value function or array
> > > drivers/mfd/lpc_ich.c:201:34: error: missing type information
> > > drivers/mfd/lpc_ich.c:208:34: error: strange non-value function or array
> > > drivers/mfd/lpc_ich.c:208:34: error: missing type information
> > > drivers/mfd/lpc_ich.c:215:34: error: strange non-value function or array
> > > drivers/mfd/lpc_ich.c:215:34: error: missing type information
> 
> [...]
> 
> > Applied, thanks!
> > 
> > [1/1] mfd: lpc_ich: Fix ARRAY_SIZE usage for apl_gpio_resources
> >       commit: 87e172b0fdd3aa4e3d099884e608dbc70ee3e663
> 
> Can this be reverted ASAP, please? See below why.
> 
> There is no problem with the code. The original author of the change
> haven't proved otherwise.
> 
> The change made it much worse to read and maintain. By the way, it actually
> _added_ the problem as far as I can see with my small test program.
> 
> Let's just calculate based on the sizeof(struct foo) taken as 10 for
> simplicity and array size as 4x2. The full size of the array is
> 4 * 2 * 10 bytes. The size of the entry in outer array will be 2 * 10 bytes.
> Now, what ARRAY2D_SIZE do is (4 * 2 * 10 / 10 / (2 * 10 / 10) == 4, and
> that's WRONG! This will make a out-of-boundary accesses possible.
> 
> If smatch can't parse something, it's problem of smatch. No need to "fix"
> the working and robust code. The original code even allows (in theory) to have
> different amount of resources per entry, however it's quite unlikely to happen.
> But at bare minimum it shows the entry taken along with _its_ ARRAY_SIZE()
> and not something common over the outer array.

Done.

-- 
Lee Jones [李琼斯]
