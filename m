Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3F128F4
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 07:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746344072; cv=none; b=sHPyBkg2tgpJ2Fsd0+k4Y+boo6nP3LBWCUsCmp07E2bSzezgfcPEdmYbwp7nWXNG3e0VduIG0Zw//UBG9q1MLKR9V4wxJ7f2603fZAyjUzUeAO6YgvhwlhAUoNehB/GUlaPj7Swz3a9WUEwwVYsHHez330Pb9SFVO64WYGZz8jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746344072; c=relaxed/simple;
	bh=jaIsT2VqYOwGpto/ZI3VtUj4gXA6trfG0WUo22uYHBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3grMEWop4lWoe965DuwZmTQjjPGK+YcwOnXDc3+fjPJ1RbSLU62ERClCWGWQwTK7gZRtB3FcvXCflA+g1sQguk5pb8FWnL+xlsYk8Nk7zx7Hjd2NfV/bm7IR9ZKQP4WYdYnSV1u1edn+YSW9sgKftwJYbUaesSEiQokmNR8V8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QdCyYDj9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QdCyYDj9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B47C4CEE7;
	Sun,  4 May 2025 07:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746344071;
	bh=jaIsT2VqYOwGpto/ZI3VtUj4gXA6trfG0WUo22uYHBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QdCyYDj9Ykna8ut26PwxIeQ+oTfxHzhVmPD50lyJRXeCRWRn8lDDBWcabqoL0FISH
	 BF1GHuLZYzmGZxB4g2f8yKKVClneikZ/cHbcl2qK0/Rw55mKgxcCup+tApSk2Hd+Nm
	 VoPOpLIyYpx6cvhT9pWvAjjZ8YTqnWbmnciWRG1HuEMPefQhzV8TjWUN33e9jt/vBm
	 Kd/A42RwUzt37Kj6rR0MQQeJxQbqqsT5iLu6miyMgpGv5OLahxWJ8xgMQbFy6VydlD
	 10bXizqIbBHLRPpdKPFFpdog8T4ISDuI3EqU57RuoVpw5NuvgaxwP/WRaU8YMZLdhN
	 RIQJ9hNMi5xFw==
Date: Sun, 4 May 2025 09:34:27 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [GIT PULL] timer subsystem fixes
Message-ID: <aBcYg0t9DIx_lh5W@gmail.com>
References: <aBcWkIOBqkKG8lH-@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBcWkIOBqkKG8lH-@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> Linus,
> 
> Please pull the latest timers/urgent Git tree from:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-05-04
> 
>    # HEAD: 7aeb1538be5df3efa1d799e5428ac3a0ae802293 vdso: Reject absolute relocations during build
> 
> Misc fixes:
> 
>  - Fix time keeping bugs in CLOCK_MONOTONIC_COARSE clocks
> 
>  - Work around and reject absolute relocations into vDSO code that
>    GCC erroneously emits in certain arm64 build environments

Please belay this pull request, just a minute after sending this out I 
received this fresh build warnings report on a Risc-V randconfig build:

   # Subject: [tip:timers/urgent 3/3] llvm-readelf: warning: 'arch/riscv/kernel/vdso/hwprobe.o': bitcode files are not supported

   https://lore.kernel.org/r/aBb6nudVcs+cqRyZ@rli9-mobl

Sorry about that.

Thanks,

	Ingo
