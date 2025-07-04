Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9EF2877C2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751641630; cv=none; b=EdEpxbXPGKgZQ6KnuQL4jcuwZ9rnIYKtynmJZc2XcEiu3LXoROQWywfly/codBWgNhPfoqNprl8UXAopc3WBZXDlwYLTSUuXzmuS6WyL34hUnalkvEgjG6BdY+oVTbUaFqtKqUJwUvr4b8tFIL5bdznUfPOQwikRyaGwv9CwxSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751641630; c=relaxed/simple;
	bh=yeBbiQXP4X73con7+MWKTN/Hn8J9+0zpd+up3PexS5I=;
	h=Message-ID:From:To:Cc:Subject:Date; b=JITBhCsEw0Zkf3ciLZfSmZ1wXtl2grcWMdD9wRSgu4SVpI1UM3LoE0qKL1M+jkA2/ABfMWBwKrj7HEEiQo9jOrg3fi6VrQWJ29lOfmxS8tXLCDxm+opr+NRVxT9MtHRKwUuWMg1eDuz/ygvtKylXgDk7PET56yTPKxv6Dl8Zjrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbCCoh/A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbCCoh/A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C460C4CEE3;
	Fri,  4 Jul 2025 15:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751641629;
	bh=yeBbiQXP4X73con7+MWKTN/Hn8J9+0zpd+up3PexS5I=;
	h=From:To:Cc:Subject:Date:From;
	b=jbCCoh/ApFgyL6Vak7yTdUl2sZjaFDMGqZFoIgddTcYgN75IhqSdaUp8HBFlIjYhj
	 guFIxKE9qRBODySxsNpLx6ZGLo75JLQvVxJTxyB94i+M3IREuZyz7zI8/9KOF3mPEg
	 EKWFGFvrAGg0cOsNoalPDOTP0sbLtcr+rbL4tMcek6TqfXuJ9+nBoAdimAGo4vZcTh
	 pyiny2UI36xFNiWYOjXa/jEs+7K2EzFMCj94BKmESj461hoSi31qRdgAS42QO4yqxO
	 kuXtoCxtHC3ptkrGO4wGRfgNxb3b7GDJKam+Dv+4HKriquxe3Gb/NfMlO2LWtrunD1
	 ZNsv1KuSPb0Zw==
Message-ID: <29572e6de29cb03ebdf8b553a11a800e.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regulator fixes for v6.16-rc4
Date: Fri, 04 Jul 2025 16:06:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af:

  Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v6.16-rc4

for you to fetch changes up to c9764fd88bc744592b0604ccb6b6fc1a5f76b4e3:

  regulator: gpio: Fix the out-of-bounds access to drvdata::gpiods (2025-07-03 12:22:35 +0100)

----------------------------------------------------------------
regulator: Fixes for v6.16

A few driver fixes (the GPIO one being potentially nasty, though it has
been there for a while without anyone reporting it), and one core fix
for the rarely used combination of coupled regulators and unbinding.

----------------------------------------------------------------
Alessandro Carminati (1):
      regulator: core: fix NULL dereference on unbind due to stale coupling data

Jisheng Zhang (2):
      regulator: sy8824x: Fix ID table driver_data
      regulator: mp886x: Fix ID table driver_data

Manivannan Sadhasivam (1):
      regulator: gpio: Fix the out-of-bounds access to drvdata::gpiods

Shree Ramamoorthy (1):
      regulator: tps65219: Fix devm_kmalloc size allocation

 drivers/regulator/core.c               |  1 +
 drivers/regulator/gpio-regulator.c     |  8 ++++----
 drivers/regulator/mp886x.c             |  3 ++-
 drivers/regulator/sy8824x.c            |  5 ++++-
 drivers/regulator/tps65219-regulator.c | 28 ++++++++++++++--------------
 5 files changed, 25 insertions(+), 20 deletions(-)
