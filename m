Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A871F4C85
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748255397; cv=none; b=oWdLMjk4IRMPFoSrOeJcnwbTBs46p65Fv2TnIq5E5dCcQX5BKNcRufAGmVKgi35Ctol4bahIwQ6A/JHgwuwzmTNz+XZ8uQK7jjm/f5Qlw+535zq0cYr1tJ2W6Ct+8UxKMVLqVaYx7FW5KNgTAgXfdJhJNCAIN2hOWgW9BcwAFdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748255397; c=relaxed/simple;
	bh=KwbejstSuPhbpux8wc9OLIeIvdw2y6HLRSfiByOQmIg=;
	h=Message-ID:From:To:Cc:Subject:Date; b=i0PvOsFKFP1RyTIo3JojuU/J4FgZowQiV1rqMlYDhz15qNKS9doo3F1vD5fCa+1xwFSMXOo5dRaK9k1VxSkVF5R7S69KHS18mop4YcEfdzmjfeeXuuyd2c8Dvo8EMC/XmnOcMDusSa3NwsAdPlju+JhNlH9CwIl73F9pTx4Bz7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqgr3npV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqgr3npV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650B6C4CEE7;
	Mon, 26 May 2025 10:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748255396;
	bh=KwbejstSuPhbpux8wc9OLIeIvdw2y6HLRSfiByOQmIg=;
	h=From:To:Cc:Subject:Date:From;
	b=jqgr3npV5qLFxzBEo7k1CvUYrjO8NCg3eseb4eaenBuN7alfHxu+qFsEwSHoN6YSY
	 cKyK4KrdRSxfCjGs+UQDft1qMlqCmwsNP+H//GqlNf0pOR7eTsHWgTppntAk8Mt43H
	 zp3HnU8ATbIcb0wjzCmkTz4Tjeb/m0cryAhDvCHVaTj0KtdL3A8zObmoH1E2ypZIwP
	 r9Rm1UDSX+0hDtSBIzNNHIMhzAQkt/pe5m8k80JjQSiq+vMtzR+CaTurDDJzAEUfrR
	 LJ4++SStLJTPUQZjXYJ9m2KiYhN3hIrxDgJmuqHdBnGZMrvVkRyOpG8DlOtoMMWF0/
	 ufT8UGveTssSg==
Message-ID: <4d6be2993d367094dcf8e574ee49b317.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regmap updates for v6.16
Date: Mon, 26 May 2025 11:29:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-v6.16

for you to fetch changes up to 1c12fbdf40e17df2efc24bf2009a0c3bfa75bfa7:

  regmap: irq: Add support for chips without separate IRQ status (2025-05-22 13:11:50 +0100)

----------------------------------------------------------------
regmap: Updates for v6.16

This release we have one new feature, support for chips that report edge
interrupts but don't provide distinct readback of that status per line,
plus a few cleanups.

----------------------------------------------------------------
Andrew Davis (1):
      regmap: Move selecting for REGMAP_MDIO and REGMAP_IRQ

Andy Shevchenko (1):
      regmap-irq: Use dedicated interrupt wake setters

Mathieu Dubois-Briand (1):
      regmap: irq: Add support for chips without separate IRQ status

Thorsten Blum (1):
      regcache: Use sort()'s default swap() implementation

 drivers/base/regmap/Kconfig      |   4 +-
 drivers/base/regmap/regcache.c   |  13 +----
 drivers/base/regmap/regmap-irq.c | 103 ++++++++++++++++++++++++++-------------
 include/linux/regmap.h           |   3 ++
 4 files changed, 76 insertions(+), 47 deletions(-)
