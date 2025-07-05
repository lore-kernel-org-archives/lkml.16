Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2F31946DF;
	Sat,  5 Jul 2025 05:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751692860; cv=none; b=fqubtMnubwIRNevYmAqlpAGtEzZDKyOgQGQlYsgm68oTtXb1c+QlRRG44WmzCENmuViOM9VvaWNY60evxnJuYjMoNwhyEzqVbbONGlUcqQJL8WPQ8HNbz2PglTDgSFRvYpT/JF6X3jfzlXA1g18r7QDSOI7C2XbJSUDHAsc+x5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751692860; c=relaxed/simple;
	bh=0GwYxnGGoLNupxKVT8wRGKrtsp6rnrmBbWE444PArkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NIpizV3pVKf5WIIElU9jA9M8991Gv7dwxT4oZ6i7sMHJToGW7N2ae1rfawybb3RJUQhHalXjslW04vZntP4fC1oF8BJ5+T09k685EsflSKZ4baMtmUcde+eiNEWUlmMa/DEb99wAq1YIKDeYZEKs0mSULmUmRfRnM4hUprNLFss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=MSoVsqft; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="MSoVsqft"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 04A6B25E27;
	Sat,  5 Jul 2025 07:20:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWUZ7DIhG7RL; Sat,  5 Jul 2025 07:20:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751692848; bh=0GwYxnGGoLNupxKVT8wRGKrtsp6rnrmBbWE444PArkg=;
	h=From:To:Cc:Subject:Date;
	b=MSoVsqftLfTKwDshYxYI0jXrTommOflOBQCSgWjBsay/UVW6gFDoGsUCJ2S77+A0I
	 8OoR/n9G1M/9PEF2oVDX0XtRXk7dCp39mlKR3/SP/aE166xZjs86WCKbTFLYi/KuuS
	 GROa90cWUi3B9TAE68P15tFd1kJQJ2hTC1sQnEb37xcyd5tFiB7KR9Isaoil1g2jG3
	 ebjxMDD3wkMLBVFSWdoZvEPmTVtTxrVAUdQFa96+O+o535LLUaWq9F0K4uD1MmHtVa
	 Dy6EHq6K5zvxSyfyF3i5bAIwmB0hdRePI6UhE3uNILhqw0WkQzyjAw1ABK+9H3wQgi
	 MS9oKwPHpzr0Q==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH] clk: thead: th1520-ap: Correctly refer the parent for c910 and osc_12m
Date: Sat,  5 Jul 2025 05:20:28 +0000
Message-ID: <20250705052028.24611-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clk_orphan_dump shows two suspicious orphan clocks on TH1520 when
booting the kernel with mainline U-Boot,

	$ cat /sys/kernel/debug/clk/clk_orphan_dump | jq 'keys'
	[
	  "c910",
	  "osc_12m"
	]

where the correct parents should be c910-i0 for c910, and osc_24m for
osc_12m.

The correct parent of c910, c910-i0, is registered with
devm_clk_hw_register_mux_parent_data_table(), which creates a clk_hw
structure from scratch. But it's assigned as c910's parent by
referring &c910_i0_clk.common.hw, confusing the CCF since this clk_hw
structure is never registered.

Meanwhile, osc_12m refers the external oscillator by setting
clk_parent_data.fw_name to osc_24m, which is obviously wrong since no
clock-names property is allowed for compatible thead,th1520-clk-ap.

For c910, refer c910-i0 by its name; for osc_12m, refer the external
clock input by index. This eliminates these orphan clocks.

Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/thead/clk-th1520-ap.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index ebfb1d59401d..74da1a61e6f0 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -427,7 +427,7 @@ static struct ccu_mux c910_i0_clk = {
 };
 
 static const struct clk_parent_data c910_parents[] = {
-	{ .hw = &c910_i0_clk.common.hw },
+	{ .index = -1, .name = "c910-i0" },
 	{ .hw = &cpu_pll1_clk.common.hw }
 };
 
@@ -582,7 +582,14 @@ static const struct clk_parent_data peri2sys_apb_pclk_pd[] = {
 	{ .hw = &peri2sys_apb_pclk.common.hw }
 };
 
-static CLK_FIXED_FACTOR_FW_NAME(osc12m_clk, "osc_12m", "osc_24m", 2, 1, 0);
+struct clk_fixed_factor osc12m_clk = {
+	.div		= 2,
+	.mult		= 1,
+	.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc_12m",
+						   osc_24m_clk,
+						   &clk_fixed_factor_ops,
+						   0),
+};
 
 static const char * const out_parents[] = { "osc_24m", "osc_12m" };
 
-- 
2.49.0

