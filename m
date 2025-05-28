Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F352D052
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748430027; cv=none; b=thW7fXp3qukFWN7oizm+huXLVWGme8jBOg+/7yOep17pd4hBvl6dQTIuq7KeDSGi021cg1BM5OyIxmy0pN8XNrCR0MxxWA2jTcsqFC+iQec9AlaHKLLDCsARTlVw2Rj/dPGo/lPQrLaQenPSmlNyI/BFKMFLbEZtXfnKv4OcQqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748430027; c=relaxed/simple;
	bh=ChHIHbrN8cV+tmAKkJBkWfVAyz42l5U2q4BKrGql8UE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ntlDRgteRTCXTYoRO8fkQAO1m9gfIQ1XpTgo0zRXNwhd9IGP/2qG2UHrmD1rx/xd7Dpvk2//7Vv49B5TtiPH7w6iT2BJdp17iapmrGk4s4/K3bHGGmqPgyKRhlJ6knE+wdOyt1BREM4wuYKzz1RZ+W0VuiKD04bAdS3KQ1nNL/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2/qrETN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2/qrETN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 984B7C4CEE7;
	Wed, 28 May 2025 11:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748430026;
	bh=ChHIHbrN8cV+tmAKkJBkWfVAyz42l5U2q4BKrGql8UE=;
	h=From:To:Cc:Subject:Date:From;
	b=R2/qrETNXisA8gRQnv8veqZ0sR0CVTfxCZ3zxPubWjuLDsCanSE9JzhjmHIFlB0fS
	 ocV+6XOpMDqqa6jvvWbgcvVW/7vX9mGskkxTG5XNakN6UkJYxrCmxfdMNmXXkuRkCk
	 vslvhD6/VWSNzvF8PmuMUJXwFe2pGYOA1BZwyrw2meim2pyFz4ouK5XO7UsF02hGPv
	 INWDHpFIWAPYqG14QVv0oiwjhQrLsUayGP5dJ04JfwK7IjYBT7J4bKbfsRqlyJHhjE
	 Riba1k+BY55+mVlrpKl9HHGWE7kadMSoURPdm188PjMgz3ivpPmT/kIMurRKVSfHeD
	 6sEupWqH5sVZA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: torvalds@linux-foundation.org
Cc: dinguyen@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] nios2: updates for v6.16
Date: Wed, 28 May 2025 06:00:24 -0500
Message-ID: <20250528110024.19319-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git nios2_for_v6.16

for you to fetch changes up to aa264d9511aa5befa28cf8d9f32fce78fcf1a773:

  nios2: Replace strcpy() with strscpy() and simplify setup_cpuinfo() (2025-04-24 17:30:01 -0500)

----------------------------------------------------------------
Simon Schuster (2):
      nios2: force update_mmu_cache on spurious tlb-permission--related pagefaults
      nios2: do not introduce conflicting mappings when flushing tlb entries

Thorsten Blum (1):
      nios2: Replace strcpy() with strscpy() and simplify setup_cpuinfo()

 arch/nios2/include/asm/pgtable.h | 16 ++++++++++++++++
 arch/nios2/kernel/cpuinfo.c      |  5 +----
 arch/nios2/mm/tlb.c              | 18 +++++++++++-------
 3 files changed, 28 insertions(+), 11 deletions(-)
