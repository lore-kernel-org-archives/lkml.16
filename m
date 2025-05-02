Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA2223FC5A
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184279; cv=none; b=lvmxVIThi4GpAf2uxLeok3/FLV7jfct120gW2Tfw2y/fIvj32Xa6EhD6z44UADjsWid3lXrYtaoEoM6jaQwjunu5nBAs5R6RNnssCLPvBQiGNxVvqqFdFpEw5U6vPM1aRr0hGXe5SRbNJT1VSIxdSxPcoHaF0jkZHNM1PDVVR0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184279; c=relaxed/simple;
	bh=5x2cPJ9xDp00yJ7ZoWTufzMw/GRYyxNXmL3uAafLwq4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k6yZvGHBMhv7+WszTB3bG584S1Zbi9RnXc5D23gQUKraWvhXc8QC6+S6JLeyLPTjYCMWJuDFOD2wc0hkdu5D0MaRH+wO/tjv3Y6rm0kNFWe+XRFjgBtmwDXJEDBfmRlKKECoC0bC3GnBR/DALCcBZQNF6nXuVYgoMgJvHpAchzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E65E1688;
	Fri,  2 May 2025 04:11:07 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA2913F66E;
	Fri,  2 May 2025 04:11:13 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH] coresight: replicator: Fix panic for clearing claim tag
Date: Fri,  2 May 2025 12:11:08 +0100
Message-Id: <20250502111108.2726217-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On platforms with a static replicator, a kernel panic occurs during boot:

  [    4.999406]  replicator_probe+0x1f8/0x360
  [    5.003455]  replicator_platform_probe+0x64/0xd8
  [    5.008115]  platform_probe+0x70/0xf0
  [    5.011812]  really_probe+0xc4/0x2a8
  [    5.015417]  __driver_probe_device+0x80/0x140
  [    5.019813]  driver_probe_device+0xe4/0x170
  [    5.024032]  __driver_attach+0x9c/0x1b0
  [    5.027900]  bus_for_each_dev+0x7c/0xe8
  [    5.031769]  driver_attach+0x2c/0x40
  [    5.035373]  bus_add_driver+0xec/0x218
  [    5.039154]  driver_register+0x68/0x138
  [    5.043023]  __platform_driver_register+0x2c/0x40
  [    5.047771]  coresight_init_driver+0x4c/0xe0
  [    5.052079]  replicator_init+0x30/0x48
  [    5.055865]  do_one_initcall+0x4c/0x280
  [    5.059736]  kernel_init_freeable+0x1ec/0x3c8
  [    5.064134]  kernel_init+0x28/0x1f0
  [    5.067655]  ret_from_fork+0x10/0x20

A static replicator doesn't have registers, so accessing the claim
register results in a NULL pointer deference.  Fixes the issue by
accessing the claim registers only after the I/O resource has been
successfully mapped.

Fixes: 6f4c6f70575f ("coresight: Clear self hosted claim tag on probe")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index f1d2f764e898..06efd2b01a0f 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -262,6 +262,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
 		drvdata->base = base;
 		desc.groups = replicator_groups;
 		desc.access = CSDEV_ACCESS_IOMEM(base);
+		coresight_clear_self_claim_tag(&desc.access);
 	}
 
 	if (fwnode_property_present(dev_fwnode(dev),
@@ -284,7 +285,6 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	desc.pdata = dev->platform_data;
 	desc.dev = dev;
 
-	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
-- 
2.34.1

