Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41942D8361
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751650727; cv=none; b=PBMF58H9Wfukoc+oMqb/gGGofrUbJOP4YqkHWnYrscuWn3RdoRDpVaOsqzWn4RVd4K/t9DFr6jdZOVmmYaHRR8fix7gMNQYOLHWV4I8vW9SQk/eR1fSpy81s9ltxiEJCWOOchgPBeFaaAHNa2TqkxGkxptQ5VkHIYcRXHdf9Qto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751650727; c=relaxed/simple;
	bh=zVwe0mAlNeqCTom1Nu+ikHh6/iLc7gWkHEWchpMS8HY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nx2+mMTYeAXL9A3h4NLqVQp+1/w4ZYXXidc7vFcqD2rcvCiu+GTt3SK1IKeHxFl7QhHI3y+JKRDbGa7UmeY6HEheU0hPdQ9QG+KjJeXvnygwolVTABlnhsy7pl2w71PJel60LB8AHLtx7VybyTKx2EeKVTcEXNgqLLHtnAD8jwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61F46293B;
	Fri,  4 Jul 2025 10:38:31 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA3D53F66E;
	Fri,  4 Jul 2025 10:38:43 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	sudeep.holla@arm.com,
	Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	WillDeaconwill@kernel.org,
	James Morse <james.morse@arm.com>
Subject: [PATCH v2 0/3] cacheinfo: Set cache 'id' based on DT data
Date: Fri,  4 Jul 2025 17:38:23 +0000
Message-Id: <20250704173826.13025-1-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v1?
 * Pushed some patches over the (very near) horizon of sharing the MPAM
   driver at you.
 * Added libvirt note to patch-1's commit message.
 * Removed the second loop in patch-1 to replace with a helper

An open question from v1 is whether it would be preferable to use an
index into the DT of the CPU nodes instead of the hardware id. This would
save an arch specific swizzle - but the numbers would change if the DT
were changed. This scheme isn't sensitive to the order of DT nodes.

---

This series adds support for cache-ids to device-tree systems.
These values are exposed to user-space via
/sys/devices/system/cpu/cpuX/cache/indexY/id
and are used to identify caches and their associated CPUs by kernel interfaces
such as resctrl.

Resctrl anticipates cache-ids are unique for a given cache level, but may
be sparse. See Documentation/filesystems/resctrl.rst's "Cache IDs" section.

Another user is PCIe's cache-steering hints, where an id provided by the
hardware would be needed. Today this expects a platform specific ACPI hook
the program that value into the PCIe root port registers. If DT platforms
are ever supported, it will likely need a kernel driver to convert the
user-space cache-id to whatever hardware value is needed.

This series generates a 32bit cache-id from the lowest CPU hardware id
of the CPU's associated with that cache. On arm64, CPU hardware ids may
be greater than 32bits, but can be swizzled into 32bits. An architecture
hook is provided to allow the architecture to swizzle the values into 32bits.

This series is based on v6.16-rc4, and can be retreived from:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/cacheinfo/v2

The MPAM driver that makes use of these can be found here:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.16-rc1

What is MPAM? Set your time-machine to 2020:
https://lore.kernel.org/lkml/20201030161120.227225-1-james.morse@arm.com/

[v1] lore.kernel.org/r/20250613130356.8080-1-james.morse@arm.com

Bugs welcome,
Thanks,

James Morse (2):
  cacheinfo: Add arch hook to compress CPU h/w id into 32 bits for
    cache-id
  arm64: cacheinfo: Provide helper to compress MPIDR value into u32

Rob Herring (1):
  cacheinfo: Set cache 'id' based on DT data

 arch/arm64/include/asm/cache.h | 17 ++++++++++++++
 drivers/base/cacheinfo.c       | 43 ++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

-- 
2.39.5

