Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D986EB79
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 21:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744319433; cv=none; b=fp4VWMT/ceaNZ+OuPxmJ0feqG0fQ8YX0fvZ1o6k7wM2kx2yOG3kZd+MWbZuzIhO8UC9our6Q/SJsu1gdaURXQ02udwANg7+6Pscj2hh40A3z5l8VUr4MzWM2CFIUMxfETHNKOKVgO9X2y9ZmdexgNb+T3wN1+xCXMSEWUDkT50I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744319433; c=relaxed/simple;
	bh=nX/XY/7M0evAeESRUbCYSex7ErwkxlGQcKzihfIyV7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mchMLFo0eUepOQzkIVh+k9CkFCRq0gEe20COwIagfRSssrgai4oF605ZdOiw6VjoljVMO9AOHt7uR1Il/p3XUW7Iva7Plp7i+sJNx4O/gYOC4OnvUGkCsP/zB6VSuHG9ZiDQrNuMW4qLiwIvcjdP5zW9iSObX6JTMIMwjGlBFFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGEbs+ix; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGEbs+ix"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4180EC4CEDD;
	Thu, 10 Apr 2025 21:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744319432;
	bh=nX/XY/7M0evAeESRUbCYSex7ErwkxlGQcKzihfIyV7o=;
	h=Date:From:To:Cc:Subject:From;
	b=oGEbs+ixXOgTh1S3TJZ4jaf6yu0vmk/XtFtF4fvaZFLo9yv26TMdLhS7vVK3sb67x
	 btj3CJ+k1KPU6NXW5XkE/lZt/ijC/6cCWWkqNRrTLjTna3fpQL+OpKnn6rlilnLrPA
	 DHryg6TlJT25GZ2Q9ihA+zKKOK62LjKVLBwKrhGlmHRpbhQDjZ4rnG9LB8zTxZcQRG
	 K4fFrQ8+aYm2D0HRgUW7U3QCOW+Inp+xzaSLtyyZcDnDzTYKwFLP64JhoMhqO1+Jox
	 Z+igy+KneYUFzXEyFNLXNN6RuOXh3Kd64MOhxg6fKFxQKe1rR1BAluYyrVp6EciRky
	 0Fq5zTNU16blA==
Date: Thu, 10 Apr 2025 23:10:27 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kan Liang <kan.liang@linux.intel.com>
Subject: [GIT PULL] perf events fixes
Message-ID: <Z_gzw9spHIqTdVG0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest perf/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-04-10

   # HEAD: 56799bc035658738f362acec3e7647bb84e68933 perf: Fix hang while freeing sigtrap event

Miscellaneous perf events fixes:

 - Fix __free_event() corner case splat

 - Fix false-positive uprobes related lockdep
   splat on CONFIG_PREEMPT_RT=y kernels

 - Fix a complicated perf sigtrap race that may
   result in hangs

 Thanks,

	Ingo

------------------>
Andrii Nakryiko (1):
      uprobes: Avoid false-positive lockdep splat on CONFIG_PREEMPT_RT=y in the ri_timer() uprobe timer callback, use raw_write_seqcount_*()

Frederic Weisbecker (1):
      perf: Fix hang while freeing sigtrap event

Gabriel Shahrouzi (1):
      perf/core: Fix WARN_ON(!ctx) in __free_event() for partial init


 include/linux/perf_event.h |  1 -
 kernel/events/core.c       | 70 ++++++++++++++--------------------------------
 kernel/events/uprobes.c    | 15 ++++++++--
 3 files changed, 34 insertions(+), 52 deletions(-)
