Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6504527817D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381632; cv=none; b=YmkM4drI9o7UNkET8HXH+RdSZCa45ccIGMmywCQ+1XyCD/yqWjS1zu9gdVwo+yiS6QDix9ULf0rvU879ugyDn7tVdkOr1L2WaIACCfx+paphRXsu1GOC7siXMR/GVHsGbTfKQH268z+rotVvqBbhk+vOoh1Guz5bfdNAtMDDy0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381632; c=relaxed/simple;
	bh=Nq6752uZqNFDKOOcflMmgGb6G8qBK0diZ4EiOD+Inqs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XWts/1B36+xW3kwR8SN1SGFcXnQ7msYHUBT4viCyyZGd5npZYpexH5jmyHKTYZDQPUxVHGigQr0PUDHF9/6Mv5FP0K5Q1CmM5UedQrWcaYXNNwRf4ss6+JC1tV0TTnMZKvePNsczBapS1XvFlwXksTQ+ESC5mjlPJhptZAvpvmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7814D12FC;
	Tue,  1 Jul 2025 07:53:34 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB01F3F66E;
	Tue,  1 Jul 2025 07:53:47 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 00/28] CoreSight: Address CPU Power Management Issues
Date: Tue, 01 Jul 2025 15:53:25 +0100
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGX2Y2gC/x2MWwqAIBAArxL7naD27ioRYrXWfmiiIIF096TPY
 ZjJEDEQRpirDAETRbpdAVlXsF/ancjoKAySy473QjAdrNqj8lYZelRqmGk1ymnbhmMUUDIfsJh
 /uazv+wHSdx1VYgAAAA==
X-Change-ID: 20250611-arm_cs_pm_fix_v3-f4ae29bb7d81
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=6135;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Nq6752uZqNFDKOOcflMmgGb6G8qBK0diZ4EiOD+Inqs=;
 b=m/RXraSsJy6Hl7VyJiDPntiCYLZ9JLMNk1Td7nr3SZFSEzN/n59pzpPI2QXZeZcyBC7P4uCit
 Iu0tSsNimfvBw6IsBK24gLeqVCj8rXm/bobTx84vQNmLowuupQkeo0q
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

This series addresses CPU power management issues in the CoreSight
drivers. For easier review, the patches are organized into two
categories:

o Patches 01 ~ 10 focus on CPU power management within the ETM drivers.
  These patches fix SMP-safe access to the mode, correct context
  synchronization, and refactor the CPU suspend/resume flows.

o Patches 11 ~ 28 extend CPU power management to cover activated paths,
  including helpers, links, and sinks. These changes move CPU PM and
  hotplug notifiers from the ETMv4 driver into the CoreSight core layer.

Summary of Changes:

- Patches 01 ~ 03: Fix device mode access in the SMP mode.
- Patch 04       : A minor fix for polling bit.
- Patches 05 ~ 07: Improve the context synchronization based on the ETM
		   specification (IHI0064H.b) and Arm ARM (ARM DDI 0487
		   L.a).
- Patches 08 ~ 10: Refactor the context save/restore flow in the ETMv4
		   driver, in the end, the CPU PM callbacks reuse the
		   normal enabling and disabling flows.
- Patches 11 ~ 17: Move CPU PM code from ETMv4 driver to the core layer.
- Patches 18 ~ 25: Enhance device mode handling in the CTI driver,
		   distinguishes debug mode from trace modes (Perf or
		   SysFS mode). Extend support activated paths during
		   CPU idle. Support save and restore context for
		   per-CPU sink (TRBE).
- Patches 26 ~ 28: Move CPU hotplug notifier from the ETMv4 driver to
		   the core layer. The full path is now managed in CPU
		   hotplug.

Verification:

This series has been verified on the following platforms:
- Hikey960, Juno-r0 and Juno-r2:
  Note that the firmware on Hikey960 and Juno-r0 is unstable. While no
  CoreSight failures were observed, but the CPU hotplug or CPU idle
  itself may fail intermittently.
  Juno-r2 is much stable and can pass 24+ hours stress test.
- FVP RevC: Verified TRBE changes.

