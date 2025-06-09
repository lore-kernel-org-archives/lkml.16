Received: from esa4.hc555-34.eu.iphmx.com (esa4.hc555-34.eu.iphmx.com [207.54.77.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F71125A626;
	Mon,  9 Jun 2025 13:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.77.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749477076; cv=none; b=N3wmU0WrJWAdkESEmYngcnGOqI+1t45cW7Jswz4hjTmx1oHQ0EqA43nM1gWlKaLIyKmI/uGQLWHhmb6LxAaDCXFVJdgCxpal1LCIWO0UVIwCsTXym2KwcJL2bLcDN7Noo0KVQy4Ulnj/sEdtpX7JQgKpJ04+4MuuGUynNMOqEkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749477076; c=relaxed/simple;
	bh=quT+zdVX2EifVoeKNBY4FQXcJ7pHShHmcCxaW2+fMIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hh6oBkMtxoM2iaBx6/JrKWrHEza/jr3axzI5CTEKAmhTeEj7zC1cFjJkBhJ8lWND9He/tx8Z6iBStJ/xtWttADxhOWYz7qtDxGY5Rr24GgZRafp9d0EGhAmBJxQgkM1VWCuMaCUqb/pHU9K2zDCyKhimX9LssAww0pTY2puOL6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=gKkTIuC7 reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="gKkTIuC7"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749477074; x=1781013074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=quT+zdVX2EifVoeKNBY4FQXcJ7pHShHmcCxaW2+fMIg=;
  b=gKkTIuC7nHddJTAyAQTrdqLlckfMfr7hifQqXbgvu68YuHDA2xFbb3pW
   wmoUAOGTvLUZMUwJNwbeCneVbg9X1aCc/l4HiE4E0Uga4b0RzuuhYbdrB
   IhRRu/OomoyZ7vPansPr8YPhoPB6iVvKe6S2PuLCOujPuFveHNwpQMKXa
   qlex7PwdPI9e7XFiEOKCHQOP92+20SKOc1fRTsl9dNlw2NmiJswTG8oAT
   0cAB9OFxnnikneF6IhJyOhuhxAlZ6l2tj+GpIWfTustzIuwoyTK9lLlCB
   YA1Tb/0Qzh2+8BRTyaNnOwFRlwcfVWlHH2EsJOj96VRjK9BP9I+BAdPCk
   g==;
X-CSE-ConnectionGUID: jiJ3+IoTQGWyA+Syk7PYXA==
X-CSE-MsgGUID: F2xqNTbSSsqvt5IFS6szQQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 16:47:59 +0300
X-CSE-ConnectionGUID: A36+pBebRuCoXNOEMTYJuQ==
X-CSE-MsgGUID: lxlF6r/DTae52yps/JiiTg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces03_data.me-corp.lan with SMTP; 09 Jun 2025 16:47:56 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 09 Jun 2025 16:47:57 +0300
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
Subject: [PATCH v1 1/7] riscv: helper to parse hart index
Date: Mon,  9 Jun 2025 16:47:43 +0300
Message-ID: <20250609134749.1453835-2-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
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
index 9ceda02507ca..efdf505bb776 100644
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
+ * Risc-V uses term "hart index" for its interrupt controllers, for the
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

