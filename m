Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605FC28FFCD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744295328; cv=none; b=CY6WglzEobjnwSX8KL+urtGu+TDtlE7eBQ44UMHJ9IL3UwmGv3zfxjPOIxZdhow1SS/Dy4BiYiGkxH3tYv+RmiJ48q4Fxw7laIdMzftr23MIIHXcJlPQUM3EjFw0hgeuOqV0RjeXXFLfygd5NTZvjksv6GPKswYUmzs9AuT7qe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744295328; c=relaxed/simple;
	bh=fZnaZ5GHZcfS9p6y2BQGcaUFH6wu1bBVJJP31QU4XV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BUnsRvWe3qR5iu7wDa+WV87Afq3ePe04Soya9GA9ZqA7vAb/90kTsVEc3NhQGj7LVjmoPikBJyIxdgwbkcXyd/sQyYDnurxeDHCR22JftTXzGhp9qvxcmAnNj0C6ouIEIEwlUc4nkHuLeeakEDtejvdX1p3l9LC5SvEy12QG6vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ffhWo1AD; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ffhWo1AD"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso13034366d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1744295325; x=1744900125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QU7b8p5X6+ipaTqnZzEvjAMW+m1ukjkOluS/etWvC10=;
        b=ffhWo1ADPW+NpqceS3kDUHHgVgtfHUB3cKz7WnCAE8Sc6FGPHThLY4tnERR9IeGf1T
         DWdDJN6PRSFQB4+5wYRgMpqcKKjzVkD78B5xpVVOBOa1s+trAkCrqD37xj3Ll610+wss
         wyGO9cFTVKB11PEldMFpnH7nZjLOlez0oP4bQsfpJqG3kW3tCLxhXEBtUlBJFaIVy7Dj
         xvtbbl0EremF1QhFyL/DTjh+4h9NJZxdzJ7TrDtHsY6Blq+fA51b/w1tFQEHID9yQZKd
         IJfDPcB8W0V2DfyRG9WB9fge6SuzntbbnBYxf9X+cMVE6V3Anrq6oaWTUyBGlDGtqBXE
         k2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744295325; x=1744900125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QU7b8p5X6+ipaTqnZzEvjAMW+m1ukjkOluS/etWvC10=;
        b=Ln0RyfT9GO3mXzilreCicBFoI0inXjo/IsHKGGZlufZLUO+nxYtoZEGDw7pBU88YKa
         VtqKHQp1VLYPWXlrLBeXi0Km0IdkHOOaG4HdGCy1pSxXKMN5FYo+ZGIPWZec+UGGhnDw
         chSr5QRbJRpBc9U4cZlKqTPwJjWXJGwUrbhdzdkKvmSqL63RwkpX9Mc+WHXDHUuVuEbr
         4mVPm2t9O1xYsJ9aFTwld4lqLZUzCcDQuuTA+xIYZpAS/3HJBaYjhYCFlXQNnuOyRevW
         PbBE5xAUcPdwI8yAiXhFFmuHiq6pYW8ZOMy0/aIM2PYWS4ibTGc7AOdfB61PRJUklzRp
         2HJw==
X-Forwarded-Encrypted: i=1; AJvYcCWJmBemZeaY31Im/C6eJZXQoiujXVoQIY1t1I1TvHVVw+XUHZStpdLbHD4BD/aFuNmrkb76RSpxmLp3CMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOoS63zwEOLT5wKEKM3VOx1XOvlT4IPmaM08zYZjoxK8PFNzPw
	PI8mwDVai9kJ5bXG3Fd4DryOGtJKPWWY/HHomyV/wzzHh9/MFQQrpu0NPhSsUL0=
X-Gm-Gg: ASbGncvjrmiOJwJ8FWJFzRVhBBglY3VN9dr6HMaOzpciI34io9Z6tOb7JXMdrPH/eRy
	MN/IiGPUSjs4mcRmU6Eqe9x6b6c1SAVHaiYFZtbTBSeaJNBdT8xkY2CJSsuxr2yGb1rJitMSWoW
	u1A4fzGiCgt/WCEtBoGcvum4hYbyG0l0Nftsg9JzKudgjDn320rLIRG0/oBQPzvdOv1GruFCAEz
	iaIDQkkksFc8GW+r8fZddtsfyHpSznDOTyCNave/ZWaCN+cuGfPhlIfU7rAQ9L3EIHBK6eBh56K
	M3oO/+PtlnICGaLxE53tVUItNRDTxOzhinTa/MnW+V2xHWnZqMPC9hrg4rnVlXgqHWVGiFCdT3X
	aCoyfGrczZV4SLabry2kgWg==
X-Google-Smtp-Source: AGHT+IGMVGeMyBaUbWMD2SRNc0LtssAH5A8ndxEkZnyBQsRRtZK83f0qG5vpcQnY38UUX/EqwX1CKA==
X-Received: by 2002:a05:6214:c2a:b0:6e8:fee2:aae4 with SMTP id 6a1803df08f44-6f0e5bd7058mr50446596d6.28.1744295325172;
        Thu, 10 Apr 2025 07:28:45 -0700 (PDT)
Received: from localhost.localdomain (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de95f8besm21567896d6.10.2025.04.10.07.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:28:44 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-cxl@vger.kernel.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	dan.j.williams@intel.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	jonathan.cameron@huawei.com,
	alison.schofield@intel.com,
	David Hildenbrand <david@redhat.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v3] DAX: warn when kmem regions are truncated for memory block alignment.
Date: Thu, 10 Apr 2025 10:28:31 -0400
Message-ID: <20250410142831.217887-1-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device capacity intended for use as system ram should be aligned to the
architecture-defined memory block size or that capacity will be silently
truncated and capacity stranded.

As hotplug dax memory becomes more prevelant, the memory block size
alignment becomes more important for platform and device vendors to
pay attention to - so this truncation should not be silent.

This issue is particularly relevant for CXL Dynamic Capacity devices,
whose capacity may arrive in spec-aligned but block-misaligned chunks.

Suggested-by: David Hildenbrand <david@redhat.com>
Suggested-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Tested-by: Alison Schofield <alison.schofield@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/dax/kmem.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
index e97d47f42ee2..584c70a34b52 100644
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
+		string_get_size(orig_len - total_len, 1, STRING_UNITS_2,
+				buf, sizeof(buf));
+		dev_warn(dev, "DAX region truncated by %s due to alignment\n", buf);
 	}
 
 	init_node_memory_type(numa_node, mtype);
-- 
2.49.0

