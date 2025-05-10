Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66932E401;
	Sat, 10 May 2025 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863616; cv=none; b=LQDaipmeXuiXlbV0BWEyebGK7cLQg0zweXHjVjLCZoXNu7L9ixa6wIKxHye+Ttp9zUirkh0/xmYAIPQWEOSDnwgXTTePNQtYPW9aQlRXZvfOXq6MVi3AkMFzK232Ca9YPq3CEL9HLQIH6vex7MIXHkPkWhD63wipuAIOOu9H0hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863616; c=relaxed/simple;
	bh=oJREma6J7hcfGwjgy7lv6qM1wLUpD8zhJ0GVqc+khVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bM7ggkOMxc9iExoQgPWlC+a2L7213ZaLi1pJLF/m/NHS8XfEcfyWO1rZSYRFYFlFpBItVPIC3Aay8mKBMWGCxNM/WputfwD/WdTk3sw5JuYx0M5DKuwBM8uPPr9y4Qem57Hhj9t0cp5otRPT0WoURiLAcjHrDYqrCUuzgd51yNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Zh74CPPy; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Zh74CPPy"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 194F525F3D;
	Sat, 10 May 2025 09:53:25 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZGqBqejas4K; Sat, 10 May 2025 09:53:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746863604; bh=oJREma6J7hcfGwjgy7lv6qM1wLUpD8zhJ0GVqc+khVo=;
	h=From:To:Cc:Subject:Date;
	b=Zh74CPPyoh9D7+lMgkqcxGni/Ama8qPHgkp8CW+MExpCgEMsNOSSq3jguj6UXSYWS
	 +GoYIvBxE4/jSnPisVLioL85+YADSekcrJkBZnhZxhR+XdMSCbWLHcTD0nYhMvvs/K
	 8XkNsERLGrZiWogGnos3dEi4+tedx6iFBsCPEEFBq2F4/7uE88ijMSJAdWy4o6Bb0n
	 dFql4uNyHQnAIGgyQDNeZ1jKb+ayS7oItIULNv25AwJ4qa5VH7Q7XWXooXN04aBiyA
	 DVW9ZjDp2EYcJznABxckPHr4meR5pN9gRASxxXIw7syioHbpcC4759kLhCyT4iADKO
	 PRSSA3DIuankw==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] clk: rockchip: Pass NULL as reg pointer when registering GRF MMC clocks
Date: Sat, 10 May 2025 07:52:49 +0000
Message-ID: <20250510075248.34006-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects the type and suppresses sparse warnings about passing
plain integers as NULL pointer.

Fixes: 621ba4d9f6db ("clk: rockchip: Support MMC clocks in GRF region")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505100302.YVtB1zhF-lkp@intel.com/
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/rockchip/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 43d7ed5c3418..805ab4a6f7e0 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -622,7 +622,7 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 			clk = rockchip_clk_register_mmc(
 				list->name,
 				list->parent_names, list->num_parents,
-				0,
+				NULL,
 				grf, list->muxdiv_offset,
 				list->div_shift
 			);
-- 
2.49.0

