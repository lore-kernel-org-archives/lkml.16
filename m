Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDAE1C683
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744980487; cv=none; b=M8vKqRxDCURXikHio5MYFKJGlU7muiBtdMK/OoC2iUfFLTCxjYusblKBaoRiDGmePKEHOTUwVuvxl6npzm7uA+4xwkASpbc37H6NpYALDfBODOgsda+4kHg3JgpqMxnK3lFYglRe2FYJMrQs12rvOwNAg2E7qa+ZDXm/9Qc24KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744980487; c=relaxed/simple;
	bh=/D7x1nz2cdiZi5+XsXslM7WDAReNSYQ/NH0dZIP1JXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ejUfjKvspbjf0WhavuwjebhK0ZCdkC8zGsdWSzleoLZ0Uuh7pj5QVXERweu+eE4qEAdo46tsIBkvWn9QRH0oKGhIUYzDnKeQPBhbusJWOu5iQ77XZX9PrhsSPet6qrgsikFyVKIMNVB1KNJD7G4U5uHRgIRXk9mFcHn0pjLNzZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FzjX4mqM; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FzjX4mqM"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac7bd86f637so555629166b.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744980483; x=1745585283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vODMw6796TMuk6ZLxaXIS17nQiEjdxi5Z2/Gqr9wluk=;
        b=FzjX4mqMW4YcqFq5ENl2vjGqb9K48GSEHE0mxSnEjGQFXjdiYtxQY88/iwZADUdcjK
         dwVRS1p+0KoBZh0824Bz0BgSiCcGdT6h7Dt5vbK71WGbb0T0uIxizmx6bWtv/Nhn/ICv
         AedKWFVI2RV42aEpgi0fwENC+ml62oCh7XZDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980483; x=1745585283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vODMw6796TMuk6ZLxaXIS17nQiEjdxi5Z2/Gqr9wluk=;
        b=xQ2oXeQHTOj5JGeRwrmzT9eSajLlbqvDl1rnztRzDziAgXuT/OGKOF4JQsLeuYmwVg
         +r7lP6zddKDHkZt5e3OHeXRCC/V/aTVi04L+2cnzjdxuPo0iEvjDl/wyd0Qh/awDJxTp
         O805HtjoY3gcPqULC3qndzkDH0MxmbU5Kh2xyfEEFeWAXOBBejZs9OJpFNGF6XdzL1Vg
         3ya39qQvoUvhb2rZFgOfPokURv4WBjjhhc0v1R/pHHFiswrjstROaiTjTw2NjoLC+O6j
         qQKZVs4Nwa6C3ScNId+yJj5/kPAAUT+55M6+NnPklBMcujt+PWT+CoYGOddleWifNO/f
         hk1g==
X-Forwarded-Encrypted: i=1; AJvYcCWosUgXkCb3TxokaJI5D06Gzf0xJjxJN4467vdUEMmK1+tQI2Jcvg6cj1k/k5qnhic4pZKuPXQcT6QGB3k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfsw5aH4XGdtW5M5WkTKCVOi/vGcGNRNwv6UI70KyR1Mm16TfV
	M8eK2GgIzDq4FwcnVZFZVMleIy/VnQRfHc7kipUGj/669RPmVpDEtQi+Li6RLQ==
X-Gm-Gg: ASbGncsYzO8Xw8dBFJDWaIY1tN7XrpOEuNezonfeFAYmEn+q8wTP5gD2r/S8vBEmaJP
	rYMkgu2GPaO+5YYf26qQmLtEBcx9w25jpIcl5o37g4sU3Bota4rPmLGCI16YQ6sN7axehwPxwSb
	/HFnS+m/s1bcaQtIshcUkcWWv1OH/pC7f//UcBnv58cS6CLcKF9yIuZZcRxcJp7zxLi1t2y3+nx
	TLPcUq+wNtY834IbaGBQ0e5BKDMoe5JspLoRN5uyonOuPhXje3ZXPDBzb6johGXfaH0isX0bdVA
	U8PBAmSx1NHdxELhq86ctw2mUZ1ES1WZ3UjVzqaVetpF1F+Ezr0l9quBtdLB8ntf/E87HTNMygZ
	Z54eK1MHQu4FIknanuuncPmg=
X-Google-Smtp-Source: AGHT+IH7dOeXgGMo/ypKtvySuJE18lPbl1UPYUQepb9qm6GK3LEheefDfsh+h1DMQJ9qmS64YVftaA==
X-Received: by 2002:a17:906:794e:b0:ac2:26a6:febf with SMTP id a640c23a62f3a-acb6ee241femr245870466b.20.1744980483399;
        Fri, 18 Apr 2025 05:48:03 -0700 (PDT)
Received: from jaz-virt.c.googlers.com.com (8.236.90.34.bc.googleusercontent.com. [34.90.236.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec51601sm117445166b.74.2025.04.18.05.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:48:03 -0700 (PDT)
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
Subject: [PATCH v2 1/2] of: fdt: allow to register arch specific hook validating reserved region
Date: Fri, 18 Apr 2025 12:47:17 +0000
Message-ID: <20250418124718.1009563-2-jaszczyk@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250418124718.1009563-1-jaszczyk@chromium.org>
References: <20250418124718.1009563-1-jaszczyk@chromium.org>
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

