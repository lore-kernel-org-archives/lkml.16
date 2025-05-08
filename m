Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1DA1DE4EF;
	Thu,  8 May 2025 06:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746685241; cv=none; b=CjNn/TPfFMwkiZ5236B9MAnWVwArFwoXztCx8nI0QfhFnRtZIaIULuwldt9ej09D3eJt0qrin/3OtBGQpGSBpqrTpFJnaVLcKDAn46IHK0mmqMj+dtApAiaAHRtqYml/AkGXlz8mBVl2cRaDJ+vMsOndH0QFyDpdAH1ZKF3HGDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746685241; c=relaxed/simple;
	bh=M/GfchhqF7wqN6mHbDcqQ1ffS7rdxz7SgS2u2b8Zl3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c9jHSJ3zvcUDb6hgGwh7D0pByh4Ze99RvthfLHC2Cg7l3+YSL5NzJ3WtKvw5qPm50DcTIEDDQlTeXV1PGalw3HF0rdoffQoKrqeWKcKuc0L92mKGFF9mliPs3z888blGenkwzE9hb5TnLnZkR3r26PWTZ9uAkpzDGuk9qE4qhow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GqIUOgRP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GqIUOgRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746685240; x=1778221240;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M/GfchhqF7wqN6mHbDcqQ1ffS7rdxz7SgS2u2b8Zl3g=;
  b=GqIUOgRP8bkuV8Px6tU24WTdCO85enXIxhJ9Cqw1z9VxO+cFXXFlyjdO
   2+rm/tUaziy5JOFRialBeyJ9ovxx6Vi3MHqe/KmCRFGRCOcZkAqTO9vUz
   4HeR5dEKsG7U4PCufEqhdlh/kVbbhblYGzQ/2E++l5p+cq4un9qaCOppB
   qHUGNGrrIXnteRPO2dKFsNSlP6k3doTY1BynIAcX+xvmq3F+6KWs0RBxm
   Z2VjkqQ8BdL/NiQg1MxNaRvg4SxXi5InHqbtKO9xFCIGPPEdwxhDu7ms+
   iVaxae+QTScCLxHbT7wdlcelevoXfVIEjiu2DvHJbLF8hj10eINiO1t/V
   w==;
X-CSE-ConnectionGUID: XeeZFX/HQqeZZs4ybmq31w==
X-CSE-MsgGUID: Nm8S5uCKT5GYiIkfJpA93Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52102798"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="52102798"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 23:20:39 -0700
X-CSE-ConnectionGUID: YO1e1srrSd+/7EItpTI0SQ==
X-CSE-MsgGUID: iwucEAgERaGeoTc2ggbVbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="140225696"
Received: from jjgreens-desk16.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.222.187])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 23:20:38 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] soundwire: only compute port params in specific stream states
Date: Thu,  8 May 2025 14:20:29 +0800
Message-ID: <20250508062029.6596-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, sdw_compute_master_ports() is blindly called for every single
Manager runtime. However, we should not take into account the stream's
bandwidth if the stream is just allocated or already deprepared.

Fixes: 25befdf32aa4 ("soundwire: generic_bandwidth_allocation: count the bandwidth of active streams only")
Link: https://github.com/thesofproject/linux/issues/5398
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/generic_bandwidth_allocation.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 1cfaccf43eac..c18f0c16f929 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -204,6 +204,13 @@ static void _sdw_compute_port_params(struct sdw_bus *bus,
 			port_bo = 1;
 
 			list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+				/*
+				 * Only runtimes with CONFIGURED, PREPARED, ENABLED, and DISABLED
+				 * states should be included in the bandwidth calculation.
+				 */
+				if (m_rt->stream->state > SDW_STREAM_DISABLED ||
+				    m_rt->stream->state < SDW_STREAM_CONFIGURED)
+					continue;
 				sdw_compute_master_ports(m_rt, &params[i], &port_bo, hstop);
 			}
 
-- 
2.43.0

