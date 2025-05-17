Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278E18460
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 13:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747488414; cv=none; b=d0W6k6ebCnW3WJbDnREZ44gCoPqMbcl5IO2KOe+6W6uktcrTl0fP6pkWp2ybkZwaNva6yxX8qtvfx1nbOC0F5suqSFWHxGg4jomqLXxdy7UEMpAuiguihjIxryq0Vfbtfto8rl6ycbkIS+T+j60BSglt3g77tEqlMrWXOb4F9tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747488414; c=relaxed/simple;
	bh=9f6rpDLNDq8TnGL+S9aBzNsULsBOv7T4OOFbMZltUt0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mKpjf6gCyrzcFi7eatTjTNi/kMeD6rR6AZmP6yg3TXxe1LkenmKZgd7Bv0A5VzjcKctwj4hRQEuy4tSJqBo7g0ZhR4FYWItxBwo933wyzoOWOl/ipcn2lV/vPXsQSLJscZegDCSEgBF7D8SAjR8iXPqDBKJv4+jmgILOyqS3sVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCUKhpqI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCUKhpqI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231D8C4CEE3;
	Sat, 17 May 2025 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747488413;
	bh=9f6rpDLNDq8TnGL+S9aBzNsULsBOv7T4OOFbMZltUt0=;
	h=Date:From:To:Cc:Subject:From;
	b=dCUKhpqIP2szUDzw016Avd7Z+A6+1nrqMqOZl9OFYpqQBgTitltzAAhwEvbTve64N
	 f5lDyFMjQiC/MBm5XBeTmNjuEoLI4r2z8bmDCFbMxxkNDiCe1NK5BZSUw92fSWfw8d
	 S+VDm923xILKRCOcOjyoletsrn9lVhc/7s6A1y4iPZxZkwCA6hlhhY5mF4zwkhXS9l
	 ADOlEMNaJZ3KrM0wcpffDAmpSZCkMiaN1j8vyNvWBA4CYDkzUGLQT2HcPEB5hNW/09
	 20dEnJE9GKGRbs3FHH4tMAu4DbiSXk6a377nT3FK4dJcWG7I0xtYKqEPlPSYvClWDx
	 UIidLFCGGjJ5Q==
Date: Sat, 17 May 2025 15:26:48 +0200
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
Subject: [GIT PULL] perf events fix
Message-ID: <aCiOmGAbtcGdc2VC@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-05-17

   # HEAD: 99bcd91fabada0dbb1d5f0de44532d8008db93c6 perf/x86/intel: Fix segfault with PEBS-via-PT with sample_freq

Fix PEBS-via-PT crash.

 Thanks,

	Ingo

------------------>
Adrian Hunter (1):
      perf/x86/intel: Fix segfault with PEBS-via-PT with sample_freq


 arch/x86/events/intel/ds.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
