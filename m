Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C78278768
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381699; cv=none; b=d09pbZez5MtCNMPXkJiGrJuaQ467xR+GH+M2ZUUlQXb+01rgZXiQmQcUjgdX1/6IDl0vFspKLupwESY7WVr3mAb8ebIfdHl1+NH5ww386SlNpyV0yZBd2cQZVM0GO/Rvd3dBuZ/OkPrQlMLsbd9vTi+VBzdploHBns6lbj0F2cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381699; c=relaxed/simple;
	bh=VXURT5YNfJCgVDQn9xbHJCyB9NNKk9hTM6afuDo+h18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PRTUy1SYGJblnz4WjpptBHyCHKa72i6YUAZMpCt6VZmTXDEva2eZSb2yB/uVw7RvtKTcHZ9jX1LYZHWkBSVbSON7e96i3Lqk8OBBpryAtwyMu8BOGdQJYbgYUUFlpaob3VPSTMobzLLCLpt1G0l3HvtYGPin4AEOkET5geAAVS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55F0112FC;
	Tue,  1 Jul 2025 07:54:40 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B6D13F66E;
	Tue,  1 Jul 2025 07:54:53 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:53 +0100
Subject: [PATCH v2 28/28] coresight: Manage activated path during CPU
 hotplug
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-28-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=1398;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=VXURT5YNfJCgVDQn9xbHJCyB9NNKk9hTM6afuDo+h18=;
 b=Zt9zzL0IG1nPqpBSgmtqOTMWoR5vbwEPdJd6wVKgUoxZy+PO9o2k4gyjEnPKQgoASLUehaGXt
 /JAt1ZldA1qCNXP3ur8edXP4hkv7C9g1WsSCgvscwvpd9vzdGqIHOAe
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

This commit handles activated path during the CPU hotplug process.

When a CPU is hotplug off or hotplug in, and if an activated path is
associated with it, the CPU PM notifier disables and enables the path,
including the sink and helpers.

When disabling a path, the sink's disable() callback updates its buffer
in SysFS mode.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index e1659b05738e73fcb6c66c74c8f1ce3a24ab2da4..0f77f4c5464550a28e2dce391e92160a7003c140 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1717,6 +1717,7 @@ static int coresight_starting_cpu(unsigned int cpu)
 	if (path->saved_mode != CS_MODE_SYSFS)
 		return 0;
 
+	_coresight_enable_path(path, path->saved_mode, NULL, false);
 	source_ops(source)->enable(source, NULL, path->saved_mode, path);
 	return 0;
 }
@@ -1743,7 +1744,8 @@ static int coresight_dying_cpu(unsigned int cpu)
 	if (WARN_ON(path->saved_mode != CS_MODE_SYSFS))
 		return 0;
 
-	source_ops(source)->disable(source, NULL);
+	coresight_disable_source(source, NULL);
+	coresight_disable_path_from(path, NULL, false);
 	return 0;
 }
 

-- 
2.34.1

