Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E53225F796
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280825; cv=none; b=Zpv1WrcYj7Vrjlr/SWtVZS61IJj2L+Dj+3Bkqfjofh5hOa7t6dxDBRt+qQMqwGanIXw2EWmho2uR4kvoknR0RuiIh6gW3p/TTeep5k6kZsS9rqEQ6H5RwBtypZrl14LmHGyKgl9sa3SDNuxiHN+6t5Xbd1EJtbErDCUvTu7jqNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280825; c=relaxed/simple;
	bh=6vw8S+hRSfHG58xTdYdiW1jdjOvKcunLK33sm0BnbqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=By9oefoIA2EytX1zqCP49MZd5jcqIbI9od7t8BQkVTiJw5AVpwXoQCYpp13BOIVjJuH6acr5PGGx2sAf1zyoVL7ZiahZ/Rm7Y+bb55D1MTYzrU+kXZIJoP5lWnS7/vhp6ClzMMS5UTvy8sIraO6/C/iAJBwGh7c/Sdw/V9Y1BEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gNt6UfDy; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gNt6UfDy"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad8826c05f2so9025166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750280822; x=1750885622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbqg4sQN2SUi0pIFs2tbxpImkFY4E1U4v5hv/pAvM/4=;
        b=gNt6UfDy7NHwtOhOJMdMkgtYbSeu+ZcsDi9k+doxkxmZ2fw5BbO/Agu50zKwH/1EMt
         2vWAITdspoFVdN4nRWv+v59gKBs7k10WXzoD9ShWN8pOHdZA/gskO4V47jHca3PoIo2o
         UVQj2KRXszQ2GEfMYfbDdkDh1SpXiJP3Mtz5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280822; x=1750885622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbqg4sQN2SUi0pIFs2tbxpImkFY4E1U4v5hv/pAvM/4=;
        b=cDvbSKi609FebYvp08y5tykmf92sEpM9k21cIJZP4GSxmPL3A2EsTvGLhhrZ7Ke9ez
         8eI6EDvcUNxwgEIqtMniO701zErz1J+aGQnMSj1uclZTXiSfg5IOXEOnHOhDJHLqTV/Z
         eDDjlEGbx1RsmergyS4A1X3JvsjHG1CPWwlpd6R+H04JUBRuHktbrgnDWO/o2wWAi6ML
         FyOStpWsTVJrZW5cWLcVvHNvsNo1fJOa+XMXwWdksEG3yeV4m0H9nTLvvVl499xyUVh3
         f0G3/rQ+25v2mhhN3WvAADlMHfp8EGbBZldiKXM7IZGt0adtJ+nWMQwvTFItmAU4qiaT
         2zxw==
X-Forwarded-Encrypted: i=1; AJvYcCX5tU1h82hli9oIf9MJtPGTDiT82R/EZ6T8ZUj2g54TRJkZktHL20DE+pXK2UfXO8kiK/9c0QULaWeTiQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzehA+BTGcImAeGCeHPRK6cUSt/h07d8xEzhfqbWi1FtV4A8i+2
	Um1vYFrdvmp6+36571kV8hhSPtqrWd5b9sVmqB3WyMO8HWxstH5VYozbReR8ZdKjIQ==
X-Gm-Gg: ASbGnctH9n9dG9GFG/J8o/5lGrCZ+LaRsubAHO7Wt0CtP4Z9PQn58PbYwq07DkEDB/+
	iBkHen/0Gc54/QHo1ckU0Pv6kCl/3Kfb6TZ0+GOkaPzoIKVeCkEnF/o5JeIgC4Ao/xf9MPOhHIL
	EFXOZr0LXA1m7+uQyXiyjHpRf6zIi3BMED/TXD104oKvRZToqykMJr/SlgTg9vvNjSq0xLQoOrA
	98eZ8JAlx4Ym6o3lxUvl2V4Sx5ijxdz9CLxtkl9daQiQl4/6VGuSO+fjg4Y8ikQz5CD6xrAN+zo
	kwYzrvUGFgu5gkSB/MtEj5n8JQoj+GinZl1E7Rdk2XOAzSwMhYWyKO4m0corpUmNN27s55+u8dh
	km4IB9hfK32KsYLU63TybJcHw9OQwBBakJRkWQYkga3v98XMxwQ==
X-Google-Smtp-Source: AGHT+IFfkvcMfihIJ8Gbe3insvUnNmqpfP+23srMHE3chOr81sZdNldVfzxN25HYJnQdeMhg4V1HZg==
X-Received: by 2002:a17:907:dab:b0:ad8:9428:6a3c with SMTP id a640c23a62f3a-adfad31ccc4mr1816124266b.11.1750280822483;
        Wed, 18 Jun 2025 14:07:02 -0700 (PDT)
Received: from jaz-virt.c.googlers.com.com (104.112.91.34.bc.googleusercontent.com. [34.91.112.104])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec892b216sm1112822266b.135.2025.06.18.14.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 14:07:01 -0700 (PDT)
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
	vineethrp@google.com,
	rppt@kernel.org,
	agordeev@linux.ibm.com,
	dyoung@redhat.com,
	myrrhperiwinkle@qtmlabs.xyz,
	guoweikang.kernel@gmail.com,
	kirill.shutemov@linux.intel.com,
	akpm@linux-foundation.org,
	joel.granados@kernel.org,
	sourabhjain@linux.ibm.com
Subject: [PATCH v3 RESEND 1/2] x86/of: add support for reserved memory defined by DT
Date: Wed, 18 Jun 2025 21:06:27 +0000
Message-ID: <20250618210628.2635891-2-jaszczyk@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
In-Reply-To: <20250618210628.2635891-1-jaszczyk@chromium.org>
References: <20250618210628.2635891-1-jaszczyk@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Grzegorz Jaszczyk <jaszczyk@google.com>

The DT reserved-memory nodes can be present in DT as described in
Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml.
Similar to other architecture, which supports DT, there is a need to
create reserved memory regions for such nodes.

Additionally this patch changes the sequence and calls
x86_flattree_get_config earlier during memblock setup, just after e820
memblock setup, so the DT reserved-memory can be properly reflected in
the memblock before it is used for allocation.

Signed-off-by: Grzegorz Jaszczyk <jaszczyk@google.com>
---
 arch/x86/kernel/devicetree.c | 1 +
 arch/x86/kernel/setup.c      | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/devicetree.c b/arch/x86/kernel/devicetree.c
index dd8748c45529..f7db0e8f9c3e 100644
--- a/arch/x86/kernel/devicetree.c
+++ b/arch/x86/kernel/devicetree.c
@@ -307,6 +307,7 @@ void __init x86_flattree_get_config(void)
 		}
 
 		early_init_dt_verify(dt, __pa(dt));
+		early_init_fdt_scan_reserved_mem();
 	}
 
 	unflatten_and_copy_device_tree();
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index fb27be697128..1c6fcb0bc65e 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1069,6 +1069,8 @@ void __init setup_arch(char **cmdline_p)
 
 	e820__memblock_setup();
 
+	x86_flattree_get_config();
+
 	/*
 	 * Needs to run after memblock setup because it needs the physical
 	 * memory size.
@@ -1179,8 +1181,6 @@ void __init setup_arch(char **cmdline_p)
 	early_acpi_boot_init();
 	x86_init.mpparse.early_parse_smp_cfg();
 
-	x86_flattree_get_config();
-
 	initmem_init();
 	dma_contiguous_reserve(max_pfn_mapped << PAGE_SHIFT);
 
-- 
2.50.0.rc2.701.gf1e915cc24-goog

