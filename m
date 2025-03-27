Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3AF17A2F8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 11:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743075504; cv=none; b=TeRJadp+NDHkSvpAzTzCSVQLzhb51mTLYe2bF8PaRIXVPZwzOejVQtYC0yOOvVYdRQxVPOfh/kIAKIl/7W5dyE7iw6M7+cW/DM4K6Oglf4E0P2IBAnUapIzuhEyuV29O31KYaUYJV+5B3cH7MaXoh369rtn3CEwGu/sV+xIEmSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743075504; c=relaxed/simple;
	bh=DRh1EIhToK94tyAuuqjRMr7gNqbNTVbhPJWAwvaGOog=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XmE2bFDq7/yycVCiX2WICNQOTk/iH9sg22+a45g+T/Q/hdn8ZE8s1ns7qRHApt2TUXDJFCGjgMFvkyNe01khITHPj/oHsC9uYNerm/0ibmEvxjAHV5RPUGDRC4W1db3ctDOYRlj2g4RhutW/FbSzyf9cFS78k6RwhI1/rzIhuDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3A061063;
	Thu, 27 Mar 2025 04:38:26 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D6C5F3F58B;
	Thu, 27 Mar 2025 04:38:19 -0700 (PDT)
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
Subject: [PATCH v1 0/9] coresight: Fix and improve clock usage
Date: Thu, 27 Mar 2025 11:37:54 +0000
Message-Id: <20250327113803.1452108-1-leo.yan@arm.com>
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
some CoreSight modules, but the corresponding drivers to support it are
absent.  In most cases, the issue is hidden because atclk is shared by
multiple CoreSight modules and is enabled anyway by other drivers.
The first three patches address this issue.

The programming clock (pclk) management in CoreSight drivers does not
use the devm_XXX() variant APIs, so the drivers needs to manually
disable and release clocks for errors and for normal module exit.
However, the drivers miss to disable clocks during module exit.

Another issue is pclk might be enabled twice in init phase - once by
AMBA bus driver, and again by CoreSight drivers.

Patches 04 and 05 fix pclk issues.

The atclk may also not be disabled in CoreSight drivers during module
exit.  This is fixed in patch 06.

Patches 07 to 09 refactor the clock related code.  Patch 07 makes the
clock enabling sequence consistent.  Patch 08 removes redundant
condition checks and adds error handling in runtime PM.  Patch 09
consolidats the clock initialization into a central place.

This series is verified on Arm64 Hikey960 platform.


Leo Yan (9):
  coresight: tmc: Support atclk
  coresight: catu: Support atclk
  coresight: etm4x: Support atclk
  coresight: Disable programming clock properly
  coresight: Avoid enable programming clock duplicately
  coresight: Disable trace bus clock properly
  coresight: Make clock sequence consistent
  coresight: Refactor runtime PM
  coresight: Consolidate clock enabling

 drivers/hwtracing/coresight/coresight-catu.c       | 53 ++++++++++++++++-----------------
 drivers/hwtracing/coresight/coresight-catu.h       |  1 +
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
 include/linux/coresight.h                          | 47 ++++++++++++++++++------------
 15 files changed, 206 insertions(+), 280 deletions(-)

-- 
2.34.1

