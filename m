Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF89C17A2F2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819860; cv=none; b=hNysGjJ3jBK+WRfiweYUlYb9HSwbyWuRbXKuG2cFrFjScPzMyBvupHp+QkDwxtoYT1o5tVVQyloQHLba5GUpxcEz+HxpzA5gLKejjmcbZVWicgTrP5kx1OfUhUZokTa4UNZWXOyV1GMVCFy3C90AMd3IqoOaME1nF9gH6sJvcdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819860; c=relaxed/simple;
	bh=yKI9595118wd9wD0+4O8i9hh8Y/Rq0qQ0WNLjJa/MlM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C9yIRd9OroELquTPV71D6dIYS5iwH+cs9rz0yeawp6YpOMc57FMPXtZK1l1oaArWji2i1u4bwBykiZGLohOYxHwBux6Sq0VdP/rdxyqvyPLvfUjLQAGipOveqoTVfzxvTUnTi0BTi/gFnWjYq2UWSFAUNqTnApp0aYN0MiJ6MQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D93551C0A;
	Fri, 13 Jun 2025 06:03:57 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 260943F59E;
	Fri, 13 Jun 2025 06:04:17 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	sudeep.holla@arm.com,
	Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 4/5] cacheinfo: Expose the code to generate a cache-id from a device_node
Date: Fri, 13 Jun 2025 13:03:55 +0000
Message-Id: <20250613130356.8080-5-james.morse@arm.com>
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

The MPAM driver identifies caches by id for use with resctrl. It
needs to know the cache-id when probe-ing, but the value isn't set
in cacheinfo until the corresponding CPU comes online.

Expose the code that generates the cache-id. This allows the MPAM
driver to determine the properties of the caches without waiting
for all CPUs to come online.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/base/cacheinfo.c  | 15 +++++++++++----
 include/linux/cacheinfo.h |  1 +
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index d8e5b4c7156c..6316d80abab8 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -188,7 +188,7 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
 #define arch_compact_of_hwid(_x)	(_x)
 #endif
 
-static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
+unsigned long cache_of_get_id(struct device_node *np)
 {
 	struct device_node *cpu;
 	u32 min_id = ~0;
@@ -200,7 +200,7 @@ static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
 		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
-			return;
+			return ~0UL;
 		}
 		while (1) {
 			if (!cache_node)
@@ -214,8 +214,15 @@ static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
 		}
 	}
 
-	if (min_id != ~0) {
-		this_leaf->id = min_id;
+	return min_id;
+}
+
+static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
+{
+	unsigned long id = cache_of_get_id(np);
+
+	if (id != ~0UL) {
+		this_leaf->id = id;
 		this_leaf->attributes |= CACHE_ID;
 	}
 }
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index c8f4f0a0b874..9c959caf8af8 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -112,6 +112,7 @@ int acpi_get_cache_info(unsigned int cpu,
 #endif
 
 const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
+unsigned long cache_of_get_id(struct device_node *np);
 
 /*
  * Get the cacheinfo structure for the cache associated with @cpu at
-- 
2.39.5

