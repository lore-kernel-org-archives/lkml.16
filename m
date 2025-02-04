Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484C8218EB0
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 19:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738695743; cv=none; b=NnZZV1VbbL2TJjfULjPJa7ZdiJFHn0ZDVdYa11GKOg0qDD1LeDe9zerfJxvpqcnTIdl7ehmp+NWt4FoRCrEk5tsH3m1zuHcH13fGxWjX4yIOZkwaT47QZO11mPZUY3hZcX/A6DCoG5P7eCNSvFaq1c0tkN2xoBgf65JtAtwb0gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738695743; c=relaxed/simple;
	bh=RGzsvbD3M4DhQeMO6slsNWmgM9tDr8tP/sIIhDjQy5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpNN4yTmI06Y3RUW5S/QT2+m+YSgcNJqY9geJeZUCgWsNbQho2/Gk1/D8Cc/jWYaE0e0m8y3g94w9fgVefh8wVh4IwrXtrtZWo5+VRczOmP9AzLYu7QRLXNRFXyHLkX2oEymiyy+CLq6Ygbr65sgE2aZcpK/vvtbtmjOxSxkvdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqJYOi5c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqJYOi5c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360E6C4CEE8;
	Tue,  4 Feb 2025 19:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738695742;
	bh=RGzsvbD3M4DhQeMO6slsNWmgM9tDr8tP/sIIhDjQy5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gqJYOi5ce+/OO4THSG7Gm15RidC3imbUoEbaVW6HtLShcr0SZ6K7E1uZFuwRneVr3
	 B8XXU82CvGPyLTE4q9A8uUze7ukrBv8BIqThnNp2JYsl18ihF8fxSTTIZ4gvJvxbic
	 1D4O4nI+ZdtL6wKIUnS7kDzrulVr9xmUGIF9nvJHccZTL2QdBrIuaAPL6qGcQzNDCa
	 WlQGM/9oUDVyprUBi3qZTcFW07m7yFXLo1CH99uLqB6WDV2FWOuLsE9QRn0196shWJ
	 0/tweEF9rfy9mzYTBpfqSFIQzKUcmLLgUQ9o+v0+r5f6Mj1SmqP2tjl60ZE7ZobK+C
	 Pl9cUOb7k/Pkg==
Date: Tue, 4 Feb 2025 20:02:19 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Dhruva Gole <d-gole@ti.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Chen Yu <yu.c.chen@intel.com>,
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH V2] kthread: Fix build warning variable 'ret' set but not
 used
Message-ID: <Z6JkO4ssN7Bwcgd6@pavilion.home>
References: <20250204090838.214647-1-d-gole@ti.com>
 <20250204160921.377178-1-d-gole@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250204160921.377178-1-d-gole@ti.com>

Hi Dhruva,

Le Tue, Feb 04, 2025 at 09:39:21PM +0530, Dhruva Gole a écrit :
> Fix the following build time warning in kthread:
> 
>    kernel/kthread.c: In function 'kthread_affine_preferred':
> >> kernel/kthread.c:861:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
>      861 |         int ret;
>          |             ^~~
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501301528.t0cZVbnq-lkp@intel.com/
> Signed-off-by: Dhruva Gole <d-gole@ti.com>

Thanks for your patch but another similar fix was already pending. I have sent
the pull request there:

https://lore.kernel.org/lkml/Z6JjZMdbDoAX_AVW@pavilion.home/T/#u
