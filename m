Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FA61EDA0E;
	Wed, 30 Apr 2025 07:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999252; cv=none; b=MyqTKNR+W1j/w0wlr7XwyRaGv1yt/FEdWnUOzw1eABxjya/Vd04vzuFcOzldM5KaKWIAXoReP+tGJ1zVgv28n21t6iptgQb1HgYLyb4oKnKp7NWlQyviMOA4NdJIdgY8apqM1AqkmLAjjlkOrNbaa1H1RllYXdjITnWzspYATk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999252; c=relaxed/simple;
	bh=kqympcmLHRH2cUWmbP4HkE6hCh1Houz4Bv47PlGyrIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WW6g+uGBhuRrDKq9dWHI/Nn2nW1nin+Bj/sbvINVIv3wcYNi7W45KYaNc9NP6MrjRVAHriLSO/3PA2+ePyZERwQyG71t+pr0EdVHYapG/JtLZJW5rlwUAO7nzLulLCXgXl3ABJBpUOuZHdkZE1nWcKsB+oJ3F2NVj08RFwGRmNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSCQQJO/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSCQQJO/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745999251; x=1777535251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kqympcmLHRH2cUWmbP4HkE6hCh1Houz4Bv47PlGyrIQ=;
  b=YSCQQJO/YipPE7io+1+v1z3ruT3aB+koaK862hlpM/bLeLY4eai2A4TB
   ZfMiZpe2QtY27bVx5rsvXSVBXXAoSYw6sqYZACDSYvRs/oSp1DKNgLofo
   V7NgQXcOz0ark+Rc9AFmdKz6n1jvthJvS8raoy3kT0Vy5cu3i+igzE5Nj
   N+OhAIoyGpMWHLbuYIDrmDFkexXlkixFlflXDR0eVov0FnK2U8YIQNJv8
   XmUKHK3hVC/pTlGb87SCFIndnrKpVUBt8ZdfjWaKiubOZy1AX8amGQq1Y
   BX/ntt0wraHRP44jCWKKajjgLgTve6dXVJch11gG7cJ+M+E1MGYihYAdM
   g==;
X-CSE-ConnectionGUID: eb8TPVxJR1KWYiUd38aq0g==
X-CSE-MsgGUID: nC/S7Pc+RW+WzqYKbVy+yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="50304199"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="50304199"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 00:47:30 -0700
X-CSE-ConnectionGUID: HEWCp498Q0WYXW4aj1y7QQ==
X-CSE-MsgGUID: diqvrwZPRqCfZnY0zqOiBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="133994219"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.233])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 00:47:27 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/2] soundwire: intel: Add awareness of ACE3+ microphone privacy
Date: Wed, 30 Apr 2025 15:47:13 +0800
Message-ID: <20250430074714.94000-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430074714.94000-1-yung-chuan.liao@linux.intel.com>
References: <20250430074714.94000-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

ACE3 introduced microphone privacy and along this feature it adds a new
register in vendor specific SHIM to control and status reporting.
The control of mic privacy via the SHIM register is only to enable the
interrupt generation via soundwire, but not handled by the soundwire code
as the mic privacy is not a feature of the soundwire IP.

On the other hand, printing the register value brings value for debugging,
so add a new flag to allow this conditionally.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.h               | 2 ++
 drivers/soundwire/intel_ace2x_debugfs.c | 6 ++++++
 drivers/soundwire/intel_init.c          | 1 +
 include/linux/soundwire/sdw_intel.h     | 5 +++++
 4 files changed, 14 insertions(+)

diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index d44e70d3c4e3..86abc465260f 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -22,6 +22,7 @@ struct hdac_bus;
  * @shim_lock: mutex to handle access to shared SHIM registers
  * @shim_mask: global pointer to check SHIM register initialization
  * @clock_stop_quirks: mask defining requested behavior on pm_suspend
+ * @mic_privacy: ACE version supports microphone privacy
  * @link_mask: global mask needed for power-up/down sequences
  * @cdns: Cadence master descriptor
  * @list: used to walk-through all masters exposed by the same controller
@@ -42,6 +43,7 @@ struct sdw_intel_link_res {
 	struct mutex *shim_lock; /* protect shared registers */
 	u32 *shim_mask;
 	u32 clock_stop_quirks;
+	bool mic_privacy;
 	u32 link_mask;
 	struct sdw_cdns *cdns;
 	struct list_head list;
diff --git a/drivers/soundwire/intel_ace2x_debugfs.c b/drivers/soundwire/intel_ace2x_debugfs.c
index 206a8d511ebd..fda8f0daaa96 100644
--- a/drivers/soundwire/intel_ace2x_debugfs.c
+++ b/drivers/soundwire/intel_ace2x_debugfs.c
@@ -76,6 +76,12 @@ static int intel_reg_show(struct seq_file *s_file, void *data)
 	ret += intel_sprintf(vs_s, false, buf, ret, SDW_SHIM2_INTEL_VS_IOCTL);
 	ret += intel_sprintf(vs_s, false, buf, ret, SDW_SHIM2_INTEL_VS_ACTMCTL);
 
+	if (sdw->link_res->mic_privacy) {
+		ret += scnprintf(buf + ret, RD_BUF - ret, "\nVS PVCCS\n");
+		ret += intel_sprintf(vs_s, false, buf, ret,
+				     SDW_SHIM2_INTEL_VS_PVCCS);
+	}
+
 	seq_printf(s_file, "%s", buf);
 	kfree(buf);
 
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 5f53666514a4..4ffdabaf9693 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -77,6 +77,7 @@ static struct sdw_intel_link_dev *intel_link_dev_register(struct sdw_intel_res *
 		link->shim = res->mmio_base +  SDW_SHIM2_GENERIC_BASE(link_id);
 		link->shim_vs = res->mmio_base + SDW_SHIM2_VS_BASE(link_id);
 		link->shim_lock = res->eml_lock;
+		link->mic_privacy = res->mic_privacy;
 	}
 
 	link->ops = res->ops;
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 493d9de4e472..2af1d8174c50 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -189,6 +189,9 @@
 #define SDW_SHIM3_INTEL_VS_ACTMCTL_DOAISE2	BIT(14)
 #define SDW_SHIM3_INTEL_VS_ACTMCTL_CLDE		BIT(15)
 
+/* ACE3+ Mic privacy control and status register */
+#define SDW_SHIM2_INTEL_VS_PVCCS		0x10
+
 /**
  * struct sdw_intel_stream_params_data: configuration passed during
  * the @params_stream callback, e.g. for interaction with DSP
@@ -331,6 +334,7 @@ struct sdw_intel_ctx {
  * @shim_base: sdw shim base.
  * @alh_base: sdw alh base.
  * @ext: extended HDaudio link support
+ * @mic_privacy: ACE version supports microphone privacy
  * @hbus: hdac_bus pointer, needed for power management
  * @eml_lock: mutex protecting shared registers in the HDaudio multi-link
  * space
@@ -349,6 +353,7 @@ struct sdw_intel_res {
 	u32 shim_base;
 	u32 alh_base;
 	bool ext;
+	bool mic_privacy;
 	struct hdac_bus *hbus;
 	struct mutex *eml_lock;
 };
-- 
2.43.0

