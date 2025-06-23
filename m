Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9BD1E5B71
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 21:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750714201; cv=none; b=rPkAQpXVBPa1inp2JWevxS5U2r7AZf5gsoMfnlhDHxLkClwyf7Z6OwIpy9tPkv0ITbrS8/owuwH2xgYKAFR7tMrtgX/2CNZQIUAGzZe7HjaUr39FFmTS7NbhiriIZKVXVIkHyYjmq+wkNPLY2Mxylsqp73+6Z1w6tzV7P01CC3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750714201; c=relaxed/simple;
	bh=rTZYvC/xL9ghntoLU+QaEzxRwek3vw/h3bcaAFYUV7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HkjKWzjw8sWQYaydyN1R0tYVDvYTe91Mo4J02f17tzzH+qBntnnBO/1DX3bL2IkOGrSGCvPxjyROHx4sKUtUgEgV/Lvsy5Y1ipVxB6IzYxC2CJNL5Atz4adV47mzZXvK1fImjScBkBdt2iCtHHUxlIX2AdetTJdzH4LedSTvIZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=FjxZHnO8; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="FjxZHnO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1750714198;
	bh=rTZYvC/xL9ghntoLU+QaEzxRwek3vw/h3bcaAFYUV7Q=;
	h=From:Date:Subject:To:Cc:From;
	b=FjxZHnO8CB8hNJq19u9QGe6kgO3XGp0tAWcLcOikfkOFg24UeDB9Ipz50RcRy3fL8
	 yHkZEOrYx3zvH7fWFSm0gsVCaJyOSSoZUMcnwkgK+csq7KWY/nOFg4ooEQtnKvPL0j
	 yW7ifjBD1DbNGtuCgb1tYPEkd1eDAx+Z6OCHVbko=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 23 Jun 2025 23:29:34 +0200
Subject: [PATCH] tools/nolibc: hide headers_check command by default
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250623-nolibc-headers-silent-v1-1-f568facf014c@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAD3HWWgC/x3MSwqEQAxF0a1IxgY0fih7K+Kg1KcGpGwqTSOIe
 7dweAb3XmSICqNPdlHEX02PkFDmGU2bDytY52SSQpqilYrDses48QY/Ixqb7gg/dg714ptOXCm
 U2m/Eouf77Yf7fgCRw8FHZwAAAA==
X-Change-ID: 20250623-nolibc-headers-silent-88e4fa592812
To: Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750714197; l=1263;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=rTZYvC/xL9ghntoLU+QaEzxRwek3vw/h3bcaAFYUV7Q=;
 b=wwqoBIjJDpCL4jkH10n+KqMOWs0LcCDp4ng0l8mSPoaMzX6z33rKFiLcUUw+UpnJXYiJHP08Z
 lEnT84PUexUA6FlMZCFUoAe+nyZZtifN+sTefZwjLc5NgYf8Lv48DRX
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

If V=1 is not specified the executed commands should not be printed.

Hide the commands by default.

Fixes: a6a054c8ad32 ("tools/nolibc: add target to check header usability")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 4bace7737b2ade388e138474c10f027a71e21816..f2f2924626d37ac7cf14f94ec248414fa509dc70 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -112,7 +112,7 @@ headers_standalone: headers
 CLANG_CROSS_FLAGS := $(subst --target=s390-linux,--target=systemz-linux,$(CLANG_CROSS_FLAGS))
 
 headers_check: headers_standalone
-	for header in $(filter-out crt.h std.h,$(all_files)); do \
+	$(Q)for header in $(filter-out crt.h std.h,$(all_files)); do \
 		$(CC) $(CLANG_CROSS_FLAGS) -Wall -Werror -nostdinc -fsyntax-only -x c /dev/null \
 			-I$(or $(objtree),$(srctree))/usr/include -include $$header -include $$header || exit 1; \
 	done

---
base-commit: eb135311083100b6590a7545618cd9760d896a86
change-id: 20250623-nolibc-headers-silent-88e4fa592812

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

