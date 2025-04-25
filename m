Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1202D2586ED
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588389; cv=none; b=uuXlQYZ4dstETH6f+wT3IpkoZ+iT4q5aG0uurHQ+YbisG/lXyS+MmJfcJL55CiTm8HAyAAHetirJfnOyEWIXKasVD09l+/ZQJWTh1tMnl+8CCHwIwLW5OaPWjbvWYz6FDmxiDXZgrIsiL216OHFYWkDk99g36G6yyJ6AQ7OTzkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588389; c=relaxed/simple;
	bh=yZVSKNRDWKVJJCJw+3fUCprifgbCQie49WUAb0ecBxw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LuLv6cfqQfzHlZVqcf9vObzYpQgAMEEaJFRhIQJgcDWqSDiPsPExgHGOidOnRWzbxpEnVwTsSp4tOvg3+4pkmtKjoxyuA4/i2V+8LvpIo9Met03FCrbR0w9hhHlgKCNgbh8LDqUI7eOYVP1nYBqJSTpvGN6MH3+DhaOQiF8TVXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5C66168F;
	Fri, 25 Apr 2025 06:39:40 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 36E233F59E;
	Fri, 25 Apr 2025 06:39:45 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Will McVicker <willmcvicker@google.com>
Subject: [PATCH] bus: fsl_mc: Fix driver_managed_dma check
Date: Fri, 25 Apr 2025 14:39:28 +0100
Message-Id: <20250425133929.646493-3-robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since it's not currently safe to take device_lock() in the IOMMU probe
path, that can race against really_probe() setting dev->driver before
attempting to bind. The race itself isn't so bad, since we're only
concerned with dereferencing dev->driver itself anyway, but sadly my
attempt to implement the check with minimal churn leads to a kind of
TOCTOU issue, where dev->driver becomes valid after to_fsl_mc_driver(NULL)
is already computed, and thus the check fails to work as intended.

Will and I both hit this with the platform bus, but the pattern here is
the same, so fix it for correctness too.

Reported-by: Will McVicker <willmcvicker@google.com>
Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index a8be8cf246fb..67031136ef66 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -139,9 +139,9 @@ static int fsl_mc_bus_uevent(const struct device *dev, struct kobj_uevent_env *e
 
 static int fsl_mc_dma_configure(struct device *dev)
 {
+	const struct device_driver *drv = READ_ONCE(dev->driver);
 	struct device *dma_dev = dev;
 	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
-	struct fsl_mc_driver *mc_drv = to_fsl_mc_driver(dev->driver);
 	u32 input_id = mc_dev->icid;
 	int ret;
 
@@ -153,8 +153,8 @@ static int fsl_mc_dma_configure(struct device *dev)
 	else
 		ret = acpi_dma_configure_id(dev, DEV_DMA_COHERENT, &input_id);
 
-	/* @mc_drv may not be valid when we're called from the IOMMU layer */
-	if (!ret && dev->driver && !mc_drv->driver_managed_dma) {
+	/* @drv may not be valid when we're called from the IOMMU layer */
+	if (!ret && drv && !to_fsl_mc_driver(drv)->driver_managed_dma) {
 		ret = iommu_device_use_default_domain(dev);
 		if (ret)
 			arch_teardown_dma_ops(dev);
-- 
2.39.2.101.g768bb238c484.dirty

