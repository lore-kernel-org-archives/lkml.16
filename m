Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DC81C8623
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745264237; cv=none; b=FPxLB8pqWVDG6ulkFqtzflarcfUt21+dCzucFrd068W87Jj5LC7atEDS8paQnFELCmjSPQrj9zkZgFwdTh4HV4aeKnmCYe2+TJdfkqw+Guzzoa7UuzH9HkEWXBNu9a7/4Z0MlnjITM3/BbBSAVXW1+DYYX5Roj2CQUHUpM/Gmlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745264237; c=relaxed/simple;
	bh=Bn1JoHHTGRIDblEfBxf8rLWrwaHohDYwBpj5VjdSJ50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C//ehh763he2BZ/qF9tDbLWO8FgsAYhiqofFSqoYLcr/6GZEwaccXzcVjsi1o8zt8DX0ib5iYmoVXVpILdxXaQamyUGon69sL62/rvDs8Z7aIPte7e6KSCmEVImRyG8G89etiu9ba6tqFIYl8TQGWlizxvRhrppeNCF2hb8fb0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+fFDyN8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+fFDyN8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79200C4CEE4;
	Mon, 21 Apr 2025 19:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745264236;
	bh=Bn1JoHHTGRIDblEfBxf8rLWrwaHohDYwBpj5VjdSJ50=;
	h=Date:From:To:Cc:Subject:From;
	b=A+fFDyN8Z/TkVFGdPZb1ajDcOXHIc2QgTF5wR5oz63VQShyzDGBrR8yFmzl8s9f4f
	 hWts4VsAPP8obbKF9vG1v7cFOG/tXZYZOw+AyYy5JHa/htrctQ6OB7FZ4seOHr4EUz
	 1pwwLKvpVKiazcoUhOx3rocCTSiUsLmn35qM8seNcf6WUktX7bAA9lCPJKC2gVzAA6
	 TxB1BVr84hImGr69y1XmIkfLtQeuzvQzNdrZE83uFZxzM0Huld6lSPyOjrD2ii5LL9
	 Ar5ORxSYA6kf7xep/f3WR2gNo3wRR5OwMs6gVSI6iUajf3z/XauOmKc4bWA8ZU+EFq
	 CIi8LkYjmS4QQ==
Date: Mon, 21 Apr 2025 09:37:15 -1000
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: [GIT PULL] sched_ext: Fixes for v6.15-rc3
Message-ID: <aAaea_h3ORZGmkxp@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 4a1d8ababde685a77fd4fd61e58f973cbdf29f8c:

  Merge tag 'riscv-for-linus-6.15-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2025-04-04 09:49:17 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git/ tags/sched_ext-for-6.15-rc3-fixes

for you to fetch changes up to bc08b15b54b8aadbc8a8f413271c07a3f4bead87:

  sched_ext: Mark SCX_OPS_HAS_CGROUP_WEIGHT for deprecation (2025-04-08 08:53:52 -1000)

----------------------------------------------------------------
sched_ext: Fixes for v6.15-rc3

- Use kvzalloc() so that large exit_dump buffer allocations don't fail
  easily.

- Remove cpu.weight / cpu.idle unimplemented warnings which are more
  annoying than helpful. This makes SCX_OPS_HAS_CGROUP_WEIGHT unnecessary.
  Mark it for deprecation.

----------------------------------------------------------------
Breno Leitao (1):
      sched_ext: Use kvzalloc for large exit_dump allocation

Tejun Heo (2):
      sched_ext: Remove cpu.weight / cpu.idle unimplemented warnings
      sched_ext: Mark SCX_OPS_HAS_CGROUP_WEIGHT for deprecation

 kernel/sched/ext.c               | 50 ++++++----------------------------------
 tools/sched_ext/scx_flatcg.bpf.c |  2 +-
 2 files changed, 8 insertions(+), 44 deletions(-)

-- 
tejun
