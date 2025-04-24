Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCC62147EA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745496040; cv=none; b=LTmeOzyUEw6Gi63mC/npUdvxGoyD7hxIq4O9y3PX7qB1yE/Z2m69knwLm5qHRXohd+VBDYuxoAC+X8K28UBfNqcc+22FN+FK6cect2+dKxaIv2PdbQNT74z+r3uaARyOiXDxZtEARfaqCkBD95awzFf73IJZzjY8se/WtRxGO3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745496040; c=relaxed/simple;
	bh=HLNqQlI1CMx/CXGHhy0Wdu+xi9GeSZuybgPqpVktToM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XV/jafw1znQLLoonrn+svlN2U6ZUWUmrQ0vuZPy+n9ORkWV6Bbrl7ZFaldenSNGXDsueePlGOr+HeV+90RP4qcjt5oRqkwzONb7JMg1GmtYu0AU5efZsU2ddVEeWPy3LYrDJTbzanbfzcxaBAM/nI6cXTGFIzygIQEKd5AKPcSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2ZCcyZp9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ACgUkYhT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2ZCcyZp9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ACgUkYhT"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745496037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cYkuCG5H6LWZm72zl+Zxot+183U8iOXDTJhedaNHA+U=;
	b=2ZCcyZp9OY30YTaJrDkOFnExzqzCs34BvjgK5HosWbPtzaLs5zCGZQILdxm29UxqG4p7vx
	3sZTsoNhiVchmQ56tsF2zm9WWJK/27GkQBxJbUFA4gEpnrqRDDAFjrxQMRDpj4xSJEjjah
	rzAsz+XI9WIrQyrpDSPaUSD7rDmXLufeTYXC9BSJkYhUISrXzuahoYkX/B/tgJmuNY3O+G
	/05QsFF6ZNZ665MdSe8loTbLA4jlHhc+vpKCyjr7cIBmjYI7kKqGAALWwriThsGvQODJqN
	ts+KHtfuISBa9juPWG3I3R4sLnxIU7or7vOEPrkYJXeeecv76nU5ocU222XpJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745496037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cYkuCG5H6LWZm72zl+Zxot+183U8iOXDTJhedaNHA+U=;
	b=ACgUkYhTh2deA3IEiPDRoBvSlyLlLLBZnQya9psGdGQc8/F2uapRjg5m/EnJPnTu45NBKM
	YAlJLYghjN+bmUCg==
Date: Thu, 24 Apr 2025 14:00:36 +0200
Subject: [PATCH] tools/build: Fix s390(x) cross-compilation with clang
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250424-tools-cross-s390-v1-1-d3ec4b43df12@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAOMnCmgC/x3MSwqAMAwA0atI1gZqWvFzFXFRNGpArDQigvTuF
 pdvMfOCchRW6IsXIt+iEo6Mqixg2vyxMsqcDWSoNo4cXiHsilMMqqi2M9hY9p5mR621kLMz8iL
 PvxzGlD7PzKfBYgAAAA==
X-Change-ID: 20250424-tools-cross-s390-73eaa2d42833
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Quentin Monnet <qmo@kernel.org>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745496037; l=1553;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HLNqQlI1CMx/CXGHhy0Wdu+xi9GeSZuybgPqpVktToM=;
 b=65HA/ft2uYY63g/+4+aOIwgDJhS16XpdO0onql1CmYt0sjJ9rRMGNAW9vdbM5kTkak60jT8bB
 B/1nxqQ6CcpC+NOakogw59qgLksRrTXG8Pz3d9vqRGEtfBZRYY3FUqA
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The heuristic to derive a clang target triple from a GCC one does not work
for s390.
GCC uses "s390-linux" while clang expects "s390x-linux" or "powerz-linux".
Add an explicit override.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
There doesn't seem to be a formal maintainer for this file.
Maybe the clang/llvm maintainers can pick it up.
---
 tools/scripts/Makefile.include | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 5158250988cea8eabb0b2add34bae28c273cb997..ded48263dd5e05e174316eda7b309804923e9711 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -101,7 +101,9 @@ else ifneq ($(CROSS_COMPILE),)
 # Allow userspace to override CLANG_CROSS_FLAGS to specify their own
 # sysroots and flags or to avoid the GCC call in pure Clang builds.
 ifeq ($(CLANG_CROSS_FLAGS),)
-CLANG_CROSS_FLAGS := --target=$(notdir $(CROSS_COMPILE:%-=%))
+CLANG_TARGET := $(notdir $(CROSS_COMPILE:%-=%))
+CLANG_TARGET := $(subst s390-linux,s390x-linux,$(CLANG_TARGET))
+CLANG_CROSS_FLAGS := --target=$(CLANG_TARGET)
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)gcc 2>/dev/null))
 ifneq ($(GCC_TOOLCHAIN_DIR),)
 CLANG_CROSS_FLAGS += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250424-tools-cross-s390-73eaa2d42833

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

