Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7573C2701B3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.21.196.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398151; cv=none; b=D+n+AjzYyuD8+/0ZfgWebYvIFdagd9sh9YulfiRRvwpaOWpSALqr7qRt3FLhAeys6QBkgYuUqqmKu69xDS4vo6yW2PH4b3O5EV/c9TtuhyWxTTZMYQ/+N14kAPnsqV1fRe28TlKBAQVLBUA2EQFoypvr3Lr//k9Ywcwyoxd57/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398151; c=relaxed/simple;
	bh=tt2L/0y3lEB8Yceubu7KjLUSWU55Vs1CZjSs841ZniQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RdEDURjQ9l5eogs/cB9/INLyHxlPf4LbwbTBWJhOqGo7C1P2uxl0uaKbnTS7ifUy4hgXbCbogqlN5FFshYuu8GyyEonQxPwWkBG67RwNDGCMSWLEU+Ys8WovfggaKivEs9K8NqlXWmVwzXA/7wPomknP/IpqONkAX/7fBTaQ+o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b=cdQTQn5Y; arc=none smtp.client-ip=72.21.196.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="cdQTQn5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1745398150; x=1776934150;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WgvWtre4TVJu4abfOj2tsJSftrHxJ/AAw6dT3bLtEKM=;
  b=cdQTQn5YbxE8tTU9+87wadS0kjAtQfbSG5Ih4nnblp0QkA75XOIOhS7q
   Dc2qVWn/fAfVek5WLrG6bSAPc4Jb7Zg2r7FhG2hNEiiAQaDKx/XIxcQX6
   70t3Qu/jWqq6FrggohHsChlSfiA9HGMd4DNr5NrsUnnGcowP+xp5RGWBb
   M=;
X-IronPort-AV: E=Sophos;i="6.15,233,1739836800"; 
   d="scan'208";a="485479226"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 08:49:06 +0000
Received: from EX19MTAEUB002.ant.amazon.com [10.0.17.79:25335]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.19.73:2525] with esmtp (Farcaster)
 id fc92da43-f71c-4df5-b171-aeeacb675f07; Wed, 23 Apr 2025 08:49:04 +0000 (UTC)
X-Farcaster-Flow-ID: fc92da43-f71c-4df5-b171-aeeacb675f07
Received: from EX19D029EUC001.ant.amazon.com (10.252.61.252) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 23 Apr 2025 08:49:02 +0000
Received: from dev-dsk-bsz-1b-e2c65f5d.eu-west-1.amazon.com (10.13.227.240) by
 EX19D029EUC001.ant.amazon.com (10.252.61.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 23 Apr 2025 08:49:00 +0000
From: Bartosz Szczepanek <bsz@amazon.de>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <nh-open-source@amazon.com>, Bartosz Szczepanek <bsz@amazon.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: Extend pr_crit message on invalid FDT
Date: Wed, 23 Apr 2025 08:48:51 +0000
Message-ID: <20250423084851.26449-1-bsz@amazon.de>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D038UWC004.ant.amazon.com (10.13.139.229) To
 EX19D029EUC001.ant.amazon.com (10.252.61.252)

Log size in addition to physical and virtual addresses. It has potential
to be helpful when DTB exceeds the 2 MB limit.

Initialize size to 0 to print out sane value if fixmap_remap_fdt fails
without setting the size.

Signed-off-by: Bartosz Szczepanek <bsz@amazon.de>
---
 arch/arm64/kernel/setup.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 85104587f849..77c7926a4df6 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -169,7 +169,7 @@ static void __init smp_build_mpidr_hash(void)
 
 static void __init setup_machine_fdt(phys_addr_t dt_phys)
 {
-	int size;
+	int size = 0;
 	void *dt_virt = fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL);
 	const char *name;
 
@@ -182,10 +182,10 @@ static void __init setup_machine_fdt(phys_addr_t dt_phys)
 	 */
 	if (!early_init_dt_scan(dt_virt, dt_phys)) {
 		pr_crit("\n"
-			"Error: invalid device tree blob at physical address %pa (virtual address 0x%px)\n"
-			"The dtb must be 8-byte aligned and must not exceed 2 MB in size\n"
-			"\nPlease check your bootloader.",
-			&dt_phys, dt_virt);
+			"Error: invalid device tree blob: PA=%pa, VA=%px, size=%d bytes\n"
+			"The dtb must be 8-byte aligned and must not exceed 2 MB in size.\n"
+			"\nPlease check your bootloader.\n",
+			&dt_phys, dt_virt, size);
 
 		/*
 		 * Note that in this _really_ early stage we cannot even BUG()
-- 
2.47.1

