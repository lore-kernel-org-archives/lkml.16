Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C112F3C33
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615706; cv=none; b=cER5vb7DKPnvQ7FevWBB3a4Dv1KUPNqtARrQbyVIU0APcRvla9YzYlFXw1g2xrX1XR7sIv4Wdndvdln7u58g7wNoSkNPj4zCjMuUyWR3IJGUArJfkfr1TISD0pvTP790w4BdDLty5hjpb4UZfRDEbTCwIbqgF0bFh1Mm+C355LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615706; c=relaxed/simple;
	bh=mdM0fCBRCMeIMAVi7fqCrM0fXAuMJVicckxaZNS+bgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S+CxSCWZos3F75PuvuyVCPJrMteJPGj1rSTRrhcSTQmInaf45p8ZHhRuB9Y0dwY2XyED8qNdJl+Nnlg4EkdetMWypGSrZky1E7CZa2taTQQaTw/PLtzs2kkE5lwWndw9WnyW4dwFmVX3wT8FxAtjehiRzwtwE2cmKk1WCTOZnOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aB7Lt57l; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aB7Lt57l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615703; x=1783151703;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mdM0fCBRCMeIMAVi7fqCrM0fXAuMJVicckxaZNS+bgI=;
  b=aB7Lt57lFqKGW2upTPlbNzpejBEwAcvzB+kKFozwU/9LiAHie4mHMQTC
   VNrKwX5C+fwWwua7sOPCNztsUArMhzViL1UD4Bw9CAeTXc8Ltp7SAGFxx
   jZGC/ZMzPyhzn+HCEvJKEu1+Fyfh/E1+2DKp1fjNEm70NKmVu9Er1pwqc
   yCCH/Su5OjvlCjLn4ftsZgptkCQ4AvdcLKuJqtYXXfRD08KrzP13Z9uxt
   S4fgczul8RE3nm/rwaXxnbh2dXEZO9qB/IiQsis8GWoCWhH4PPRJzMuvb
   5vzvtdyGwpzfbzlEMgEFKOCLVPxD7xE22nxYtnBfYM44iQo1cBG0dzRaP
   Q==;
X-CSE-ConnectionGUID: o3ojZnaNQdifyAhg28+Mgw==
X-CSE-MsgGUID: dLZV87yESu+l756RUxzZcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194260"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194260"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:59 -0700
X-CSE-ConnectionGUID: LhFiReD2SIile6uLjhnPyQ==
X-CSE-MsgGUID: o0jYIUk4SJePdq14auC1hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616652"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:51 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 4B87844419;
	Fri,  4 Jul 2025 10:54:49 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 62/80] staging: greybus: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:48 +0300
Message-Id: <20250704075448.3221843-1-sakari.ailus@linux.intel.com>
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

 drivers/staging/greybus/gbphy.c | 1 -
 drivers/staging/greybus/gbphy.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 6adcad286633..3068bd71cd98 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -53,7 +53,6 @@ static void gbphy_dev_release(struct device *dev)
 #ifdef CONFIG_PM
 static int gb_gbphy_idle(struct device *dev)
 {
-	pm_runtime_mark_last_busy(dev);
 	pm_request_autosuspend(dev);
 	return 0;
 }
diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
index d4a225b76338..4a4ebc7f2b98 100644
--- a/drivers/staging/greybus/gbphy.h
+++ b/drivers/staging/greybus/gbphy.h
@@ -85,7 +85,6 @@ static inline void gbphy_runtime_put_autosuspend(struct gbphy_device *gbphy_dev)
 {
 	struct device *dev = &gbphy_dev->dev;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 }
 
-- 
2.39.5

