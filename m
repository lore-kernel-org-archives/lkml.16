Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559722288EC;
	Wed,  5 Feb 2025 07:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738741365; cv=none; b=HVNiPDN8vDHs6lWJ3h5BOxAMG0M2aAzXyGyvIZsqD/Hu8fGyUE9YcZt7H6ZceHpp+0XTzZmfjQOSNSeVuDYZEEfMp45Pg/o9fkMuTExlT24ncAah3IqYb8LPfdfr/dusmPqwL+/KiSsGU4oCj6E0LLz+U5hpBBtYoSZS9rchNgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738741365; c=relaxed/simple;
	bh=RrCJfR2BB9gau+/RvmNFEMgvWMGS49Ta+AtEXTFWNCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XWVzx4SEps5432IDgwuCAQh72ma4uqfvKgHCsts+E5LmCkJqyGw0mE7jc3Z1kFl4DxDD7s8IcbTAH1f/wOR6lLcbuZmlzjMWLEkXukJYhcK3SI/4u031EGzW7DMqhxdAisZihPJPCc53MVnj46hlIuw+dwY3654sEBCaXl1DRQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gbp0QkOn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gbp0QkOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738741364; x=1770277364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RrCJfR2BB9gau+/RvmNFEMgvWMGS49Ta+AtEXTFWNCs=;
  b=Gbp0QkOnX0rEaGOhB4sSHmJjt0YhJTVgcOe8++6KMhtO7+9myUiWuBTR
   nHoTQlPkSZBClk6I+a8qCgIxj1gHeK76Qb51QvFmI3NrWizIhTjcxcLuV
   4ZJ5F7hkVhMIjN67YDKAKBxJZ8FCMcp6eBi6r5BqAyTn9KDuDuHbVIIgp
   DNFBEZDVvkyYb89J7+4iIehR7v8Jhht0RSuVy1nhDUl+cM8YWP8kz5N9b
   m+AHvFzkZm4BEp2OyfX737VNn12lPbQAMYlKvLH+XLuq3TfUMaZ4oIIhP
   QLdASHsZR7JX8m+d7cCHg6qgQjjRRcsXBpSN0HK42LUBDq1ARug+01OlW
   A==;
X-CSE-ConnectionGUID: loZBdGzSSz+t3v2ZHKWoPQ==
X-CSE-MsgGUID: tHqWrbQDS9qv9EjXHiRk1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38499688"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="38499688"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 23:42:43 -0800
X-CSE-ConnectionGUID: JwsJZCG0SJ2YO0xhdYdDCw==
X-CSE-MsgGUID: qrhHcEtQQ4KbT00A78zViA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="111004886"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.241])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 23:42:42 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/2] Revert "soundwire: intel_auxdevice: start the bus at default frequency"
Date: Wed,  5 Feb 2025 15:42:32 +0800
Message-ID: <20250205074232.87537-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205074232.87537-1-yung-chuan.liao@linux.intel.com>
References: <20250205074232.87537-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now, we can support more than 1 soundwire bus clock frequency.

This reverts commit c326356188f1dc2d7a2c55b30dac6a8b76087bc6.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/intel_auxdevice.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index b34b897400fc..5ea6399e6c9b 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -243,30 +243,9 @@ static int sdw_master_read_intel_prop(struct sdw_bus *bus)
 
 static int intel_prop_read(struct sdw_bus *bus)
 {
-	struct sdw_master_prop *prop;
-
 	/* Initialize with default handler to read all DisCo properties */
 	sdw_master_read_prop(bus);
 
-	/*
-	 * Only one bus frequency is supported so far, filter
-	 * frequencies reported in the DSDT
-	 */
-	prop = &bus->prop;
-	if (prop->clk_freq && prop->num_clk_freq > 1) {
-		unsigned int default_bus_frequency;
-
-		default_bus_frequency =
-			prop->default_frame_rate *
-			prop->default_row *
-			prop->default_col /
-			SDW_DOUBLE_RATE_FACTOR;
-
-		prop->num_clk_freq = 1;
-		prop->clk_freq[0] = default_bus_frequency;
-		prop->max_clk_freq = default_bus_frequency;
-	}
-
 	/* read Intel-specific properties */
 	sdw_master_read_intel_prop(bus);
 
-- 
2.43.0

