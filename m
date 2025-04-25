Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BA181E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540864; cv=none; b=RRtpz3TgaWi9BULQYyPbZLtWyHYMhpZL1COQvUFgzaqhDsIbx/T8weTGXVqnAgrJ8plLB4HfgXaOZmVArqGd3AftS1C9P6o4PAjhOM2F3HJpmuIJgmDN5m0Iiy9rDnN2+enoc2VIR76UxC74/vkIsqtfuB9pzLMhquHBQNVwXQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540864; c=relaxed/simple;
	bh=6v2Q0mfNxIz0tbJ8FTrJMdjnv2wJIGrsaUOtTS4lgRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJgR+7vtrIAGEa35c7cC9CPRoMCKfxteRsAR2ii8UGt4qgzAaOJKUBWtpFnnNrovKli2RwlyhajbPlEIACN3ZxtyNanpJQl4bHSKfn84wStyW094rmY9Fe7rn+/woRSt4/IhnM0ljYFX0VlEjK/AkesAc9EoyH8gUtPESTokSSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=spnGVQ7O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="spnGVQ7O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D754BC4CEE3;
	Fri, 25 Apr 2025 00:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540862;
	bh=6v2Q0mfNxIz0tbJ8FTrJMdjnv2wJIGrsaUOtTS4lgRE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=spnGVQ7Oh4b8/adVcDlnzT+RRsJpCbuXisUW7G5tx5lNyu3E0cvm1JERl1YOxCvuY
	 lBlUYmeIWViKRQ0L3OSZEd27dtLhv7yfMydatNlVVRD3id4evk73jIqq04Jwg8MVfZ
	 LYGGSvsLbTbmZSW0zg04f56KhUhE6GydnxKX16i/7OulScDmGM1vz7FDpY4cXCx+Oh
	 xWlJ3hx1dNnKFh1MatGrV273JstQQn1tV+L73W76yaqEzcEFFOjGajV+6zD6XfuS1k
	 8QQ9kvq/kwsUXvqrl8eCpUwsUZcH+97eHfRnY32ikKi1dzt9W82gL/IbBWbuVIpvzo
	 r4hLkCcOotK2A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7967FCE18B4; Thu, 24 Apr 2025 17:27:42 -0700 (PDT)
Date: Thu, 24 Apr 2025 17:27:42 -0700
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
Message-ID: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
 <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>

Hello!

This v3 series replaces open-coded uses of the ratelimit_state structure
with formal APIs, counts all rate-limit misses, replaces jiffies=0 special
case with a flag, provides a ___ratelimit() trylock-failure fastpath to
(almost) eliminate false-positive misses, simplifies the code, and adds
a simple test.

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

15.	Warn if ->interval or ->burst are negative, courtesy of Petr
	Mladek.

16.	Simplify common-case exit path.

17.	Use nolock_ret label to save a couple of lines of code.

18.	Use nolock_ret label to collapse lock-failure code.

19.	Use nolock_ret restructuring to collapse common case code.

20.	Drop redundant accesses to burst.

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
 12 files changed, 246 insertions(+), 104 deletions(-)
