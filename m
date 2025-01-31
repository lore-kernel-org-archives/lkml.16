Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED581BFE03
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322708; cv=none; b=tCMe+nE1ZAfMRx4yM5VUVFWZfgnzzJjF4cPy1n/Kj9kyHvFgAz1ZdkXZ9G4E0nYLeECt9XY0Z9NMpDEBBoQuCGtts2rLVNCVi42gp5TXjI5zutAsgHW0GVDL6ouBsAdcSEgtXSMehIInBsLx9QZm3J69anDUV9Y/ow2a0wT10/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322708; c=relaxed/simple;
	bh=Mj7becK2tdHID/rbbpR8Lc171Ee1AVxwW8A41fJTUTM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=uuNt/ecWpQMqWjPARfd/DDNaRiIxZxbohmmPYiqdqYITa/qOSiX4B9jYzmKDgfutrvmBEokhaOW7/nXVSR0d3YkuoS5plwy6Gc7lIznGDNUWOziuAzLDqG4g3WyM3cN54ngfT0nFi0s9QMkQQQQlxrWQh0N0tadrReFZu2H/Ex0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C54EC497;
	Fri, 31 Jan 2025 03:25:31 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9ED953F63F;
	Fri, 31 Jan 2025 03:25:05 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v2 00/18] firmware: arm_ffa: Framework notification support
 + other updates and fixes
Date: Fri, 31 Jan 2025 11:24:00 +0000
Message-Id: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANSynGcC/23MQQrCMBCF4auUWRvJTKqgK+9RiozNxGbRpiQ1K
 CV3N3bt8n/wvg2SRC8Jrs0GUbJPPsw16NDAMPL8FOVtbSBNLRK1yjm+vxbLqySF+uysse5i7An
 qY4ni/HvXur726NMa4mfHM/7W/05GpZVGMoYfbATlxnE6DmGCvpTyBTf5PiKkAAAA
X-Change-ID: 20241224-ffa_updates-106fd3df93d5
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3498; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=Mj7becK2tdHID/rbbpR8Lc171Ee1AVxwW8A41fJTUTM=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMPNWwAMby9FW8Midi6klPrFYbB1FFl3SDNN
 suxWERuZX+JAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzDwAKCRAAQbq8MX7i
 mK2eEACUR9YW+vd1DALtRbLodzYIxkZR0bjp5V1LCy7C+e9fghrGO/PConEM/x+piTFAP+0Brag
 8glYQxvV23llcvdjlVUMmF9fbVfhuxWu2W45jX5qFL7L82vHDIUAwbKgHOXn3jpbHuhN/L4ORj6
 x5HyTws+9N5wdbTjzRLydY7pZ3LdmHK6J2kxkHF8iKIPwNKF56zcHk1GxyMB+hH99pNc3YZQp6Y
 rP1zcaiM5NpY8ITK35Mucm+uho9KHbSVJM6dvsdRK197uZbUTCgQP3I8g4mrdGIerFbUSsEKrZF
 lez6uWkgxodAkVWidPM71bbLFM7mFrwDRW7m6WeLbHFIH74EVbv3Mw6ymoP4PUtdS/JhMbe4WiF
 NYepmH01e/WuaLlEnJjM9Vus6PQ2T7C5vQhAoihTNarygEBDAiEOFoEn+p5+HOe9bEyN3bCgFgg
 Z80hQvIBgfMDIL1UAWv2Q/b+/5xjhY6jN2XyABBUjg4L8va1RaGpcsShnXowhG6KVbhmNdHHp+n
 cqm1dykAuAmDg4zxxhqqO0HVzHkh+kfgIpmlOclk1WX0RGPvZhfVOMB9RbwChugbATx/G9WcHWC
 gulE0fy3gw3K+gk3r9+KZDQ2o9sjsDZd68hlppLpqiFCUmvyuoTxf/o/7bU9SHV93An7bpIhIjx
 zQQHQ7UggpXYiBg==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

This bundle of changes mainly have FF-A framework notification support
along with other minor updates and fixes.

It adds support to allow multiple UUIDs per partition to register
individual SRI callback, to handle Rx buffer full framework notification
in particular and general framework/interface to extend in the future.

It also adds support for passing UUID in FFA_MSG_SEND2 which improves
the multiple UUID/services per partition support in the driver and
an helper to check if a partition can receive REQUEST2 messages or not.

It also improves cleaning up the partitions by adding unregistration of
the devices as well as handles the presence of host partition in the
partition info.

It also contain fixes big-endian support in couple of functions:
__ffa_partition_info_regs_get() and __ffa_partition_info_get().
Big-endian support is still not complete. Only these changes can be
verified at the moment without any additional application or testing
support changes.

Regarding the FF-A versions, it upgrades the driver version to v1.2
and rejects any higher major version than the driver version as
incompatible.

It also fixes the mis-alignment with sync_send_receive{,2} function
prototypes.

It replaces UUID buffer to standard UUID format in the ffa_partition_info
structure and fixes a typo in some FF-A bus macros.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
Changes in v2:
- No changes in the patches sent as v1 itself.
- Addition of framework notification support and other updates as listed
  above
- Link to v1: https://lore.kernel.org/r/20241224-ffa_updates-v1-0-01233aba3e1e@arm.com

---
Sudeep Holla (17):
      firmware: arm_ffa: Replace SCMI by FF-A in the macro
      firmware: arm_ffa: Replace UUID buffer to standard UUID format
      firmware: arm_ffa: Align sync_send_receive{,2} function prototypes
      firmware: arm_ffa: Fix big-endian support in __ffa_partition_info_get()
      firmware: arm_ffa: Fix big-endian support in __ffa_partition_info_regs_get()
      firmware: arm_ffa: Handle the presence of host partition in the partition info
      firmware: arm_ffa: Unregister the FF-A devices when cleaning up the partitions
      firmware: arm_ffa: Helper to check if a partition can receive REQUEST2 messages
      firmware: arm_ffa: Add support for passing UUID in FFA_MSG_SEND2
      firmware: arm_ffa: Upgrade FF-A version to v1.2 in the driver
      firmware: arm_ffa: Reject higher major version as incompatible
      firmware: arm_ffa: Remove unnecessary declaration of ffa_partitions_cleanup()
      firmware: arm_ffa: Refactoring to prepare for framework notification support
      firmware: arm_ffa: Stash ffa_device instead of notify_type in notifier_cb_info
      firmware: arm_ffa: Add support for {un,}registration of framework notifications
      firmware: arm_ffa: Add support for handling framework notifications
      firmware: arm_ffa: Allow multiple UUIDs per partition to register SRI callback

Viresh Kumar (1):
      firmware: arm_ffa: Refactor addition of partition information into XArray

 drivers/firmware/arm_ffa/bus.c    |  13 +-
 drivers/firmware/arm_ffa/driver.c | 500 ++++++++++++++++++++++++++++----------
 include/linux/arm_ffa.h           |  22 +-
 3 files changed, 397 insertions(+), 138 deletions(-)
---
base-commit: 6d61a53dd6f55405ebcaea6ee38d1ab5a8856c2c
change-id: 20241224-ffa_updates-106fd3df93d5

Best regards,
-- 
Regards,
Sudeep

