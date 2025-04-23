Received: from smtp-fw-9105.amazon.com (smtp-fw-9105.amazon.com [207.171.188.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05426238C1E;
	Wed, 23 Apr 2025 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.188.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399445; cv=none; b=Jlg+nRvTkBZOpD4Dnrv9g2O137gIZtYZ6ziyNXKK6YYoidXUVbBZ6QAc2V6pEwwqFJh6jALJuFx5ExPdGcA4gk2yaA3sC2HwCEVoNcvlHnl9GGpqtxaWHZ018wMC5LMPYxiEqIOkIr7QiiboEwMfQ+vaIIGRHK4qaSCj7xsc6wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399445; c=relaxed/simple;
	bh=13R4HhhyYLACWE2+iL5wvrH6LRhdycd8zTDtIennd8o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kna99aqGAZOiMX/uKKko2dP1s+G+qXvko908DE94eGClsxzuoh24eMffjw8GCHXGLjedJtnpWyYp2hdY+2t65q77fSjZX/QFHf+R5dnYMpE4twQKE7CjXkWA3sKQ/QWQKim5lFNwlmua39tXtla+E8EGk9Gg6q4b8O3QGdgLFGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b=tgrbK3kj; arc=none smtp.client-ip=207.171.188.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="tgrbK3kj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1745399444; x=1776935444;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L4PoR1ud+jNJMhh5D7KbDC7ekzYs2jqet1AIShSE0mk=;
  b=tgrbK3kjeLjafxFEuAaNR+XJA4LAhHcNTp6Z0dG2IOHQw6FF+bq5n2m9
   4U95r440ctOcFKv681G9ThdyLFhtLIAvnDqNO1iboDVisRwU2xS7RmPjb
   HdHevKskWT+INWWHNwDHkqtx4Xvzmji2qXebL8xoKfO1kMZxiGmeURlO0
   o=;
X-IronPort-AV: E=Sophos;i="6.15,233,1739836800"; 
   d="scan'208";a="12842701"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9105.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 09:10:34 +0000
Received: from EX19MTAEUB001.ant.amazon.com [10.0.10.100:26368]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.46.70:2525] with esmtp (Farcaster)
 id fa0c195f-2dfb-4e4d-80bc-22273541f32d; Wed, 23 Apr 2025 09:10:33 +0000 (UTC)
X-Farcaster-Flow-ID: fa0c195f-2dfb-4e4d-80bc-22273541f32d
Received: from EX19D029EUC001.ant.amazon.com (10.252.61.252) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 23 Apr 2025 09:10:32 +0000
Received: from dev-dsk-bsz-1b-e2c65f5d.eu-west-1.amazon.com (10.13.227.240) by
 EX19D029EUC001.ant.amazon.com (10.252.61.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 23 Apr 2025 09:10:30 +0000
From: Bartosz Szczepanek <bsz@amazon.de>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>
CC: <nh-open-source@amazon.com>, Bartosz Szczepanek <bsz@amazon.de>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] fdt: Extend warnings on error paths
Date: Wed, 23 Apr 2025 09:10:17 +0000
Message-ID: <20250423091018.51831-1-bsz@amazon.de>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D036UWC004.ant.amazon.com (10.13.139.205) To
 EX19D029EUC001.ant.amazon.com (10.252.61.252)

Print out adress and size if elfcorehdr is overlapped. Be more verbose
about what went wrong in case early_init_dt_verify fails. Other than
improving logging, no functional change is intended in this commit.

Signed-off-by: Bartosz Szczepanek <bsz@amazon.de>
---
 drivers/of/fdt.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index aedd0e2dcd89..c9b5e056b713 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -469,21 +469,22 @@ static u32 of_fdt_crc32;
  * described in the device tree. This region contains all the
  * information about primary kernel's core image and is used by a dump
  * capture kernel to access the system memory on primary kernel.
  */
 static void __init fdt_reserve_elfcorehdr(void)
 {
 	if (!IS_ENABLED(CONFIG_CRASH_DUMP) || !elfcorehdr_size)
 		return;
 
 	if (memblock_is_region_reserved(elfcorehdr_addr, elfcorehdr_size)) {
-		pr_warn("elfcorehdr is overlapped\n");
+		pr_warn("elfcorehdr is overlapped (addr=0x%llx, size=%llu)\n",
+			elfcorehdr_addr, elfcorehdr_size);
 		return;
 	}
 
 	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
 
 	pr_info("Reserving %llu KiB of memory at 0x%llx for elfcorehdr\n",
 		elfcorehdr_size >> 10, elfcorehdr_addr);
 }
 
 /**
@@ -1128,26 +1129,33 @@ void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
 	memblock_add(base, size);
 }
 
 static void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
 {
 	return memblock_alloc_or_panic(size, align);
 }
 
 bool __init early_init_dt_verify(void *dt_virt, phys_addr_t dt_phys)
 {
-	if (!dt_virt)
+	int rc;
+
+	if (!dt_virt) {
+		pr_warn("FDT wasn't correctly mapped");
 		return false;
+	}
 
 	/* check device tree validity */
-	if (fdt_check_header(dt_virt))
+	rc = fdt_check_header(dt_virt);
+	if (rc) {
+		pr_warn("FDT header is invalid: status=%d", rc);
 		return false;
+	}
 
 	/* Setup flat device-tree pointer */
 	initial_boot_params = dt_virt;
 	initial_boot_params_pa = dt_phys;
 	of_fdt_crc32 = crc32_be(~0, initial_boot_params,
 				fdt_totalsize(initial_boot_params));
 
 	/* Initialize {size,address}-cells info */
 	early_init_dt_scan_root();
 
-- 
2.47.1

