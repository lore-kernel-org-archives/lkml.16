Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A3A275B1E;
	Thu, 26 Jun 2025 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939008; cv=none; b=vEZMllhza5LUQbIvgMobw8TDZHPOCbWAWCL/l3dQXuvQBYc57NQ8yRqwL/dc+xZxor8gE/5PsjtbUZ82QJ35tkUowEPDBPNmsGHR1uPK0svpnvnRhelrik9/enUTE37MP+3nrwDjXK5rEdjG1r67dfO0l/nkI6AFdFidc0B1sJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939008; c=relaxed/simple;
	bh=/3RJJEQ2zBHSm6EY7rwA9SGnSiEM7Gbzc56YyGcdRaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ngTcYwiHDhO2n4EdtqI2isvE1bOVJirB8/E3VBuS5DXf8dK/iZPF5lbtgCPH8k4+vKmf3PAZtFBu+cmVIUeVIEEzze4vXAy/wM46ZR9QwDnnBHibJOFWRiNnxY2UXqaARsw8lUW16IXm4t8Sq8ewCTHKrAPOFH/X+Uq/7+FB6Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+p5L2Qi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+p5L2Qi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750939006; x=1782475006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/3RJJEQ2zBHSm6EY7rwA9SGnSiEM7Gbzc56YyGcdRaI=;
  b=Z+p5L2Qi7vxn8kfFbz+TNfeRZuMNucyMoclo+vvIDwIBHLStN1YA9/ZG
   tQi7VNdnlpjRQWo8MLhi+EL4G/HUEGTkrz+LPDJ5bXeGfqX5Yz8IRtnjH
   ppQ/Vmaj/iZvmpLzqyzGH5Sluo4WtiPRdy0K/hjxguta4odKywmEOaSC8
   cYf24dSB/7zmCs3HyigV9SljuXBVcOVJtsqqnqJBOxAKk5WbvkkVsAtCw
   OVcikihE/TzOEBeGH1nk35z9/9cSgy70rPxESeY+dVCl533OL/P39ROMQ
   GSgN7jjIYzQzPzGuiDH2+JQkHHgvSG1QRgkchqKDpHBOEApLQ5lVZVFhW
   Q==;
X-CSE-ConnectionGUID: eBB7PhjPQuSgnyYV4DvGHA==
X-CSE-MsgGUID: qlnUjehYR1uKA6iu/eVTZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304529"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53304529"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:56:46 -0700
X-CSE-ConnectionGUID: FeIBOcjaTuquBnGDWLT4Iw==
X-CSE-MsgGUID: O3VK16BnSa6lqYeipo8mUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152800555"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:56:44 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 01/15] soundwire: add sdw_slave_wait_for_initialization helper
Date: Thu, 26 Jun 2025 19:56:11 +0800
Message-ID: <20250626115625.536423-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626115625.536423-1-yung-chuan.liao@linux.intel.com>
References: <20250626115625.536423-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

waiting for slave->initialization_complete is commonly used by SoundWire
codec drivers. Add a helper to reduce the duplicated code.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/slave.c     | 17 +++++++++++++++++
 include/linux/soundwire/sdw.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index d2d99555ec5a..5d45adb28491 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -104,6 +104,23 @@ int sdw_slave_add(struct sdw_bus *bus,
 }
 EXPORT_SYMBOL(sdw_slave_add);
 
+int sdw_slave_wait_for_initialization(struct sdw_slave *slave, unsigned int timeout)
+{
+	unsigned long time;
+
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+					   msecs_to_jiffies(timeout));
+	if (!time) {
+		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
+		sdw_show_ping_status(slave->bus, true);
+
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(sdw_slave_wait_for_initialization);
+
 #if IS_ENABLED(CONFIG_ACPI)
 
 static bool find_slave(struct sdw_bus *bus,
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 0832776262ac..961a10af12c1 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1087,6 +1087,7 @@ int sdw_stream_remove_slave(struct sdw_slave *slave,
 			    struct sdw_stream_runtime *stream);
 
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
+int sdw_slave_wait_for_initialization(struct sdw_slave *slave, unsigned int timeout);
 
 /* messaging and data APIs */
 int sdw_read(struct sdw_slave *slave, u32 addr);
-- 
2.43.0

