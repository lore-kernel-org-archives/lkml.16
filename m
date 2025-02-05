Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF76822B8CA;
	Wed,  5 Feb 2025 08:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745159; cv=none; b=Q30wjgoCKjwvYj1NoJJt2m/q1RL3W1blLApuL25wDG76UM/PGoNLR3nvcDzbApcUInkMovNsTCvAbH3NCRaTWAWAnlBHJmnwVlW6p126vUwRxJB+VxhI8hbCmQ8j62dHi5STrpAiV9xQ3Y49oEnSeP/YVnU8L2RmOPGTBmvKdYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745159; c=relaxed/simple;
	bh=2vXDq7+SgVA2KCvb2xNhw8okvp63e4r2OZttvitqe08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GWQ5v923Zo5bG5Es1ez2ymx+bajTJQGx0xsnW8wX88mXCJ6P+TMp2C9kbylE3KW7B4hRbh4XeUxe2t0nkkkH5wquGZX+gxsN8tPKRI6EaEP1BrvKpd1v1Fz/Ih00o5V9BkD4rbMHgWSn/ClJdNX4EQ9qL2N86RaEu82PRDVgznM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QsT/qw/m; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QsT/qw/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738745158; x=1770281158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2vXDq7+SgVA2KCvb2xNhw8okvp63e4r2OZttvitqe08=;
  b=QsT/qw/mO5ZYXeY1eD+kfVZPpKazMp9N1XqlcabvfEZD1wzI2kyM5qov
   Dd4iczV8i3ekAWElwE9dFzJu+XEg6dFeqYfYZKU/UAtHcJFOe2dFnzDGR
   Mg7OwtL5aiEZNF9ueDINJx8gFDC6/kNwHsDo3A1JqK0bCckq4z8N8EQE4
   kgyUDHTOvgyiuxkMQkFCPIowH/2FjhddKbCzlkX6iOOB5CLU3saD8MZdl
   2CtjcDwBw159VV5YLb2YchOzOQeV4gcyOF5vS65LUzM4KWPG48MDX+ZtV
   hKF0zXubehjdIGnBdq5VkeTkw2DrIYkcVLRYBZyZi55t9QwlJ+OO7CUXD
   w==;
X-CSE-ConnectionGUID: 4MxsEjlsQ72ccxwWnLJUVQ==
X-CSE-MsgGUID: EZv+sHLuRjqwNJwkKuZopA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38532547"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38532547"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:57 -0800
X-CSE-ConnectionGUID: o3gDldnYR3Stgt6sTZ4lEg==
X-CSE-MsgGUID: ywoJDxWQTR2HfYzBbXMHPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115887911"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.241])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:57 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 12/16] soundwire: intel: add BPT context definition
Date: Wed,  5 Feb 2025 16:45:26 +0800
Message-ID: <20250205084531.158763-13-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205084531.158763-1-yung-chuan.liao@linux.intel.com>
References: <20250205084531.158763-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

This is needed to be shared between open/send_async/close.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/intel.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index dddd29381441..d44e70d3c4e3 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -48,11 +48,34 @@ struct sdw_intel_link_res {
 	struct hdac_bus *hbus;
 };
 
+/**
+ * struct sdw_intel_bpt - SoundWire Intel BPT context
+ * @bpt_tx_stream: BPT TX stream
+ * @dmab_tx_bdl: BPT TX buffer descriptor list
+ * @bpt_rx_stream: BPT RX stream
+ * @dmab_rx_bdl: BPT RX buffer descriptor list
+ * @pdi0_buffer_size: PDI0 buffer size
+ * @pdi1_buffer_size: PDI1 buffer size
+ * @num_frames: number of frames
+ * @data_per_frame: data per frame
+ */
+struct sdw_intel_bpt {
+	struct hdac_ext_stream *bpt_tx_stream;
+	struct snd_dma_buffer dmab_tx_bdl;
+	struct hdac_ext_stream *bpt_rx_stream;
+	struct snd_dma_buffer dmab_rx_bdl;
+	unsigned int pdi0_buffer_size;
+	unsigned int pdi1_buffer_size;
+	unsigned int num_frames;
+	unsigned int data_per_frame;
+};
+
 struct sdw_intel {
 	struct sdw_cdns cdns;
 	int instance;
 	struct sdw_intel_link_res *link_res;
 	bool startup_done;
+	struct sdw_intel_bpt bpt_ctx;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs;
 #endif
-- 
2.43.0

