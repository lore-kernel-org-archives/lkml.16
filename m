Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437D217BA9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975103; cv=none; b=rgbSI1JxKpjxqM7pjV0s+o6AG/Jqw1p9XBsmssU8mXCw3O93S+cQWNvPLdIA5rTfF1cdoJvgDfBLk9SEQFT/AV4JpB0TVBYX8ciotj/Y5I1+cigL4B4HLiSacB4zPWzqFQaqbgR8a74EYc3cgLtvg1AMLiV1k6wag8vG7C80Elk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975103; c=relaxed/simple;
	bh=zfMN+OuWOiL6b7Mc0kTwoXJkTCxc25MaAuv8otuWUvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dylqb0sUiUvSxmaaNATZED2f+81eb8k5aJ9imXmF1Z7TlYimSkqPc7QJa85SpKazHbuJPxIHfV6ay803pEfleIsoUtagBjmWed66ir5JMuZZsZsH4Afe1ZXgJ0gqImzJp8HD+OhSlLYq+9jPt/DuyCvum8jNv7vrPhCNIdnU5xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hn3izpPU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hn3izpPU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2445C4CEE3;
	Wed, 30 Apr 2025 01:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745975102;
	bh=zfMN+OuWOiL6b7Mc0kTwoXJkTCxc25MaAuv8otuWUvo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Hn3izpPU4vOovFUK/F2h5pSByQq/JfdnUb8Zz0UQ3uQpyVJw4iAOn7Cyip/d9yML4
	 i4dCC2Mffrt+zo1vpw5fCDmMXKw6uDE3ORIAsMEnzs8iu01XeGoZcwjEs0qLwHyzk7
	 e6Exhy/98dLsYC54wtQB9kmr978nQqA1hknSzAwrYWDSG1XBcIYx0sIacztxOhCW/z
	 rq0mnEH9Js97Jy3hdSUMbId2ibJcToRezlaci6RRdS483noBOXPzYoCkTvv0/KFccG
	 pCIY7hepDHAM6vx6BmPPQQii0WwoyHRHlmRXBRucXP80t4PiSB14S2r6yr02ZzaklF
	 ovv6mHA7+4Z4Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A8C9CCE077B; Tue, 29 Apr 2025 18:05:00 -0700 (PDT)
Date: Tue, 29 Apr 2025 18:05:00 -0700
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
Subject: [PATCH v4 0/20] ratelimit: Reduce ratelimit's false-positive misses
Message-ID: <b0883f20-c337-40bb-b564-c535a162bf54@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
 <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
 <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>

Hello!

This v4 series replaces open-coded uses of the ratelimit_state structure
with formal APIs, counts all rate-limit misses, replaces jiffies=0 special
case with a flag, provides a ___ratelimit() trylock-failure fastpath to
(almost) eliminate false-positive misses, simplifies the code, and adds
a simple test.

The key point of this series is the reduction of false-positive misses.
More could be done to avoid open-coded access to the ->interval and
->burst fields, and to tighten up checking of user input for these fields,
but those are jobs for later patches.

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
 12 files changed, 246 insertions(+), 104 deletions(-)