Stress test script:

  #!/usr/bin/bash

  echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink

  while true; do
          echo 0 > /sys/devices/system/cpu/cpu2/online;
          echo 1 > /sys/devices/system/cpu/cpu2/online;
  done &

  while true; do
          echo 1 > /sys/bus/coresight/devices/etm2/enable_source;
          echo 0 > /sys/bus/coresight/devices/etm2/enable_source;
  done &

---
Changes in v2:
- Refactored ETMv4 suspend and resume for reusing the normal enabling
  and disabling flows (James).
- Used a per-CPU structure to maintain path pointers (James).
- Supported helpers in CPU PM flows (James).
- Fixed the SMP-safe access to device mode.
- Fixed the context synchronization in ETMv4x driver.
- Link to v1: https://lore.kernel.org/linux-arm-kernel/20250516160742.1200904-1-leo.yan@arm.com/

Signed-off-by: Leo Yan <leo.yan@arm.com>

---
Leo Yan (27):
      coresight: Change device mode to atomic type
      coresight: etm4x: Always set tracer's device mode on target CPU
      coresight: etm3x: Always set tracer's device mode on target CPU
      coresight: etm4x: Correct polling IDLE bit
      coresight: etm4x: Ensure context synchronization is not ignored
      coresight: etm4x: Add context synchronization before enabling trace
      coresight: etm4x: Properly control filter in CPU idle with FEAT_TRF
      coresight: etm4x: Remove the state_needs_restore flag
      coresight: etm4x: Add flag to control single-shot restart
      coresight: etm4x: Reuse normal enable and disable logic in CPU idle
      coresight: Populate CPU ID into the coresight_device structure
      coresight: sysfs: Validate CPU online status for per-CPU sources
      coresight: Set per CPU source pointer
      coresight: Register CPU PM notifier in core layer
      coresight: etm4x: Hook CPU PM callbacks
      coresight: Add callback to determine if context save/restore is needed
      coresight: etm4x: Remove redundant condition checks in save and restore
      coresight: cti: Fix race condition by using device mode
      coresight: cti: Introduce CS_MODE_DEBUG mode
      coresight: cti: Properly handle modes in CPU PM notifiers
      coresight: Add per-CPU path pointer
      coresight: Add 'in_idle' argument to path enable/disable functions
      coresight: Control path during CPU idle
      coresight: Add PM callbacks for percpu sink
      coresight: Take hotplug lock in enable_source_store() for Sysfs mode
      coresight: Move CPU hotplug callbacks to core layer
      coresight: Manage activated path during CPU hotplug

Yabin Cui (1):
      coresight: trbe: Save and restore state across CPU low power state

 drivers/hwtracing/coresight/coresight-catu.c       |   1 +
 drivers/hwtracing/coresight/coresight-core.c       | 337 ++++++++++++--
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |   1 +
 drivers/hwtracing/coresight/coresight-cti-core.c   |  40 +-
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  |   2 +-
 drivers/hwtracing/coresight/coresight-dummy.c      |   1 +
 drivers/hwtracing/coresight/coresight-etb10.c      |   1 +
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  61 ++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 488 ++++++---------------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  62 ---
 drivers/hwtracing/coresight/coresight-funnel.c     |   1 +
 drivers/hwtracing/coresight/coresight-replicator.c |   1 +
 drivers/hwtracing/coresight/coresight-stm.c        |   1 +
 drivers/hwtracing/coresight/coresight-sysfs.c      |  10 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   |   1 +
 drivers/hwtracing/coresight/coresight-tpda.c       |   1 +
 drivers/hwtracing/coresight/coresight-tpdm.c       |   1 +
 drivers/hwtracing/coresight/coresight-tpiu.c       |   1 +
 drivers/hwtracing/coresight/coresight-trbe.c       |  85 ++++
 drivers/hwtracing/coresight/ultrasoc-smb.c         |   1 +
 include/linux/coresight.h                          |  55 ++-
 21 files changed, 665 insertions(+), 487 deletions(-)
---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250611-arm_cs_pm_fix_v3-f4ae29bb7d81

Best regards,
-- 
Leo Yan <leo.yan@arm.com>

