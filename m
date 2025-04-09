Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB0F1ACEDC;
	Wed,  9 Apr 2025 05:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178161; cv=none; b=TfL7VYwhNXzpUcX39VJ+GiaRhxMzzQ5AmRT7Im2FPEr93pxaO2MpzjurlsPkqTqXCBlK7iLHV4YW+VZQlVAHYP9WMbi3zKQBVoJ64zx4ZwEBAi4ldxb7EiNMfXgPWIfjZGTsYH7VRS8SvmrGl9WhEi4sc9BO7AlGW2K+WB94EyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178161; c=relaxed/simple;
	bh=4Wy3yCBq546yQOPfDeu6wg9Z3vjW6EJdFZNs9gXnivA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RSx/8kSZiTo3Se7q/ih1Ui9unIAiRVuSg6014Y2uOS0hfQNM/nluveRHzbECdO933SIgpOGCr/U7LLSep0KYriyiXDr1Z0itFpc1OwqWWgvSCXCOTLYoJQ4naj7wuMTvlPEQxVpbMNCoCx8Y5Ouzd6x2Ke7SEjOPI8HD0aS+sGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsrSdiO2; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsrSdiO2"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7394945d37eso5387451b3a.3;
        Tue, 08 Apr 2025 22:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744178159; x=1744782959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SqmnRPjmyzZPHZJ1jZA1292cRIoN8NM+P95WGqViGh0=;
        b=YsrSdiO2XbYsqz1Tu/YQv+JHIBj+Dif1TpjsUl36i+EBKaD8h4/ocKadijoofXVSgb
         IxuOH4M39+HGD2W0KPBPMuneWT14+gxlc8I74+VsU41ekoNytF5lxM+Y8n1mmXUZKFD1
         ojhUTq1+4r2a6gDf4UcX+g2GWICH8iSRVoOvri/e6cGnDNgcnKShGDgRVPY6Z3rfSM7s
         lQ9w9/tB5dFLI+1Uu4IvJbSUGw17y5bT2ufipOUL0OktiXlNh31NVFdf4rwKXdtYgDFO
         5eNtB9YtaZ1yLNlXILpHJWqG6ujnGFqckoxsTp46QBDVSlTqQEARnMBdVoqo1Qj7p1BK
         WErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178159; x=1744782959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqmnRPjmyzZPHZJ1jZA1292cRIoN8NM+P95WGqViGh0=;
        b=aGI3oUyN001ehQzAUpDpqp2lM2yE5JL2LvStvUUS/dSMVnNNv3X/wIHDzsLSOJS0Mr
         BMBS7Y5fq6VHe90daGsayQnOyTlLhN/92MeejmGpq6Iw7G67Dkvcuash51Joher+lt4a
         LwI0UcHlRyzy5c75IcBOD5b/V1eImhTQT4Meqfj5cz3kK93U0w9FEkrxLdi/5z+yQ1kC
         ft1/6HQQEJXK8Gl0YVNFs6B5AGtfR3bTOxSqHz9kFeYpAvzRfbO2yMgiJa3/XzsPjPzr
         jmFFLe0xaul3hxud15fAJdg34pcGqQGFdV2h51cMj4RPDR3hz4Q16tQPhJSaLkBECluP
         CyhA==
X-Forwarded-Encrypted: i=1; AJvYcCWL5oU3H1bBwsUje0PiaVJFABMADJQs4vlsIYb0yOABK/g7LU9MEfzDck56ZSKT2p6P2GUpjABV7SnNCQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUDvxO5iHSnp6U+OVIpDebPkxPwAn+QoAVI5r1If6aXzTpR8ln
	jkAVLfZoMIpZjI5+rIByoTm7VhRoIADNOQtfGuu1Y4mHkTzim3d6KjOi+2v9
X-Gm-Gg: ASbGncuzzT7bKDEFEon4rVxxHWNWWspEVVlEcBRfR8J3Zx2WYDPy1SGveoUhKMpzhcI
	TQcDRpubPZ7vEu8uB/cHm4snSUrReTjLHN3lctOvc7Tg7/7ORktxOcI+VUimSSGSA+vbTzpTWXE
	w2ylj0AFQXY9oIWqTmYwTZjgiauPeeMgUOydQ6rTtdBSnm4zsEG00I37Yno1BQurFW9bYfhgozh
	gFCXG7UATQSGAAZxhuJMHAfsIvtbW6B/+UKQUUTLYoaGnbyQ7yRN72LM96QBtIdr/guZD1cchS2
	/rq2ni7VYORJ4JDqLrAXBsaqudeWS6eeeue90WItuoKhqBWN34JOTAzK6BuJN9j8dCayT1wz4OK
	BpMnbKyoShPgywFSrXQ==
X-Google-Smtp-Source: AGHT+IEQLsJG6Df0R8apZSHxgxtSkSKnFiZLBoP02n6T9NpPsQOO8yZL9qHYwtYytu9EdpeT8HhmmQ==
X-Received: by 2002:a05:6a00:1482:b0:736:ff65:3fcc with SMTP id d2e1a72fcca58-73bafd31907mr1507936b3a.16.1744178159305;
        Tue, 08 Apr 2025 22:55:59 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e692d5sm412105b3a.163.2025.04.08.22.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:55:58 -0700 (PDT)
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
Subject: [PATCH v1] rust: conditionally compile dma abstraction based on CONFIG_HAS_DMA
Date: Wed,  9 Apr 2025 14:55:01 +0900
Message-ID: <20250409055501.136672-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make dma abstraction conditional on CONFIG_HAS_DMA.

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
 rust/kernel/lib.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index de07aadd1ff5..9d743af69dc8 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -46,6 +46,7 @@
 pub mod device;
 pub mod device_id;
 pub mod devres;
+#[cfg(CONFIG_HAS_DMA)]
 pub mod dma;
 pub mod driver;
 pub mod error;

base-commit: c59026c0570a2a97ce2e7d5ae5e9c48fc841542b
-- 
2.43.0

