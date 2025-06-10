Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7DB23F43C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572594; cv=none; b=kGxmoSXx9hHAZyDGegcrsIVcgenyqn8Xl7jQnK0gMjSrNy0wnRD8I39f6Q2XZ+4jo7TlTfYi9P1zcTS2vTL3lYCWTrGY022TuNOcrMAZUFRCG0ZP6B3XPP103TCYpx1vpDQfbEfUZ5l9YDTE1lewFBtb8Uqykhm7+/mxEPgZEZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572594; c=relaxed/simple;
	bh=pSarTRCzQuRL/R7ATW6/ZUy90+VuBzjUwmj0wBd4rF4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oX8xy+PS/29d0jOoG/F+zUM3szbn6U4ChkN3NMQuu3yB8n/JO7uUjlGl+FYsIVLi6+Cq6AWISM0RYv1+0JKvrYmK0ziZJ/9wK6CQisXbLrEW4pZ3XLzxMgsQX9Nt0s6yv0toU9FYpihCYjKCSYC1ZitZCaez0ujYTBUWRa91vRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=cfGWd+OD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="cfGWd+OD"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2363bd24891so1219265ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1749572592; x=1750177392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Duyi2eYfEOWURmM5RwkHbBgHFP1RL7l3Jtl3iemhVW0=;
        b=cfGWd+ODd8qHlJ+BRwzQe3sqboRtM6FnENCpdWYK/eGxcjLLdw6Zpcl8FhibUZiHds
         qNnYzh9A9g6lK4rEMWOiNx2owJxwiiL6Of+FN2wf2EWzzZQuC0Vi6Ho10ntZ1n8Hju4R
         qbMUFu7qKbJTHng+tWPpz0w6u1G2x78oLlx20iI7TJR5p5Phagf3XOgFxW7LlaOpCLHT
         zv9Op7f8+QsH62ZlbXy3DGh7OhuwV+yFvKHmKvJ9UM9os8ZdNG4h/24V/D/2Om/jjGV7
         KlRAusGeDZamr1HjUnA4nkKdoQ63FLsb5D5JmDkX70WezzHmsbwkxCN0dFOavi9USVY0
         uJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749572592; x=1750177392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Duyi2eYfEOWURmM5RwkHbBgHFP1RL7l3Jtl3iemhVW0=;
        b=GAAO13Gq6sipQCQhq+Bi8yI58cs3xBTPxm6DZRGa4UsmT/a7n6BcjKqbahaAh3f0iL
         +vwFmKRy1dCCxvkPizhRdKg09mKCJCSXVgHjkenqO6cpD2oPtKmspuE67stmH9duMwmE
         NdzWSv3oxWV2vkbJ22gMq3ba46MOVX4JUUjC8lwVr2TGN3jlxPeZCR2OuIabDMpF350O
         Hor2ZtX0dhGPZqJ6CauGP+n5irQK5foUzUQKFBhMlcZ2ALSNHsMWJ8IAwDGTXipWBfbv
         ER4YthJvjCGAIDVTwE3Or0CPcQLKNYJpW6HT+GRaMu4Ej6OyM+M0NHj1U9/ZQtpyDI3X
         XlOw==
X-Forwarded-Encrypted: i=1; AJvYcCXDrwQVuveaxz++wsLEBQGhVbs0NK8kUpw6CbliMBCE0HCWtCGK0GX9nDYGi0xsuWo8cqZ40Z80MpT0uCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUYCfCZ58ZCzV9NMqdaUguwgRgsFCBmHJuvDNCffOL3FYnqxQk
	zDROY+MpYCF/L449xSVmaCms13J6bZl2DadwZYGRr1BnlUN6Hhn2rRszT5PDTD1x87I=
