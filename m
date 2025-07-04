Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD02286415;
	Fri,  4 Jul 2025 07:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615649; cv=none; b=h7KAra2LQB6QyIoyf+T4uUcVzbKsVA8W57o4J1D6BtDbRpYmyQo+IMkUfP2e1ZxSrLiOo862wVk5jfj48DLoOfw/iaApuLP8O1TwGxCBapv3VB004AL/vEcT1pBOEwPW+mg7xFmN+JfFx3mi8NY6MrNccdXeQdbpgbRzNSo/nd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615649; c=relaxed/simple;
	bh=TYN32i5byZbG1X85V7D0gufUAODeDj4mg0h1TSE5Imc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LLZZN751qaXjnQMEk2fCwUGEk5jZKYKQ9HSNcqYdRKWbzzur0ITU1Ms3nXEs8xLwDMr5ZthaZPWxGd7L1dqh10l+Bo53HtXwhtOeZjQ5lBsyJI8omqLY0zRuwtmjZOA5z4oo5YMum3Wa5B/kCvNSZpFhP/wdoP8who3Upxmbjss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrRatoHU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrRatoHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615648; x=1783151648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TYN32i5byZbG1X85V7D0gufUAODeDj4mg0h1TSE5Imc=;
  b=WrRatoHUXvEIv2kHfmdSpVWt35wQ7209PQgBSX6VXk5lrWMMekKrhdsP
   a9WGxl7esdernrPIVJ41NVZMRPMNyRvMRwFGmNwoiPiHX6N/s3yS1byVy
   OPqBEdZmne7wuyeg+tJS3n8RvjHF8c4ydDrapGEga4TG3EQHxY27FyRl3
   ZVoNmEDdvPrjMczos6RJyVkABxHa14CFrtGimZyp1ThrIpWuBpY8Y3fMO
   GWpu5ZZBzDj7n93bWHTHbzNYFDeGOay5S+6MvhdQ+lXf435bo5dhAzLpR
   JFnKiA0AwQbnRLTrskvFbWs1S3VUVA2e6LZtIebNYzRec5xMgb8lG11bY
   w==;
X-CSE-ConnectionGUID: 0QwB31tySQi9VixvdoedEw==
X-CSE-MsgGUID: vr4/MgUZRpCwlz/WZTulZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494471"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494471"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:07 -0700
X-CSE-ConnectionGUID: frYQDD7rTXWTctvPTnoKrg==
X-CSE-MsgGUID: i8ml/69OSV2+5Y+rWWPkwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924171"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:03 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 0B608447EB;
	Fri,  4 Jul 2025 10:54:01 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/80] clk: imx: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:00 +0300
Message-Id: <20250704075400.3217126-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/clk/imx/clk-imx8qxp-lpcg.c | 1 -
 drivers/clk/imx/clk-scu.c          | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index d0ccaa040225..1dae3410ee99 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -267,7 +267,6 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 	if (ret)
 		goto unreg;
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index b27186aaf2a1..0ef661608139 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -567,7 +567,6 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 
 	if (!((clk->rsrc == IMX_SC_R_A35) || (clk->rsrc == IMX_SC_R_A53) ||
 	    (clk->rsrc == IMX_SC_R_A72))) {
-		pm_runtime_mark_last_busy(&pdev->dev);
 		pm_runtime_put_autosuspend(&pdev->dev);
 	}
 
-- 
2.39.5

