Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA6327CCF0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381662; cv=none; b=IDOBBJfzKh8wmdNQh0WqPnSrwJLAaumcR5D8DmLKr7Pe3RAWmEWmHwFiEyPnNLUIssrowVfwhR77wVCfhNV6mhLUQbergCMFQLT8QF74OdBCd/yAW2mStJExfl8msP9k8TZh22BDwjgstOzlmQQnkvmnmpomDTA1EQGs0NW2CV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381662; c=relaxed/simple;
	bh=4m7eT5tfhZOLfAcGb/o9rljKjvvedBRVjxFwdOLgSqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r2WkBIFD1Mke5ia2FZmwh+gWBCeKH2vf3ilBXz7osVu+31g5sigmq/CHGUCLrJAeVQAxkTHuCYGrIPROQQg8GWpo9Dz8FEWj3NmPNgqxXWWbCsDseN212Kjuzq4AbVEQ5vKcMJO08phxZ64EkiFCYur+LxFbfktVX7PW6j3W6ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10FDE12FC;
	Tue,  1 Jul 2025 07:54:05 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 560F83F66E;
	Tue,  1 Jul 2025 07:54:18 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:38 +0100
Subject: [PATCH v2 13/28] coresight: Set per CPU source pointer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-13-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=1922;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=4m7eT5tfhZOLfAcGb/o9rljKjvvedBRVjxFwdOLgSqI=;
 b=7qpgAmLoyoY7ovI70BZmdSIYYa9Jq+O6UeTZHDqhzWy+2tWL6H5heDIZz+p9ab/Vmza9ELq37
 BMa+4vW1I9SCXCtHXHs+gnzu9MDpVa20WJAhwBN9OFcIriTS6B9uDTf
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Introduce coresight_set_percpu_source() for setting CPU source device. The
sources are maintained in a per CPU structure 'csdev_source'.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 1a4bde5d6cd8fcfdd43bcafb45aa4dc5f1dd2d34..042e8e646ff521a15dc18d7264faa427f1ac0dc7 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -32,6 +32,7 @@
  */
 DEFINE_MUTEX(coresight_mutex);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
+static DEFINE_PER_CPU(struct coresight_device *, csdev_source);
 
 /**
  * struct coresight_node - elements of a path, from source to sink
@@ -77,6 +78,11 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
 }
 EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
 
+static void coresight_set_percpu_source(int cpu, struct coresight_device *csdev)
+{
+	per_cpu(csdev_source, cpu) = csdev;
+}
+
 static struct coresight_device *coresight_get_source(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
@@ -1390,6 +1396,10 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 			goto out_unlock;
 		}
 	}
+
+	if (coresight_is_percpu_source(csdev))
+		coresight_set_percpu_source(csdev->cpu, csdev);
+
 	/* Device is now registered */
 	registered = true;
 
@@ -1421,6 +1431,8 @@ EXPORT_SYMBOL_GPL(coresight_register);
 
 void coresight_unregister(struct coresight_device *csdev)
 {
+	if (coresight_is_percpu_source(csdev))
+		coresight_set_percpu_source(csdev->cpu, NULL);
 	etm_perf_del_symlink_sink(csdev);
 	/* Remove references of that device in the topology */
 	if (cti_assoc_ops && cti_assoc_ops->remove)

-- 
2.34.1

