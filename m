Received: from esa3.hc555-34.eu.iphmx.com (esa3.hc555-34.eu.iphmx.com [207.54.77.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D698A2566D1;
	Thu, 12 Jun 2025 14:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.77.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739167; cv=none; b=lVmZgj7nY8wVQwhWLDOebnz5sKj4yH5Ehgj486R4iYXW8nkwVskR/ND4/BsiNY+HE6JfwHjPxFDAey/5xBfHjltwm/hQL3Tlmx6J9stl+STRCo0hknibWhZEzPx9qOIRBvvtxas0nj+pTgjaZsmmmcw68qjOmUK3tnwo6xGTc7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739167; c=relaxed/simple;
	bh=TOqVmhZr+3+F6SSr0o3CVr7UW9s5G0m391KmKzLln1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U1o2TL7DzSSeY48mRRXf0IKFszYZvXsN2AwkGCbMgI3y2ixYcBTqDmT8oztYbjKWhZgaQSZxrLZEUst1faqmUtwsn0VgJQxdmW+8y8V7obRLI6/RdWoAoAogX/WHzbB0pPYZfRutO6YSs2isHw8fCCwX2fRyc57mTmGjv+QmpDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=W9zklm+C reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="W9zklm+C"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749739165; x=1781275165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TOqVmhZr+3+F6SSr0o3CVr7UW9s5G0m391KmKzLln1w=;
  b=W9zklm+C7O4aOKFWumbziRLGUaTKdfsyZCzDElz4yzpTI3/F+/IVVKLR
   4UcPX48Gm7jiIzIrS81tT2oke2b2AmaTQpHda0Xk06IIcoEOax0CD3F78
   HIqeoTHGeEk1cMjHH4zRZOo1F2FmVdUBFePioyuaqwP2OKNhuTR+j1R42
   Xk8kst2tQNrgc2mQkMWxewGioYC2yyxq0JgL+/zAAsmtWyHnpFPY6lQCK
   bKygW4h8ZnAQzAC9P8BYEDXpyVI1XYA6qcc5KvbxoT+XohikSfMqeMyhN
   IojmjoAsIvVr5HprZMSmLPWIbI12//sHIE0nW/bOzyW3J7tDXq1noO1IL
   A==;
X-CSE-ConnectionGUID: FyMY0vSXSSyly/jgsizkFA==
X-CSE-MsgGUID: kNzQqysHRFemZW6EE+rBig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 17:39:16 +0300
X-CSE-ConnectionGUID: Sir/HMzRSLSNIi8/c/f4xw==
X-CSE-MsgGUID: ewezxy20TNmtEFUeqzmlhQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
  by ces03_data.me-corp.lan with SMTP; 12 Jun 2025 17:39:14 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 12 Jun 2025 17:39:15 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v3 1/7] riscv: helper to parse hart index
Date: Thu, 12 Jun 2025 17:39:05 +0300
Message-ID: <20250612143911.3224046-2-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

RISC-V APLIC specification defines "hart index" in [1]
And similar definitions found for ACLINT in [2]

Quote from [1]:

Within a given interrupt domain, each of the domain’s harts has a unique
index number in the range 0 to 2^14 − 1 (= 16,383). The index number a
domain associates with a hart may or may not have any relationship to the
unique hart identifier (“hart ID”) that the RISC-V Privileged
Architecture assigns to the hart. Two different interrupt domains may
employ entirely different index numbers for the same set of harts.

Further, [1] says in "4.5 Memory-mapped control region for an
interrupt domain":

The array of IDC structures may include some for potential hart index
numbers that are not actual hart index numbers in the domain.
For example, the first IDC structure is always for hart index 0, but 0 is
not necessarily a valid index number for any hart in the domain.

Support arbitrary hart indices specified in an optional property
"riscv,hart-indexes" which is specified as an array of u32 elements, one
per interrupt target, listing hart indexes in the same order as in
"interrupts-extended". If this property is not specified, fallback to use
logical hart indices within the domain.

If property not exist, fall back to logical hart indexes

Link: https://github.com/riscv/riscv-aia [1]
Link: https://github.com/riscvarchive/riscv-aclint [2]
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/riscv/include/asm/irq.h |  2 ++
 arch/riscv/kernel/irq.c      | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 7b038f3b7cb0..59c975f750c9 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -22,6 +22,8 @@ void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu);
 void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
 
 struct fwnode_handle *riscv_get_intc_hwnode(void);
+int riscv_get_hart_index(struct fwnode_handle *fwnode, u32 logical_index,
+			 u32 *hart_index);
 
 #ifdef CONFIG_ACPI
 
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 9ceda02507ca..b6af20bc300f 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -32,6 +32,40 @@ struct fwnode_handle *riscv_get_intc_hwnode(void)
 }
 EXPORT_SYMBOL_GPL(riscv_get_intc_hwnode);
 
+/**
+ * riscv_get_hart_index() - get hart index for interrupt delivery
+ * @fwnode: interrupt controller node
+ * @logical_index: index within the "interrupts-extended" property
+ * @hart_index: filled with the hart index to use
+ *
+ * RISC-V uses term "hart index" for its interrupt controllers, for the
+ * purpose of the interrupt routing to destination harts.
+ * It may be arbitrary numbers assigned to each destination hart in context
+ * of the particular interrupt domain.
+ *
+ * These numbers encoded in the optional property "riscv,hart-indexes"
+ * that should contain hart index for each interrupt destination in the same
+ * order as in the "interrupts-extended" property. If this property
+ * not exist, it assumed equal to the logical index, i.e. index within the
+ * "interrupts-extended" property.
+ *
+ * Return: error code
+ */
+int riscv_get_hart_index(struct fwnode_handle *fwnode, u32 logical_index,
+			 u32 *hart_index)
+{
+	static const char *prop_hart_index = "riscv,hart-indexes";
+	struct device_node *np = to_of_node(fwnode);
+
+	if (!np || !of_property_present(np, prop_hart_index)) {
+		*hart_index = logical_index;
+		return 0;
+	}
+
+	return of_property_read_u32_index(np, prop_hart_index,
+					  logical_index, hart_index);
+}
+
 #ifdef CONFIG_IRQ_STACKS
 #include <asm/irq_stack.h>
 
-- 
2.43.0

