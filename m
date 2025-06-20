Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAF727FB25
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750417242; cv=none; b=Hiey0WX4joc2QMLa3I2PriOo6KUkzrMFBtR5VWdxMh1m5pMF4jHCfUa7I3Gt/I7qRBflyJ8qP+mI3P8T6BnYFPPl8ELVwcrUQGHCnYGsXAYlWIeZF+9QWbP4Mn+GbQVgiK8a0JE1I/KVUhkmhx+tIjAzrx2OT3wuON1I8Dc/8Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750417242; c=relaxed/simple;
	bh=+mjvB4tuc7hFJsqAvVRwFmvtR5QbD0fyNd4pRSMSUeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PSQDnuf+yL5oHd4HQp8tJ1y6T2sPEqfDOWPrvIRhwkpLdZscAbupyuVP58sjxwZhwQoiyB2fATqmHaGpFZTKMsAGHA8Ysqgt7zPdcWwuJaBt/cXs6t5AuYpSGs5FBBNLLtzhmSOcfqIUv6NGbqtImr7kZ1WXiWOdMnU3TLbZdI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XqLg/BW0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2O9qQdhh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XqLg/BW0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2O9qQdhh"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750417233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bz3FkrvK+6s0da0qU1rVXz5C4VyK6atgA4iybwpXf4s=;
	b=XqLg/BW0O5hrEUz9i/sGv6BmeUjZsYptmQ2BKqgryYtHbAX627EauLJHn8tyDJ5LSO+hOV
	Faie7jwIgXCaEiS7btKrUYPc77ITb1Hf1M3LRAHZ++KfgusHYS4bKievS+mmfsuqzSm2Ak
	LzlbE/UNCdbAi1CTXSY8D5RBdIYYhfpln3MR6W1NXXNTuSfTy9W9JUV0K3YB4Vjicc4ZPh
	KLM6aPJglfPOvVVLBwNfGGWTRw/bxabYIPGWXCX/JDjPwShyLyB3aKK93YXOUlUseoUnFP
	XmgjPYc1WAf0XKztfUino3e2QaMmIOIMMRhpaKwJXb3H1l6OoNOYpNT5AmQ+aw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750417233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bz3FkrvK+6s0da0qU1rVXz5C4VyK6atgA4iybwpXf4s=;
	b=2O9qQdhhl11UeE/uU/ySWEBjuho1RLBPW7o/ipAJf9I86wsQjyC45QDazrx3cAwggEuflQ
	Z+uvrsGzyfDdxeAg==
Date: Fri, 20 Jun 2025 13:00:28 +0200
Subject: [PATCH v2 2/2] tools/nolibc: drop s390 clang target override
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250620-tools-cross-s390-v2-2-ecda886e00e5@linutronix.de>
References: <20250620-tools-cross-s390-v2-0-ecda886e00e5@linutronix.de>
In-Reply-To: <20250620-tools-cross-s390-v2-0-ecda886e00e5@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Quentin Monnet <qmo@kernel.org>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>, Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750417228; l=1055;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+mjvB4tuc7hFJsqAvVRwFmvtR5QbD0fyNd4pRSMSUeA=;
 b=Vd2p2UAWHewbV5HcpypVqfWovFjjww3OU96B13cFfgbdHNirzp63ZYFgUZOMtXksUOsLWHutg
 q9FL17jy0AFD2A1dIv+PMCZqZYj5qCVsAizFHdsBHEqnUpAKBw9g2bq
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

tools/scripts/Makefile.include now has the same override,
removing the need for the one in the nolibc Makefile.

Drop the superfluous custom override.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/include/nolibc/Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index c335ce0bd195c1ec63b9b23c0143307acfd3d3c8..3b3ff0505a5f5fea493d6a77faf44759925ff2b0 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -114,9 +114,6 @@ headers_standalone: headers
 	$(Q)$(MAKE) -C $(srctree) headers
 	$(Q)$(MAKE) -C $(srctree) headers_install INSTALL_HDR_PATH=$(OUTPUT)sysroot
 
-# GCC uses "s390", clang "systemz"
-CLANG_CROSS_FLAGS := $(subst --target=s390-linux,--target=systemz-linux,$(CLANG_CROSS_FLAGS))
-
 headers_check: headers_standalone
 	for header in $(filter-out crt.h std.h,$(all_files)); do \
 		$(CC) $(CLANG_CROSS_FLAGS) -Wall -Werror -nostdinc -fsyntax-only -x c /dev/null \

-- 
2.49.0

