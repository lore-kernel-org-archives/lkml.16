Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com [99.78.197.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8F217AE1D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576422; cv=none; b=KpUFmrfnK+FGWcOT4lb/8QvNvossCZ8CZvps1od48poKALRYzhku/RhPv/dDO8VIRTWIT/Ru4Xh08zorpKNjEu/wdikoseWpl3572UgDgrP1xWSOsmjBU+V4uCA0D9TbQ5HYxaJSGngT5pJH0oO5TtxmktuQ8KuvGViuhjO4Nzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576422; c=relaxed/simple;
	bh=z4ABru8tKBS2STmuFttQNIRlov/mtoOenuukQli4oYY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UCixswzva35Wr43AbLxnc9fcoC1/9dhFSBTqq4UHDcXB+j6f1bxMwZ4dTI8qW4CJDUt3NM6a+64wWAsv5Bq4NkTRJifc3EgO/lQK1QVjlk4bSO0Wtx1Da1BnguUm9pLs1qFN5FgSFjanwipXrfgjT2JgLWX7X0qQ2A5a32RFM9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b=cAVRRHwF; arc=none smtp.client-ip=99.78.197.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="cAVRRHwF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1745576420; x=1777112420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9MCmXbidRkR+q6lK/LlO8ENPf08O7LIBh2qUjZeb8xU=;
  b=cAVRRHwFFrLrQgvF+UhxmjeHrRUqhnRrG2ZrGqjjH7cr9t9ODNNVJ0EW
   x+VZmsR7NGt7CJczZKNpy0TzHorRnZtGXYNEypC8kUdHn2/09zB8QJ6mt
   2mArFMUHbqSiIoEMLpOIjhLYY5nBVWY5XBiCH64OU4wBwZTNqvtYlSZvi
   c=;
X-IronPort-AV: E=Sophos;i="6.15,238,1739836800"; 
   d="scan'208";a="194318961"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80009.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 10:20:18 +0000
Received: from EX19MTAEUA001.ant.amazon.com [10.0.10.100:12409]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.15.207:2525] with esmtp (Farcaster)
 id b95b1a64-d152-4f5f-9220-4bcba3fe2c21; Fri, 25 Apr 2025 10:20:17 +0000 (UTC)
X-Farcaster-Flow-ID: b95b1a64-d152-4f5f-9220-4bcba3fe2c21
Received: from EX19D014EUC004.ant.amazon.com (10.252.51.182) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 25 Apr 2025 10:20:17 +0000
Received: from dev-dsk-bercantu-1c-725598d7.eu-west-1.amazon.com
 (10.253.100.253) by EX19D014EUC004.ant.amazon.com (10.252.51.182) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14; Fri, 25 Apr 2025
 10:20:14 +0000
From: "Bernardo C. Gutierrez Cantu" <bercantu@amazon.de>
To: <bercantu@amazon.de>
CC: <akpm@linux-foundation.org>, <dwmw2@infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <lkp@intel.com>,
	<rppt@kernel.org>, <yajun.deng@linux.dev>
Subject: [PATCH] mm: memblock: Fix arguments passed to memblock_set_node()
Date: Fri, 25 Apr 2025 10:20:03 +0000
Message-ID: <20250425102003.64122-1-bercantu@amazon.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <bd5842a92bd340799a74063f8da83d96@amazon.de>
References: <bd5842a92bd340799a74063f8da83d96@amazon.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EX19D038UWB001.ant.amazon.com (10.13.139.148) To
 EX19D014EUC004.ant.amazon.com (10.252.51.182)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

memblock_set_node() receives a `base` and a `size` arguments, but we are
passing the `start` and `end` of the memory regions when iterating over
them in memmap_init_reserved_pages() to set their node ids.

This results in the function setting the node ids for the reserved memory
regions in `[base, base + base + size)` instead of `[base, base + size)`.

Pass `start` and `size`, so that we iterate over the correct range.

Fixes: 61167ad5fecd ("mm: pass nid to reserve_bootmem_region()")

Signed-off-by: Bernardo C. Gutierrez Cantu <bercantu@amazon.de>
---
 mm/memblock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index 0a53db4d9f7b..9639f04b4fdf 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2196,7 +2196,7 @@ static void __init memmap_init_reserved_pages(void)
 		if (memblock_is_nomap(region))
 			reserve_bootmem_region(start, end, nid);
 
-		memblock_set_node(start, end, &memblock.reserved, nid);
+		memblock_set_node(start, region->size, &memblock.reserved, nid);
 	}
 
 	/*
-- 
2.47.1




Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597

