Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F36D2C08C9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025141; cv=none; b=hSgMAPC+3bdSeXGD/+e220XR3tF0+WcXAZgd5wzdmLygansxQMNTPfRQNduUDa53tYNirGUZLGSkqvkMmnp42//yG3nNx+j10Z2YwClHNVa4HVciTegjD1ytRjdLS4oRaWUhdTm9b5skGirUq1M9QBZcnSj7+Ef9o+0MKoclF9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025141; c=relaxed/simple;
	bh=qoXC/l3xNPFNA8wYwenCP2bGPYx0KGdr+dPkmBLbGJw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HN511yeju9eRjmnUQfsfVfqCrkDX9B5CcDknr2uvqen6wJWIQsqpB/k0w2Y0WouAFwO046G3rYTWD/nCQ011Xpi4WjZJM/4FuzVePCvxggBQlRLco7/EfnaRffVvRs+tKpDPNU1B9KhjkdjOvfIT4YbE6n2reBcnifQWBYY9hS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5F811A00;
	Fri, 27 Jun 2025 04:52:00 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71EF13F58B;
	Fri, 27 Jun 2025 04:52:16 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 00/10] coresight: Fix and improve clock usage
Date: Fri, 27 Jun 2025 12:51:46 +0100
Message-Id: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANOFXmgC/x2MWwqAIBAArxL7nWCLPa8SIWZrLT1RkCC6e9LnM
 Mw8EMgzBeiyBzxFDnweCVSegV3MMZPgKTGgxFJWWAvjd22Ddnxru5121VEJQjUWVLimRQmpvDw
 l/1/74X0/MuX2WGUAAAA=
X-Change-ID: 20250627-arm_cs_fix_clock_v4-e24b1e1f8920
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751025136; l=3817;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=qoXC/l3xNPFNA8wYwenCP2bGPYx0KGdr+dPkmBLbGJw=;
 b=3Vrpyuj0g3wgLf3vy2h2lTU/Ztbwf4fbhJTfkVn+5AlcSNz6IOHJ2k70ibxk2VAzhUvqrJ5Wj
 JvuL9JyFmWwDmZPufSX+wf8eidoI4rOOWsHgzYiix58F8Gp+jbswhU8
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

This series fixes and improves clock usage in the Arm CoreSight drivers.

Based on the DT binding documents, the trace clock (atclk) is defined in
some CoreSight modules, but support is absent. In most cases, the issue
is hidden because the atclk clock is shared by multiple CoreSight
modules and the clock is enabled anyway by other drivers. The first
three patches address this issue.

The programming clock (pclk) management in CoreSight drivers does not
use the devm_XXX() variant APIs, the drivers needs to manually disable
and release clocks for errors and for normal module exit.  However, the
drivers miss to disable clocks during module exit. The atclk may also
not be disabled in CoreSight drivers during module exit. By using devm
APIs, patches 04 and 05 fix clock disabling issues.

Another issue is pclk might be enabled twice in init phase - once by
AMBA bus driver, and again by CoreSight drivers. This is fixed in
patch 06.

Patches 07 to 10 refactor the clock related code. Patch 07 consolidates
the clock initialization into a central place. Patch 08 polishes driver
data allocation. Patch 09 makes the clock enabling sequence consistent.
Patch 09 removes redundant condition checks and adds error handling in
runtime PM.

This series has been verified on Arm64 Hikey960 and Juno platforms.

Changes from v3:
- Separated patch 07 into two patches, one is for clock consolidation
  and another is for polishing driver data allocation (Anshuman).

Changes from v2:
- Updated subjects for patches 04 and 05 (Anshuman).
- Refined condition checking "if (dev_is_amba(dev))" in patch 07
  (Anshuman).

Changes from v1:
- Moved the coresight_get_enable_clocks() function into CoreSight core
  layer (James).
- Added comments for clock naming "apb_pclk" and "apb" (James).
- Re-ordered patches for easier understanding (Anshuman).
- Minor improvement for commit log in patch 01 (Anshuman).

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Leo Yan (10):
      coresight: tmc: Support atclk
      coresight: catu: Support atclk
      coresight: etm4x: Support atclk
      coresight: Appropriately disable programming clocks
      coresight: Appropriately disable trace bus clocks
      coresight: Avoid enable programming clock duplicately
      coresight: Consolidate clock enabling
      coresight: Refactor driver data allocation
      coresight: Make clock sequence consistent
      coresight: Refactor runtime PM

 drivers/hwtracing/coresight/coresight-catu.c       | 53 ++++++++---------
 drivers/hwtracing/coresight/coresight-catu.h       |  1 +
 drivers/hwtracing/coresight/coresight-core.c       | 46 +++++++++++++++
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 41 +++++---------
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 24 +++-----
 drivers/hwtracing/coresight/coresight-etb10.c      | 18 ++----
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 17 ++----
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 32 ++++++-----
 drivers/hwtracing/coresight/coresight-etm4x.h      |  4 +-
 drivers/hwtracing/coresight/coresight-funnel.c     | 66 ++++++++--------------
 drivers/hwtracing/coresight/coresight-replicator.c | 63 ++++++++-------------
 drivers/hwtracing/coresight/coresight-stm.c        | 34 +++++------
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 48 ++++++++--------
 drivers/hwtracing/coresight/coresight-tmc.h        |  2 +
 drivers/hwtracing/coresight/coresight-tpiu.c       | 36 +++++-------
 include/linux/coresight.h                          | 30 +---------
 16 files changed, 226 insertions(+), 289 deletions(-)
---
base-commit: 67a993863163cb88b1b68974c31b0d84ece4293e
change-id: 20250627-arm_cs_fix_clock_v4-e24b1e1f8920

Best regards,
-- 
Leo Yan <leo.yan@arm.com>

