Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9414335946
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 01:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743559169; cv=none; b=ivp4A666mCMuG8acvwQWK/4WFCSn0Ho+GbJY1k5p/nrC8uSB4/6xQ0l3wGsXkbDDdCCCCSn7cdie93Sd+Osh5gp5Nd+SOmcQXEORcL+38oFfaaKSfxzNKuRKKUnB/VxzSDUFf44mbc10BADYa5YR08O2RZ1Bx8EqTM96uByOxbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743559169; c=relaxed/simple;
	bh=uqNvFcKzNHiDSgwHvLQNxIbpQWuJPRZ0MBBCC5wOz+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QG1oIk2OcVAsxQqtwTU8pHqjJVUT8jfY7zDuHRXt4Yk9QO3yIoltGmdz7Y3mDodP1ttX3VF9sam3vKIuKNwfd7j7IJap2OYNzpklmi1U7GVTKJ+Ibkm5Xjgd7y3EZwArkphvIRVQiQLP8f3NnNj0PjqR0JxaQuomUA9kkqOTkB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=j1Whb+y7; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="j1Whb+y7"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8ffa00555so49826456d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 18:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743559165; x=1744163965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6MiemE6Vl/b5ROnmlBxt9gMb8X21cw8ERPPfIrwPI4A=;
        b=j1Whb+y7BufQ+OFBalxaTDfHyMnqlOv39BxUFalkjjz3VOkZCMIkOSirLQvXo4rW30
         PHpb1Z6gAg07HKG9uiOoAVtywp/qAyUXrJPy5CkDdy/qBqCSdi01DA+ylocZyoAuekYt
         nx9rJU6cEiks15cEtgrs51t93xFch3TVnx7+8kLFLIxSghZqbdZWU/+/qJlKDJff8If6
         t8lCe8++uj1dVJPpBvdMKNIKNoKYrQ7szCBa7BR7fcPoeJNsqoxGgybWgm2wCm15O4os
         wFc123kInuKBiMTHn0OOsejdMvJTV3QvK2U19OXtctxeBg0OUMBLr9Ze+JkzeqokWCeE
         LSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743559165; x=1744163965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MiemE6Vl/b5ROnmlBxt9gMb8X21cw8ERPPfIrwPI4A=;
        b=wCBBPY9xgD6wIRg/Z51r2HFCNhycoU22lRB8J/yHd+Tf4A7EHbAULDFaCkm6AViVjS
         rVr9Aqs7hohaOHNiIW8w1sW2ZxuozGb2vWELdLN9RDUITiA2d+0MH8CAunudRmpCOWaH
         k8Dm3HLU+yuFBdQnOHswaRJUzU1/44tbx5xWIKyt68LSNpM5RHKoiQALtT4pq3YJKcTs
         E8KPQc3MgAT2OC9/nGzRyeC2NsHC0YzSqF0/hU4Q0jMjQ1Ayb0nayZIEMFi5rdcCKoYs
         EbaLs9QQm9b348o4BYSHz1BvxBY6b2qqylHIA6mLTQ2FTphHAOa95IFATLvplWZosWuE
         BF6A==
X-Forwarded-Encrypted: i=1; AJvYcCXe1QptquNyyBchSQQbmllJqjBCt2hfG1TBS42lnyJQeI/vYAzg/0Yp+KCmYY2wO0LyIdK/5EOL8JrmnDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd4eHp1u/MQMjTjAm0UBx3Lm65l8ANp3i8QJol19yK6AKGoKXx
	0perknUniKRQ+OivPqyLyu+HrFlurVep6UuwYIwAKCg1Gjeo8BUowfY+FXN9BUc=
X-Gm-Gg: ASbGnctD1nP+2nlZWoeSBSjgh7EEXVhti5hZVWC060sgrbhWz566uL+XeJfm+tDR79r
	iE5cnGZdax9Tig8p7YE5l9iPT8XAM4oMq0F13zmgiGcW9jzfE46p8rII6XhZiMZavU0ygHUFZa1
	tdeRCQ1XSLZUbuUHdoupvAM3qYp2jGq4EOdMvY67u46PR9WGqB1ufONVddeqNmY0yb/Cc5+6J4g
	vaIUzDTuKTV074YoPfDPwq6YL1qGat4YH7gAC14P5zgzNbwC4b22yMIrYu8N1O3UAn+ncWiyCPT
	/bvM0w1SGoSfEjOLMeZa5QHvL3a3p9tDht+N0NCPLR1GCTKeMw0PcKWwo3MtZw06wfkDYu633An
	RCh7xbmXE33pNY02QFg4v38OO1uQGXnaj
X-Google-Smtp-Source: AGHT+IFTkMEgtYgeg/jyMTLw1npojfnLCbBA7oaWxjcijhqPO6qE2+4JiydGMjNyuwX0+WPP+1ah6w==
X-Received: by 2002:ad4:5c48:0:b0:6e8:9525:2ac3 with SMTP id 6a1803df08f44-6eed627930bmr247678456d6.34.1743559165433;
        Tue, 01 Apr 2025 18:59:25 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9646269sm68791386d6.41.2025.04.01.18.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 18:59:25 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-cxl@vger.kernel.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	dan.j.williams@intel.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v2] DAX: warn when kmem regions are truncated for memory block alignment.
Date: Tue,  1 Apr 2025 21:59:20 -0400
Message-ID: <20250402015920.819077-1-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device capacity intended for use as system ram should be aligned to the
archite-defined memory block size or that capacity will be silently
truncated and capacity stranded.

As hotplug dax memory becomes more prevelant, the memory block size
alignment becomes more important for platform and device vendors to
pay attention to - so this truncation should not be silent.

This issue is particularly relevant for CXL Dynamic Capacity devices,
whose capacity may arrive in spec-aligned but block-misaligned chunks.

Suggested-by: David Hildenbrand <david@redhat.com>
Suggested-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/dax/kmem.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
index e97d47f42ee2..32fe3215e11e 100644
--- a/drivers/dax/kmem.c
+++ b/drivers/dax/kmem.c
@@ -13,6 +13,7 @@
 #include <linux/mman.h>
 #include <linux/memory-tiers.h>
 #include <linux/memory_hotplug.h>
+#include <linux/string_helpers.h>
 #include "dax-private.h"
 #include "bus.h"
 
@@ -68,7 +69,7 @@ static void kmem_put_memory_types(void)
 static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
 {
 	struct device *dev = &dev_dax->dev;
-	unsigned long total_len = 0;
+	unsigned long total_len = 0, orig_len = 0;
 	struct dax_kmem_data *data;
 	struct memory_dev_type *mtype;
 	int i, rc, mapped = 0;
@@ -97,6 +98,7 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
 	for (i = 0; i < dev_dax->nr_range; i++) {
 		struct range range;
 
+		orig_len += range_len(&dev_dax->ranges[i].range);
 		rc = dax_kmem_range(dev_dax, i, &range);
 		if (rc) {
 			dev_info(dev, "mapping%d: %#llx-%#llx too small after alignment\n",
@@ -109,6 +111,12 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
 	if (!total_len) {
 		dev_warn(dev, "rejecting DAX region without any memory after alignment\n");
 		return -EINVAL;
+	} else if (total_len != orig_len) {
+		char buf[16];
+
+		string_get_size((orig_len - total_len), 1, STRING_UNITS_2,
+				buf, sizeof(buf));
+		dev_warn(dev, "DAX region truncated by %s due to alignment\n", buf);
 	}
 
 	init_node_memory_type(numa_node, mtype);
-- 
2.47.1

