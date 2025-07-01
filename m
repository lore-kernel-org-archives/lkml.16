Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F59B279331
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381659; cv=none; b=fgMi6gvPifwlxTSTyKJFEVSIz14e4CSfahIQ1yMQx8805WTJ/bGWx7zb6hG3cTAjzmw0IniTKmxewC4TUvKBMwoJEnJQoAOWQZ7WiO9wyG5hTcaYMvYKpVcQbOeNOoxlHLglu+yIRzaMOldux2el71Z4jL3tmcn6G+lXVyVLGyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381659; c=relaxed/simple;
	bh=kVfnIuEZjB5bHPp421bGkmfx7svcXMuvxQmlSraykCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lo8crHWvU0GHsQnR0fxtglz1Ez+VSDcblEFhWxdMSWHZsutYTn8gFfCGAZRZLsZu8D/rgKC04aKqXf58RyY0QExnfXtCs3qzH+G1bjVj5o5ZGHcpca4a4PxX+mnuTlvSgCCOqG1m/K0GOmKptNJT64ROZS5oxuH5NLBornNqN0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE899236D;
	Tue,  1 Jul 2025 07:54:02 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 002EA3F66E;
	Tue,  1 Jul 2025 07:54:15 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:37 +0100
Subject: [PATCH v2 12/28] coresight: sysfs: Validate CPU online status for
 per-CPU sources
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-12-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=1042;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=kVfnIuEZjB5bHPp421bGkmfx7svcXMuvxQmlSraykCU=;
 b=msYEhfqo/15b1dqJFoYGIEnZGzvUj1/bEpSUgI/mniIIIr9EgudVlb4Po0KS9Txv7DbI59gCk
 dJLVFaLa8UaA/42wf0pHvBS23Ksh7vqgYoRU9yo/5YcWe48HXk9YQ3f
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

The current SysFS flow first enables the links and sink, then rolls back
to disable them if the source fails to enable. This failure can occur if
the associated CPU is offline, which causes the SMP call to fail.

Validate whether the associated CPU is online for a per-CPU tracer. If
the CPU is offline, return -ENODEV and bail out.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-sysfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index feadaf065b5318c8426aa53420b8e5f67a258683..14ee15297b98115122068cbe932f0b2ce004b77e 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -161,6 +161,9 @@ static int coresight_validate_source_sysfs(struct coresight_device *csdev,
 		return -EINVAL;
 	}
 
+	if (coresight_is_percpu_source(csdev) && !cpu_online(csdev->cpu))
+		return -ENODEV;
+
 	return 0;
 }
 

-- 
2.34.1

