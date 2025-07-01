Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6B82797AF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381686; cv=none; b=cbhfu2ebeACKcbtY/sObSxNCu/d261DIV4V8WXEIKx6gB/2YdZ5urzsCZAnwc9XywPCrKdnb1U8lZYhnkPzsCI35tnDKUZIVALl55yIYeTr9y0tV6lMJcAy8L2vW5T1VzdVDQ9llV9bfDxmU4UA3IkBQg2M/Z7jaQmPJaMhiRTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381686; c=relaxed/simple;
	bh=9L1EiYgvY38bCT1qDmDUnheuGD4I8DQDte2Ndag5pCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M+O6PiNZv6f4PxGEfq/wLSgjWUjlPBEyNh/G4YR20xCD+Rurtf2qTPGXCLSfavc3Ui3/RmrLpG2fI4mwJ+EDKwNCHQOytECvW+QI7xW58xHT+ayZ8UJTqjoiUR0hX9DLJuYsKv0blsN5ef2SB2ltJcmZTRvLrRU0vyvpuua1PQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 908B112FC;
	Tue,  1 Jul 2025 07:54:28 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5ADB3F66E;
	Tue,  1 Jul 2025 07:54:41 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:48 +0100
Subject: [PATCH v2 23/28] coresight: Control path during CPU idle
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-23-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=2166;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=9L1EiYgvY38bCT1qDmDUnheuGD4I8DQDte2Ndag5pCw=;
 b=Fgy6ikEzF+BfBZfN+rwxGhriIHc/dM/seJY8qlKEnJjto30WIMD8LgrB4oby5liMO/lgMuODb
 rkY14JfnHEvA8R8apdo5v6gES1n7DL1ub3DoJXb9Pwxxp7DtihUQBBY
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Control links and helpers on an activated path during CPU idle. Since
coresight_disable_path_from() does not handle a source device's
helpers, explicitly disable them alongside the source device.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index b1c122d1c4164e3ca6f1aaad0bd24917032626be..7693a0eade1a8de6d0960d66f6de682b5d5aff17 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -458,8 +458,15 @@ static bool coresight_need_save_restore_source(struct coresight_device *csdev)
 
 static int coresight_save_source(struct coresight_device *csdev)
 {
-	if (csdev && source_ops(csdev)->save)
-		return source_ops(csdev)->save(csdev);
+	int ret;
+
+	if (csdev && source_ops(csdev)->save) {
+		ret = source_ops(csdev)->save(csdev);
+		if (ret)
+			return ret;
+
+		coresight_disable_helpers(csdev, NULL);
+	}
 
 	/* Return success if callback is not supported */
 	return 0;
@@ -1662,17 +1669,33 @@ static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 {
 	unsigned int cpu = smp_processor_id();
 	struct coresight_device *source = per_cpu(csdev_source, cpu);
+	struct coresight_path *path;
 
 	if (!coresight_need_save_restore_source(source))
 		return NOTIFY_OK;
 
+	/*
+	 * When run at here, the source device mode is enabled.
+	 * The activated path pointer must not be NULL.
+	 */
+	path = per_cpu(csdev_cpu_path, source->cpu);
+	if (WARN_ON(!path))
+		return NOTIFY_BAD;
+
 	switch (cmd) {
 	case CPU_PM_ENTER:
 		if (coresight_save_source(source))
 			return NOTIFY_BAD;
+
+		coresight_disable_path_from(path, NULL, true);
 		break;
 	case CPU_PM_EXIT:
 	case CPU_PM_ENTER_FAILED:
+		if (_coresight_enable_path(path,
+					   coresight_get_mode(source),
+					   NULL, true))
+			return NOTIFY_BAD;
+
 		coresight_restore_source(source);
 		break;
 	default:

-- 
2.34.1

