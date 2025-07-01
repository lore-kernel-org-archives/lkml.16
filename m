Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C716A2797BE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381641; cv=none; b=b78Adj7fL7jXD3JNQhummoMvjvjrtKluMu5hj+yFGux5Tjc5UUv6uEqKyY3orSh4R1Qoztt/jC1CafoubspJjxU3x0kYFy3dA/+/1Uw7qRiayvLwAtWlpPnguv/JFbB6wkOj5MvuJ6ltOfythoXtdU9YfkyeKU9p1fR7MdqFPBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381641; c=relaxed/simple;
	bh=XEklKqzZzuBQgA3S6YOLjB8+BUxX080YryaSPCcA+T4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yh786SV/qD+OjxqnChuhL6ZJ5Sr0QeYjQ7U2PeQEmfbMfo2W1RsISEIiXYtzic7HpwFKKJSMSVOMNMJHmhufkKnBw0kUFqMZwsGR3iPD3iatZ6y2eIo5vk7TFPpJgbPR6KR4Saw0MXu2ylx4xVHaSqOGjee6WwBCxUnz6qtG0Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA68512FC;
	Tue,  1 Jul 2025 07:53:43 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C0A43F66E;
	Tue,  1 Jul 2025 07:53:57 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:29 +0100
Subject: [PATCH v2 04/28] coresight: etm4x: Correct polling IDLE bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-4-23ebb864fcc1@arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Levi Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=1181;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=XEklKqzZzuBQgA3S6YOLjB8+BUxX080YryaSPCcA+T4=;
 b=r3aN+HbjUuRZVfFTL5aRWKsJ3SDRhfNEhiXbvAheENKE2QZWV9KfOOyiJknHDM7mY9+ATYBiK
 Nkr2ZlbD42NCTK8j7CU8CNYFvpdYe7EYjgiKrnb0pktL/d3Lx1vLjFV
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Since commit 4ff6039ffb79 ("coresight-etm4x: add isb() before reading
the TRCSTATR"), the code has incorrectly been polling the PMSTABLE bit
instead of the IDLE bit.

This commit corrects the typo.

Fixes: 4ff6039ffb79 ("coresight-etm4x: add isb() before reading the TRCSTATR")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index ee405c88ea5faa130819f96b00b8307f8764d58a..0f2a8b8459c93ca29d270b6fa05928244e0761c5 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1921,7 +1921,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 		state->trcpdcr = etm4x_read32(csa, TRCPDCR);
 
 	/* wait for TRCSTATR.IDLE to go up */
-	if (etm4x_wait_status(csa, TRCSTATR_PMSTABLE_BIT, 1)) {
+	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 1)) {
 		dev_err(etm_dev,
 			"timeout while waiting for Idle Trace Status\n");
 		etm4_os_unlock(drvdata);

-- 
2.34.1

