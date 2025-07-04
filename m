Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FFE2EF664
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615695; cv=none; b=CTMwgfhjLzo8k21vaaIE+DxX0MbvWXSnjXnFabgjxxGrUURi7GGDCF2Sx5AQcMUHozT7biOdHHZ+w45RGoXPt5VvbyQmcMedkEPKPywUx8r/3r2PitJjO6KvqR544FbuvscwGqoFeBBFje1G49g+IVrGHhXJZ6+RhlbImXHz2b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615695; c=relaxed/simple;
	bh=FD8NSdsEQqeGz8ildUOGKLMTm/GKTBxIB/60rQo+QMY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SytGepeUKbNrbTaOyzuI7IAquYOR2lqwtPjHGBPS9zKcwq5cQ1P2HLh7+Lgl8MeHDhxOirLLQ95CxkZNcqLnWFNC+n1+Pd+cEwa1frkWjMsMntbZcHuQRjT4fDTDpm+SoHx3NE9RPpyaXrtQXb5Z/D+jnpA0ezJBBJUGN57xk5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdCGzw+c; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdCGzw+c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615693; x=1783151693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FD8NSdsEQqeGz8ildUOGKLMTm/GKTBxIB/60rQo+QMY=;
  b=AdCGzw+cQiMB/Tx6FCDUzfohbDX9wQRl52G1If0eqd3lauWEV9tTSatk
   JVevR5s1zbIREA6LU13cdTHUrCsVI56MapICPzcUoJFSi4Gh0+HVlPOzy
   DBGrOJrV0V36+ZewgWxv5j2zKPI+kPL7fmURZigeFpZVmwCfcDqCrQXuU
   QvBGUx3209fHyRvd5j/VSiF4P6PldQddmzdUcgxg4vgXA/5Ud/OyR4e/0
   iZaRbCHFQ8XYXxms+hvVzIS1ZWzBa9S2MnN/GKn8fFx2s9QMFWNl6g0X0
   t+P2Dm7JC4KYRoeFGmtlXRPTCGMlU7XeE+FSWUFDnHxHn5Ax25rl1hrTL
   g==;
X-CSE-ConnectionGUID: YROJz4ajSbS72EKrtFxIiA==
X-CSE-MsgGUID: /Lgnsw6CQFuTV1ZHqUYY5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194226"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194226"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:47 -0700
X-CSE-ConnectionGUID: Bgwjjc6LR7GBqHNaIjSxEQ==
X-CSE-MsgGUID: gXyyhgBTQJmOvqWtYsKw4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616606"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:44 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id D896A44394;
	Fri,  4 Jul 2025 10:54:41 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 53/80] phy: ti: phy-twl4030-usb: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:41 +0300
Message-Id: <20250704075441.3221235-1-sakari.ailus@linux.intel.com>
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

 drivers/phy/ti/phy-twl4030-usb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/phy/ti/phy-twl4030-usb.c b/drivers/phy/ti/phy-twl4030-usb.c
index a26aec3ab29e..1d26189ace4f 100644
--- a/drivers/phy/ti/phy-twl4030-usb.c
+++ b/drivers/phy/ti/phy-twl4030-usb.c
@@ -505,7 +505,6 @@ static int twl4030_phy_power_on(struct phy *phy)
 	dev_dbg(twl->dev, "%s\n", __func__);
 	pm_runtime_get_sync(twl->dev);
 	schedule_delayed_work(&twl->id_workaround_work, HZ);
-	pm_runtime_mark_last_busy(twl->dev);
 	pm_runtime_put_autosuspend(twl->dev);
 
 	return 0;
@@ -598,7 +597,6 @@ static irqreturn_t twl4030_usb_irq(int irq, void *_twl)
 		if (atomic_add_unless(&twl->connected, -1, 0)) {
 			dev_dbg(twl->dev, "%s: cable disconnected %i\n",
 				__func__, status);
-			pm_runtime_mark_last_busy(twl->dev);
 			pm_runtime_put_autosuspend(twl->dev);
 			twl->musb_mailbox_pending = true;
 		}
@@ -636,7 +634,6 @@ static int twl4030_phy_init(struct phy *phy)
 	pm_runtime_get_sync(twl->dev);
 	twl->linkstat = MUSB_UNKNOWN;
 	schedule_delayed_work(&twl->id_workaround_work, HZ);
-	pm_runtime_mark_last_busy(twl->dev);
 	pm_runtime_put_autosuspend(twl->dev);
 
 	return 0;
-- 
2.39.5

