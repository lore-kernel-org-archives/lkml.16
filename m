Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3706A29
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819852; cv=none; b=sZWPf7J5pPSu0sXChdqAh/dgik0pVc7VirfPOOuA83pKGMZU8kJaIMGQSFAFBnInPOXblLZHxHcUYUW12Xb3Kv+BI+Qgakgz44aGP0MLfTHUKr2BQdHQ4/Hcft3qgLxvQNSzqEIjZ1dbRsAUQLwI3DnlRWumThkFpBbVhIQL1Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819852; c=relaxed/simple;
	bh=VQNWDd1YQ60J6doeEOBUSszAhBt87lrKUAX5qbHodJw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X5UdlsM960dRQrg7+Dfi43PTKavfjKx9L+TMBMfpRZm85Vzf4icDlLjHz6xR4TESaGSAjVHAoBzZB8D56pJnmvPY9d8+1TK+J1EgL/ikIDx9Ef9Sn6OoiMpoKssh5dPtHgboFbdwS0ptZW40ne8oZZ9xqDCcRP3pgtAgsJm4yDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C17E1C0A;
	Fri, 13 Jun 2025 06:03:49 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12FA53F59E;
	Fri, 13 Jun 2025 06:04:07 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	sudeep.holla@arm.com,
	Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 0/5] cacheinfo: Set cache 'id' based on DT data
Date: Fri, 13 Jun 2025 13:03:51 +0000
Message-Id: <20250613130356.8080-1-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Rob H previously preferred to generate a cache-id from the information DT
already has. (Rob: does the PCIe cache-steering use-case change this?)

This series generates a 32bit cache-id from the lowest CPU hardware id
of the CPU's associated with that cache. On arm64, CPU hardware ids may
be greater than 32bits, but can be swizzled into 32bits. An architecture
hook is provided to allow the architecture to swizzle the values into 32bits.

Finally, the MPAM driver needs to know the size of a cache, which is stored
in cacheinfo. Add a helper to retrieve that information.

This series is based on v6.16-rc1, and can be retreived from:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/cacheinfo/v1

The MPAM driver that makes use of these can be found here:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.16-rc1

What is MPAM? Set your time-machine to 2020:
https://lore.kernel.org/lkml/20201030161120.227225-1-james.morse@arm.com/


Bugs welcome,
Thanks,

James Morse (4):
  cacheinfo: Add arch hook to compress CPU h/w id into 32 bits for
    cache-id
  arm64: cacheinfo: Provide helper to compress MPIDR value into u32
  cacheinfo: Expose the code to generate a cache-id from a device_node
  cacheinfo: Add helper to find the cache size from cpu+level

Rob Herring (1):
  cacheinfo: Set cache 'id' based on DT data

 arch/arm64/include/asm/cache.h | 14 +++++++++++
 arch/arm64/kernel/sleep.S      |  1 +
 drivers/base/cacheinfo.c       | 45 ++++++++++++++++++++++++++++++++++
 include/linux/cacheinfo.h      | 21 ++++++++++++++++
 4 files changed, 81 insertions(+)

-- 
2.39.5