X-Gm-Gg: ASbGncsAbk7PPhH1k/znpAGmkXrmHa7snyQLb42RerIwEu3gWLeQ2iNSH6P5blxANjS
	F270J9g6s0VpaawXod4t6FzNFgxxeuVVJTJ9O/qlgC1YVWlzzodyCgZc0Aj2oN/bNfe2tBetWYm
	3uVWva5ILjkABrJv7ELsXUwSH3Y3n537eM7uvKXI1CJqxhy0g6XBKnfccb1GJBavW8Ni7eYZ1EJ
	3YHwZiUjdHa6XbCZNNoKepl2v1m8tACIRxz4BO25KYjgnMvDW2BgDWXejkcaY9j0RnHf5dATPDb
	+B6JbgbuX7Zc00QGTbW3/O/Eeray6f7ESGghUozwpTR5L7WXQEuq+doah9OetQREH/k5dq4E4Tl
	rKPD83hFDVq6zVgA7
X-Google-Smtp-Source: AGHT+IFzRZ/2ilv/TWo2BZioT8NNZBq3mXBKm6pZaGbBq5g4DcH/rH2061k7qbX3Bt49Qj9jZ8ssgQ==
X-Received: by 2002:a17:902:e80e:b0:234:c549:da0c with SMTP id d9443c01a7336-23603f4afa2mr100700265ad.0.1749572592309;
        Tue, 10 Jun 2025 09:23:12 -0700 (PDT)
Received: from dev-cachen2.dev.purestorage.com ([208.88.159.129])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-236032ff2f7sm73294405ad.92.2025.06.10.09.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:23:11 -0700 (PDT)
From: Casey Chen <cachen@purestorage.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-arch@vger.kernel.org,
	surenb@google.com,
	kent.overstreet@linux.dev,
	arnd@arndb.de,
	mcgrof@kernel.org,
	pasha.tatashin@soleen.com,
	yzhong@purestorage.com,
	Casey Chen <cachen@purestorage.com>
Subject: [PATCH] alloc_tag: remove empty module tag section
Date: Tue, 10 Jun 2025 10:22:58 -0600
Message-Id: <20250610162258.324645-1-cachen@purestorage.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The empty MOD_CODETAG_SECTIONS() macro added an incomplete .data
section in module linker script, which caused symbol lookup tools
like gdb to misinterpret symbol addresses e.g., __ib_process_cq
incorrectly mapping to unrelated functions like below.

  (gdb) disas __ib_process_cq
  Dump of assembler code for function trace_event_fields_cq_schedule:

Removing the empty section restores proper symbol resolution and
layout, ensuring .data placement behaves as expected.

Fixes: 0db6f8d7820a ("alloc_tag: load module tags into separate contiguous memory")
       22d407b164ff ("lib: add allocation tagging support for memory allocation profiling")
Signed-off-by: Casey Chen <cachen@purestorage.com>
Reviewed-by: Yuanyuan Zhong <yzhong@purestorage.com>
Acked-by: Suren Baghdasaryan <surenb@google.com>
---
 include/asm-generic/codetag.lds.h | 6 ------
 scripts/module.lds.S              | 5 -----
 2 files changed, 11 deletions(-)

diff --git a/include/asm-generic/codetag.lds.h b/include/asm-generic/codetag.lds.h
index 372c320c5043..a45fe3d141a1 100644
--- a/include/asm-generic/codetag.lds.h
+++ b/include/asm-generic/codetag.lds.h
@@ -11,12 +11,6 @@
 #define CODETAG_SECTIONS()		\
 	SECTION_WITH_BOUNDARIES(alloc_tags)
 
-/*
- * Module codetags which aren't used after module unload, therefore have the
- * same lifespan as the module and can be safely unloaded with the module.
- */
-#define MOD_CODETAG_SECTIONS()
-
 #define MOD_SEPARATE_CODETAG_SECTION(_name)	\
 	.codetag.##_name : {			\
 		SECTION_WITH_BOUNDARIES(_name)	\
diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index 711c6e029936..c071ca4beedd 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -50,17 +50,12 @@ SECTIONS {
 	.data : {
 		*(.data .data.[0-9a-zA-Z_]*)
 		*(.data..L*)
-		MOD_CODETAG_SECTIONS()
 	}
 
 	.rodata : {
 		*(.rodata .rodata.[0-9a-zA-Z_]*)
 		*(.rodata..L*)
 	}
-#else
-	.data : {
-		MOD_CODETAG_SECTIONS()
-	}
 #endif
 	MOD_SEPARATE_CODETAG_SECTIONS()
 }
-- 
2.34.1

