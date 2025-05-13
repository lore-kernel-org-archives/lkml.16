Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCC6125B2
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 00:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747097710; cv=none; b=Ra6Y/45C0JBJIpS+zxRzj539j/nAqaWiiMz3sG9SCAPpGg/SnowKqUUGBibA4EAbT8NZPsRacVPyUxIV+4t2gUzSPZJAEhWsSJjcmeMoGu/AItEOJ9g21sL6ljVHPI3VhK5DYGatG4M9tTRyC6Si2XuAXp/BfYHuO6OZ1ZGRcrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747097710; c=relaxed/simple;
	bh=vGzp9x4b4Fsi/J2pVJA34Wo7DZDlbFJ8oSXHJgd18x4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LNDvHsMX+3uOpkj67s/tOhSnQfHywHhvC3ufMYVP6tzuowomb6rgz1Qbnfn+9p9XmZ8Qx30Poc5Ilo53E5KSrnGlKATC8znUPgEQGXWWQIH7M/FuTBWh/LOjcY9zrxL1iurMzJbd+WtVwK9wQ9FCS9bdJotxMfgoCopywvrISkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0NYrpOO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0NYrpOO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7868C4CEE7;
	Tue, 13 May 2025 00:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747097710;
	bh=vGzp9x4b4Fsi/J2pVJA34Wo7DZDlbFJ8oSXHJgd18x4=;
	h=Date:From:To:Cc:Subject:From;
	b=K0NYrpOODAQmmrOrsK7Q21WJtxtDUR0CYGiUQ4A1FFQYax3Erbh0RMixoelyf9zJr
	 89zyCpvCMtdehSlo+uZwdfBEIwNjtV4e/t8ZKYMwuhShtSHt41PLKlMaQyS95nqWUx
	 qKzLQ+fyTLo6IGxzApzhprwV1CcImVwehjmk86wWiJj9v0UG7frV9FA8PSW33vXU8o
	 PgBB5hwbV/TSkDZDqKdL9OSiWzIGDwSDV75FTW5D7xMh5Y2Quy4rdPGTmUGvAKS/SP
	 GunAGMDkcMZyEyseSYDS/VHDk0Y8ZjcEd9ZMyGUPPIbQY4coAtqcQuifE45HvqbEIx
	 OFcuVZMVcpfIg==
Date: Mon, 12 May 2025 14:55:08 -1000
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: [GIT PULL] sched_ext: Fixes for v6.15-rc6
Message-ID: <aCKYbH3D3BYW8Hzy@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit bc08b15b54b8aadbc8a8f413271c07a3f4bead87:

  sched_ext: Mark SCX_OPS_HAS_CGROUP_WEIGHT for deprecation (2025-04-08 08:53:52 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git/ tags/sched_ext-for-6.15-rc6-fixes

for you to fetch changes up to 428dc9fc0873989d73918d4a9cc22745b7bbc799:

  sched_ext: bpf_iter_scx_dsq_new() should always initialize iterator (2025-05-07 06:24:07 -1000)

----------------------------------------------------------------
sched_ext: Fixes for v6.15-rc6

A little bit invasive for rc6 but they're important fixes, pass tests fine
and won't break anything outside sched_ext.

- scx_bpf_cpuperf_set() calls internal functions that require the rq to be
  locked. It assumed that the BPF caller has rq locked but that's not always
  true. Fix it by tracking whether rq is currently held by the CPU and
  grabbing it if necessary.

- bpf_iter_scx_dsq_new() was leaving the DSQ iterator in an uninitialized
  state after an error. However, next() and destroy() can be called on an
  iterator which failed initialization and thus they always need to be
  initialized even after an init error. Fix by always initializing the
  iterator.

- Remove duplicate BTF_ID_FLAGS() entries.

----------------------------------------------------------------
Andrea Righi (4):
      sched_ext: Track currently locked rq
      sched_ext: Fix missing rq lock in scx_bpf_cpuperf_set()
      sched_ext: Remove duplicate BTF_ID_FLAGS definitions
      sched_ext: Fix rq lock state in hotplug ops

Tejun Heo (1):
      sched_ext: bpf_iter_scx_dsq_new() should always initialize iterator

 kernel/sched/ext.c      | 191 +++++++++++++++++++++++++++++++-----------------
 kernel/sched/ext_idle.c |   2 +-
 2 files changed, 124 insertions(+), 69 deletions(-)


-- 
tejun
