Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F117405A
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 10:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746096145; cv=none; b=Ttn+akES3KzvRu98egDer/pZ8jFdfb2WRZRH5bM0fKibvJAtJBDOhaBXDDYBf9pa+H/1v62MlMkQ21H3gZ5Psk2PDKA6KJ78k9AxQFfdsVYR6PVefEPcc2/hzWs+BRcXd1moyU5bTL8ednjsus8m17Oy9qUfZqNSU/aZ2IJ9t0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746096145; c=relaxed/simple;
	bh=mybtwAHUCt1+RJrPHko4tTrPUoyxkIyYXMT7DGOMCWo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qp39fpJqbhOr8moL+iDERlwdOsX8sQyf0QkJIm9VqksBcftV1FBpbwJ9Ydr67ilasphrJVMT5tBIY4xd/1k+a/PJlnPgkXTZsntHkyrPuSA3m6yJ1THPC/A7Xp6WCX1OX4Pm1itujYgSV4oLsk8dVeMdZc+DtHi39Q/0LvvTJXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA08B106F;
	Thu,  1 May 2025 03:42:15 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E776B3F673;
	Thu,  1 May 2025 03:42:21 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH] coresight: etm4x: Remove redundant claim register setting
Date: Thu,  1 May 2025 11:42:16 +0100
Message-Id: <20250501104216.2375126-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The claim register is set twice in the restore flow; remove the
duplicate operation.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 5c20ed4cf4ed..228317991ec2 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1958,8 +1958,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	if (drvdata->numvmidc > 4)
 		etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR1);
 
-	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
-
 	if (!drvdata->skip_power_up)
 		etm4x_relaxed_write32(csa, state->trcpdcr, TRCPDCR);
 
-- 
2.34.1

