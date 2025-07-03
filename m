Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3932E9EC9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 18:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751567737; cv=none; b=bmPAXxIfchQWNpuEUZkKs3+io8uywGXYxG+8SpHrgt1B7uQF3krhv/GZM5ZVNdzUUEZizA5z9skIVqcN+lPq5HhCxpwxxXqbUaL+LaQ7hJ5DuxI5VcijRFPGdjwEOL6IuV4k22Tdb+cZvUqpki+WLL8sAuVMwbljXlweegWJ+cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751567737; c=relaxed/simple;
	bh=4IQJmfRPn5wOvf8eRJE9LC5lIdjzqxsiARifvlsXhAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jsNOv3DdHJOZdf0tyT5ytnDltSJsGpW9Dzy5593ZVD6i9DxrUnaDSClrBhyqW5qqG2Emnm86Og2j0gvb+VftnOzRvk693MIQTP1nX2KsHGZ2Z3uvxJw66roIdQz8zrwIIDc3KYXQ0Xk6aBzhod5GBov7+IqIWWH8iDEv9Z+/3ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5PR6d7i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5PR6d7i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C6FC4CEEB;
	Thu,  3 Jul 2025 18:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567736;
	bh=4IQJmfRPn5wOvf8eRJE9LC5lIdjzqxsiARifvlsXhAk=;
	h=From:To:Cc:Subject:Date:From;
	b=l5PR6d7ij5o2bBnv3i4c24V4q+HIAjYLh8cszOeCWYjKOpgo79o6h5WGPGnTDygOH
	 yC3XzD7djv814c0IMAcvcPSBvtTEt0cAc2+0+qQCXyJ+J8qweyrqKeVsuVxnimTs8b
	 Zo5+AuLmBPopJ1DBv+2vcFWhvKowclDkkjEPJmPu8+AURPigEHktPShNgkVQyC8W4q
	 etaA28PNFdeHpmTibqbndNc+6tFSft3fyuQZxVVfwMhexKN3COovYk9onNeqZ7JoYe
	 TbUU92VGOj3rrchpEMeWYpj1vlmSGolyHJFn4/sMeVvnj3TPw0vYg0+hN6h74DAlPC
	 pVv96QlPCJAcQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwtracing: coresight: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Thu,  3 Jul 2025 13:35:33 -0500
Message-ID: <20250703183534.2075569-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 22 +++++--------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 88afb16bb6be..be964656be93 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -24,6 +24,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/coresight.h>
 #include <linux/amba/bus.h>
 #include <linux/platform_device.h>
@@ -634,25 +635,14 @@ static int of_tmc_get_reserved_resource_by_name(struct device *dev,
 						const char *name,
 						struct resource *res)
 {
-	int index, rc = -ENODEV;
-	struct device_node *node;
+	int rc = -ENODEV;
 
-	if (!is_of_node(dev->fwnode))
-		return -ENODEV;
-
-	index = of_property_match_string(dev->of_node, "memory-region-names",
-					 name);
-	if (index < 0)
-		return rc;
-
-	node = of_parse_phandle(dev->of_node, "memory-region", index);
-	if (!node)
+	rc = of_reserved_mem_region_to_resource_byname(dev->of_node, name, res);
+	if (rc < 0)
 		return rc;
 
-	if (!of_address_to_resource(node, 0, res) &&
-	    res->start != 0 && resource_size(res) != 0)
-		rc = 0;
-	of_node_put(node);
+	if (res->start == 0 || resource_size(res) == 0)
+		rc = -ENODEV;
 
 	return rc;
 }
-- 
2.47.2

