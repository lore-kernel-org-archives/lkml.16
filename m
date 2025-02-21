Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1501253B7D;
	Fri, 21 Feb 2025 18:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740161053; cv=none; b=g8wW/BsNGTmUfec9OfzIdRy98Pu2Sen2iwVEjAx3aU7AVr1SPCVUk083e8OC5ppxmkoamHgvFz+ROcReC5Cfz5aj/mev8UvitBw6xr4bfu9wq+413DocQ4GKnKhXPA64CeWIdCOSBrbyYZXkjLOop3SoPKU6FsvynoQqhlKOf5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740161053; c=relaxed/simple;
	bh=Gkzd+0+eoZlvdbPR8c1GU4RoDNPv/6Zi7aLQNFled24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xj0pMNuMgwx1CJn3eqYQy9UGXrDnmCzfS2IDVs9vMyMIqki3tZLgAZrRu55IStboOF8YqfUbAh5wbJ1tTdUiasCG+uhI2AS79HnsZvBMa0Wcc2PKi1MWXTG+BqWCo8dN8GoNbds0z4I6CDB7oTn9xTuHRBJlqiMynigfTHeZqMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E37EC169C;
	Fri, 21 Feb 2025 10:04:28 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A6A63F59E;
	Fri, 21 Feb 2025 10:04:08 -0800 (PST)
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH v7 06/10] perf: arm_pmuv3: Add support for ARM Rainier PMU
Date: Fri, 21 Feb 2025 18:03:45 +0000
Message-ID: <20250221180349.1413089-7-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the ARM Rainier CPU core PMU.

Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 drivers/perf/arm_pmuv3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 0e360feb3432..3785522a08e7 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1369,6 +1369,7 @@ PMUV3_INIT_SIMPLE(armv8_neoverse_v1)
 PMUV3_INIT_SIMPLE(armv8_neoverse_v2)
 PMUV3_INIT_SIMPLE(armv8_neoverse_v3)
 PMUV3_INIT_SIMPLE(armv8_neoverse_v3ae)
+PMUV3_INIT_SIMPLE(armv8_rainier)
 
 PMUV3_INIT_SIMPLE(armv8_nvidia_carmel)
 PMUV3_INIT_SIMPLE(armv8_nvidia_denver)
@@ -1416,6 +1417,7 @@ static const struct of_device_id armv8_pmu_of_device_ids[] = {
 	{.compatible = "arm,neoverse-v2-pmu",	.data = armv8_neoverse_v2_pmu_init},
 	{.compatible = "arm,neoverse-v3-pmu",	.data = armv8_neoverse_v3_pmu_init},
 	{.compatible = "arm,neoverse-v3ae-pmu",	.data = armv8_neoverse_v3ae_pmu_init},
+	{.compatible = "arm,rainier-pmu",	.data = armv8_rainier_pmu_init},
 	{.compatible = "cavium,thunder-pmu",	.data = armv8_cavium_thunder_pmu_init},
 	{.compatible = "brcm,vulcan-pmu",	.data = armv8_brcm_vulcan_pmu_init},
 	{.compatible = "nvidia,carmel-pmu",	.data = armv8_nvidia_carmel_pmu_init},
-- 
2.43.0

