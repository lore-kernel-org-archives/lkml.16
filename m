Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ED123644F;
	Wed, 21 May 2025 21:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863695; cv=none; b=tNw32VdK1AA0lHQO1bu1FJwhFUkBRMCK3A4r9PU+YsGkcMUX7UCprl6qyb5z0SIZizL9vju19SRl47tn/2EmOn7o/efCxUfFXaXX4uTRLAxDgEil9e7aj3e8E7RpJIH5+Kme6diHiQxvAbG04FyHNI2vS/llu+hS5ZvrzhB+OII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863695; c=relaxed/simple;
	bh=8OLj8iWS88tWpahud+rm64c/tzy6W4fGh7sn1WqC2d0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EATM7JqDSXM4VgGmmd3R3V0Ymtppap7xTor+p5mx/NolVpOeB8GlGXOxn6dogRsS3kGSAQixGKN0nGhqAaUP+cG5Rsf9BEJrVuCyyNbR1ts/8wbUaKLoBoxB5ddQ1KJqtfUXTcysahyf2RDD9XGyC4LcGv4wBosOFiaf4n1CWng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rntB5nRH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rntB5nRH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390F7C4CEE4;
	Wed, 21 May 2025 21:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747863694;
	bh=8OLj8iWS88tWpahud+rm64c/tzy6W4fGh7sn1WqC2d0=;
	h=From:To:Cc:Subject:Date:From;
	b=rntB5nRHtlkMAqbe7bie668OccmsNVLvxvB3t+FFbB7LUJAnXDC97tqfpH4OIY0K8
	 27Dm/Xu5z4lwz7qWQxgKvtptB2n0biIgFGpOR3HusOftokCjlnZw7Z3FpNu7V50O6p
	 GGsxz3ME8SBf7UHjP1xWDty7rv0zvXIhBaueFXFe6QKdFmxJcBf8D4kJujXWH1H666
	 xn3YDXlW/gll5Y//LnRBvYeD6AVRrWW4zbjV8rkKJ3v1s0cJ2K/Znc2fdM2hHAT5JB
	 lkelQG9lUZwRPFtevPDuv0tgS+1Uk2U4jShRbT5IiS8Bp8Eu+dOpo5IBk896AQKXqi
	 EjrZ37I8/Y99w==
From: Stephen Boyd <sboyd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v6.15-rc7
Date: Wed, 21 May 2025 14:41:31 -0700
Message-ID: <20250521214133.1193304-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
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

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 6a56880562d470b7bbdd1d955ff3fad4ad73a74f:

  Merge tag 'sunxi-clk-fixes-for-6.15' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk-fixes (2025-05-17 20:46:38 -0700)

----------------------------------------------------------------
Fixes for some SoC clk drivers:

 - Define the gate clk for the OTG PHY on Rockchip RK3576 so the nvmem
   driver actually works

 - Initialize clk_hw_onecell_data::num before accessing the 'hws' array
   to keep UBSAN happy

 - Fix a perf degradation on the Allwinner D1 MMC clk that was making
   things half bad

 - Fix the Allwinner SNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT macro to have
   proper order of arguments

----------------------------------------------------------------
Andre Przywara (2):
      clk: sunxi-ng: fix order of arguments in clock macro
      clk: sunxi-ng: d1: Add missing divider for MMC mod clocks

André Draszik (1):
      clk: s2mps11: initialise clk_hw_onecell_data::num before accessing ::hws[] in probe()

Heiko Stuebner (1):
      clk: rockchip: rk3576: define clk_otp_phy_g

Stephen Boyd (2):
      Merge tag 'v6.15-rockchip-clkfixes1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into clk-fixes
      Merge tag 'sunxi-clk-fixes-for-6.15' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk-fixes

 drivers/clk/clk-s2mps11.c            |  3 ++-
 drivers/clk/rockchip/clk-rk3576.c    |  2 ++
 drivers/clk/sunxi-ng/ccu-sun20i-d1.c | 42 ++++++++++++++++++++----------------
 drivers/clk/sunxi-ng/ccu_mp.h        | 25 +++++++++++++++++++--
 4 files changed, 51 insertions(+), 21 deletions(-)

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
