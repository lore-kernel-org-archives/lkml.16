Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD7A284685
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421467; cv=none; b=U4iDCa0mDE+JRzsiA7HpyuOpTDE3cZurgWFr6vt6CwyH+zsE9TS3DlFMMJ3XLWx3WBHV4EQ8zCQTKCc1grNe0MBneYKjF0Cqoijif0AxMQOhk7U/NVPV6nG8+vyGnis21+7sXFVUa/nY8ARcD7CNh6XExT72M/sSNJnQyuVJaBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421467; c=relaxed/simple;
	bh=T/2s/sIQTZwzj2yZUSCBDBnwMqUW9SGS+tVzidDzlBY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=k7faIpMBPcN1YU9EiqVFioTRzlIeR/Vn4epb7MnW7ZPvyD0vyFFEkmXKYgxNZSeN5RKyuB8eiJa7MwBViHlt7+fzvsM9J8xFMqykcJBm4OVX9797Gj8tKLAx5AEdJ3jey1HO77mo4KI4yR398PEzGlru66uO4ix4uZeWuuWcNBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDFB01063;
	Wed, 23 Apr 2025 08:17:38 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8EDA83F66E;
	Wed, 23 Apr 2025 08:17:41 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 0/9] coresight: Fix and improve clock usage
Date: Wed, 23 Apr 2025 16:17:17 +0100
Message-Id: <20250423151726.372561-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes and improves clock usage in the Arm CoreSight drivers.

Based on the DT binding documents, the trace clock (atclk) is defined in
some CoreSight modules, but support is absent.  In most cases, the issue
is hidden because the atclk clock is shared by multiple CoreSight
modules and the clock is enabled anyway by other drivers.  The first
three patches address this issue.

The programming clock (pclk) management in CoreSight drivers does not
use the devm_XXX() variant APIs, the drivers needs to manually disable
and release clocks for errors and for normal module exit.  However, the
drivers miss to disable clocks during module exit.  The atclk may also
not be disabled in CoreSight drivers during module exit.  By using devm
APIs, patches 04 and 05 fix clock disabling issues.

Another issue is pclk might be enabled twice in init phase - once by
AMBA bus driver, and again by CoreSight drivers.
This is fixed in patch 06.

Patches 07 to 09 refactor the clock related code.  Patch 07 consolidats
the clock initialization into a central place.  Patch 08 makes the
clock enabling sequence consistent.  Patch 09 removes redundant
condition checks and adds error handling in runtime PM.

This series is verified on Arm64 Hikey960 platform.

Changes from v1:
- Moved the coresight_get_enable_clocks() function into CoreSight core
  layer (James).
- Added comments for clock naming "apb_pclk" and "apb" (James).
- Re-ordered patches for easier understanding (Anshuman).
- Minor improvement for commit log in patch 01 (Anshuman).


Leo Yan (9):
  coresight: tmc: Support atclk
  coresight: catu: Support atclk
  coresight: etm4x: Support atclk
  coresight: Disable programming clock properly
  coresight: Disable trace bus clock properly
  coresight: Avoid enable programming clock duplicately
  coresight: Consolidate clock enabling
  coresight: Make clock sequence consistent
  coresight: Refactor runtime PM

 drivers/hwtracing/coresight/coresight-catu.c       | 53 ++++++++++++++++-----------------
 drivers/hwtracing/coresight/coresight-catu.h       |  1 +
 drivers/hwtracing/coresight/coresight-core.c       | 45 ++++++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 41 +++++++++-----------------
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 24 +++++----------
 drivers/hwtracing/coresight/coresight-etb10.c      | 18 ++++--------
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 17 ++++-------
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 32 ++++++++++----------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  4 ++-
 drivers/hwtracing/coresight/coresight-funnel.c     | 66 +++++++++++++++---------------------------
 drivers/hwtracing/coresight/coresight-replicator.c | 63 ++++++++++++++--------------------------
 drivers/hwtracing/coresight/coresight-stm.c        | 34 +++++++++-------------
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 48 +++++++++++++++---------------
 drivers/hwtracing/coresight/coresight-tmc.h        |  2 ++
 drivers/hwtracing/coresight/coresight-tpiu.c       | 36 ++++++++++-------------
 include/linux/coresight.h                          | 30 ++-----------------
 16 files changed, 225 insertions(+), 289 deletions(-)

-- 
2.34.1

