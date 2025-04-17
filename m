Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CE7211460
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744928408; cv=none; b=j7ryEfVyroNo/aibw86tCQVzUXDqxNMtPb18zV3WMXyKhvaTPklhJ7DeFIfUTr/0vUAmLyJzAKtbWbaDPyTRcqgeKgH6qsLDZNiI7DuiKvQ9U5By+0phQeYkPGHBk7skooP3pOgAOMbcgsriP43MFo6wp6rb++F0IYvjWJYIdTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744928408; c=relaxed/simple;
	bh=kNIEV7w0Jrsu8SijviBsschYErqLmr5QPzJ2rxSKeMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bm2HxC5qfVAjtqoDaXkwK+cOYp9hUiiQgbwJeIn+nuATAcDB1RORhKevC6lYCsInni3W6r7o147vtstaM65COLsFDETUDLjCVShntmqto2b3lFrCmAbbf+GuYs15zdo1MW1YPty2rARlxgxfWPwz32sLp/aaT1JNAXxd/Pkdrqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hT66Nxjh; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hT66Nxjh"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so1616717a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744928404; x=1745533204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocHmrHTnEglicCcfURc0OBBLsngl7+N4WxjTCwBZAnk=;
        b=hT66NxjhCHfKXz+XetYfy1MdyHjwPl4lSYFKzj1FTOVxaP3HIHWUgVsokr9DJtUHd8
         twPcVdjOMMFYjDuTsi/lxRuc5TaikmHkzuUpzqiObejKQTkkOO52HunKeUWX0xhrHLyw
         hai+btZbtWNB84qV++dsKZhZseA/v2ewth9nE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744928404; x=1745533204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocHmrHTnEglicCcfURc0OBBLsngl7+N4WxjTCwBZAnk=;
        b=L9doEO8ltT1noA7YsUe1rUgzvXkDvp5XaNsXqsTyRVAOnySD68GqBa2SmZOtpvJWnd
         eutLhGqB5ryCTphkOhAGKwQEZg8aFgC0/fAJYUD7BuDPfiS/xdsVBcJEY0QAMMGezZcn
         nMg52SW/J/SZ5b67IoE/vPidZjB09gDkvLXq+OkYOxjlgEypPqWBBWFPrpXCZHflrLF/
         DvlmqU6V6SgCwKtv3qkLQp3M7ztPnw3O2PKk517HY4nl9LFGJOXUY5FykYTentZ8vk2A
         +cGkh5XL+FcLZj46T6r4amfULhdSKbzOOgBjxD6ylL4uao0sN0HCwrj3JFGbn2iLWoeG
         9tAA==
X-Forwarded-Encrypted: i=1; AJvYcCVgL64oB5edaHbZhtnlyBunBsh/u1PzcpHeWEjn5CW+6PYg7O0YFLtLclWHm15iDFPFKBjFfz68xtA4+pI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK1Fp0b8JxNH3D9+bMX3Rfx03Xrqohzwt9g4aUVBbUiIvl6UiM
	q8vJsS3/OAtIj5LdE8jV9lrr+RS3T5bAkDzuODgMNSHQXQlpQG4YslFRIG7slQ==
X-Gm-Gg: ASbGncv8BkEako0PUs9PGyqxXO7+2qcxfk8jmXc9bCT8CG8VBRA7fbVgZPVfL9MxI3w
	11fhw6xO2gXblUjq9bNE8VEVc7wEQu60+M00j4R516lPJG49UdBK3Sk/GTbq/w9l9XWLPAQ/QgT
	Y27b1SA67Qp+zFYMDwNK0GW0KGkZp8n5HmG0Engi2RHksRTSfwngk5/xnSkOM1YtasrFC/HuheN
	1+GPUmTjDN6Xb3sW5DiaFasjF8fYuAAbDHnkIRhNbawOGj21zEOtyKJn09fF3Q6apbT9Sr4XOKL
	APPs7t2OFCtnIZwQ6mQzEIl7bgpQmOKZCcnVNIvDq4nRAlwiGPNKEEKGq16MqC5v9ksFgM8rw4b
	SlXf0GA9AfmFfF/cIL6KGpn8=
X-Google-Smtp-Source: AGHT+IEoyj6sXrhWuqgG5kT0lHjI20HNFjGrtb86BA/kJMJKRg3XJWkjKxjGSHD1vNaLeMyjaImFnQ==
X-Received: by 2002:a17:907:2d0b:b0:ac2:cae8:e153 with SMTP id a640c23a62f3a-acb74aa9af0mr47222266b.4.1744928404512;
        Thu, 17 Apr 2025 15:20:04 -0700 (PDT)
Received: from jaz-virt.c.googlers.com.com (8.236.90.34.bc.googleusercontent.com. [34.90.236.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0c068sm45725066b.11.2025.04.17.15.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:20:03 -0700 (PDT)
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
Subject: [PATCH 2/2] x86/of: add support for reserved memory defined by DT
Date: Thu, 17 Apr 2025 22:19:38 +0000
Message-ID: <20250417221938.579452-3-jaszczyk@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250417221938.579452-1-jaszczyk@chromium.org>
References: <20250417221938.579452-1-jaszczyk@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Grzegorz Jaszczyk <jaszczyk@google.com>

The DT reserved-memory nodes can be present in DT as described in
Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml.
Similar to other architecture, which supports DT, there is a need to
create reserved memory regions for such nodes.

Additionally, the x86 architecture builds its memory map based on E820
description passed by bootloader and not on DT. Since x86 already has
some DT support and allows booting with both ACPI and DT at the same
time, let's register an arch specific hook which will validate if a
reserved-memory region passed by DT is valid (covered by E820 reserved
region entry).

Without this check, the reserved memory from DT could be successfully
registered, even though such a region could conflict with e820
description e.g. it could be described as E820_RAM and could be already
used at early x86 boot stage for memblock initialization (which happens
before DT parsing).

Co-developed-by: Bartłomiej Grzesik <bgrzesik@google.com>
Signed-off-by: Bartłomiej Grzesik <bgrzesik@google.com>
Signed-off-by: Grzegorz Jaszczyk <jaszczyk@google.com>
---
 arch/x86/kernel/devicetree.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/x86/kernel/devicetree.c b/arch/x86/kernel/devicetree.c
index dd8748c45529..0c2b95300c6a 100644
--- a/arch/x86/kernel/devicetree.c
+++ b/arch/x86/kernel/devicetree.c
@@ -18,6 +18,7 @@
 #include <linux/of_pci.h>
 #include <linux/initrd.h>
 
+#include <asm/e820/api.h>
 #include <asm/irqdomain.h>
 #include <asm/hpet.h>
 #include <asm/apic.h>
@@ -289,6 +290,14 @@ static void __init x86_dtb_parse_smp_config(void)
 	dtb_apic_setup();
 }
 
+static bool __init x86_is_region_reserved(phys_addr_t base, phys_addr_t size)
+{
+	if (!e820__mapped_all(base, base + size - 1, E820_TYPE_RESERVED))
+		return false;
+
+	return true;
+}
+
 void __init x86_flattree_get_config(void)
 {
 #ifdef CONFIG_OF_EARLY_FLATTREE
@@ -307,6 +316,9 @@ void __init x86_flattree_get_config(void)
 		}
 
 		early_init_dt_verify(dt, __pa(dt));
+
+		early_init_set_rsv_region_verifier(x86_is_region_reserved);
+		early_init_fdt_scan_reserved_mem();
 	}
 
 	unflatten_and_copy_device_tree();
-- 
2.49.0.805.g082f7c87e0-goog

