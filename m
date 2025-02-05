Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD37322D4C9;
	Wed,  5 Feb 2025 08:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745165; cv=none; b=CH1Ssf+PNNObZxsOR2TlKl+/WEgDTx9GHbK+39ReMorNNd6bpnZI8jgdKS0119dDDu2pCXBX6wss4QiyqJ5hHyrW1XBMAUo1BNClT8KCFgtRYBLDA29xq5dOLGmW4kecasEV41Y+pvzP3X0NxhJYvqEUDsiRA5swDIDQXzSfJyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745165; c=relaxed/simple;
	bh=goZDLHvWODKwCst2CM1CW/pL0JVHaP6YCWm3xiQc4VU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TxqTpeCDEBEtUQz96m1Bva2W9R2soshXkSR/vES+oTwFr8xoDF4iy1GgC9P94BQlScnjKIHR7QWbq4amUEVWC8ZC5CnIArRkcoQyK4T7yIDgBNnrtvjtydVUv0ib5x9rmb2iZgfegZiN5CbSbdEEtR1De5c8/b1GM5evzHL3Mx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qsno1VT9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qsno1VT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738745163; x=1770281163;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=goZDLHvWODKwCst2CM1CW/pL0JVHaP6YCWm3xiQc4VU=;
  b=Qsno1VT9wEQBpTUyVUBubVnwjWSGSQ/8qevKGjhLb/yHE1IxFu5NmBty
   CibxMCvYNBGum0hg3Z/pd5YWK9Eo4lgUWudW0UEWJsLs4MBfY4Je0yQxH
   Qbf6gH+wyQJn7nDU81oJiX/2PPCwHuO3ndSp1rpxShXlTf0tDUvs6ca2Z
   IHZuL9FkTgGJXcoJEp29PKlIAlZZ+pK9EEgkoBjfeNWb3d7phbo2RYY9t
   0YCDpHF2WJCk872c3vDoIQjlYqBnoYwntqTmpSNdYoAX3aG2gZPvGhm56
   YrDVfpff8CEWtlcgEx72dXLovRXpbYIEcyeXg182z/J2gKxq6enTRZ1bC
   Q==;
X-CSE-ConnectionGUID: 964Xyu4JRVC6gS+0jZFj0w==
X-CSE-MsgGUID: REFsesYYTLe0b5mcaY/kqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38532567"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38532567"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:46:03 -0800
X-CSE-ConnectionGUID: sSQO9D1bSLaTVHYxpf0l3Q==
X-CSE-MsgGUID: K+aWGSqWTe6iUj72KTMAFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115887954"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.241])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:46:03 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 16/16] ASoC: rt711-sdca: add DP0 support
Date: Wed,  5 Feb 2025 16:45:30 +0800
Message-ID: <20250205084531.158763-17-yung-chuan.liao@linux.intel.com>
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

DP0 is required for BPT/BRA transport.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index f5933d2e085e..e87e2e1bfff7 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -225,6 +225,14 @@ static int rt711_sdca_read_prop(struct sdw_slave *slave)
 		j++;
 	}
 
+	prop->dp0_prop = devm_kzalloc(&slave->dev, sizeof(*prop->dp0_prop),
+				      GFP_KERNEL);
+	if (!prop->dp0_prop)
+		return -ENOMEM;
+
+	prop->dp0_prop->simple_ch_prep_sm = true;
+	prop->dp0_prop->ch_prep_timeout = 10;
+
 	/* set the timeout values */
 	prop->clk_stop_timeout = 700;
 
-- 
2.43.0

