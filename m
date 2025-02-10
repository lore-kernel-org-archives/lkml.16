Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549F41D5CE8
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187408; cv=none; b=h8xx1oZJH7CQW/2C+n6rV6E8naPU5ftCOchUuStZt30EZazQmbPTyR5sYfs+z7BRouvTY1y74QESp2z5L8G/WUZk0QsaABltxePzywb+s0IEuYMflkD5EQ+t/0jVXoJzwr821nta6pjCaxQibOcpWnFChg0bxdorEfChuSkOBZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187408; c=relaxed/simple;
	bh=uCV2tAoMGXYCBNOgQEOeFDyRm6fM97DBdQGgiHHrH3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VR+/sl9s01G7uSgJeRn0Juq0xJF5sKtcrGaVinz7uAJyZk/CD8RHFCcdkO9sN0YvqIiKjszaemOb5ufWPOc5BnvVOPbyfj8gbmwCcpo/IO9mRLq4xdL3/mPmbHSxFaVS473A1HCRTuYTj654QYs+bxhnSq4yJRuJSqVxxiO0EkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kqLakCI/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kqLakCI/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=MkO/9X+VjCYKaz
	5toI02hL625tEKcVF2KKPURzcR3Uw=; b=kqLakCI/vazAQP60hgBOMCYkV1X9GM
	VpS+fio/jjQ23yV4Xq/skLL8A+xExNLdXwecBQolqUZBhlFwVyaA/AVu3Bv6T/2D
	sKEwlJaOfLmRix+Su9eNnLC0hP+SF/dsNHQA2fPFVLxtf3DllZNpiWzp/nEYNBYS
	m7s3VAJyPbuKjqeMIwlSKuhPb4w+REdMGo8mV5RfAZAAsL4InkFP3aiRoTv3K+Ul
	NtQgWNP6eM3cGCfJmSXrVqrsMdd21ZG9Rlw61cD7H5acuBNWSvNANSRJq5ACsEYg
	lO7yVmYb5IEMYNx91sy9ZJxzJ2BXDolxLUd/5SWgEjfhFShAgIXRva2g==
Received: (qmail 802320 invoked from network); 10 Feb 2025 12:36:43 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2025 12:36:43 +0100
X-UD-Smtp-Session: l3s3148p1@XHFjH8gteL1ehh99
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RESEND] coresight: etm4x: don't include '<linux/pm_wakeup.h>' directly
Date: Mon, 10 Feb 2025 12:36:36 +0100
Message-ID: <20250210113635.51935-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header clearly states that it does not want to be included directly,
only via '<linux/(platform_)?device.h>'. Which is already present, so
delete the superfluous include.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2c1a60577728..bdb9262798cc 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -24,7 +24,6 @@
 #include <linux/cpu_pm.h>
 #include <linux/coresight.h>
 #include <linux/coresight-pmu.h>
-#include <linux/pm_wakeup.h>
 #include <linux/amba/bus.h>
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
-- 
2.45.2

