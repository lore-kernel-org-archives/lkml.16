Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E51219E806
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743714881; cv=none; b=lIW6ZlERDRXOP3B8HRHFb3+n7ZzBfotBtuKjczqWuXH0C7iotJsXtRjhcb4hC7uGLJkjiCaLYOEiYLhz4nhBQA9BpoQP1CK836b590Px0P5wl/LTQY9T0YUsbOlFSmZG/Auy9ngEGJesysR6IBngFOh6TN0iEyCccoOeb0py7dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743714881; c=relaxed/simple;
	bh=uLMQ/F/3ytathLIg7FLxMcw4+feD4cRHjtbUD2GmIWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j2tiQFXoq+DZgRuaZEDwN5YeqgajzxT6zfMg9LxlXkxwo89v3SmVsCera+l0xTFRb05xsZwXJtbUdV0SkasNg42cn4eELwOF/9u3CbmrKXG1zMAMoxOQ3Y57+yaekV6Onn6Wa/SQIa+pa+Ly/GlO7elk+j9T+0uhzUYgHvHnKFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufDflTsy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufDflTsy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C383C4CEE9;
	Thu,  3 Apr 2025 21:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743714880;
	bh=uLMQ/F/3ytathLIg7FLxMcw4+feD4cRHjtbUD2GmIWQ=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=ufDflTsyDG5ABL+nh72K0N6EvM38CMHMcK+BGqGw9Jb1L/J33rEohGC6Zl6zCOrEN
	 sHGUVxln33vY7y1S3d0iE9ktRSWCmHvZMVpNRTeWS+SvRplWKPJZgVf0SJ0UCXQ/Eh
	 pKIf6mT7mvi4TXlJHuK+zWahBCIQ1ySlNJ8HST3qGnaKQp0KCT6Tf3H4iAl4C02Nhi
	 saLdmD4oOWw3CNnomJZZtGxo0tTtgjK2wocUht4YDgACqggZ3T1vtw8+jl7HVS8TbD
	 fRvlenyX0cuF5nuXSqpDn5e3h8rvvkD5vsTVnXq/aAcjP7y3PFVyzgHsIhDVg98is0
	 042MFpv7lcRJg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id DF7AECE0799; Thu,  3 Apr 2025 14:14:38 -0700 (PDT)
Date: Thu, 3 Apr 2025 14:14:38 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: [PATCH RFC 0/9] Reduce ratelimit's false-positive misses
Message-ID: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

This RFC series replaces open-coded uses of the ratelimit_state structure
with formal APIs, counts all rate-limit misses, replaces jiffies=0
special case with a flag, provides a ___ratelimit() lockless fastpath
to (almost) eliminate false-positive misses, and adds a simple test.
The lockless fastpath also provides a 10-20% speedup on my x86 laptop,
though your mileage may vary.

The key point of this series is the reduction of false-positive misses.
Patches 4-7 move in this direction within the fully locked confines of
the current design, and patch 8 introduces the lockless fastpath.

The individual patches are as follows:

1.	Create functions to handle ratelimit_state internals.

2.	random: Avoid open-coded use of ratelimit_state structure's
	->missed field.

3.	drm/i915: Avoid open-coded use of ratelimit_state structure's
	->missed field.

4.	drm/amd/pm: Avoid open-coded use of ratelimit_state structure's
	internals.

5.	Convert the ->missed field to atomic_t.

6.	Count misses due to lock contention.

7.	Avoid jiffies=0 special case.

8.	Reduce ratelimit's false-positive misses.

9.	Add trivial kunit test for ratelimit.

						Thanx, Paul

------------------------------------------------------------------------

 b/drivers/char/random.c              |    9 -
 b/drivers/gpu/drm/amd/pm/amdgpu_pm.c |   11 --
 b/drivers/gpu/drm/i915/i915_perf.c   |    8 -
 b/include/linux/ratelimit.h          |   40 ++++++-
 b/include/linux/ratelimit_types.h    |    2 
 b/lib/Kconfig.debug                  |   11 ++
 b/lib/Makefile                       |    1 
 b/lib/ratelimit.c                    |    8 -
 b/lib/test_ratelimit.c               |   77 ++++++++++++++
 include/linux/ratelimit.h            |   13 --
 include/linux/ratelimit_types.h      |    4 
 lib/ratelimit.c                      |  186 +++++++++++++++++++++++++++--------
 12 files changed, 296 insertions(+), 74 deletions(-)
