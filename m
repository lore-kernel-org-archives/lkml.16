Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1DB20E01B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744928406; cv=none; b=f2v/KGKrHnGuHkcQJShhWe61Hcdvh5MKaNm9bK+wdZJ8qJ6HuUdo6DWcg2ynaJwLTUXSELU1BxzasqOih+aJAgJwWwWaQh9xeBUCGdDkP0sxpGBZditV41rsTsdhtcIqQzov5ICvQhUbcvIQ2J4AntGjUzfhtSmKIWTbOLYEt7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744928406; c=relaxed/simple;
	bh=/D7x1nz2cdiZi5+XsXslM7WDAReNSYQ/NH0dZIP1JXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=itRbrzYpORRteBxutyGs5liyVwUP58PMoHshDQ9lXuC/yBOekN8ihRxRk+A3Xel9hw+d+I/zCcyq05pyXJYmcK+zCemRJbpr47mqVj5B+5sUF55vnQBpb+xFwN1AqjNt99JjRqqEgdbspT5cZcmWjxXZ/mse+A4Cq8l8Iu8Fezc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JAMS3dZ5; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JAMS3dZ5"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so155333466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744928403; x=1745533203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vODMw6796TMuk6ZLxaXIS17nQiEjdxi5Z2/Gqr9wluk=;
        b=JAMS3dZ5sxbABBvH3jbcwQEi7qOj2DGSbkWd05ATC4uPKVH2LvBVdUgfjCeA75/1gw
         y63k9xjrin9zPnbpLOnF+1DYTuacXGQJK2eJFazg7tbMhD367s138Z5vsHFtqK2ksBQW
         S6YZLk9CYMNfwCyNHqyjRrh0WnxBcn+HMO5TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744928403; x=1745533203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vODMw6796TMuk6ZLxaXIS17nQiEjdxi5Z2/Gqr9wluk=;
        b=OgACEmnUVyP4RZZh19kNz3Uf3mrHNecWEG21V9MPjxCMdBrrEKpBx4C1hdN/Rj7pkM
         XopepAKEWQ2PKImbddAGFTwU4+mR6wp4bxFSFRA3AqBk3702uEEDQziaZrlYpvhAllEo
         dt7H1hQa2RVEHT45+z9775uIanJWs1zV4A9A1kA+sUB8wu/8HeTYDF2BZLSizmVIxfyE
         dA7EVNAxuVp/MseILLnSRuRdZOfeQv8zmLWTpBxlDYOQFzMD20Rbj+WS8CKGx6va3KiS
         3MHSJFAt8135fht6gdMWMND0FJatw87W9saM5xt/8GCpM4O93pt1Z2TtApEcJ6ekEUOM
         8QXA==
X-Forwarded-Encrypted: i=1; AJvYcCWMcp0d2cpR5Ar4hc+I3SLaVfWgjV3xuSjLXAP5/foptOkx8bgczsVlw6lfmBPu4jg3J+FpCg6J1yYQbuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPkW/pvMqskqjzGAKY/aSmTpZlZQXIYP9WtVygGtpHVelreds7
	PpmA5lY5n+9FpFyt/c8DYJYy6FYWxWlIiPoph8tYS2eHeZmi+BrdH0f2vl0SMw==
X-Gm-Gg: ASbGncuBuea2hZDuBV5P1EXxqZZJYqT1oiw2SWNP6BGZGeRFWr8K9WYqYQhbEkR1tvO
	pWLmaFXhXY8ksPnwZ84obnRKXIkb1DnMKg5klo7dYPVPCNquDT1AtUhzzJ6UNSy5B5zC7LGQzX0
	zT8V82tunhk9PO+fU3z13YV/Xhhn344ZObwdeD68968GY9Nxjf4JmOzEx7qGbK2PdrFxE9LTrlS
	pwDXp4MedAAzrkqqhte6EmF2J6qFt7iEyvtxq7GdeB2wGRNrY0zP4UzCrYtDYcRc3C46ovVXUwJ
	q/B47sK2m66mPhCMCEHY9SlEyRnsEB/6v4mCcjA6v3LTjfEWaz1jTGErzAhz1K8Yv/uMdubt7ZN
	wPdS2b1XjtmI9pFRACtLhVXI=
X-Google-Smtp-Source: AGHT+IGmQMmeVlfs7plUqtsZJEWNR5WBuca1u4T7ItTkJtiG4sb4NF0vrMxSdkNrdzep2Gtau49jlg==
X-Received: by 2002:a17:906:6a0d:b0:aca:d4d0:a735 with SMTP id a640c23a62f3a-acb74db592bmr36919566b.43.1744928403422;
        Thu, 17 Apr 2025 15:20:03 -0700 (PDT)
