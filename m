Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DA91E32DB;
	Wed, 29 Jan 2025 21:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738185869; cv=none; b=pCNRb8fM1FA0011M/KJzT9gUOMClAv9ghAAq5XwYZaxyIN5kzLrZOeqlh5JAb3d84vX0/4jjaIGo35hYXQavOeDcrNx7vuimlCmMtxnt6xnwnmL9uRKLpOJi7w9N8muy2d+yUfvxCg7E3JdVEBLgI83iWshgRKafpQ575XFiyvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738185869; c=relaxed/simple;
	bh=IE2XmwtCSi2uLHoGwf2THCB2jPoratrPfoMxiPiN7dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZ0aOTCPY28pwNz4p8gP7TH6dDj8zti4Szj7WppmLTyvfUQ0OPBYEH06v6P0L/WlkVBLQfeOzsD5K/m/CimJQPA/vHzG1BLwuodcI7qU0+hLcvbVxXjGM8O6Mm9JtlOYeLsdPJJeXvs+AmwC8emyDhFvMR72ec+n5cYxBR8Ozos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=pRmbz4py; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="pRmbz4py"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738185865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eTw5ALbz+eNCK5haVBAw0e9IWB0QRVmD6iP4AxauZSk=;
	b=pRmbz4pyxVMtr648pdFf3V8A2wGvSUoRfTzZ7CNxOFxcQY05HLuHMeb0bs8qPJ0TkZPGku
	fIMNRIgX2FoyPSk2xcbvfg0qa6a1jfl/Ti0/lfONWlOEZs/mKv/GQ0KT7EreixpDKGBl0a
	Pp2DkLmDlSChAXgB3qnW30yFzoMX2wnv3nTbjHWWyY9hw3rzL60f/RaQKZZ+7W+Yq0j2GG
	ZFMWtwsACgVQjz0/nXH32075XqtGJ1BTo4cQ+qbAlYp1TCsJSdeLESQZ7qJzXWzYoWvkBa
	8isTEY2muAGXffJPdtwiOskubNDKhbmo6r1LEKZVag0tPn/QNe2hOjy4cdz0Fw==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Craig Tatlor <ctatlor97@gmail.com>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH v2 2/3] clk: qcom: gcc-sdm660: Add missing SDCC block resets
Date: Thu, 30 Jan 2025 00:23:26 +0300
Message-ID: <20250129212328.1627891-2-alexeymin@postmarketos.org>
In-Reply-To: <20250129212328.1627891-1-alexeymin@postmarketos.org>
References: <20250129212328.1627891-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This will allow linux to properly reset eMMC/SD blocks.

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Fixes: f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver for SDM660")
---
 drivers/clk/qcom/gcc-sdm660.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index df79298a1a25..01a76f1b5b4c 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -2420,6 +2420,8 @@ static struct gdsc *gcc_sdm660_gdscs[] = {
 static const struct qcom_reset_map gcc_sdm660_resets[] = {
 	[GCC_QUSB2PHY_PRIM_BCR] = { 0x12000 },
 	[GCC_QUSB2PHY_SEC_BCR] = { 0x12004 },
+	[GCC_SDCC2_BCR] = { 0x14000 },
+	[GCC_SDCC1_BCR] = { 0x16000 },
 	[GCC_UFS_BCR] = { 0x75000 },
 	[GCC_USB3_DP_PHY_BCR] = { 0x50028 },
 	[GCC_USB3_PHY_BCR] = { 0x50020 },
-- 
2.45.3

