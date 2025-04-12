Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D060163;
	Sat, 12 Apr 2025 00:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744416362; cv=none; b=Eoz5mT0j5901GB/Uqa5RpC0/dsBEJI5agsqSU+xPKW56QsImdEpPzxNKzo4JwAAfginQlPFS4BGfYSzDcvPdcrR8vSbosZhlIvLOKgz+hNKCyQveVZexBJfqCEkPC4AsfGrJ6zfSpS8y+Jtllna8IYmRCdqzSuunTqoccIwLITQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744416362; c=relaxed/simple;
	bh=YVCFUks66+ZwAwguLIz5pSSCpJSGHaqsSBxu9Du3S88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p9BPW95IFHyHDNI1gTSbqHc+FITOxzPHIFqITkQnv15at0/aGYiPsXsvAgfCCeQY52WoEcWoxMGPmGqZTaBYfVwEgPjTax0sIvrsqWJ8rxvN5GMLPV3PhnMmj7WlZJZyaDZGkE269C1SGekJ8ifz8guUJV0zadwj78GPhdzfTmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oeo/aP9p; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oeo/aP9p"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b0322b6f974so1848140a12.1;
        Fri, 11 Apr 2025 17:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744416360; x=1745021160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n1yGHPZt7BVOstn5lsXeEMe3lmFH9Rd9JNPYieYc3UE=;
        b=Oeo/aP9pOxs4A7c6+znI0DRmgI8+lerDYxH4bJpNUilVNltXIWiCbnRtohqrhHH8nH
         oVOjyvqnSBxJYTkbCFheVcFVY2Lfm8As6X2x6KjyBAAnh3raPhHorxJVRzMCNiSoxvsR
         4UPqWOFc0+Pk50fpuiSZAGXf7oqphEr3Lw4GY8lgsqVh2HMk41V/nVXWUDz0DC1RPpYi
         Mjp9kYd8l6GsuVi0MlNMaU7uvGk1Tq+KynMTLQKqqNYMwoV3zVmstiTt7hE0B5NPkC5b
         5FMndnTjKB5wR9bcW9oXg61hjimalonr7gQlrlWXLCTxCFhwCankbLoxfj+e6lGkDEJa
         w2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744416360; x=1745021160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1yGHPZt7BVOstn5lsXeEMe3lmFH9Rd9JNPYieYc3UE=;
        b=XAabKvS5kxxVi14GE5FDsgXycQgTd9Ft0d8+XS2lBNlnTOT8oMYfMcoExQjrcMxJfN
         jGzDP8FZHZ9EEXnJpXl1xphfLCyPmZ1jbRVI7NJVnBbl5+270OLgkvqf5zj4K9e5xBDt
         XFH5HrY7en1Hjl40M9PsN3LlM96ba3fKBk0EvXpw9xRI77aUub+bLNaSr0rHC29UlAZC
         lqBPjm7weF5hGZOzY+1xoHfjcdX3HoMkNK2xjUnuxKasaZyrQHLi5qjuRScepg5H0KYB
         amfWmIb8ma1jr2CX+azY+9S4aXsOHMtMXnLJX+OqD0EdNk+ToVp1f7qmIn83JN2iZ8TE
         8A7g==
X-Forwarded-Encrypted: i=1; AJvYcCXLwpZ7lLD+uTkdD2t0qrTMv6EZ29Oc4nITkK6lQx3cf+SbTUdONhiV4H74nAJTvK9nKiT8Ub3x9Dqi7M0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxdhMfSJkksoLF7BhuruJtu/r6r/aLWUQCoeeXS0GASKGv/bs+
	AtcLkVa+yyHah9Cj7FkUKS0V2unuXebQ4gTwl6Eto9RPZB8NauJsYDMo90o+
X-Gm-Gg: ASbGncvc1SvXsto1udelOfxII8HdYhJo3YKZgKO0eRPe+8fIH3F6u94KUSE1ISspwMm
	L9UXvJsHCpfEca3tlGsGZdeQ1Z7G8GyktySbwYn7dTYWr9D+sCdGi7wLNgeD6H8c05fZO8ZxiAd
	dGjqpVo5i4cMUX1XwgxlFSwe/B+Nm14Dq86RYIoy1FNrmeGSE9FHVwgn0YvjI8kBlX8379IZrpR
	S35fxv3nNLD6q0bSfWY4/WmUGAhalaqPN64dOz1h27DCeAGp0ARz+WMUtTh+mW5AaSfSgtX0jZ8
	AhhavMyTJQytLDX1wCGecV8RWuKF/mVceCuc85rGHCpzA3U8lv3H6xABM1hNp45srHCN07FHc2L
	JMT0OUYmwu0uffEYPdUAKxI1p1O7J
