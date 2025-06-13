Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AA2149C51
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819857; cv=none; b=bXfAEr0+a1NCImRAeuY3qIcZ5kUjKCNR4CJbVhkKCUj9/uiFVs/0ayxcCOQUXnquDuDl4zux+pTDd2I8/O4mMwkEOUMQyWLKcbH85fDRWQ41cnIbDtPQwJ9BgoSCEvoOfhf4c3A3ZuqZyfPfqAKhYTRV70ofRiiyRHLO1WFFOHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819857; c=relaxed/simple;
	bh=V1199vLhEPBr+wTi5hbKlQugLCws1t1lxOMUm2rIYOg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RVUwaMaR9SqrQ/LRHgh6JQ3xowquXCr54IDrAzNh/tjR/J+SoX7p7hWpRRZzEG0CA8Wf2+uPjuq13SA2a7VGvhIinmy/b/NJw0/7OXOQRdPCtEFzGv1HMlWCGXdfW8Xgn2wpOVhVfcXufmzF+3jsfNrZ4H6LK7C0opsTIIbOTKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A3181C0A;
	Fri, 13 Jun 2025 06:03:54 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BA293F59E;
	Fri, 13 Jun 2025 06:04:13 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	sudeep.holla@arm.com,
	Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 2/5] cacheinfo: Add arch hook to compress CPU h/w id into 32 bits for cache-id
Date: Fri, 13 Jun 2025 13:03:53 +0000
Message-Id: <20250613130356.8080-3-james.morse@arm.com>
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
device-tree, but instead generated from the smallest CPU h/w id of the
CPUs associated with that cache.

CPU h/w ids may be larger than 32 bits.

Add a hook to allow architectures to compress the value from the devicetree
into 32 bits. Returning the same value is always safe as cache_of_set_id()
will stop if a value larger than 32 bits is seen.

For example, on arm64 the value is the MPIDR affinity register, which only
has 32 bits of affinity data, but spread across the 64 bit field. An
arch-specific bit swizzle gives a 32 bit value.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/base/cacheinfo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 9888d87840a2..d8e5b4c7156c 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -184,6 +184,10 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
 	return of_property_read_bool(np, "cache-unified");
 }
 
+#ifndef arch_compact_of_hwid
+#define arch_compact_of_hwid(_x)	(_x)
+#endif
+
 static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
 {
 	struct device_node *cpu;
@@ -193,6 +197,7 @@ static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
 		struct device_node *cache_node __free(device_node) = of_find_next_cache_node(cpu);
 		u64 id = of_get_cpu_hwid(cpu, 0);
 
+		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
 			return;
-- 
2.39.5

