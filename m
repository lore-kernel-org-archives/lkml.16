Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27700227586
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643537; cv=none; b=XCZ8T1sS3b9YDVkKRbKSY41P6B50A4YMaSl7NTZo0MNanwA/NCL2Lq3eY5uLqxJH46OYF90/MWMaaUpA0yYSWQVCCAFIzYSCEH3pMBwHolJpl/WDSl3CGdefeCMafL2Mq8/t+UlfMiPL0rZBfHb4jF6zYjMWWeRGbc2OInB5uQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643537; c=relaxed/simple;
	bh=Rn0ct3v4rW64OlY7++1Oc0LAQJA4hk8QYtJnzRwiqYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8ZmgEvT9ciBK8wE+FO59wPTamrjfyNO5MQ7OjBAMVfSblXSINdSryEt15iTe32klzxa58girJ4XYasIEfCGdHFirsW2Ge6x7FedQ8bm3hBMn3bs6F+TEin1stG+M+pMlo1bApkRxHWvtqgrAlZFC41QhfDgUfIIBugDaE14q18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=XKplBOaS; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="XKplBOaS"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so889801b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751643535; x=1752248335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zp7uD1poiW059gGzU86bprSx2F9Pa7gwCpaEXnEz8mU=;
        b=XKplBOaS/yFxMLewba2WgLZRhA28fFSfp/Cz1I0tX4/V8i9WD5lAZFUm6NSfibK/vl
         cuKtkCI3jPoB5fyWv5IrrVAq/E8mdm8JUePNmkUWaWuWNgn6YLdUBqzalHNfXFSToidP
         tHuD29KyUqBNGvVdBzlBvYqKDUp+cizBFOpp3IC2gILwCsrebgJ2SsJt08lvALwlBMMQ
         Z8fTm4PXJbRQguN6hSycHgtso2i7yPMbP9zBojdC4wgCK4gPiXAyKV42XeHCOQj1nglp
         AlZG1h6iClAchU01oE29eYm2E4traB2CvcK0MleKdRq2JSBmedX3zryOJMwH+HpMgCnz
         /yRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643535; x=1752248335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zp7uD1poiW059gGzU86bprSx2F9Pa7gwCpaEXnEz8mU=;
        b=IOKkq7Xd5WzpD37/Uz9jfLMBJfZgNltoX830b5TIoQwxyFHQwkgFefYyeS8TkJG+oD
         bqvqEJ0Q/xf43I3oMqxTzS6JY8qFDwzcruCh+mxStknEoZjPPwmlMEvtuFIZYXLwl9af
         4PuQLegUqrmp+E65JRSoQI36NhyKEVu/u1in+ZwvSn2kLhfoj2SVPZy/lx/TpoALfE/Z
         BuW/VCrcxDWIl3aTv5LcHYklbGV7Dtor6Dn/+TKVMa6YJQ9n9RNsYL+vXU6wtgVBy/IK
         ELTH9bZrozYfdg6FgsQYZte+m7FG93SkPaohZjXnSz2m4+nyb+vfc3fFR6EfrWrSPSgK
         fO3w==
X-Forwarded-Encrypted: i=1; AJvYcCVS3c2qH0IJFKfkwN0UOqNl76iSTZ5/dCbiVxiNBT4UOTDcQE4g2xJOqnYmi53IM6KPL9nWXSUx8yfqd3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpL3RXxQweN24KEXfjtZoZ7PPGfKkTK6FEZvyA0mwpZAbhMAjI
	cE7nsq+UG6aCE7MF6jGiEP7UdsPZPjHdzL3Ym9eP8O0/gjiBi4Mkf4GiHJuX8lSIO2c=
X-Gm-Gg: ASbGncsW7Aequ3J9VZSM/2apVIpLXVDoTjwIAk5GdHmHTPuEjOGfTq4nBZhQ8espSQ7
	KrcE0GVQ52NYDgRbB3UHptN2O/V9uytPpn5M9ayle/XuMeLtYMFKqyzy2QfdmL8rTyp6vO1FnZ2
	7nP/bhYKxTR2zkZrQcRotVX8j7yFc/Pu/2S0I8+gEzI7kKsVgYPkA7q7AmYTEYzpOKEIuCs9/IO
	u6ZkW5aYeZcYoJ9clT5DGuB40K3hRhz4mK5JPUqaWUNV5s77BIzj297DiNK8wZa3RkR80hn5aIn
	2pa3Zf+c4WXp0G6QrFvKdHGwDBZ4BRyUsvaq65NvB0nx1YYCbjpzKinl65vOhk3q5TQfH9MkJ5G
	ChnRje+a4+5PONSUPibI=
X-Google-Smtp-Source: AGHT+IGIXVrx9PSDrG3EEvpjwpw1PdozZsTf2OUe+pqrmlHyZJisYpgboZx4tCy5PCWnKNZpHdxUDw==
X-Received: by 2002:a05:6a20:a11d:b0:220:3804:f3d6 with SMTP id adf61e73a8af0-22595173066mr5303101637.2.1751643535243;
        Fri, 04 Jul 2025 08:38:55 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee63003bsm2084818a12.62.2025.07.04.08.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:38:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/2] RISC-V: KVM: Disable vstimecmp before exiting to user-space
Date: Fri,  4 Jul 2025 21:08:37 +0530
Message-ID: <20250704153838.6575-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704153838.6575-1-apatel@ventanamicro.com>
References: <20250704153838.6575-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If VS-timer expires when no VCPU running on a host CPU then WFI
executed by such host CPU will be effective NOP resulting in no
power savings. This is as-per RISC-V Privileged specificaiton
which says: "WFI is also required to resume execution for locally
enabled interrupts pending at any privilege level, regardless of
the global interrupt enable at each privilege level."

To address the above issue, vstimecmp CSR must be set to -1UL over
here when VCPU is scheduled-out or exits to user space.

Fixes: 8f5cb44b1bae ("RISC-V: KVM: Support sstc extension")
Fixes: cea8896bd936 ("RISC-V: KVM: Fix kvm_riscv_vcpu_timer_pending() for Sstc")
Reported-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Closes: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2112578
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_timer.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index ff672fa71fcc..85a7262115e1 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -345,8 +345,24 @@ void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
 	/*
 	 * The vstimecmp CSRs are saved by kvm_riscv_vcpu_timer_sync()
 	 * upon every VM exit so no need to save here.
+	 *
+	 * If VS-timer expires when no VCPU running on a host CPU then
+	 * WFI executed by such host CPU will be effective NOP resulting
+	 * in no power savings. This is because as-per RISC-V Privileged
+	 * specificaiton: "WFI is also required to resume execution for
+	 * locally enabled interrupts pending at any privilege level,
+	 * regardless of the global interrupt enable at each privilege
+	 * level."
+	 *
+	 * To address the above issue, vstimecmp CSR must be set to -1UL
+	 * over here when VCPU is scheduled-out or exits to user space.
 	 */
 
+	csr_write(CSR_VSTIMECMP, -1UL);
+#if defined(CONFIG_32BIT)
+	csr_write(CSR_VSTIMECMPH, -1UL);
+#endif
+
 	/* timer should be enabled for the remaining operations */
 	if (unlikely(!t->init_done))
 		return;
-- 
2.43.0

