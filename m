Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB72136E37
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 22:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743633920; cv=none; b=I4E7qDTJ2SFlBUArT4SMmfN3Cn4+W0kiFM0I5RQZTmc9NVacy4jyxVucse8iGjyWzOQjotdFRn6RCaP1lSdaGKWHcoRJnYmwYLd7raUjGUmKkieuMoc0PhNES2Kq62oC9mhgGGr1HFjukwKD7hs45IiggAP7pDDp80lyJJDyHDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743633920; c=relaxed/simple;
	bh=rEhdG88pccJsY3daYqUpsk6LhRDaIQ/aRTXy6KDMmAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nbWkHGxRQNlDId9k18k6lCgd3eXF4vy/7LyPn0Xy6oentL+kzio7Ek+4M2L4ALaxbL6Vqt4DlIEThIB4A5gDGqVO228nKlCccfoE9/mhiSfbcc+nqMlAYurVg5l1VdLjgU+lSeZ0U8KPYQ1DEFlkLqG/x96wC2sGPwwI8Y4kxEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TstdTvfk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TstdTvfk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC10C4CEDD;
	Wed,  2 Apr 2025 22:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743633918;
	bh=rEhdG88pccJsY3daYqUpsk6LhRDaIQ/aRTXy6KDMmAA=;
	h=Date:From:To:Cc:Subject:From;
	b=TstdTvfkUiMlY1TWqKzj3oWJGiRtuamSIG8phgBiM4QboPm/zraDPs4zJCbQyMBSV
	 UzTnDu9Dkw0ExHBrDPJknpdLAElRHpLQtSmhXUlMq8FgpGiKZK7OiLWFHG9LUVYrEE
	 DiLhD02NP8xwNJMMnfHf3e2F80aJAkbQ+O3pX/nusIaG5MgvHPNtrjyGyqUHdXXl3Y
	 hYbLbZbPABfCsr1oR0m8EK/f8mWZW3wa98+AU5shCuRZJeqonCHqxFQwk2Bmck4ekL
	 QNfepGOD1VjigIZX9V58EOdFaTmY80bxaG9XfxraaEbAyU3OXHXYcTn/ZyZzYDweBN
	 4ZGFqxy02iw4A==
Date: Wed, 2 Apr 2025 12:45:17 -1000
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: [GIT PULL] sched_ext: Fixes for v6.15-rc0
Message-ID: <Z-29_RUhhuUhGLiv@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Note: Trying sending out accumulated patches sooner even during a merge
      window. If you don't like it, please let me know.

The following changes since commit f6e0150b2003fb2b9265028a618aa1732b3edc8f:

  Merge tag 'mtd/for-6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux (2025-03-26 10:28:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git/ tags/sched_ext-for-6.15-rc0-fixes

for you to fetch changes up to 2bac648dab395be0ad0d55b9c2ae7723e71e233e:

  tools/sched_ext: Sync with scx repo (2025-04-02 09:08:33 -1000)

----------------------------------------------------------------
sched_ext: Fixes for v6.15-rc0

- Calling scx_bpf_create_dsq() with the same ID would succeed creating
  duplicate DSQs. Fix it to return -EEXIST.

- scx_select_cpu_dfl() fixes and cleanups.

- Synchronize tool/sched_ext with external scheduler repo. While this isn't
  a fix. There's no risk to the kernel and it's better if they stay synced
  closer.

----------------------------------------------------------------
Andrea Righi (2):
      sched_ext: idle: Fix return code of scx_select_cpu_dfl()
      sched_ext: initialize built-in idle state before ops.init()

Jake Hillion (1):
      sched_ext: create_dsq: Return -EEXIST on duplicate request

Tejun Heo (2):
      sched_ext: Remove a meaningless conditional goto in scx_select_cpu_dfl()
      tools/sched_ext: Sync with scx repo

 kernel/sched/ext.c                              |  8 +--
 kernel/sched/ext_idle.c                         | 12 ++--
 tools/sched_ext/include/scx/common.bpf.h        | 85 +++++++++++++++++--------
 tools/sched_ext/include/scx/enum_defs.autogen.h |  3 +
 tools/sched_ext/include/scx/enums.autogen.bpf.h | 24 +++++++
 tools/sched_ext/include/scx/enums.autogen.h     |  8 +++
 tools/sched_ext/include/scx/enums.h             |  3 +-
 7 files changed, 103 insertions(+), 40 deletions(-)

-- 
tejun
