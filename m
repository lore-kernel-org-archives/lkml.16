Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8019E8836
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 02:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748313451; cv=none; b=p0kkYyn9Zqb7KcQMpcgdq8H0Gs+t4J1+2npsEL7Jtxd1fTHPVDcYhA4i2nTMR7Grd1roloAR0txn5yof5EVGTd2hDK84i4WK/1nPKiRk/x4T30K1Mpu5sKEbsLlHw2S6DfX3nWnARhS6Lnt2kV6kD+Oprbkzio8YeWPM1A3RXC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748313451; c=relaxed/simple;
	bh=4a6lYNXhPM1HlLHeSGS9Gg60ZeWZNLWnGN8oC694dvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m19/kSLN66Shjo+4WYLYjfGP9bS5y8y8nuxH7r5mAL18zld7ZaP6rU1IeIXs1/blEJTyDJJKrZlK8En/WC5Aw6arc5j6/VdUngrl4wPNCak6YD/HemLcn4Kc2EWuaS3oo7zykyQ4TsKfqSCHHRfQfYXf/Z2DL0MiyoXG2hkH6MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCmzZUpL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCmzZUpL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5555C4CEE7;
	Tue, 27 May 2025 02:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748313450;
	bh=4a6lYNXhPM1HlLHeSGS9Gg60ZeWZNLWnGN8oC694dvc=;
	h=Date:From:To:Cc:Subject:From;
	b=JCmzZUpLh/eYvsdm/kO0l/XWBuPddHaUM422zR3Jz1Zjh4kf1AWabuTXz5BaMkDm3
	 EWCMUCndYAh9FtSBsSbD6ZB6BtZXSy+lbyVxQdorapb+CmAlFl380VnxsxST2zVkZd
	 8GymBaeewauVNzTH9otWD6LHNo20NM+orlsGlVyUWYqYOZRBIxIhRTcPGqIXtM10sO
	 z/vHTolZjaDinz8tAJHSNCYtUkFODtZdTF2YuGeP/WrQWP6QWpvWkVRsIeORNhrbCe
	 Fe6IILDLBf4abGTsE+f6G5XrDPoIVDkTh2rdNiaMoGrTDGjCSgUByXcFlQgKV1w7Ce
	 8k5Qquq6p4xVA==
Date: Mon, 26 May 2025 19:37:27 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
	Neill Kapron <nkapron@google.com>,
	Sumanth Gavini <sumanth.gavini@yahoo.com>,
	Terry Tritton <terry.tritton@linaro.org>
Subject: [GIT PULL] seccomp updates for v6.16-rc1
Message-ID: <202505261937.AFE76B5@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull these seccomp updates for v6.16-rc1.

Thanks!

-Kees

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/seccomp-v6.16-rc1

for you to fetch changes up to a9b33aae79cea2e55fd9204069a29b2e59f012a5:

  selftests: seccomp: Fix "performace" to "performance" (2025-05-20 13:16:39 -0700)

----------------------------------------------------------------
seccomp updates for v6.16-rc1

- selftest fixes for arm32 (Neill Kapron, Terry Tritton)

- documentation typo fix (Sumanth Gavini)

----------------------------------------------------------------
Neill Kapron (1):
      selftests/seccomp: fix syscall_restart test for arm compat

Sumanth Gavini (1):
      selftests: seccomp: Fix "performace" to "performance"

Terry Tritton (1):
      selftests/seccomp: fix negative_ENOSYS tracer tests on arm32

 tools/testing/selftests/seccomp/seccomp_benchmark.c |  2 +-
 tools/testing/selftests/seccomp/seccomp_bpf.c       | 13 +++++--------
 2 files changed, 6 insertions(+), 9 deletions(-)

-- 
Kees Cook
