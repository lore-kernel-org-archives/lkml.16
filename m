Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CEF2BEC5F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615662; cv=none; b=UOBdU/7vc2NDs7eg6FnNX9+8loao2KOmSrVj8U1ALcxVAh5XacdTh1+nm563qOAuJo+tx3qhzTsYgIh888TA9vaSBksXU320pABopkZ7pMpITnu1DxhnJ/h51hN/ISWn8BNjrl+acqbHTi5jsC/f+KD1rrOnPyJaMFANhV12WnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615662; c=relaxed/simple;
	bh=h0lMe6Zm9CS9GXMsA2shed5+hSDPE9usNB0Lg7iJ170=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bMT+W5vKhWzDlQByzLQxR2O2EjbYomrSQPhAN+wDIqfgx4cE/mLr2xZk1xw+BR+wb62snc9LwWbfE/+qcMj3dsgUnIkia1UfBzL24hMkMCMsVA/p991fZUlxLnSvWhf6F4Y/K3nna1hTQG+tVW+ERlVEnAhK88PuoPrpHHJkg2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/hbBGu4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/hbBGu4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615661; x=1783151661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h0lMe6Zm9CS9GXMsA2shed5+hSDPE9usNB0Lg7iJ170=;
  b=A/hbBGu4V/9ob04NGyD5f8SSIl24peT403mzn8WEqVFGYYaZcdfFBeYm
   FIsiW4/IrqAQ+NeIJ8l4gWNw5MvWjKTL77mwyQDbomWnSjsXBHFgSJwHA
   DagGG3H+NGXNkCvPwkD2ZuDiCMbIhck2N8TNdLKsQtleY5OgF0zHR7OQU
   23OPZhEeTO5G4hCB+RUuZSc1e0icbbWmz68ktgJjfKajZGhaIaRIOgCbf
   9F4rIR5H+i4hrZhkR8WOvm9XRsSl3QIHqrYq0ZctaiMRNICPvDcMZ+Lm7
   JL5LG1sl8X/cyoGuUb8WCK+YwESpDuI5mB2TMRwzL9xV2jFDjSOwX9UpE
   A==;
X-CSE-ConnectionGUID: xk0+Gw40QNamqyTju2bvdw==
X-CSE-MsgGUID: qRzVZPIeRGezRnNMLzQTyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494577"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494577"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:20 -0700
X-CSE-ConnectionGUID: VZFjeWY5TcazgNbcPfL/aA==
X-CSE-MsgGUID: eyiD6zqhRn6LxYXLojBAuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924249"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:18 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id CB436447EB;
	Fri,  4 Jul 2025 10:54:16 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 24/80] i3c: master: svc: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:16 +0300
Message-Id: <20250704075416.3218647-1-sakari.ailus@linux.intel.com>
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

 drivers/i3c/master/svc-i3c-master.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 7e1a7cb94b43..4f68005c47d9 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -664,7 +664,6 @@ static int svc_i3c_master_set_speed(struct i3c_master_controller *m,
 	}
 
 rpm_out:
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 
 	return ret;
@@ -779,7 +778,6 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
 		goto rpm_out;
 
 rpm_out:
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 
 	return ret;
@@ -801,7 +799,6 @@ static void svc_i3c_master_bus_cleanup(struct i3c_master_controller *m)
 	/* Disable master */
 	writel(0, master->regs + SVC_I3C_MCONFIG);
 
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 }
 
@@ -1207,7 +1204,6 @@ static int svc_i3c_master_do_daa(struct i3c_master_controller *m)
 		dev_err(master->dev, "Cannot handle such a list of devices");
 
 rpm_out:
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 
 	return ret;
@@ -1511,7 +1507,6 @@ static void svc_i3c_master_enqueue_xfer(struct svc_i3c_master *master,
 	}
 	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
 
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 }
 
@@ -1801,7 +1796,6 @@ static int svc_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
 
 	ret = i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
 
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 
 	return ret;
@@ -1834,7 +1828,6 @@ static int svc_i3c_master_disable_hotjoin(struct i3c_master_controller *m)
 	if (!master->enabled_events)
 		svc_i3c_master_disable_interrupts(master);
 
-	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
 
 	return 0;
@@ -1954,7 +1947,6 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 	if (ret)
 		goto rpm_disable;
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
-- 
2.39.5

