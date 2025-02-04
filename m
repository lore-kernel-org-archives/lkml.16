Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69F3213E69
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684534; cv=none; b=QaGld1NCnKpsLg8+HcTq68KoUJ8CwTabpd6K+1JreKBrBs+dKGjDb8aT9iArRd0bBukaL5FPRtZ9yS7W1MuFqUTd9fAPYm544sPQXYT429FrUNxlWMWszUTG2Vy6+VHbmVVN9mf2YTaMSoNl0uYnLBX81Qn6xvy4SX8hdfHdMt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684534; c=relaxed/simple;
	bh=l5ETErzgYEYP4uKaysgCjkIfKyA9pl0H4zoi5fXg/UE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wv/zK9oDd3L7M4c20xu/frjEl68QuR3FjlHLNZcLI9jAauYVTAzdVLhjYw/Z8vAMa5A387PoZDFkIUX5L2/MG63zmK9VbF1Vsel1ocUhn/lOO/hobbvOtDcDboDIH7fBwMsMYKYzqSoy6x4QwksYK4jccdOYLKJjn+KnCPr5yX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jFytUpzv; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jFytUpzv"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738684530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tjDbFbRwm3HhAGF25M09T2irsMdw4QN9fdCTcQJrGfg=;
	b=jFytUpzvpraiJUWcauYL0330V0OrfayU9MHwu2SjTm6Mk+mnewiAlRiZoqAfnX332Fj1wz
	uZLUzQcAD8Jyi5ebHpkCQNgeazqurdJLFrabyQEJTeO/W2xIwm7GOijrAqIMqdw+GWFTmi
	6XeX71NrqGxsGeragjZ2M7LiP+COxbY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Russell King <linux@armlinux.org.uk>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] arm/pgtable: Remove duplicate included header file
Date: Tue,  4 Feb 2025 16:55:12 +0100
Message-ID: <20250204155514.4486-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The header file asm-generic/pgtable-nopud.h is included whether
CONFIG_MMU is defined or not.

Include it only once before the #ifndef/#else/#endif preprocessor
directives and remove the following make includecheck warning:

  asm-generic/pgtable-nopud.h is included more than once

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/arm/include/asm/pgtable.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index be91e376df79..6b986ef6042f 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -19,14 +19,13 @@ extern struct page *empty_zero_page;
 #define ZERO_PAGE(vaddr)	(empty_zero_page)
 #endif
 
-#ifndef CONFIG_MMU
-
 #include <asm-generic/pgtable-nopud.h>
+
+#ifndef CONFIG_MMU
 #include <asm/pgtable-nommu.h>
 
 #else
 
-#include <asm-generic/pgtable-nopud.h>
 #include <asm/page.h>
 #include <asm/pgtable-hwdef.h>
 
-- 
2.48.1

