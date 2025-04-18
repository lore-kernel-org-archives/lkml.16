Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A434275114
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744980489; cv=none; b=cgckMpQfMFnWAm+O2K9DSb3U0g7ZQMB9TV+0m0UaXL7PWeCrRrfQe94K9onpCyUGGn+8myaOzQCbJap/NuBvwtdT6lHKDDsg7cvEwM5VCD+g1bii6N7stGZMmzTlE5fe5auA6HrpeagGSQhfVeGKVagcYF5YBCYwx0zQr4Z+XFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744980489; c=relaxed/simple;
	bh=pV1rzCsr8FYCVhfWMYFrJeFTmf49atITKo8uKg1wnyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P+eNULktOtsnw3qtSIWGeHo4yHEfZbNqbrcfH0Py3g0ROvsBPQz9C3yC7onQWcoYeqkq5YIAqtHmIwpHp14ZBnSUqQVw2LNQqpkpFoCpUlg6udDysotPrrlWEuUktoIrJV/ZjJAI0RshkOlW82yCRY4Zjoh+31/z+20bIOadV7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dYboGRGQ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dYboGRGQ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso283340966b.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744980485; x=1745585285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XNN0Tem4xu6RZArPHYvTvbcnQvUc79+UNyXgXNy6Cc=;
        b=dYboGRGQLK/iphKt7or08i312U/MdrGDeftywb+tVOJQpvcy/mUsyvNaMOBOTJppEO
         3UsCcvCYjQCsbNfWO0txdRxeXTJO1SluqgTWXoANT74n+IKwn2+GX3jRx7JQLelr2m/0
         wzJJHAhVLCYEI066TNZ7Yym3ABAt49RqxsGtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980485; x=1745585285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XNN0Tem4xu6RZArPHYvTvbcnQvUc79+UNyXgXNy6Cc=;
        b=rjvLVbOjr9ZlEVk3bqHwOvohRF2hd1Blkmk5GwmhQdZ1mQ4Pd22D7852PcisJvvl47
         B4/RzXFX7HVVtW7EtIimvzAEgGrSoLVpahy8Ph0joq6RBuz4S04uIxf4wGN3/9/PvfB8
         MkaxRS/6kd5+gReoQyzhO6GwvbrMsSq0CJxxtY5rMFa279bKd/5atbpZJdkgf0WI0Lje
         ooDvUHOe20yvSKK8PQ5BUPTOPKFAJvEtFJRfkgNFpPcQ+DnNEJJuPstm7WdP/BZQDhvX
         BIrF08DoEC8MmL1DJvRMfkqI35Rc4Z+2sS9jzE5A1IUwJMK+0MWs1sPdzP02fLLbC7dS
         YvWg==
X-Forwarded-Encrypted: i=1; AJvYcCW5Z1GvWwica0lg8TurJm99/0UBhsi/clq/pX/gcbCm7IJ7COwAFminxOiAFgTpA9HffIKuqXmgLd6PScM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKhON+w3QnQ2cb34iIJPv81AycLGr1XXEW7HMNbA55n+3jWfMg
	3O/gJYpAIjOdcn2aZKQaU65zrkQHWabPG30gsnXtoJtIjZ82q81/ikPesCipsQ==
X-Gm-Gg: ASbGncunDKIsgKN9yrtofQ4kQ6Z/Oz9TqtYIxB3P24GJzRoy9i8idNLl4/fkWKTigaG
	UBUrzoc+1ae9jQ5bSwTeC0oajA6SD0ZvU4926Yen8VpfiMTfptJci7BOXBGemoqcXvQC1OKW7lh
	BTRfvEXJJei/f2XUVdWtT8Mv6igjYFtlBcccYH8mK2d2XLIhQ9kkI9qsG6v3sqpPwFo0K6sv14s
	Z9W2vqlIcQVwaYN2qQjW6YS9x4qpAc9AhxwOXAxFtvpiEZK3UPV0ZEzGU4KX5S8mjnWFDeSc6N5
	qsg0AFm7A3RbxEpBw9jdWpqWBodZIHBQifs1SYPtr52uNVuHp7oOzA+Tivxt7bsPUBdMXv9tIoG
	GQwZfr2nqJxXTyEpFTeZodwTDnwCNMAZeTw==
X-Google-Smtp-Source: AGHT+IG6P9eJLmL9+eikfNPnUZ7wxWv+V7OiUcpJHJFZyEg5TP66XxZUXXNNSx/PygO5dYxQPBqHMg==
X-Received: by 2002:a17:907:3d8a:b0:ac7:150e:8013 with SMTP id a640c23a62f3a-acb74b1ce20mr256181666b.15.1744980484716;
        Fri, 18 Apr 2025 05:48:04 -0700 (PDT)
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
Subject: [PATCH v2 2/2] x86/of: add support for reserved memory defined by DT
Date: Fri, 18 Apr 2025 12:47:18 +0000
Message-ID: <20250418124718.1009563-3-jaszczyk@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250418124718.1009563-1-jaszczyk@chromium.org>
References: <20250418124718.1009563-1-jaszczyk@chromium.org>
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
 arch/x86/kernel/devicetree.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/kernel/devicetree.c b/arch/x86/kernel/devicetree.c
index dd8748c45529..9a93eddfcedb 100644
--- a/arch/x86/kernel/devicetree.c
+++ b/arch/x86/kernel/devicetree.c
@@ -18,6 +18,7 @@
 #include <linux/of_pci.h>
 #include <linux/initrd.h>
 
+#include <asm/e820/api.h>
 #include <asm/irqdomain.h>
 #include <asm/hpet.h>
 #include <asm/apic.h>
@@ -289,6 +290,11 @@ static void __init x86_dtb_parse_smp_config(void)
 	dtb_apic_setup();
 }
 
+static bool __init x86_is_region_reserved(phys_addr_t base, phys_addr_t size)
+{
+	return e820__mapped_all(base, base + size, E820_TYPE_RESERVED);
+}
+
 void __init x86_flattree_get_config(void)
 {
 #ifdef CONFIG_OF_EARLY_FLATTREE
@@ -307,6 +313,9 @@ void __init x86_flattree_get_config(void)
 		}
 
 		early_init_dt_verify(dt, __pa(dt));
+
+		early_init_set_rsv_region_verifier(x86_is_region_reserved);
+		early_init_fdt_scan_reserved_mem();
 	}
 
 	unflatten_and_copy_device_tree();
-- 
2.49.0.805.g082f7c87e0-goog

