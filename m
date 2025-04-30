Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9D121ABC6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002543; cv=none; b=KKG19IW7bT0WGiOoV/iCXJdsH4JAvPzELDeOZZJwtRZnjmixgkxXXICZLK/6EfLfdsUhsymJBAKyzVPh7/Bp+MGgYULT+env0tyFHvaTcLZF9EWEeM2MTpqWdE4ohcGo25npRvTu+4ul87S/AN3ji9i+1up0sQQN6GZYnrNGZf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002543; c=relaxed/simple;
	bh=lrOuAr7//CsCE16uws5U23OQFFSQw7lF11vTqjRDSzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IYe4WgjwEQ1vMuHfMTD7S/VE1PIH43uafgFgT+dogzwO6lgYAVsMYNL/6zWeB25yQO9It6sSYeOWXXUVrCwnzHSZZhCUkQuecSCU8w2Xai4rGwWXgB6X35wQAyLVz4E1OxtjHdVdpatV8hqj1/ahacRfUzMEwVqKYiJpT9RfvDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i/JkN+D6; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i/JkN+D6"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f6222c6c4cso10833969a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746002539; x=1746607339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUfMAZkI61yB2821Vq79bnRbndqVmGSRfkgPEIOM8kc=;
        b=i/JkN+D63ROIBA6DJGutGsEMbrWDOAAdpL8odZ0nniSdmuwRLzVN6X/WIz+p0hdRQV
         V/iohUXWjVN98kJblpSPnwI5ldVsTPa/UBBTbCzPoYnrUzmZIomfHquwGH7DcLgwgQ6g
         n7iz0zGqhxnlHjoSX78xbG4SYyPgQ9UEtaAyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746002539; x=1746607339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUfMAZkI61yB2821Vq79bnRbndqVmGSRfkgPEIOM8kc=;
        b=qLwv/hKnXTTom5Crhx3EXjR3HSqbws1TIThVaWidOvIn4leP29n1AerwQzsHjGijjf
         Kcevbu43bsDKLXnudpIx1GhBYVYjQgu/kP+9e3J7wh8aUZvvDzceIPuh6bx+ezpPWmeE
         vxoHeaYkLTpaemwcpkihcrZlS0F/NadCWA5p6c3KtwkdweK/a4Fwd9UE9ZFjO+20aLgw
         L75mzl1AbF8PMXoygC3kzORsrqNd0k88BBS9CpscXjeb4qSFZ8mSgCyLipviNRh6S+LI
         N35ywagOGnr67uvbXnPrpgFtVcHgEiHUppO8UGTTkm7eTPyxP1O4AJV+L89Nn9BnWHyl
         cmhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkJQQ4V2z9xWGQDxg3lOLIUuJUMEmnYZtD93+sKRuvYiGLK9a2Lh1sULv/YEAx/Pp68EmUUQBQuZ4Xvwk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3CR6GlTVL6REeeMpzBxerVK8InH8HGYst1PeK9ckNMo2qMwgN
	IYesX16rpnhGCVunyjDAc89HsGnwBHfFr66MutG/99o5lUlfpLjlQN0IrCGT2Q==
X-Gm-Gg: ASbGnct+bQRXeR1NuUNWMHMmWu5VC7e8fwiQosYoN9Fw3+zJoIB9M3vDVMm+s8X2go7
	uL6d1U31zgOQsBVMcTKhGhz9sbQ+cXHtOETsEcEG9jtncyCzlOf7LA+3qTEk90dXUJGUjWUtcjz
	31aTuXtEq9csK1Ov+IHQz1fZfOg9RbAJTfsyUE0UWD/MWiIKuc2hEKtKkaB1CfcfJ6H3qeUpiQd
	QdVB5f0KKhkdalhacVEsSeLezOpguK0n4CwyXm/EtS0cydHj46pmezxBXqdVuCWB4KIIjkRjfA3
	arNqKiMGiixzm23y0PIZkLYxV8+WPNoWkh3vU1FS5D+lyIEkDbT9y+2W/LYR4wz1I9uxUvnqcg0
	T38HqsbBscrzDBcGupDXO9m0RCA==
X-Google-Smtp-Source: AGHT+IE2tUm9vY4g6n13IEUjGDpcQXgLL2IoWAKbWzvId5UL7O470kgqnETeVgxpGEkAr3echu2a4w==
X-Received: by 2002:a05:6402:2707:b0:5f6:23d2:e6f7 with SMTP id 4fb4d7f45d1cf-5f89c10be57mr1961159a12.32.1746002539605;
        Wed, 30 Apr 2025 01:42:19 -0700 (PDT)
Received: from jaz-virt.c.googlers.com.com (23.31.204.35.bc.googleusercontent.com. [35.204.31.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f5342sm8351783a12.35.2025.04.30.01.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:42:19 -0700 (PDT)
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
Subject: [PATCH v3 1/2] x86/of: add support for reserved memory defined by DT
Date: Wed, 30 Apr 2025 08:41:37 +0000
Message-ID: <20250430084138.2287031-2-jaszczyk@chromium.org>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
In-Reply-To: <20250430084138.2287031-1-jaszczyk@chromium.org>
References: <20250430084138.2287031-1-jaszczyk@chromium.org>
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
index 9d2a13b37833..6f4eddc11560 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1047,6 +1047,8 @@ void __init setup_arch(char **cmdline_p)
 
 	e820__memblock_setup();
 
+	x86_flattree_get_config();
+
 	/*
 	 * Needs to run after memblock setup because it needs the physical
 	 * memory size.
@@ -1157,8 +1159,6 @@ void __init setup_arch(char **cmdline_p)
 	early_acpi_boot_init();
 	x86_init.mpparse.early_parse_smp_cfg();
 
-	x86_flattree_get_config();
-
 	initmem_init();
 	dma_contiguous_reserve(max_pfn_mapped << PAGE_SHIFT);
 
-- 
2.49.0.901.g37484f566f-goog

