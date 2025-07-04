Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F2F288C34
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615644; cv=none; b=bQfDgvsHmLDs04ZvGLj/6u9Q+eGp9gbNFoYTHXcf8foLv5HJQAcuhKs6mW9WyimYxBhRVA4DR5uojlCg8p5oKTQJTFGrPbvxEvYi4k/EPOd8SIafTWFgVFzVbouvMEq1ZtK4tYPKk+q4Xr8whoSyTsbyXsbAZe+w/I3XnoFwJzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615644; c=relaxed/simple;
	bh=/KSubG/583tj8/waloKAOv1jSxfdiDCDSVtOLpK0Epo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dfbrnPFJFtCJbbvL7LkP7Y/SlscZU+lVgfjVfuZeu+BlqKEIOTTjVjp3I2uQTw5dix4YcNzp/jf5bhiiEQ9+Yp4M0K2udRZY0poGA/l4LiUAeGBtF9ndJ9KkmvSw8P4w1QWYqZengJeQ+neyJt91rs2zl+jyXHy8kmhzC1K3/WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jj4CNFN/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jj4CNFN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615643; x=1783151643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/KSubG/583tj8/waloKAOv1jSxfdiDCDSVtOLpK0Epo=;
  b=jj4CNFN/3b0iQQ8U/wey5lhnKEuztfTDAnBNvqiOv4ob+2HrD8OefSBw
   Ehud6kKIxHPybVB+rO0YEEO6w73JKRQqEC/jGGkO1mIPXanEcWSI37F+g
   Y7jD/yQGLwoeV9x8bCmPiyW5XFMfSo+LzaCjguAGnmj+py/EQiMxLUITs
   Ns9oEhVRLSQN6DDbJqlALlCWViv84r1DNIUkn3DedVol9nZR7vgCzLq+g
   1jrBLrhLvfkI46NLVCWPJr1EFEwgzzyw1mtqfD53PDRV3yQiR0qhU37DZ
   zQTZSq3FIo8A/EfB79oM8gjcSpc4rWd3Vol46ucb75hzkUL9BYgiPw4Bo
   Q==;
X-CSE-ConnectionGUID: zxY0d5jHRYi7E/mZr9+cTg==
X-CSE-MsgGUID: zNzbxTJISJqphM6fody+pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494448"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494448"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:01 -0700
X-CSE-ConnectionGUID: dVgidJ0MTPCgshrCmpcizw==
X-CSE-MsgGUID: IvkVuz9SR/OUKP7ve5SU1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924155"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:53:59 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id CA01544419;
	Fri,  4 Jul 2025 10:53:57 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Min Ma <min.ma@amd.com>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/80] accel/amdxdna: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:53:57 +0300
Message-Id: <20250704075357.3216774-1-sakari.ailus@linux.intel.com>
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

 drivers/accel/amdxdna/amdxdna_pci_drv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index f2bf1d374cc7..c7083a657333 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -101,7 +101,6 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
 failed:
 	kfree(client);
 put_rpm:
-	pm_runtime_mark_last_busy(ddev->dev);
 	pm_runtime_put_autosuspend(ddev->dev);
 
 	return ret;
@@ -125,7 +124,6 @@ static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
 
 	XDNA_DBG(xdna, "pid %d closed", client->pid);
 	kfree(client);
-	pm_runtime_mark_last_busy(ddev->dev);
 	pm_runtime_put_autosuspend(ddev->dev);
 }
 
@@ -296,7 +294,6 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto failed_sysfs_fini;
 	}
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 	return 0;
 
-- 
2.39.5

