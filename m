Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7762DEA99
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751650736; cv=none; b=G+bqP2UBIQ7seSCOlJrl0tvcypFC9AA0m5KA+5GtiqShQ5/89jq0UUlqczL3cM3k/EWb6bJSCP685snR2pbPDXr3k/6RK7kupTIq5nj5Q9v77351n6xgpX4mp3eUtg/vGeWXMA5YejBc5ibR1PTfT7BH2Pf/Kcb5cXRf/mL1xkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751650736; c=relaxed/simple;
	bh=Y8Ao9VFKOGm4s0rrTv5ueK7YLyz/32omxIZkTsEdhcU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fkFkEdYxR431TCEuLHJJUzLF6k93QSC9pN4d4DH8XsoSKpJkaGRAwjpxqliCYteU2SDkM8+IxhJNEkt0v47fLL6GK78FawSXhMtxThTaKmJxZThGyME5CIxfaa2LAV2BbYmot6ntknluY5P+u0b8NmA0zIETzWdKBsT5zanIl50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B0CC2A2A;
	Fri,  4 Jul 2025 10:38:40 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 652783F66E;
	Fri,  4 Jul 2025 10:38:52 -0700 (PDT)
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
Subject: [PATCH v2 2/3] cacheinfo: Add arch hook to compress CPU h/w id into 32 bits for cache-id
Date: Fri,  4 Jul 2025 17:38:25 +0000
Message-Id: <20250704173826.13025-3-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250704173826.13025-1-james.morse@arm.com>
References: <20250704173826.13025-1-james.morse@arm.com>
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
has 32 bits of affinity data, but spread accross the 64 bit field. An
arch-specific bit swizzle gives a 32 bit value.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 drivers/base/cacheinfo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index df593da0d5f7..25d028f7a986 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -196,6 +196,10 @@ static bool match_cache_node(struct device_node *cpu,
 	return false;
 }
 
+#ifndef arch_compact_of_hwid
+#define arch_compact_of_hwid(_x)	(_x)
+#endif
+
 static void cache_of_set_id(struct cacheinfo *this_leaf,
 			    struct device_node *cache_node)
 {
@@ -205,6 +209,7 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
 	for_each_of_cpu_node(cpu) {
 		u64 id = of_get_cpu_hwid(cpu, 0);
 
+		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
 			return;
-- 
2.39.5