Received: from jaz-virt.c.googlers.com.com (8.236.90.34.bc.googleusercontent.com. [34.90.236.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0c068sm45725066b.11.2025.04.17.15.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:20:02 -0700 (PDT)
From: Grzegorz Jaszczyk <jaszczyk@chromium.org>
To: tglx@linutronix.de,
	robh@kernel.org
Cc: mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@google.com,
	dmaluka@chromium.org,
	bgrzesik@google.com,
	jaszczyk@google.com,
	ilpo.jarvinen@linux.intel.com,
	usamaarif642@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	tnowicki@google.com,
	mazurekm@google.com,
	vineethrp@google.com
Subject: [PATCH 1/2] of: fdt: allow to register arch specific hook validating reserved region
Date: Thu, 17 Apr 2025 22:19:37 +0000
Message-ID: <20250417221938.579452-2-jaszczyk@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250417221938.579452-1-jaszczyk@chromium.org>
References: <20250417221938.579452-1-jaszczyk@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Grzegorz Jaszczyk <jaszczyk@google.com>

Add a possibility to register arch specific hook which will validate if
reserved-memory region passed by DT is valid (e.g. in case of x86, which
allows to boot with both ACPI and DT at the same time, registered hook
will validate if reserved-memory region passed by DT is covered by E820
reserved region entry).

Signed-off-by: Grzegorz Jaszczyk <jaszczyk@google.com>
---
 drivers/of/of_reserved_mem.c | 14 ++++++++++++++
 include/linux/of_fdt.h       |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index ee2e31522d7e..bb66a019e3e2 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -27,6 +27,7 @@
 
 #include "of_private.h"
 
+static bool __initdata (*arch_is_region_reserved)(phys_addr_t base, phys_addr_t size);
 static struct reserved_mem reserved_mem_array[MAX_RESERVED_REGIONS] __initdata;
 static struct reserved_mem *reserved_mem __refdata = reserved_mem_array;
 static int total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
@@ -131,6 +132,13 @@ static void __init fdt_reserved_mem_save_node(unsigned long node, const char *un
 static int __init early_init_dt_reserve_memory(phys_addr_t base,
 					       phys_addr_t size, bool nomap)
 {
+	if (arch_is_region_reserved && !arch_is_region_reserved(base, size)) {
+		phys_addr_t end = base + size - 1;
+
+		pr_err("mem %pa-%pa not arch reserved\n", &base, &end);
+		return -EINVAL;
+	}
+
 	if (nomap) {
 		/*
 		 * If the memory is already reserved (by another region), we
@@ -146,6 +154,12 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
 	return memblock_reserve(base, size);
 }
 
+void __init early_init_set_rsv_region_verifier(bool (*is_mem_reserved)(phys_addr_t base,
+								       phys_addr_t size))
+{
+	arch_is_region_reserved = is_mem_reserved;
+}
+
 /*
  * __reserved_mem_reserve_reg() - reserve all memory described in 'reg' property
  */
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index b8d6c0c20876..c7769323e720 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -65,6 +65,8 @@ extern void early_init_dt_check_for_usable_mem_range(void);
 extern int early_init_dt_scan_chosen_stdout(void);
 extern void early_init_fdt_scan_reserved_mem(void);
 extern void early_init_fdt_reserve_self(void);
+extern void early_init_set_rsv_region_verifier(bool (*is_mem_reserved)(phys_addr_t base,
+								       phys_addr_t size));
 extern void early_init_dt_add_memory_arch(u64 base, u64 size);
 extern u64 dt_mem_next_cell(int s, const __be32 **cellp);
 
@@ -89,6 +91,8 @@ static inline void early_init_dt_check_for_usable_mem_range(void) {}
 static inline int early_init_dt_scan_chosen_stdout(void) { return -ENODEV; }
 static inline void early_init_fdt_scan_reserved_mem(void) {}
 static inline void early_init_fdt_reserve_self(void) {}
+static inline void early_init_set_rsv_region_verifier(bool (*is_mem_reserved)(phys_addr_t base,
+									      phys_addr_t size)) {};
 static inline const char *of_flat_dt_get_machine_name(void) { return NULL; }
 static inline void unflatten_device_tree(void) {}
 static inline void unflatten_and_copy_device_tree(void) {}
-- 
2.49.0.805.g082f7c87e0-goog

