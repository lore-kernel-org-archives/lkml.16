Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6773976410
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819855; cv=none; b=bNnyW1QdWxN4BLmV4D5IdaQQOKKpjX45RhhC67VeGQMat8/40ElCsXHhPDESGG8M9+dFtNTFo7hQsVh90qDLvkN22/T312/VmTLLRqmOUIemvn1fnaKc2Ga+MuF6Ai6sPaHXchszkqXMXS5yO+Tjhrn7RJ25fs8x4IZDpBiqdTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819855; c=relaxed/simple;
	bh=lwkFMbUDRfq7zvVSJJ0Y/V6V8MeJmvET1EKCFo9+p8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ryDBg1kXUCeZMJpFs7dvf/F8U+dci1OYM2FtOfq/apssK+gBPTqulStp1SEoUhgJo1jy0BnH18d/e6SxJ4vNO6i7WplhH+3EMm0NWsdhn4sq+feCZTLvNlV19ng64FSPUaJsWfYASMuW8K6UuRsLrKuRbhfvV7sQ26Bg0PMa370=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 197161CDD;
	Fri, 13 Jun 2025 06:03:52 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D47B93F59E;
	Fri, 13 Jun 2025 06:04:10 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	sudeep.holla@arm.com,
	Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 1/5] cacheinfo: Set cache 'id' based on DT data
Date: Fri, 13 Jun 2025 13:03:52 +0000
Message-Id: <20250613130356.8080-2-james.morse@arm.com>
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

From: Rob Herring <robh@kernel.org>

Use the minimum CPU h/w id of the CPUs associated with the cache for the
cache 'id'. This will provide a stable id value for a given system. As
we need to check all possible CPUs, we can't use the shared_cpu_map
which is just online CPUs. As there's not a cache to CPUs mapping in DT,
we have to walk all CPU nodes and then walk cache levels.

The cache_id exposed to user-space has historically been 32 bits, and
is too late to change. Give up on assigning cache-id's if a CPU h/w
id greater than 32 bits is found.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
[ ben: converted to use the __free cleanup idiom ]
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
[ morse: Add checks to give up if a value larger than 32 bits is seen. ]
Signed-off-by: James Morse <james.morse@arm.com>
---
Use as a 32bit value has been seen in DPDK patches here:
http://inbox.dpdk.org/dev/20241021015246.304431-2-wathsala.vithanage@arm.com/
---
 drivers/base/cacheinfo.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index cf0d455209d7..9888d87840a2 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/cacheinfo.h>
 #include <linux/compiler.h>
@@ -183,6 +184,37 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
 	return of_property_read_bool(np, "cache-unified");
 }
 
+static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
+{
+	struct device_node *cpu;
+	u32 min_id = ~0;
+
+	for_each_of_cpu_node(cpu) {
+		struct device_node *cache_node __free(device_node) = of_find_next_cache_node(cpu);
+		u64 id = of_get_cpu_hwid(cpu, 0);
+
+		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
+			of_node_put(cpu);
+			return;
+		}
+		while (1) {
+			if (!cache_node)
+				break;
+			if (cache_node == np && id < min_id) {
+				min_id = id;
+				break;
+			}
+			struct device_node *prev __free(device_node) = cache_node;
+			cache_node = of_find_next_cache_node(cache_node);
+		}
+	}
+
+	if (min_id != ~0) {
+		this_leaf->id = min_id;
+		this_leaf->attributes |= CACHE_ID;
+	}
+}
+
 static void cache_of_set_props(struct cacheinfo *this_leaf,
 			       struct device_node *np)
 {
@@ -198,6 +230,7 @@ static void cache_of_set_props(struct cacheinfo *this_leaf,
 	cache_get_line_size(this_leaf, np);
 	cache_nr_sets(this_leaf, np);
 	cache_associativity(this_leaf);
+	cache_of_set_id(this_leaf, np);
 }
 
 static int cache_setup_of_node(unsigned int cpu)
-- 
2.39.5

