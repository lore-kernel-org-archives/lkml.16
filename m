Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407DE21364
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 04:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743222993; cv=none; b=IIvSENK8g1RFrvx6UzUwcu6VFFebLU18joUoAQoktvo9+xXiiAIbQaAQizc4aNoJoJ+Hh3yvPIFMPxuTgY8Hg6kQX99K08wa+608I7PrG9hBRanChw1ydPSxEPijh0QjsV6iwGNQqp+lobMa4PrNN5INNPwoOE7EB2cg9GhMZMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743222993; c=relaxed/simple;
	bh=yHXhw7+F5Xw1YYXO7jwS3bgOfv0Xaa6l+E6wNZRMpvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSGVuwJK/A3C8TZICp9RVKax6FLPxxy1I8d2hLXbhzdd2mXVZykwHUwSqwJnBafnG2O8Pj2/J2UGNVC+vFsYX2jRbJa8hO6u0JZOhzHervjEwoj7Nnche0yvtTUhKY0cE5MZWx3m0iUdN83NCXXZ2djzTECTGSkFNmfJNJ2cUpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqW4JOV7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqW4JOV7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5EDAC4CEE2;
	Sat, 29 Mar 2025 04:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743222992;
	bh=yHXhw7+F5Xw1YYXO7jwS3bgOfv0Xaa6l+E6wNZRMpvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fqW4JOV7rSByO3Eo32dg24ye0fuEZgrY5cDXIeejcvrIERCrPvaqEf3spbXqSh1/E
	 CRj+01FuXI8EIWi3tsihvJh8Chy7bdl1LQ+mvTa9tyJvmsXLDEQRUw5HomsI4ajqED
	 iOQlmbwSykhPVGwlDd9w6gkXpPYqCJ/Fs/ITlz+WI+47xwpi7WoHcK6qaBrm1xTKCt
	 inQYItKbZ1Tn2cnuBqCPXehCkHDRVhzLlD7SVRsLkclAOKmqklvYZuy2Z60ql4eM5a
	 Pl3+Q3EZcVzjILxhqa7Dz9NompMc/NXuVGXlWLMBTsuHd7Sl7xNZaSQObEDLECnyrf
	 HXu6KLdZrS/FQ==
Date: Fri, 28 Mar 2025 21:36:30 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Witold Sadowski <wsadowski@marvell.com>, Ingo Molnar <mingo@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, kernel test robot <lkp@intel.com>
Subject: [PATCH v2] spi: cadence: Fix out-of-bounds array access in
 cdns_mrvl_xspi_setup_clock()
Message-ID: <gs2ooxfkblnee6cc5yfcxh7nu4wvoqnuv4lrllkhccxgcac2jg@7snmwd73jkhs>
References: <008546505c6c5973a1c119a41b74e665a3e29b71.1743178029.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <008546505c6c5973a1c119a41b74e665a3e29b71.1743178029.git.jpoimboe@kernel.org>

If requested_clk > 128, cdns_mrvl_xspi_setup_clock() iterates over the
entire cdns_mrvl_xspi_clk_div_list array without breaking out early,
causing 'i' to go beyond the array bounds.

Fix that by stopping the loop when it gets to the last entry, clamping
the clock to the minimum 6.25 MHz.

Fixes the following warning with an UBSAN kernel:

  vmlinux.o: warning: objtool: cdns_mrvl_xspi_setup_clock: unexpected end of section .text.cdns_mrvl_xspi_setup_clock

Fixes: 26d34fdc4971 ("spi: cadence: Add clock configuration for Marvell xSPI overlay")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503282236.UhfRsF3B-lkp@intel.com/
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
v2: Fix typo in commit log

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

