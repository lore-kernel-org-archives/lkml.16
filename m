Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8466518E377
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819861; cv=none; b=KzV5wC+BKxrIbvYMMdv503j7eIAedLDiEuSXzqlV2w1eLjcVmklqYHmlYh4xVkK5Lvs0TvXUrCtHupsh3cKsoa0z0HWevxoAiCNSNxro12F9GQMziEzPcYGjuhuwxQOTCk+g5eimYk8A79sl/NiT9pbjJFZi01xqVvdWUsvCCqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819861; c=relaxed/simple;
	bh=ksM2r+Oto/NBE+GrS0KZDyWMch35QCoQT8Du9Fc4exU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EZcDaehH4omySQBiRSJrZZq8++YkMJ1aWMVs7P8mDcLdcDnBMouVL7dOzg6Ydn2HLwR3bac2X01ZZ9PasE6l+AjoTsLB+TelvWStmyfr3G5nxLlxoAD9YsXOJ61CpkrEo40kZK+PMq1BLyX8nePYnUuSGZjMJqyYH9MxI9l9LYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9450B1CDD;
	Fri, 13 Jun 2025 06:03:59 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2FF13F59E;
	Fri, 13 Jun 2025 06:04:18 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	sudeep.holla@arm.com,
	Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 5/5] cacheinfo: Add helper to find the cache size from cpu+level
Date: Fri, 13 Jun 2025 13:03:56 +0000
Message-Id: <20250613130356.8080-6-james.morse@arm.com>
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

The MPAM driver needs to know the size of a cache associated with a
particular CPU. The DT/ACPI agnostic way of doing this is to ask cacheinfo.

Add a helper to do this.

Signed-off-by: James Morse <james.morse@arm.com>
---
 include/linux/cacheinfo.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 9c959caf8af8..3f1b6b2e25b5 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -148,6 +148,26 @@ static inline int get_cpu_cacheinfo_id(int cpu, int level)
 	return ci ? ci->id : -1;
 }
 
+/*
+ * Get the size of the cache associated with @cpu at level @level.
+ * cpuhp lock must be held.
+ */
+static inline unsigned int get_cpu_cacheinfo_size(int cpu, int level)
+{
+	struct cpu_cacheinfo *ci = get_cpu_cacheinfo(cpu);
+	int i;
+
+	if (!ci->info_list)
+		return 0;
+
+	for (i = 0; i < ci->num_leaves; i++) {
+		if (ci->info_list[i].level == level)
+			return ci->info_list[i].size;
+	}
+
+	return 0;
+}
+
 #if defined(CONFIG_ARM64) || defined(CONFIG_ARM)
 #define use_arch_cache_info()	(true)
 #else
-- 
2.39.5