X-Google-Smtp-Source: AGHT+IF4FSkvtK71eFQmWd7r5EM5benxiZt/VKA2BS8m6LYGVADpnhU5GciqTL2F9Zkajo2ZhVgPPQ==
X-Received: by 2002:a17:90a:dfc6:b0:2ee:f550:3848 with SMTP id 98e67ed59e1d1-30823660367mr6594140a91.5.1744416360076;
        Fri, 11 Apr 2025 17:06:00 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df08f826sm6384002a91.29.2025.04.11.17.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 17:05:59 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: abdiel.janulgue@gmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	aliceryhl@google.com,
	tmgross@umich.edu,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] rust: helpers: Add dma_alloc_attrs() and dma_free_attrs()
Date: Sat, 12 Apr 2025 09:05:06 +0900
Message-ID: <20250412000507.157000-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dma_alloc_attrs() and dma_free_attrs() helpers to fix a build
error when CONFIG_HAS_DMA is not enabled.

Note that when CONFIG_HAS_DMA is enabled, dma_alloc_attrs() and
dma_free_attrs() are included in both bindings_generated.rs and
bindings_helpers_generated.rs. The former takes precedence so behavior
remains unchanged in that case.

This fixes the following build error on UML:

error[E0425]: cannot find function `dma_alloc_attrs` in crate `bindings`
     --> rust/kernel/dma.rs:171:23
      |
171   |               bindings::dma_alloc_attrs(
      |                         ^^^^^^^^^^^^^^^ help: a function with a similar name exists: `dma_alloc_pages`
      |
     ::: /home/fujita/build/um/rust/bindings/bindings_generated.rs:44568:5
      |
44568 | /     pub fn dma_alloc_pages(
44569 | |         dev: *mut device,
44570 | |         size: usize,
44571 | |         dma_handle: *mut dma_addr_t,
44572 | |         dir: dma_data_direction,
44573 | |         gfp: gfp_t,
44574 | |     ) -> *mut page;
      | |___________________- similarly named function `dma_alloc_pages` defined here

error[E0425]: cannot find function `dma_free_attrs` in crate `bindings`
     --> rust/kernel/dma.rs:293:23
      |
293   |               bindings::dma_free_attrs(
      |                         ^^^^^^^^^^^^^^ help: a function with a similar name exists: `dma_free_pages`
      |
     ::: /home/fujita/build/um/rust/bindings/bindings_generated.rs:44577:5
      |
44577 | /     pub fn dma_free_pages(
44578 | |         dev: *mut device,
44579 | |         size: usize,
44580 | |         page: *mut page,
44581 | |         dma_handle: dma_addr_t,
44582 | |         dir: dma_data_direction,
44583 | |     );
      | |______- similarly named function `dma_free_pages` defined here

Fixes: ad2907b4e308 ("rust: add dma coherent allocator abstraction")
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v3:
- add rust/helpers/dma.c to the Rust DMA entry in MAINTAINERS file
v2: https://lore.kernel.org/lkml/20250410234332.153242-1-fujita.tomonori@gmail.com/
- add helpers for dma_(alloc|free)_attrs() instead of conditionally compile
v1: https://lore.kernel.org/lkml/20250409055501.136672-1-fujita.tomonori@gmail.com/
---
 MAINTAINERS            |  1 +
 rust/helpers/dma.c     | 16 ++++++++++++++++
 rust/helpers/helpers.c |  1 +
 3 files changed, 18 insertions(+)
 create mode 100644 rust/helpers/dma.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..bec614ef35d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7020,6 +7020,7 @@ L:	rust-for-linux@vger.kernel.org
 S:	Supported
 W:	https://rust-for-linux.com
 T:	git https://github.com/Rust-for-Linux/linux.git alloc-next
+F:	rust/helpers/dma.c
 F:	rust/kernel/dma.rs
 F:	samples/rust/rust_dma.rs
 
diff --git a/rust/helpers/dma.c b/rust/helpers/dma.c
new file mode 100644
index 000000000000..df8b8a77355a
--- /dev/null
+++ b/rust/helpers/dma.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-mapping.h>
+
+void *rust_helper_dma_alloc_attrs(struct device *dev, size_t size,
+				  dma_addr_t *dma_handle, gfp_t flag,
+				  unsigned long attrs)
+{
+	return dma_alloc_attrs(dev, size, dma_handle, flag, attrs);
+}
+
+void rust_helper_dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
+				dma_addr_t dma_handle, unsigned long attrs)
+{
+	dma_free_attrs(dev, size, cpu_addr, dma_handle, attrs);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index e1c21eba9b15..1e7c84df7252 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -14,6 +14,7 @@
 #include "cpumask.c"
 #include "cred.c"
 #include "device.c"
+#include "dma.c"
 #include "err.c"
 #include "fs.c"
 #include "io.c"

base-commit: c59026c0570a2a97ce2e7d5ae5e9c48fc841542b
-- 
2.43.0

