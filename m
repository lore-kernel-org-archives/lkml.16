Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4323620F07D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746517507; cv=none; b=cSiVBHZKynZDuYXNArIDZL9molxpjB7TMcU1M965tudUZ6/mOIAzo0I0xzRIiUAUB40qep5jdksLUdGZz6IypJWVS32pRkbAtWDS+cY1pC3VeCunoTobjX268ZkCyo6c4F/C8t///XmzmwkrpjX3qbb/lzhE/Tyybw8eRf5HQw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746517507; c=relaxed/simple;
	bh=dWeIEVlsTt6LZ7zYC8dLBPwWzYFzHO3Zjs5e8jZVlL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pn1FBS2YFZp5oBEzZo1PN3OvZP8W2ZqKnacW5fKEk5ybwAmjnKmzMLEJMQPk658X+ZkfwEga6oAsU6gnLv26uqLbxmlxRwcuwfQX3YtGOj9Dmd311oiWJIwbLGiRwvD4/62BEXkUv0oUh04lKZVE0sGq1Qi6SsUcpRB2qas2l4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WJPFbKvT; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WJPFbKvT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=17qveg2sFxnYGJmZxV7vmqyNaQiuU15VOdXUcfpSCtM=; b=WJPFbKvTMZPkHD3L1BKzN5a/3E
	cJClJY9ZaJr7DB0omR9kpIJ8y1EQeAr4UuY2VVLtD45fGBBxIcbw+xrbXMCkqckwxcXgJv7jY1P63
	TNjpSr+fx7rd/tEs8M5qea053wCRjpkn3AJyRuVP3i5OiV6kR33fTDFF1crCubHKj/jRT/KMuTmh3
	hWHeTBmJl3Dh5Ra4Q8S3KInyjz3NVYg8bIHZ9y9FjYiGC5NS+cAE933/IX6tCvwybe7gXhLEjHEVl
	8T83EuBGkuIa4fp+KFtYnwP91HF16/MXkK0YhN68u45xKrhzQLyOZPcekXUo402H18WHUPZZQg3Mt
	b6gJu3Hg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCCz7-0000000Fc0t-0QDd;
	Tue, 06 May 2025 07:45:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AB8BB30050D; Tue,  6 May 2025 09:45:00 +0200 (CEST)
Date: Tue, 6 May 2025 09:45:00 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 00/15] x86/kconfig: Enable various kernel features in the
 defconfig, add the 'x86_32' subarchitecture build target and misc cleanups
Message-ID: <20250506074500.GI4198@noisy.programming.kicks-ass.net>
References: <20250505110946.1095363-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505110946.1095363-1-mingo@kernel.org>

On Mon, May 05, 2025 at 01:09:31PM +0200, Ingo Molnar wrote:
> Historically the x86 defconfigs aimed to be distro kernel
> work-alikes with fewer drivers and a substantially shorter
> build time. We regularly ask our contributors to test their
> changes on x86 defconfigs, and we frequently analyze code
> generation on such kernels as well.
> 
> In practice, over the past couple of years this goal has
> diverged from what actual modern Linux distributions do
> these days, and this series aims to correct that divergence.
> 
> Perform a thorough modernization of the x86 defconfigs, and
> apply some cleanups to the x86 build system as well:
> 
>  - Enable various kernel features that the most popular
>    Linux distributions have enabled in their generic
>    kernels these days: KVM host, BPF support, UBSAN, various MM
>    options, debugging options, various scheduler and cgroups
>    options, support for a number of guest OS platforms,
>    and other options.
> 
>  - More specifically, these changes enable a rough superset
>    of the kernel features enabled by Ubuntu, Fedora/RHEL
>    kernels.
> 
>  - Clean up the organization of the defconfig files as well.
> 
>  - Add the ARCH=x86_32 build target
> 
>  - Synchronize the x86_32 defconfig to the x86_64 defconfig:
>    this file is really just a random set of options configured
>    many years ago with no relevance to anything people are
>    using today anymore. Just follow the 64-bit options to the
>    extent possible, to have at least one modern frame of
>    reference.
> 
>  - Clean up a number of kbuild details

One thing I'd been pondering for a while, but have absolutely no
bandwidth for what so ever, is a more fragment based config setup.

Much like we now have defconfig, kvm_guest.config, debug.config
and xen.config etc..

My main 'complain' is more that defconfig is too fat already, and here
you are making it fatter still -- notably, I don't need i915 in most of
the kernels I build (my test machines are all headless).

Could we not instead move things out into fragments, so that people can
compose the bits they need?

The other day, I was looking for a kvm_host.config fragment, to pair with
the kvm_guest.config we do have.

Similarly, all that UBSAN, MM and assorted debug cruft is already in
debug.config (although I do think debug.config is *too* heavy).


