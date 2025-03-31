Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3C91E5205
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435215; cv=none; b=hjEdtb7/QN/xNmnK9qYUQWM7oV06B5rO0AiUHAWpJ9X1qTB7TqlD08ApG9gteq/vl2F1vhNiWVGq1mrmfiC3KApmu/k1I8bVvAfr/Zrl3x6W9w7nS+K5tuS4tQsycJdX9xQ3NFr4xsXNutLhw8Glq3j0TdpoTuenAV5KMTqCEdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435215; c=relaxed/simple;
	bh=COFiYf1P2w+YNug1bU9bg+KDi+ERdNnrVZGhy569pmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKlopu7jelR7aaCkgVixpHpx46BLNgfu4CXuPdM+IlAoMWOfXC+Jw6O8EhZjsDkyGVWbpYHdiVH5Km2b+K+gu704YAWamjiRt2nW4CBRu04BrH/oJ21EB1a775xx3C/f12OXrdxZLACdWiVBX5/xWv2Mg8gkYbEcb5yH0UuZUm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mg+cC07U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mg+cC07U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA9DC4CEE3;
	Mon, 31 Mar 2025 15:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743435214;
	bh=COFiYf1P2w+YNug1bU9bg+KDi+ERdNnrVZGhy569pmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mg+cC07U1hr3FySwqpZ/g+Z9SwwQDY7dIdn34VXqiPDEnjOjcaTRXUKgECBDduZnB
	 WCLORUsQO/D5UiSK1kwhzvV7sj7809KzEawfm8h9QD4Wwsb2JLLaPuxkuIYwEPwYs2
	 2BJfrbHV88xn3CJTukoyoXgjtbl1aKJaW5gcCWUxS5Xg6wCUW/bPVB4Q0Y1jcFXMx5
	 I68duOm1dHy4nC5YpNEGHkRbLjpH4u/MeW01lWM9J/MWnyarggk07tvBXxB3DfL5z4
	 9cy4Uqm/5CaRUUjIzXxtyUO/MdSBHnl3MeqJf4gds7uWaZhj8GPkJKNIvJQsVNtQMv
	 78X54Mp41wcSg==
Date: Mon, 31 Mar 2025 08:33:32 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Witold Sadowski <wsadowski@marvell.com>, Ingo Molnar <mingo@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, kernel test robot <lkp@intel.com>
Subject: [PATCH v3] spi: cadence: Fix out-of-bounds array access in
 cdns_mrvl_xspi_setup_clock()
Message-ID: <h6bef6wof6zpjfp3jbhrkigqsnykdfy6j4qmmvb6gsabhianhj@k57a7hwpa3bj>
References: <008546505c6c5973a1c119a41b74e665a3e29b71.1743178029.git.jpoimboe@kernel.org>
 <gs2ooxfkblnee6cc5yfcxh7nu4wvoqnuv4lrllkhccxgcac2jg@7snmwd73jkhs>
 <4f589f15-7531-46cf-9ed9-0e4c6afdcda3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4f589f15-7531-46cf-9ed9-0e4c6afdcda3@sirena.org.uk>

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
Link: https://lore.kernel.org/r/gs2ooxfkblnee6cc5yfcxh7nu4wvoqnuv4lrllkhccxgcac2jg@7snmwd73jkhs
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
v3: fix "- 1" spacing

 drivers/spi/spi-cadence-xspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xspi.c
index aed98ab14334..6dcba0e0ddaa 100644
--- a/drivers/spi/spi-cadence-xspi.c
+++ b/drivers/spi/spi-cadence-xspi.c
@@ -432,7 +432,7 @@ static bool cdns_mrvl_xspi_setup_clock(struct cdns_xspi_dev *cdns_xspi,
 	u32 clk_reg;
 	bool update_clk = false;
 
-	while (i < ARRAY_SIZE(cdns_mrvl_xspi_clk_div_list)) {
+	while (i < (ARRAY_SIZE(cdns_mrvl_xspi_clk_div_list) - 1)) {
 		clk_val = MRVL_XSPI_CLOCK_DIVIDED(
 				cdns_mrvl_xspi_clk_div_list[i]);
 		if (clk_val <= requested_clk)
-- 
2.48.1

