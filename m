Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB8615687D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819858; cv=none; b=ZaWEWQmJXe5ryQw9hQo7bx2QlE3+mr8zfWh6qHywRN6Z4Na/KPg+oZJAPVPDk19mrklL646xeqG8dkRc9gdDFrgmi6QfCxldQHqfNdrC1e3EZ9XQgAu0e6K0+rJg3y+HQpv+twhHcSILnxKbTeNoejsIPP5pp0z6uz8b4TM+M/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819858; c=relaxed/simple;
	bh=xBHd7ftCSlID8/BsGphSCMIzrEgTd5ElG/eUHO1W7xk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IZHmT9gWxr0V8BMX01hHhbRLbUz0JbQe6bjyirHypK0vVOJbGihw/HsnLwQpwMrw0M2kKl+oqnJH2Ckblpdrl8QZcX2mPTZJQge1LO6v/pwGNv87v6QPg1BB/8HLGlvJqWBrqPp+VOWVUDpCfPjzK2V0Yz+Hbg22MI9a/RM4LXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F8A41CDD;
	Fri, 13 Jun 2025 06:03:56 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 609623F59E;
	Fri, 13 Jun 2025 06:04:15 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	sudeep.holla@arm.com,
	Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 3/5] arm64: cacheinfo: Provide helper to compress MPIDR value into u32
Date: Fri, 13 Jun 2025 13:03:54 +0000
Message-Id: <20250613130356.8080-4-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250613130356.8080-1-james.morse@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Filesystems like resctrl use the cache-id exposed via sysfs to identify
groups of CPUs. The value is also used for PCIe cache steering tags. On
DT platforms cache-id is not something that is described in the
device-tree, but instead generated from the smallest MPIDR of the CPUs
associated with that cache. The cache-id exposed to user-space has
historically been 32 bits.

MPIDR values may be larger than 32 bits.

MPIDR only has 32 bits worth of affinity data, but the aff3 field lives
above 32bits. The corresponding lower bits are masked out by
MPIDR_HWID_BITMASK and contain an SMT flag and Uni-Processor flag.

Swizzzle the aff3 field into the bottom 32 bits and using that.

In case more affinity fields are added in the future, the upper RES0
area should be checked. Returning a value greater than 32 bits from
this helper will cause the caller to give up on allocating cache-ids.

Signed-off-by: James Morse <james.morse@arm.com>
---
 arch/arm64/include/asm/cache.h | 14 ++++++++++++++
 arch/arm64/kernel/sleep.S      |  1 +
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
index 99cd6546e72e..f8798dc96364 100644
--- a/arch/arm64/include/asm/cache.h
+++ b/arch/arm64/include/asm/cache.h
@@ -42,6 +42,7 @@
 
 #include <asm/cputype.h>
 #include <asm/mte-def.h>
+#include <asm/suspend.h>
 #include <asm/sysreg.h>
 
 #ifdef CONFIG_KASAN_SW_TAGS
@@ -87,6 +88,19 @@ int cache_line_size(void);
 
 #define dma_get_cache_alignment	cache_line_size
 
+/* Compress a u64 MPIDR value into 32 bits. */
+static inline u64 arch_compact_of_hwid(u64 id)
+{
+	u64 aff3 = MPIDR_AFFINITY_LEVEL(id, 3);
+
+	/* These bits are expected to be RES0 */
+	if (FIELD_GET(GENMASK_ULL(63, 40), id))
+		return id;
+
+	return (aff3 << 24) | FIELD_GET(GENMASK_ULL(23, 0), id);
+}
+#define arch_compact_of_hwid	arch_compact_of_hwid
+
 /*
  * Read the effective value of CTR_EL0.
  *
diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
index f093cdf71be1..ebc23304d430 100644
--- a/arch/arm64/kernel/sleep.S
+++ b/arch/arm64/kernel/sleep.S
@@ -50,6 +50,7 @@
 	lsr	\mask ,\mask, \rs3
 	orr	\dst, \dst, \mask		// dst|=(aff3>>rs3)
 	.endm
+
 /*
  * Save CPU state in the provided sleep_stack_data area, and publish its
  * location for cpu_resume()'s use in sleep_save_stash.
-- 
2.39.5

