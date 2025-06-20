Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7863D25F963
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413782; cv=none; b=uv16rNHIwSU4sLoQA1YRfLw3dQC31doOdVHqmRSjharD4zc4gmRllP0gQfhrFt1eino/hgNidBA2WbDEzZemz+IlIDgMyk/xKY+gqJWKTYQLbmQwc1KgTpicBpa6hu1l2UnFZSShrTojHYwJGputFNeulCCPMWQU5tymsXv72XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413782; c=relaxed/simple;
	bh=WyPgnZVhINH4Sx2MORlz0cYf8AmxrXffi5h9YKVbBJY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Q2A6bSG+XGzTaxZtvJHXV+5yoEvm016Isit9+jtttzR37RBNTvhU5lntB3fHkEJZ/g9xpbBOqwpFlXrmYO+d1b3E2SmCviy7RoZyTtc16GO2IINgXMWjH6annfizcPUp7z49Vn5qlNd7fFxb9eA7pY2L6O25r8z46YGAhnDAzpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55KA2vxs009924;
	Fri, 20 Jun 2025 12:02:57 +0200
From: Willy Tarreau <w@1wt.eu>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: [PATCH 1/4] tools/nolibc: fix misleading help message regarding installation path
Date: Fri, 20 Jun 2025 12:02:48 +0200
Message-Id: <20250620100251.9877-2-w@1wt.eu>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <20250620100251.9877-1-w@1wt.eu>
References: <20250620100251.9877-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The help message says the headers are going to be installed into
tools/include/nolibc but this is only the default if $OUTPUT is not set,
so better clarify this (the current value of $OUTPUT is already shown).

Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 tools/include/nolibc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index c335ce0bd195c..f91d29705733a 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -80,7 +80,7 @@ help:
 	@echo "Supported targets under nolibc:"
 	@echo "  all                 call \"headers\""
 	@echo "  clean               clean the sysroot"
-	@echo "  headers             prepare a sysroot in tools/include/nolibc/sysroot"
+	@echo "  headers             prepare a sysroot in \$${OUTPUT}sysroot"
 	@echo "  headers_standalone  like \"headers\", and also install kernel headers"
 	@echo "  help                this help"
 	@echo ""
-- 
2.17.5

