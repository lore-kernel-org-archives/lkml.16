Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFEC1DED40;
	Thu, 10 Apr 2025 23:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744328635; cv=none; b=Yl26zNoBpGP9YI04KNmlEhb8aYdXWpSpEm7WwbgrmS+n0jgsRWeWj1Gt90mwPWJ37nEKqi+hR652f64x2aIv/8fmqwfs2hpGIVVkuFvOVCHFxwayZE4/Hywl6rntbsnpUXpt0Ioe/6ag8gUoAHFJeBygSQh3pTwz2JdsBfNMrCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744328635; c=relaxed/simple;
	bh=p666x0nC/judlLYcmnXL7beImPA94XeZkw17BkcrsrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OreQMCUmYax/H1Qyb14KHfkD8XjW2SXjeyx1TF+dpUouuEwqItspNDVwSlh+GYUEJad1ab868HLTKxqs0ekujoXuLXzVcVjzGUbulmePBw5i2/4ndYNuFeVi/0rMojFz5EWiT+gZHrHrBRLFNUv1JUPN4ptgedcukWWhQ1i1nqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITrULVAy; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITrULVAy"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so1331143b3a.0;
        Thu, 10 Apr 2025 16:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744328633; x=1744933433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mkXOG9SHSYydAOpZRLIeujo9akAQSNGPAXLGkx9I9X4=;
        b=ITrULVAyoXQSAzxnB26Hua+6VLXpCVCQVXk+8hZn9K5bB5Ed33+L/030VurGKt3ZtB
         RaV8XNltt0RZ2GMfnpWpHrOj8YQ6CkFSDpXmk45lrNVXUdm2GJVqpprULkl8FCA/FDIV
         eCIeuVCVXT8kKHOOP/ZSrkquCBlec/5aCi8b+s4czXYSGRqXUVCpirQ4AW+x7PmYgHhA
         XneKmBSFD1sUMW4m4OPhBDMSCUzoO2h/mgonQjiEwE/5sjAsyWHZQ+2RgwDppyHA6q9/
         RhlDFW1ekQI6oC8f4gWOAP3T9OFilEUsbxFTUk3AVVw/QLLW5hsd73Wl19HsNVcxu4Dj
         JR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744328633; x=1744933433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkXOG9SHSYydAOpZRLIeujo9akAQSNGPAXLGkx9I9X4=;
        b=v2iBkmq5vYi1pLrKGcMnC27legecEPoKx0C6gvs87Ie7QrNiiT4dxq3VYc2AQ3+liF
         dfmr7sjcxMwOXKpGU6d/krg9/Q4IZc6tSac0k/L7THf52OFQfEALcbVc8sxtx96BGcmR
         rlLXfBJg08wi6GIRiSpNmUTJEXmBBYlX/BnoglmBje1rPB/qAqASeGwEm8deqeyS/7WD
         Vf9fx2N8jP9k8Rhhs2vrEP5kvtxvXo8WyNK4Y1vKrC2T6A99WLoOwDCGdGz/JBBlnvJj
         w06vLAJAIscRFjbRrQy4t5Ea3d7hkTGKRJJhQphaXvaOmY7imm8NW5A/LTDEUVgns8zZ
         2bmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdRfI3mK1cReBDH855pxx6xiFoUrgLmzJfmVGRjRU1ZQ8cEQNurC1Y096+cIJUXYGgOPLeS5z6ZswYAfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqXr7wT7unBFr3btLhffmfvCvX36aMBabdtU7+xd10jzj3VUNM
	woFrNxyaev5/z5wppGyMO+WU5K7TyxbJc5lU5ZqQkVTHE8C8vUs4TYXQwxYk
X-Gm-Gg: ASbGncvdKfJup35ojuphaCKCAjAgesmTIGYZDdTnU6aa1nsqMqbNpk75gEF4fXEer4Z
	Y5KBvxeXkIQo3AOJr4sLHWGhrkzsWEi3PDc3hz4w2Zd1TeS17ajVtiD2vq7sxn3fxt9y2+jkLEM
	FdnoPlP1gyg+DDNPsgaVCGHB0fwGF6GocezNTPEP1FCdTYphakSRRpQ+f0XYJyCLtFqqRi6eiyC
	oliCLh3QPguJYXLYv7bIr38kkCHLp2OC7k9Q5mes1M3Ul9YV8itU5u1663CTRkFRWFpHN9Yfgs0
	amnkNBpjzOfx2HFxqRwTAzkUmBVNC1KCWPSCf9yxkFkrP8Eaqlva+7oJUknzVallCQBHFqmYKho
	9NAegeZQ6Jgw0SeaMvA==
X-Google-Smtp-Source: AGHT+IEvxZfT0oBD09UnAPGUiwY4IMkEr5SLqOudKTaL2C+U7GzKJx3GLjFfHx9Qdt2ZsECrPXu8+Q==
X-Received: by 2002:a05:6a20:d70f:b0:1f3:418c:6281 with SMTP id adf61e73a8af0-20179787761mr1116092637.4.1744328633153;
        Thu, 10 Apr 2025 16:43:53 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3943sm165813b3a.37.2025.04.10.16.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 16:43:52 -0700 (PDT)
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
Subject: [PATCH v2] rust: helpers: Add dma_alloc_attrs() and dma_free_attrs()
Date: Fri, 11 Apr 2025 08:43:32 +0900
Message-ID: <20250410234332.153242-1-fujita.tomonori@gmail.com>
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
v2:
- add helpers for dma_(alloc|free)_attrs() instead of conditionally compile
v1: https://lore.kernel.org/lkml/20250409055501.136672-1-fujita.tomonori@gmail.com/
---
 rust/helpers/dma.c     | 16 ++++++++++++++++
 rust/helpers/helpers.c |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 rust/helpers/dma.c

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

