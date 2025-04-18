Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D464CB5B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996430; cv=none; b=udTJ7KPxJ8zvKqRXue0mPLDf+qtauexH+jkGuhSbfJGGACT6XhnHvmEPH6Aao5/8tAmQJE9djc26LVFLOn0bj9G9SneclZCKRQqVSKesjqfGxuVfVIxVlg35b9HNP40tiHzTzMAUDN/E3Ph1vC+AMtIEbwI8PX17/mmIoC3Tal4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996430; c=relaxed/simple;
	bh=hUtx8e9yDachBxTWpIoQHwiNoBELSgD6mbQDwJ/qBpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/f2JHKqTxf91led3jC3W+w7cAQLzStO5u5qu9A4akvZo2OuiNHPhe9UK01eZ1RKbpLY86/GNf8rs68uaO6wbgNVBDcuS4Iq8mn87hVyIeYn+Yt1ZMfrHB0eEOXCGJy3lRm3N3nKrwJ/7fu6UCgaP8XFOSzMy1MAm1ceWPmugkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2ug33xs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2ug33xs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB50C4CEE2;
	Fri, 18 Apr 2025 17:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744996429;
	bh=hUtx8e9yDachBxTWpIoQHwiNoBELSgD6mbQDwJ/qBpU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=A2ug33xszGhAytK6edddcLcX6tKZPSPZMBo/wtWQYt0sSttpy2E3ld0dLgonvZ1h0
	 NSpFqdH3A2cryJEH5AvptCkA8afH49a59UCiF8a9JynBqEjvkDO7q0LEzkjJI5DFBK
	 uvkZJDgEltofiXh/BivTD5/v9j+qiQh7ZDmjPrsobBJsgBcZjeAx5J3ocRm3tfnIV5
	 koPq6myZVdtgp8Lr+3lZHPbuIN7JKsChwdYlwDNpMztkha2FFi3xMGRDdVNgckZSmE
	 WlXlAcBdwx2pP53pfwPaVNiw2hunHET2ECy4AUKLqxHeHkIRmzip1geUCby2FC3nER
	 CAYOZG6krY4Qg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0AAFACE077B; Fri, 18 Apr 2025 10:13:49 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:13:49 -0700
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
Subject: Re: [PATCH RFC 0/9] Reduce ratelimit's false-positive misses
Message-ID: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>

Hello!

This v2 series replaces open-coded uses of the ratelimit_state structure
with formal APIs, counts all rate-limit misses, replaces jiffies=0 special
case with a flag, provides a ___ratelimit() trylock-failure fastpath
to (almost) eliminate false-positive misses, and adds a simple test.

The key point of this series is the reduction of false-positive misses.

The individual patches are as follows:

1.	Add trivial kunit test for ratelimit.

2.	Create functions to handle ratelimit_state internals.

3.	Avoid open-coded use of ratelimit_state structure's ->missed
	field.

4.	Avoid open-coded use of ratelimit_state structure's ->missed
	field.

5.	Avoid open-coded use of ratelimit_state structure's internals.

6.	Convert the ->missed field to atomic_t.

7.	Count misses due to lock contention.

8.	Avoid jiffies=0 special case.

9.	Reduce ___ratelimit() false-positive rate limiting, courtesy of
	Petr Mladek.

10.	Allow zero ->burst to disable ratelimiting.

11.	Force re-initialization when rate-limiting re-enabled.

12.	Don't flush misses counter if RATELIMIT_MSG_ON_RELEASE.

13.	Avoid atomic decrement if already rate-limited.

14.	Avoid atomic decrement under lock if already rate-limited.

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

 b/drivers/char/random.c              |    9 +--
 b/drivers/gpu/drm/amd/pm/amdgpu_pm.c |   11 ---
 b/drivers/gpu/drm/i915/i915_perf.c   |    8 +-
 b/include/linux/ratelimit.h          |   40 ++++++++++++-
 b/include/linux/ratelimit_types.h    |    2 
 b/lib/Kconfig.debug                  |   11 +++
 b/lib/Makefile                       |    1 
 b/lib/ratelimit.c                    |    8 +-
 b/lib/test_ratelimit.c               |   79 +++++++++++++++++++++++++++
 include/linux/ratelimit.h            |   13 +---
 include/linux/ratelimit_types.h      |    3 -
 lib/ratelimit.c                      |  102 +++++++++++++++++++++++++----------
 12 files changed, 223 insertions(+), 64 deletions(-)
