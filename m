Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AA61A0BF1;
	Thu, 26 Jun 2025 06:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750918209; cv=none; b=hiY8SabTRufpuxZR1aEasfmZietnW8wiw2NeBUI3dv88pxjoD20bFN/7QSkrjzk0CjX68/RVXJlmpcjPKUIkcz2W0H9QyfLvpgOAEV1S+uP3HQqV5hKBtV7gMu2QknKVgkZI2KTdrlz4Ps7SZ01JLHWMiISSKMToHO1ujoPCom8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750918209; c=relaxed/simple;
	bh=0VjUD0rlHJg/vo4zGAKPX3dq84AtOggkwudG6hOV5cA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=le0/UtahbfGc7XnnrIhziv8hj7j9QGEH4aDHXoqXLjv9VAX4xsrCrNpOzEce6e18UlLBSHf6jHTED7CsOG2Bt59BKf3d1kMcwAzGHDrD/Yq+tm4BXxiUEzivsvclZXNZ+bpUIjGXCLwajBAKEqAzdPQlUoxxarN9TawYNHDHCp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/Qn3MJb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/Qn3MJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750918209; x=1782454209;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0VjUD0rlHJg/vo4zGAKPX3dq84AtOggkwudG6hOV5cA=;
  b=O/Qn3MJbQmi5+8SNo9tlPAfMlz1z96HaHPaGt+8HsmtmIm7U406OwpWj
   RhkAICWndnWNum8C7s4le1lwx83+aVtBo01LrSZonIS0DsVg396TkAT0h
   T6IzPcP2tJFaaVVB9VvhwGN+QglcZTI/UzxffdSkMjQn1pZd/IFszPrJr
   p/NCatokEeypjKKoqiBPCAXSmP+gwi9Gft0hCT+Qg6pKrDt84Ox2E9hoe
   9jqpuhRR7T5/+zmYTt7ZE7R9RUwQMZ/QThxNJ2Jfjzwu0lE01m/9rp56k
   10Xz3tsKwMPU6GDqdrsxNnpnP07IuL/yabwSOmeXs83gItbXOMhFR3OmB
   w==;
X-CSE-ConnectionGUID: 9y9ZIRuJS4Ot3uOQkbaxrA==
X-CSE-MsgGUID: EczfvE0ZRSyQ5kb9XFs31A==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64635383"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="64635383"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 23:10:07 -0700
X-CSE-ConnectionGUID: AGd7JTLeSqSYmxFJroxDMg==
X-CSE-MsgGUID: AUdDHZnSQ96za1yUn+B05g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="152542179"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 23:10:05 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] soundwire: stream: restore params when prepare ports fail
Date: Thu, 26 Jun 2025 14:09:52 +0800
Message-ID: <20250626060952.405996-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The bus->params should be restored if the stream is failed to prepare.
The issue exists since beginning. The Fixes tag just indicates the
first commit that the commit can be applied to.

Fixes: 17ed5bef49f4 ("soundwire: add missing newlines in dynamic debug logs")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index a4bea742b5d9..38c9dbd35606 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1510,7 +1510,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 		if (ret < 0) {
 			dev_err(bus->dev, "Prepare port(s) failed ret = %d\n",
 				ret);
-			return ret;
+			goto restore_params;
 		}
 	}
 
-- 
2.43.0

