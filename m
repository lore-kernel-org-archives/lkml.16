Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76927DDC5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 16:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743178143; cv=none; b=E2q2CrZ5ivLXMJit4EU0dGkjTTBYNXXaKf0aqkyFekKQYarnJxuLv62qfd8AKePED7Rxj/WwxyIJGIshMr6taezjz6XpDqcXtSB93Y+VZ4wmJ0S1pLaMBfU70FDh6/HgcaHxYnHvxTldlB+ak9oP1c/H56xUnkPcY9vk865P2G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743178143; c=relaxed/simple;
	bh=p6S1j84JzWEW1QfBIxu+svNklVIzrBIwdLYkE67ycDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EjcflTGq7wenTp3pHprGG3BIVor+l9xOYrrfQ8gPAsM7HIgmMTmrXZ1hU9JWymcZ1yxkLDkGtjkVLxZ5srAPDm7RrPcjYx6PSWXPCEphEfJJhdFkURTyszq7R+EnLAIV8qMt47kCknDzC4AW/9cf78iKzZ5M/OS4IGIWYDyUKRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtvNrG19; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtvNrG19"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859DBC4CEE4;
	Fri, 28 Mar 2025 16:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743178143;
	bh=p6S1j84JzWEW1QfBIxu+svNklVIzrBIwdLYkE67ycDk=;
	h=From:To:Cc:Subject:Date:From;
	b=JtvNrG19iGH40HoP75u9ZqM3dunYGV4SATlUgnxEU1XG4nTQAVJKI0gvoPI+6lS8f
	 5Mxq0VneQYitAw1dWMsdgevW6oK77JCPxpot1fnvcfzPioKP22LjxzLhXj5xRxXVZF
	 FbYoYzr7QuP3LV8ayNdSzDisF71POQaBxb03grMBCyBmWl0zWMG/P4G5BSuRuPuHbl
	 PtpHzfR6mM7gsbBmWoIgnkKM94atFZqvCxDmHmS4XRcE4GmUmWtwKBGXjV5r9d1L7l
	 zo4Xia5mJyJ6AZ37BztAUK+zFg9DBs2mfKzD+nSFp6V7e+ObxlJ1WG7Ms0Csi4dbKi
	 Jx0lQnm5XUQwg==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Witold Sadowski <wsadowski@marvell.com>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] spi: cadence: Fix out-of-bounds array access in cdns_mrvl_xspi_setup_clock()
Date: Fri, 28 Mar 2025 09:08:18 -0700
Message-ID: <008546505c6c5973a1c119a41b74e665a3e29b71.1743178029.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If requested_clk > 128, cdns_mrvl_xspi_setup_clock() iterates over the
entire cdns_mrvl_xspi_clk_div_list array without breaking out early,
causing 'i' to go beyond the array bounds.

Fix that by stopping the loop when it gets to the last entry, clamping
'i' to 128.

Fixes the following warning with an UBSAN kernel:

  vmlinux.o: warning: objtool: cdns_mrvl_xspi_setup_clock: unexpected end of section .text.cdns_mrvl_xspi_setup_clock

Fixes: 26d34fdc4971 ("spi: cadence: Add clock configuration for Marvell xSPI overlay")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503282236.UhfRsF3B-lkp@intel.com/
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 drivers/spi/spi-cadence-xspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xspi.c
index aed98ab14334..b7ac4385c49f 100644
--- a/drivers/spi/spi-cadence-xspi.c
+++ b/drivers/spi/spi-cadence-xspi.c
@@ -432,7 +432,7 @@ static bool cdns_mrvl_xspi_setup_clock(struct cdns_xspi_dev *cdns_xspi,
 	u32 clk_reg;
 	bool update_clk = false;
 
-	while (i < ARRAY_SIZE(cdns_mrvl_xspi_clk_div_list)) {
+	while (i < ARRAY_SIZE(cdns_mrvl_xspi_clk_div_list)-1) {
 		clk_val = MRVL_XSPI_CLOCK_DIVIDED(
 				cdns_mrvl_xspi_clk_div_list[i]);
 		if (clk_val <= requested_clk)
-- 
2.48.1

