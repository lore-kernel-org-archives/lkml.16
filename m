Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AF11E8345
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 21:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195920; cv=none; b=gVbZKi0u/XlXJ50lqXOt+jHESr7DlIZjBeDtXvJ6wYnmAAFFvjjUQYRFJ0R0rkXbucTXLNVxNjgkMoSxANNCo3AoCpcPhDMnr7JlA0DTbZB2XUQR1adFPlS/fdnF2SF0QHMJJJMM9hoDAuxvg1gnSQyXw1+8FVAzXdanIjorOyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195920; c=relaxed/simple;
	bh=WEKHejMQupw5Pu9CB+ulHe0ux1RtpHLFxvTVJW3KU8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M5Wm6yUGbu5yXBfcOIoPb+P4WFmgFnSPbkxp4CfOz1/VgNYlKvxTEw8NvNrxS31Qt0XpYPfRzJYYAduInVjzs+S3UhLNsZoMknUzKAUVmC2F2sMMlSVF9BpBsZ8rTfkQiZa+a4G1a9CynKxiLLVApjS89S1UTrBIt9FDWNhNeF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dh0Zss3y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dh0Zss3y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA923C4CEE4;
	Fri, 28 Mar 2025 21:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743195919;
	bh=WEKHejMQupw5Pu9CB+ulHe0ux1RtpHLFxvTVJW3KU8w=;
	h=Date:From:To:Cc:Subject:From;
	b=dh0Zss3ydXm6wkdqX3wuMuO0mctcNwtjcdDKBDYOM3quageV/qFber9+7+peCNy0W
	 MDWIgm3+xwD1kCGalY2xwU2CCDZ3rPJLMvukArKFczmsskOikcxu6AdOYSjklZEu7g
	 CBZcTTNjAyaS59OLbCYZNGdwzDmnHN2cjsPMWC6nAC4PPMs8HN1IqJzLGOShEJEY4n
	 PmJ/oK05ZoGC71a8+sStCKWVozbFp8OU2XHRNVrgpK2RD4KDRmnB3DjpwjjYZ5LwWd
	 GnH1QLBB0/LOQsIrXFnuVClftHEz+hFMyP5sUHf1RgV2wEQ3t2+me3BkUa4lSEm9SO
	 ZnoWprCLz1IMw==
Date: Fri, 28 Mar 2025 22:05:14 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>
Subject: [GIT PULL] locking fixes
Message-ID: <Z-cPCnVX5oBwlug1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest locking/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2025-03-28

   # HEAD: 495f53d5cca0f939eaed9dca90b67e7e6fb0e30c locking/lockdep: Decrease nr_unused_locks if lock unused in zap_class()

Miscellaneous locking fixes and updates:

 - Fix a locking self-test FAIL on PREEMPT_RT kernels
 - Fix nr_unused_locks accounting bug
 - Simplify the split-lock debugging feature's fast-path

 Thanks,

	Ingo

------------------>
Boqun Feng (1):
      locking/lockdep: Decrease nr_unused_locks if lock unused in zap_class()

Maksim Davydov (1):
      x86/split_lock: Simplify reenabling

Ryo Takakura (1):
      lockdep: Fix wait context check on softirq for PREEMPT_RT


 arch/x86/kernel/cpu/bus_lock.c | 35 ++++++++++++++++++++++++-----------
 kernel/locking/lockdep.c       |  3 +++
 kernel/softirq.c               | 18 ++++++++++++++++++
 3 files changed, 45 insertions(+), 11 deletions(-)
