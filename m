Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AB72C3242
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615666; cv=none; b=duqawcFKEL7r0ewmM7KfaYvInAHEh+YtCObGYXzZJEf45ukNlEnqwxniNhmI6X6xPLCvAGFVc1EA4qUcCF+IYMUpUJjwiWZMEtJNGbng1XaQjA6S83PvAMkUPf1aK5ddrPuacMPYTjXKemNCyzATXRMEsFAxGBOuCdbqMviAMAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615666; c=relaxed/simple;
	bh=q2znRzlNkp1VX01C6C6SWFWs8cikijZSrtuwfc3vXfo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FFk5QV4nz4xSLcaiCbYH5cBaQwaq+Nn6+aNyrfOGlAy7YiFG12BLw+8ZW1BnVWO2ZQxmGaTolmWAqXXwwejCBNA+Gr6RIP/WlGwIb+Uja/pTiekob4YTgpyHGtOHu9cFdHIKvVrUQISpSgZnRREUgjpLqz5EYNbyrrAJzI2uLYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkJzONL/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkJzONL/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615663; x=1783151663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q2znRzlNkp1VX01C6C6SWFWs8cikijZSrtuwfc3vXfo=;
  b=IkJzONL/4mLoRXhhGhdOV0rzBoGUVKW+uWfMy3xi4bd8ms0GkzgoSBM1
   mgsoQncyGIA08UuWASIAzj0Paz6mM2FRR15CjSxmmclSqFGIiSt/oNTCq
   SzlHtTQhD+U/+RydLcxk1TyghxPviPpuqLhcsHyEQfTgV46dL/jjh9GGs
   uHrgdjq35QAM4WGGQ/gVjNppbX2nAiRCuiZtFJG7A9ci6mMvOCJ5N6R5w
   5tv7BVXJi5BCSpaoFLWRjOMEsdqPhfqYW1ej61o/LwkRv1Cr8lfxT5xy9
   kvwLBqFWVSI4NSHLrwEM+Dn48cRV/Ap8Gmrmt0oFOFaLoidcPPw9Q+KPc
   w==;
X-CSE-ConnectionGUID: w+8A0oeCSn6ppElfxODdVw==
X-CSE-MsgGUID: g99wdkJKRj6ryMM37rqosA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494584"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494584"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:22 -0700
X-CSE-ConnectionGUID: IUennC47Tk2lCs9hia+Stw==
X-CSE-MsgGUID: DVXgBXKdTmiKM3rSFP38Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924252"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:19 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 90C7344424;
	Fri,  4 Jul 2025 10:54:17 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Aniket <aniketmaurya@google.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 25/80] i3c: dw: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:17 +0300
Message-Id: <20250704075417.3218742-1-sakari.ailus@linux.intel.com>
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

 drivers/i3c/master/dw-i3c-master.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 611c22b72c15..37bee9c21736 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -699,7 +699,6 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	dw_i3c_master_enable(master);
 
 rpm_out:
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
@@ -829,7 +828,6 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 	else
 		ret = dw_i3c_ccc_set(master, ccc);
 
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
@@ -912,7 +910,6 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 	dw_i3c_master_free_xfer(xfer);
 
 rpm_out:
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
@@ -998,7 +995,6 @@ static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 	ret = xfer->ret;
 	dw_i3c_master_free_xfer(xfer);
 
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
@@ -1148,7 +1144,6 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	ret = xfer->ret;
 	dw_i3c_master_free_xfer(xfer);
 
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
@@ -1316,7 +1311,6 @@ static int dw_i3c_master_disable_hotjoin(struct i3c_master_controller *m)
 	writel(readl(master->regs + DEVICE_CTRL) | DEV_CTRL_HOT_JOIN_NACK,
 	       master->regs + DEVICE_CTRL);
 
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 	return 0;
 }
@@ -1342,7 +1336,6 @@ static int dw_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
 
 	if (rc) {
 		dw_i3c_master_set_sir_enabled(master, dev, data->index, false);
-		pm_runtime_mark_last_busy(master->dev);
 		pm_runtime_put_autosuspend(master->dev);
 	}
 
@@ -1362,7 +1355,6 @@ static int dw_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
 
 	dw_i3c_master_set_sir_enabled(master, dev, data->index, false);
 
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 	return 0;
 }
-- 
2.39.5

