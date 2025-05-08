Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8195520CCFB
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747160; cv=none; b=IKUHVChlKi8Y7jyQwfWZJfarGIGSZrbpO0ymJbp1L5/6xVn1J1df//tcz+NOnIVfVaDRWiZNSOWrA+mZbVmPOubMwdSb9kzu7WPaSO+5OjXg+NLoQZJIeNcUDnFztkJOlh6dnALEqToL1Er8BSZykGb7eH4SGbI0pi4gk4imLMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747160; c=relaxed/simple;
	bh=JdLHTFtD5w+LZ0bsIefCnqjpDQatFiDpdkO59iER688=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXJjgfR361Fz3tftUcxirqSEXJC5l6TITB/7SS+3NOlXnzjXGHMBVyduKDc8mIZUPGGVGX2rwe7BWMGJA0xg9B/e3+03OijlUZF2b1fmpL7c2hQBuKO01+c6AxR2tg7skJkffLxHziC1Ic6wOgYt2z617KYzLYcNV6PP6D/p8k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nz6Kh96o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nz6Kh96o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC695C4CEE7;
	Thu,  8 May 2025 23:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747159;
	bh=JdLHTFtD5w+LZ0bsIefCnqjpDQatFiDpdkO59iER688=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Nz6Kh96o8H3JogtJcHq5r0Dn3keR5D/3Q4pfABz8fdO4+dQrfdY/BW9ViT3535q+c
	 Coi5SgpexMJ0TldKBR7XlZRWn7cmiZLXgY5yn8x2BxNkQp6ad+9s2qydcLzuwCBd9h
	 K7N9RXZcwboQZTVbz7AvzBIAeuL35OjmWVy9CTcasxKDJ3zPl8X7Uc4Rr38oOPohSc
	 6ShX257SDTvUIq/ZlzjLzTqpl1yYp59iXvzb9TFbRHM+j1lXV4XNKfAUNrJR5Dlunt
	 6HibunYAWaFBFGRs3tvrgLxSw70eYwxi2Lais13KcBdqiUp5V0OH4cjcAQLgLEviAV
	 82Z3fl3L4dfpQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 83C63CE11A4; Thu,  8 May 2025 16:32:39 -0700 (PDT)
Date: Thu, 8 May 2025 16:32:39 -0700
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
Subject: [PATCH v5 0/21] ratelimit: Reduce ratelimit's false-positive misses
Message-ID: <1bcf7d5e-b89c-4118-b872-c8896bdbdc19@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
 <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
 <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
 <b0883f20-c337-40bb-b564-c535a162bf54@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0883f20-c337-40bb-b564-c535a162bf54@paulmck-laptop>

Hello!

This v5 series replaces open-coded uses of the ratelimit_state structure
with formal APIs, counts all rate-limit misses, replaces jiffies=0 special
case with a flag, provides a ___ratelimit() trylock-failure fastpath to
(almost) eliminate false-positive misses, simplifies the code, and adds
a simple "smoke" test along with a simple stress test.

The key point of this series is the reduction of false-positive misses.
More could be done to avoid open-coded access to the ->interval and
->burst fields, and to tighten up checking of user input for these fields,
but those are jobs for later patches.

The individual patches are as follows:

1.	Create functions to handle ratelimit_state internals.

2.	Avoid open-coded use of ratelimit_state structure's ->missed
	field.

3.	Avoid open-coded use of ratelimit_state structure's ->missed
	field.

4.	Avoid open-coded use of ratelimit_state structure's internals.

5.	Convert the ->missed field to atomic_t.

6.	Count misses due to lock contention.

7.	Avoid jiffies=0 special case.

8.	Reduce ___ratelimit() false-positive rate limiting, courtesy of
	Petr Mladek.

9.	Allow zero ->burst to disable ratelimiting.

10.	Force re-initialization when rate-limiting re-enabled.

11.	Don't flush misses counter if RATELIMIT_MSG_ON_RELEASE.

12.	Avoid atomic decrement if already rate-limited.

13.	Avoid atomic decrement under lock if already rate-limited.

14.	Warn if ->interval or ->burst are negative, courtesy of Petr
	Mladek.

15.	Simplify common-case exit path.

16.	Use nolock_ret label to save a couple of lines of code.

17.	Use nolock_ret label to collapse lock-failure code.

18.	Use nolock_ret restructuring to collapse common case code.

19.	Drop redundant accesses to burst.

20.	Add trivial kunit test for ratelimit.

21.	Add stress test for ratelimit.

Changes since v4:

o	Add a simple stress test.

o	Move the tests to the end of the series for bisectability.

o	Add Reviewed-by tags.

Changes since v3:

o	Correctly handle zero-initialized ratelimit_state structures,
	being careful to avoid acquiring the uninitialized ->lock.

o	Remove redundant checks of the "burst" local variable.

o	Add Reviewed-by tags.

Changes since v2:

o	Apply feedback from Bert Karwatzki, Srikanth Aithal, and Mark
	Brown, fixing a hang that happened on some systems.

o	Applied Reviewed-by tags and added links.

o	Added a prototype patch from Petr Mladek that splats if either
	interval or burst are negative.

o	Added several commits that simplify the code.

Changes since v1 (RFC):

o	Switch from lockless fastpath to carrying out needed updates
	upon trylock failure, per Petr Mladek feedback.  This greatly
	simplifies the code and is a much smaller change from the
	current code.  There is a small performance penalty compared to
	the lockless fastpath, but not enough to matter.

o	Never unconditionally acquire the lock, again per Petr Mladek
	feedback.

o	Better define effects of non-positive burst values (always
	ratelimit) and non-positive interval values (never ratelimit
	when the burst value is positive).

o	The changes from Petr's original are supplied as five incremental
	patches, but could easily be folded into Petr's original if
	desired.  (Left to my lazy self, they stay as-is.)

						Thanx, Paul

------------------------------------------------------------------------

 b/drivers/char/random.c              |    9 +
 b/drivers/gpu/drm/amd/pm/amdgpu_pm.c |   11 --
 b/drivers/gpu/drm/i915/i915_perf.c   |    8 -
 b/include/linux/ratelimit.h          |   40 +++++++-
 b/include/linux/ratelimit_types.h    |    2 
 b/lib/Kconfig.debug                  |   11 ++
 b/lib/ratelimit.c                    |    8 -
 b/lib/tests/Makefile                 |    1 
 b/lib/tests/test_ratelimit.c         |   79 ++++++++++++++++
 include/linux/ratelimit.h            |   13 +-
 include/linux/ratelimit_types.h      |    3 
 lib/ratelimit.c                      |  165 ++++++++++++++++++++---------------
 lib/tests/test_ratelimit.c           |   69 ++++++++++++++
 13 files changed, 313 insertions(+), 106 deletions(-)
