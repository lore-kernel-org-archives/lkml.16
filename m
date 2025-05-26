Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A32342A87
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 04:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748234995; cv=none; b=Vta4R964XdM9gOiQ64TKFPRj7mNaFX/+gBGkWf2vP8aFt2b/BIVM0naaJ5ZzqCDA/kN+YXGTTHK1MFM8tiHQ3bva5z5rDvCDOQnykJzSt3PXkSl+Pw5ri4BqWXDfmLVjIQaHVIhnCveaVbTuFja3Rcq/ZciFHGn9qRRePkIsdqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748234995; c=relaxed/simple;
	bh=w0TWMSCDauYIcpJKBkHdjolMi+Jf1VbAxv9pGoz7wIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DIl6xlzMn+im8hKiODHlikPmcC9ZrsYVMVaz3ZzqCs0jxUqT1aeHS47MIMkbx0vkgop/AS5thwaQvr3xyyc1ul2xDcL3GRsoms0HwMhRzMNXVAKHxpXdD496YA4maPia5DgmaYOwXarD4GMgxB8/C/pm4ZJRMQTFEJarGyqmnIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ely3pplg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ely3pplg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0734C4CEED;
	Mon, 26 May 2025 04:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748234993;
	bh=w0TWMSCDauYIcpJKBkHdjolMi+Jf1VbAxv9pGoz7wIM=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=Ely3pplgsd3lyfVOnrZRGGCAR4LlPtY3UPnYfbRrkVsH/9+BQfgy4mSKlLEeKwf3b
	 VGb7BZ7Ces08rHDWUt/x0issbtqXeKrJ9MQBtMW/CsJxMdxuncKx9cEnP0HA1n+oF6
	 23LIRcOu7N/oxiH8emZMLzlERx470FtYkPNM5I/+1iUk8KunVMr43Io0khVrmXxjbq
	 Yvn/oCTZA6wUxBXJH2s35X7oEOF/A715TLEaDfjJLzoI71vXZNpmGsdYbf4wGx7TNw
	 AA9WAbjKgg12djq13bgyXBhtQY8hmIViuaGqPww/sEMUIOPclNPJ+tYsJckz/Gj+Y0
	 8Lzs9QRliA1wg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6E86CCE0854; Sun, 25 May 2025 21:49:53 -0700 (PDT)
Date: Sun, 25 May 2025 21:49:53 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, pmladek@suse.com,
	akpm@linux-foundation.org, john.ogness@linutronix.de
Subject: [GIT PULL] Rate-limit changes for v6.16
Message-ID: <c4547cbd-d38b-4b50-92b1-0f3f717a7979@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello, Linus,

When the v6.15 merge window opens, please pull this rate-limit update from:

  git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/ratelimit.2025.05.25a
  # HEAD: ba575cea29fd82a0e6836fefcd51db36f1ff8a92: ratelimit: Drop redundant accesses to burst (2025-05-08 16:13:27 -0700)

These have been subject to -next testing for more than a month, have had
five LKML postings, have been featured on LWN, and with one exception
have a full set of acks.  That exception is this:

48e864ae8657 ("random: Avoid open-coded use of ratelimit_state structure's ->missed field")

The change from this series is function-preserving and is incidental to
the random subsystem, but is necessary to the series, which is in turn
needed to avoid silent and false-positive drops of rate-limited printk()s.

----------------------------------------------------------------
lib/ratelimit: Reduce false-positive and silent misses

Changes
-------

* Reduce open-coded use of ratelimit_state structure fields.
* Convert the ->missed field to atomic_t.
* Count misses that are due to lock contention.
* Eliminate jiffies=0 special case.
* Reduce ___ratelimit() false-positive rate limiting (Petr Mladek).
* Allow zero ->burst to hard-disable rate limiting.
* Optimize away atomic operations when a miss is guaranteed.
* Warn if ->interval or ->burst are negative (Petr Mladek).
* Simplify the resulting code.

A smoke test and stress test have been created, but they are not yet ready
for mainline.  With luck, we will offer them for the v6.17 merge window.

----------------------------------------------------------------
Paul E. McKenney (17):
      ratelimit: Create functions to handle ratelimit_state internals
      random: Avoid open-coded use of ratelimit_state structure's ->missed field
      drm/i915: Avoid open-coded use of ratelimit_state structure's ->missed field
      drm/amd/pm: Avoid open-coded use of ratelimit_state structure's internals
      ratelimit: Convert the ->missed field to atomic_t
      ratelimit: Count misses due to lock contention
      ratelimit: Avoid jiffies=0 special case
      ratelimit: Allow zero ->burst to disable ratelimiting
      ratelimit: Force re-initialization when rate-limiting re-enabled
      ratelimit: Don't flush misses counter if RATELIMIT_MSG_ON_RELEASE
      ratelimit: Avoid atomic decrement if already rate-limited
      ratelimit: Avoid atomic decrement under lock if already rate-limited
      ratelimit: Simplify common-case exit path
      ratelimit: Use nolock_ret label to save a couple of lines of code
      ratelimit: Use nolock_ret label to collapse lock-failure code
      ratelimit: Use nolock_ret restructuring to collapse common case code
      ratelimit: Drop redundant accesses to burst

Petr Mladek (2):
      ratelimit: Reduce ___ratelimit() false-positive rate limiting
      ratelimit: Warn if ->interval or ->burst are negative

 drivers/char/random.c              |  9 +++--
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 11 +-----
 drivers/gpu/drm/i915/i915_perf.c   |  8 ++--
 include/linux/ratelimit.h          | 37 ++++++++++++++++---
 include/linux/ratelimit_types.h    |  5 ++-
 lib/ratelimit.c                    | 75 ++++++++++++++++++++++++++------------
 6 files changed, 98 insertions(+), 47 deletions(-)
