Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A436255250
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750417241; cv=none; b=Y0xjpJWstc+rp2j63aOAk6yjORPOFr1d5AU3kb0859CIq27hlpnAWTeXNtcuk4WJS6zd/MirDysQFAB8BucVAYfAUu1yJnChvbQHxsqGAXTGcGKKB56x2LUQ+gJ6xgbxEp+OOm6Jq5p7lju9L+7dVsuoQlicJ1OoHRNJlU6E7z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750417241; c=relaxed/simple;
	bh=pr/KqdFA1dyDJYNDSxullixg+y3pLhBOHWegk527QVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mxBmrcDKUvnzDoe8ktQ5w2HM7BpMOhZuA3JfAWGQdVYBrA6fdQa1cW/OnBTCs2pGVZ5COrb9HuyQvtQelTQO+1sF7ocd2Lag4K9GOACpe88ZYlnLJRlkWYGerobyZ8LlszCI0O4N019FGGnhl+m/Ra8WK+rsbz7YMo44Q8Hei34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TdGL/7+O; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ISQbHP8P; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TdGL/7+O";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ISQbHP8P"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750417232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2w4hPKvF7hL0Kc5WnaNyp1RctLQ4dOlft5mLMMcWDs4=;
	b=TdGL/7+ODiIUfBpI76Ht3GFEQu6n1DCbEXnW3WfGQaVBzekz+i/tr/AW0mo6KQLLWPUbIy
	DVrAFaKWGd+yE5/x3TI0npILmix2WYVZ/4QWWIQOLLP/4XBpPju7bOIWBRJw8gZyJNIY2t
	wKz10TnV0oYfzAlZVpqQ8hwLRjboR2Ne2oJFVJyqss9gB/dWo34Dgrn5aoGgR9ENpKhB1r
	jfVDgbgPC41qS/iHpnxS09djoAC3+geaT1E1XJyGBed0Nj/DCcTAPPawLeVnpybdTm1lv/
	qGq80Kttf07sWAUGBZ4h8wVY8GVBpkosPvBdYpzJMxzuY0HlO9tjD8UmEB4PBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750417232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2w4hPKvF7hL0Kc5WnaNyp1RctLQ4dOlft5mLMMcWDs4=;
	b=ISQbHP8PXXquXQHKgnf2FmcKiLvLulReXWQm61G2S5ObxoQBANtm5OkYbsNkmCoh5zwhrL
	5iEcTl+TunAD9TCw==
Date: Fri, 20 Jun 2025 13:00:27 +0200
Subject: [PATCH v2 1/2] tools/build: Fix s390(x) cross-compilation with
 clang
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250620-tools-cross-s390-v2-1-ecda886e00e5@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750417228; l=1266;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=pr/KqdFA1dyDJYNDSxullixg+y3pLhBOHWegk527QVI=;
 b=gnkyWFPCPVu1kX2MrdbNYbA+Vdq0A5YZbjdbcU8xImvf1vrLGQluvbgrL+6e2TTdStziqAAy+
 1kmsTFiu4h4AUM6xKQje0j+TDgEaNrZNlZOUSGxTyfnRfZeVJunYfQ/
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The heuristic to derive a clang target triple from a GCC one does not work
for s390. GCC uses "s390-linux" while clang expects "s390x-linux" or
"powerz-linux".

Add an explicit override.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
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

-- 
2.49.0

