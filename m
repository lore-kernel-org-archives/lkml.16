Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D363027FD5D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381681; cv=none; b=CRju2zTsWPn5NrDS32EI3ibIHPOZEBotLQAa9Nz2ZRLJjKYsTeI94/sLGLLFimV1OgNKU7DOwq9kcSvH+0Je0xdhxV618o+EbuECkUf6GHI7aeI7NnqlCsDYuHuI0j+/ye3YNxbQo6DSxl4Nn1Z1Tpd1LF7r1qpR6b0a8Cnd0K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381681; c=relaxed/simple;
	bh=8KnowfizcKTwHx9JascrgsezO+T6JM3qkVi26atwE48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cnTmYhOVVeEgNU4fsp/0TTuaqsBWGNhZBTPnbdYWvxSy9+/dG4k7kv6vq8XdcSB2gzo7VEXqjRn05C2xTAezt8o5xcO4M856A2iUzeSjih9R1As/V/PZVYB0L4pZmlWXqixECSe68Rqoz3vBZIlvbCpsw3HzOUZwM9CGPnTgwGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7DD512FC;
	Tue,  1 Jul 2025 07:54:23 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 293D23F66E;
	Tue,  1 Jul 2025 07:54:37 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:46 +0100
Subject: [PATCH v2 21/28] coresight: Add per-CPU path pointer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-21-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=3722;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=8KnowfizcKTwHx9JascrgsezO+T6JM3qkVi26atwE48=;
 b=gPP+nUzhLlf6ecDk58Jt4hCmgdvZgMFpc899ez+vsNs/AL3f3trJGGmyTl5tF02sRIRHuVRgB
 g88q5FvfzFeArzQxP79zxQZj8+eUlX9ZUJ0s/DWcOa31/Fd1CuxxnHt
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Introduce per-CPU path pointers, save activated paths into the
structure. This will be used by later changes for controlling the path
during CPU idle.

The path pointer is assigned before setting the source device mode to
active, and it is cleared after the device is changed to an inactive
mode. So safe access to path pointers is guaranteed when the device is
in an active mode.

The path enabling has been refactored: a new _coresight_enable_path()
function is introduced to enable components in the path. The existing
coresight_enable_path() function now calls this new helper and updates
the per-CPU pointers accordingly.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 48 ++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 45f15a1f51295b298073551cb328d20cc2c36cdb..ef2a0de366d9b12b4f609027c8b67f690cf84558 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -35,6 +35,27 @@ DEFINE_MUTEX(coresight_mutex);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_source);
 
+/*
+ * Activated path pointer for a per-CPU source device. When enabling a path,
+ * the path pointer is first assigned, followed by a synchronous SMP call on
+ * the target CPU to transition the device mode from DISABLED to an enabled
+ * state. Conversely, during the disable flow, an SMP call on the target CPU
+ * transitions the device mode to DISABLED, after which the path pointer is
+ * cleared.
+ *
+ *  per_cpu(csdev_cpu_path, csdev->cpu) = path
+ *  coresight_take_mode(csdev, CS_MODE_SYSFS or CS_MODE_PERF)
+ *
+ *  // Safe to access per_cpu(csdev_cpu_path, cpu);
+ *
+ *  coresight_set_mode(csdev, CS_MODE_DISABLED)
+ *  per_cpu(csdev_cpu_path, csdev->cpu) = NULL
+ *
+ * As a result, the device mode is used to determine whether it is safe
+ * to access the path pointer.
+ */
+static DEFINE_PER_CPU(struct coresight_path *, csdev_cpu_path);
+
 /**
  * struct coresight_node - elements of a path, from source to sink
  * @csdev:	Address of an element.
@@ -508,6 +529,12 @@ static void coresight_disable_path_from(struct coresight_path *path,
 
 void coresight_disable_path(struct coresight_path *path)
 {
+	struct coresight_device *source;
+
+	source = coresight_get_source(path);
+	if (coresight_is_percpu_source(source))
+		per_cpu(csdev_cpu_path, source->cpu) = NULL;
+
 	coresight_disable_path_from(path, NULL);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_path);
@@ -531,8 +558,8 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 	return 0;
 }
 
-int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
-			  void *sink_data)
+static int _coresight_enable_path(struct coresight_path *path,
+				  enum cs_mode mode, void *sink_data)
 {
 	int ret = 0;
 	u32 type;
@@ -599,6 +626,23 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 	goto out;
 }
 
+int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
+			  void *sink_data)
+{
+	int ret;
+	struct coresight_device *source;
+
+	ret = _coresight_enable_path(path, mode, sink_data);
+	if (ret)
+		return ret;
+
+	source = coresight_get_source(path);
+	if (coresight_is_percpu_source(source))
+		per_cpu(csdev_cpu_path, source->cpu) = path;
+
+	return 0;
+}
+
 struct coresight_device *coresight_get_sink(struct coresight_path *path)
 {
 	struct coresight_device *csdev;

-- 
2.34.1

