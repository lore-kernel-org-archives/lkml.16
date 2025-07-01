Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CE628030C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381683; cv=none; b=F9fVAIzxNuryDLAZvwPOShDix6BQm8KKaMxNrV8MDs9K7bZ/ckKXBE76JUOeNRMTlRwmQhgQed903EvapMb2R46Hs4w5J0lenp9/gN+yq112pFsfZ+Pbubsyrlqc5Q8FkTsgUKFtBENfU9GpB0ehYN/B4Tgd9GqMUY/Ot2cRBvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381683; c=relaxed/simple;
	bh=daI45/KHLkHSHN5ClQd+NXqQYk8WXPHn3Y1nZBaOnwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lilp3yHH6HvygqnAqCv6dCDOcSauf9HMn8nQcvqCAsN0eY0QFsfbLSW1VNe/2hUk4BTRj7slba43BfZq3l7RW4gKgMhNV/pEF2t254vgswidJatrP+RUQdLwcsIUPLHfc0KIKFZIuk5FEn0ZDOKAXrozQSsOeFvxBi4IBaCpumc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39C04236D;
	Tue,  1 Jul 2025 07:54:26 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F49F3F66E;
	Tue,  1 Jul 2025 07:54:39 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:47 +0100
Subject: [PATCH v2 22/28] coresight: Add 'in_idle' argument to path
 enable/disable functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-22-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=3705;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=daI45/KHLkHSHN5ClQd+NXqQYk8WXPHn3Y1nZBaOnwE=;
 b=D7TZxKDdiBKP3SIYjMRDWTWkbQJUy21hUHB2lXoNRy8khhqrIPLMkmP5b5kWIxDetMDclolmB
 9g354hqx5dNAbXp/e46yWoWlCrfizQ8bOQp6XIck1ILpLiLQX00gMHx
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Introduce an in_idle argument to the path enable and disable functions.
When set to true, it skips to touch the sink device. To avoid invoking
sink related helpers, the condition check is moved before the enable
helpers are called.

This is a preparation for managing the path during CPU idle.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 29 +++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index ef2a0de366d9b12b4f609027c8b67f690cf84558..b1c122d1c4164e3ca6f1aaad0bd24917032626be 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -477,7 +477,8 @@ static void coresight_restore_source(struct coresight_device *csdev)
  * disabled.
  */
 static void coresight_disable_path_from(struct coresight_path *path,
-					struct coresight_node *nd)
+					struct coresight_node *nd,
+					bool in_idle)
 {
 	u32 type;
 	struct coresight_device *csdev, *parent, *child;
@@ -500,6 +501,10 @@ static void coresight_disable_path_from(struct coresight_path *path,
 						CORESIGHT_DEV_TYPE_SINK :
 						CORESIGHT_DEV_TYPE_LINK;
 
+		/* To reduce latency, CPU idle does not touch the sink */
+		if (in_idle && type == CORESIGHT_DEV_TYPE_SINK)
+			continue;
+
 		switch (type) {
 		case CORESIGHT_DEV_TYPE_SINK:
 			coresight_disable_sink(csdev);
@@ -535,7 +540,7 @@ void coresight_disable_path(struct coresight_path *path)
 	if (coresight_is_percpu_source(source))
 		per_cpu(csdev_cpu_path, source->cpu) = NULL;
 
-	coresight_disable_path_from(path, NULL);
+	coresight_disable_path_from(path, NULL, false);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_path);
 
@@ -559,7 +564,8 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 }
 
 static int _coresight_enable_path(struct coresight_path *path,
-				  enum cs_mode mode, void *sink_data)
+				  enum cs_mode mode, void *sink_data,
+				  bool in_idle)
 {
 	int ret = 0;
 	u32 type;
@@ -572,10 +578,6 @@ static int _coresight_enable_path(struct coresight_path *path,
 		csdev = nd->csdev;
 		type = csdev->type;
 
-		/* Enable all helpers adjacent to the path first */
-		ret = coresight_enable_helpers(csdev, mode, path);
-		if (ret)
-			goto err_disable_path;
 		/*
 		 * ETF devices are tricky... They can be a link or a sink,
 		 * depending on how they are configured.  If an ETF has been
@@ -587,6 +589,15 @@ static int _coresight_enable_path(struct coresight_path *path,
 						CORESIGHT_DEV_TYPE_SINK :
 						CORESIGHT_DEV_TYPE_LINK;
 
+		/* To reduce latency, CPU idle does not touch the sink */
+		if (in_idle && type == CORESIGHT_DEV_TYPE_SINK)
+			continue;
+
+		/* Enable all helpers adjacent to the path first */
+		ret = coresight_enable_helpers(csdev, mode, path);
+		if (ret)
+			goto err_disable_path;
+
 		switch (type) {
 		case CORESIGHT_DEV_TYPE_SINK:
 			ret = coresight_enable_sink(csdev, mode, sink_data);
@@ -622,7 +633,7 @@ static int _coresight_enable_path(struct coresight_path *path,
 err_disable_helpers:
 	coresight_disable_helpers(csdev, path);
 err_disable_path:
-	coresight_disable_path_from(path, nd);
+	coresight_disable_path_from(path, nd, false);
 	goto out;
 }
 
@@ -632,7 +643,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 	int ret;
 	struct coresight_device *source;
 
-	ret = _coresight_enable_path(path, mode, sink_data);
+	ret = _coresight_enable_path(path, mode, sink_data, false);
 	if (ret)
 		return ret;
 

-- 
2.34.1

