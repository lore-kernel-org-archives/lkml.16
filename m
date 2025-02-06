Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0EA24634C
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738848022; cv=none; b=BGVzAKEFHq6FHDWg1qtMaeKmEnLatocLFjdZk4y2hmKW9nB7KSuT8hQjxUqmU76rDvCqkvn2JLuiw6v63cW3r43FGVFjCPc0WCKo8RDgR7jfgpoZsQJ2IHy8E8ujkha2IDcPoYmGzrXWy+K0tsSxHDKA3h9Fw6w+VcItlIA/WnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738848022; c=relaxed/simple;
	bh=CyIeWg1B56bF5Vmqh8TDQAwEQXNhWeXPgR5Lr1nU1/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qikk0za1uVVq0mEMwB151vtEl1WhOx5Uvuzwb04Zmr+8JUAOk1DWtAEKVxzR63JZ8y9VjROAf+nadWaVd6g1TyfTdsUzZ0A2LHBiHVBwUGXKXcsr3nw8v7L1WhebLc9kXtd17vR//zP3W+tsXcFnrDkt5q3rSqsiXBvU6kV0BmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=eg+qu9yA; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="eg+qu9yA"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21ddab8800bso12863365ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 05:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738848020; x=1739452820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrDRN4Xst5SkS3JM77fVw4KRP+DFTnf94c/mEjZvbjk=;
        b=eg+qu9yAsAzJDEX9+JXlClGz1m7Gc05X5dBgSrNoglXdhWf2AVqQFP0xHR0sSRC0DY
         3uUJjDrUJIVAFHXQkZaRXBtN83yv5nwvjZpsUrqsBVux+NCgUi15YWhJpeEfjtTqEB8o
         lAhUk+zY8Pm72KMizOEozBuNLpIwZQNR/GVNK5sysCWnbnDcEFJpO8NNLxpVoP8Qow/I
         m/5AegbmL63tr+Qpml4TBAMmKIBahd56/nNY40Qc5NH2/UV4zgcrRSfBZIJPE0snYbjo
         yxFEcD+pOaJlHM1cH0J7KDWegyDr0Yd4ODq2lJeF7w8Jq/Cl5BA4X+Ljm4DQFYKQbtJe
         LRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738848020; x=1739452820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrDRN4Xst5SkS3JM77fVw4KRP+DFTnf94c/mEjZvbjk=;
        b=tlCGntzAWMjM2U4UTz+9F7sBsK6PUmCFtrayHy+5ygpvzFyD5f04TLxKFnJIGw39Yb
         8/RmLU8FS1/5cxGNo0izDz7NXkCEKidcc9kD9oyU2qupLHnXi83Jcf1fbZDUUJB7CJnL
         a80gmyzliyURO23jZcWxFFjWsR8JvZumwkhdcTH78H38edB/xKCtg39LUSLrxhBj1Iw7
         uinfwW51XBWu2mK6DgR+7ufbbQ5TcH86hAH7ai7EnXdlhqxkAOB+mIHGWRO9LZ5Pka0H
         9Dzqi4HGQYMli4bLX9WQG8AGQ25v+ANMZ7O4pPT3cU2/3ZmlIZYyKMu/ctrZlW1BW835
         CRvg==
X-Forwarded-Encrypted: i=1; AJvYcCXqv2MhWT3RBc3KGJiFQ+7MSUqkVLIPKg8GmkYN+e3BKOrlxvU86P/celyGFNFPrCVGKAwNXF+am5gWycQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn7PlLDJdG3kfvgzSfd2OQRX9Eo1D57WYAT20qJc+hZWu8QG0S
	koSboJ86OG9a7CwT4Cy6EWAwvIGuM404+5NGKZG8YsbRAdaRh+AfjG4ms1f+vu8/4WYhQU0Zbrv
	b
X-Gm-Gg: ASbGnctpFh5DMTaHUxS4mSwmJgefTIRNjeOJPIuuEmwDv4libDXATxHf3BXeVQZMboN
	Y2ukrAYHJR2Ulkp9KLqO72PKcS/W+mCRBCKh+TV5wGroBh/iJ6/OL9mQ9b6HZlQHcf3sQLM9Qle
	o+zXUQJus4BbM+WEJgBoNkSopARZPIi6TGzWAhsLfygs03wtUhXPxVt0mSbr1dTsvOSV9HZ56jM
	Dp3I7Y94ez1NuJJqZB+RBpUNOKDMRn4XhQZ862Y7/XwQPagDBJDRf8HszZKCnopJQT2SKLjF+Jd
	iKlZ8YBf44TrtFGr6A==
X-Google-Smtp-Source: AGHT+IFoKcEdPqNHWZEzdZAOUsizoappgIzPDtN89x/XcnGf3N+z1xzF2ftk+OYeq3D0U9lyU9Xq3Q==
X-Received: by 2002:a17:903:2406:b0:215:8dd3:536a with SMTP id d9443c01a7336-21f17e2a49fmr111715285ad.4.1738848019982;
        Thu, 06 Feb 2025 05:20:19 -0800 (PST)
Received: from L4CR4519N7.bytedance.net ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d987sm12170775ad.120.2025.02.06.05.20.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 06 Feb 2025 05:20:19 -0800 (PST)
From: Rui Qi <qirui.001@bytedance.com>
X-Google-Original-From: Rui Qi
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	haibo1.xu@intel.com,
	guohanjun@huawei.com,
	sunilvl@ventanamicro.com,
	samuel.holland@sifive.com,
	parri.andrea@gmail.com,
	ericchancf@google.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Rui Qi <qirui.001@bytedance.com>
Subject: [RFC 4/5] RISC-V: ACPI: define arch_apei_get_mem_attribute
Date: Thu,  6 Feb 2025 21:19:25 +0800
Message-Id: <20250206131926.91289-5-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250206131926.91289-1-qirui.001@bytedance.com>
References: <20250206131926.91289-1-qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rui Qi <qirui.001@bytedance.com>

we need arch_apei_get_mem_attribute to get protection bits
for a given physical address. These protection
bits are then used to map the physical address.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/include/asm/acpi.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 6e13695120bc..c35dd4e5a84d 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -90,6 +90,24 @@ static inline void acpi_get_cbo_block_size(struct acpi_table_header *table,
 
 #endif /* CONFIG_ACPI */
 
+#ifdef CONFIG_ACPI_APEI
+/*
+ * acpi_disable_cmcff is used in drivers/acpi/apei/hest.c for disabling
+ * IA-32 Architecture Corrected Machine Check (CMC) Firmware-First mode
+ * with a kernel command line parameter "acpi=nocmcoff". But we don't
+ * have this IA-32 specific feature on RISC-V, this definition is only
+ * for compatibility.
+ */
+#define acpi_disable_cmcff 1
+static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr)
+{
+	return PAGE_KERNEL_IO;
+}
+
+#else
+#define acpi_disable_cmcff 0
+#endif
+
 #ifdef CONFIG_ACPI_NUMA
 void acpi_map_cpus_to_nodes(void);
 #else
-- 
2.20.1

