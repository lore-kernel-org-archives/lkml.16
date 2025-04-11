Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44227280CCB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349924; cv=none; b=G+nbrL3W7mxZgoy1NfZ+jjz8IJIaipWYy3eyRXm/k9OEcKY3XdoBJ8k4aLtRvPFdKQqoRMGl7AWptmUNZTCJJEqWtXELx/6wuTrZwOQNRLs/tyGw/VSByjQxrk549eNUIIxuhkrObG9fQ758QGaknsfQ2XMu+2UGYCvdnsnfnDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349924; c=relaxed/simple;
	bh=RVtMCMJAM6uGfjWS5bBGzF6kImCKyWD0tknfs/Iqawc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AbWcb9/Rg8F9PyuyAJbggZtOrwS1FK3/PmWTnFRH2v42u4JmbuUO/xG1glZx/PvFjOzk6up+65Bmb3r1tFw+407PZVTT+oIpV67eQ1b25BYV62Bg0MyKn37av7IGIesDGDLF4ygRKw/SNBD5DdIRYobjC4834FGFcUohEyJxp6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HKNZLzok; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HKNZLzok"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b048d1abbbfso904376a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744349923; x=1744954723; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kA+rlZCcqa8ZBpJsZPffMW5upf9/jLnF7y6wsXcCijE=;
        b=HKNZLzokmNxWlVJjC5TKSOjMnXulvZV7qPlBn9YKq2GTolJBNQBJbPHdmYVpvuKx2a
         p8ye0ZT2ugH3fHMiwlQ1iPDzn3I5VSzcyUsKUkSel/0rzBi0qNHSDS/dPSYNevEDTJe3
         rNw5vgQ1fhzMm4rIl7LIymMf/4yV9WSOI8hkQeTYR04KV0suZIdDd6xqLTjDO84uql0w
         h7mxsanFyoOf4DYHt641EX9tYBLiDH3+9hGdi6lExFx17YNeRETMyaRAqk1Kp0d26FeH
         nKWIs3TlNCNugQ7xbi9I24cjKwtUFXlYcj55x9uYxyud9u0+dItkoK/plHClX/5Iw+Wg
         +Plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349923; x=1744954723;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kA+rlZCcqa8ZBpJsZPffMW5upf9/jLnF7y6wsXcCijE=;
        b=ngnTqpYhleZsG49CoOvCH3WwXgsxaOHIIl0ISVB7tGY27HEyee4LUdrbPMtSB6UBJN
         FgCPOP4D/YQvHjvS4z8qyaodCeaUJkOyQvmup74xXwfgVrlEbf+0gq8uwOIeEt+NEMFd
         3fCdyy0gj4F/7Kg2jTs9WKONN+I0seL3Sa8MczklpInncFgeHFXpczROrFir5EwK9+xb
         Gjx9S01/+2OUFYuIeuLEY8tTvQVmjbHbxLBODf2BYzzFxubk5/6YV1KhO1lbct0Qhn1r
         j8iCwyXToEPxIt1dAv0gADxkjKgNQ8VMD+aFfMIALuzUtsaNBd9/CsXdd9xRo4NMy12d
         xLtw==
X-Gm-Message-State: AOJu0YwmQyKgW4s4DBhQqFtL2TSG7IauwHWYxxt/J3SIjnhZIS/GLTwr
	JzkKI9aNnnDBh1G2B3KheUJrLpxhKPNAtai4K9UTdwvEIHK0EeNlnxXBRzoKzmi7phxhfA78DAQ
	zzYghK4H4ThRh3wVGUBWUB5fPsH/9GMSH0EvUchtePT7NOnpmztppAes6BK/HBMl1pQeHQ/LMiB
	XrtTzvXI4Q/6mLRfclvDAXGlUZKk2zIzB7BFx70Jt1NzfeFsEcOaykfT8q0JAEEg==
X-Google-Smtp-Source: AGHT+IFMNgH3FeNkL43VcSwOV5hq+5tHGG0G6gtWFb6aZTBEqWyHMIBbsA40BOUPJoyVSd2JH8itZpILADhQmm2q
X-Received: from plbjg10.prod.google.com ([2002:a17:903:26ca:b0:223:f321:1a96])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:fc4d:b0:224:1ce1:a3f4 with SMTP id d9443c01a7336-22bea4a1e8bmr23409575ad.1.1744349922412;
 Thu, 10 Apr 2025 22:38:42 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:37:43 -0700
In-Reply-To: <20250411053745.1817356-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411053745.1817356-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250411053745.1817356-13-changyuanl@google.com>
Subject: [PATCH v6 12/14] memblock: add KHO support for reserve_mem
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, 
	graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de, robh@kernel.org, 
	rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org, Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Alexander Graf <graf@amazon.com>

Linux has recently gained support for "reserve_mem": A mechanism to
allocate a region of memory early enough in boot that we can cross our
fingers and hope it stays at the same location during most boots, so we
can store for example ftrace buffers into it.

Thanks to KASLR, we can never be really sure that "reserve_mem"
allocations are static across kexec. Let's teach it KHO awareness so
that it serializes its reservations on kexec exit and deserializes them
again on boot, preserving the exact same mapping across kexec.

This is an example user for KHO in the KHO patch set to ensure we have
at least one (not very controversial) user in the tree before extending
KHO's use to more subsystems.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 mm/memblock.c | 205 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 205 insertions(+)

diff --git a/mm/memblock.c b/mm/memblock.c
index 456689cb73e20..3571a859f2fe1 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -18,6 +18,11 @@
 #include <linux/memblock.h>
 #include <linux/mutex.h>
 
+#ifdef CONFIG_KEXEC_HANDOVER
+#include <linux/libfdt.h>
+#include <linux/kexec_handover.h>
+#endif /* CONFIG_KEXEC_HANDOVER */
+
 #include <asm/sections.h>
 #include <linux/io.h>
 
@@ -2475,6 +2480,201 @@ int reserve_mem_release_by_name(const char *name)
 	return 1;
 }
 
+#ifdef CONFIG_KEXEC_HANDOVER
+#define MEMBLOCK_KHO_FDT "memblock"
+#define MEMBLOCK_KHO_NODE_COMPATIBLE "memblock-v1"
+#define RESERVE_MEM_KHO_NODE_COMPATIBLE "reserve-mem-v1"
+static struct page *kho_fdt;
+
+static int reserve_mem_kho_finalize(struct kho_serialization *ser)
+{
+	int err = 0, i;
+
+	if (!reserved_mem_count)
+		return NOTIFY_DONE;
+
+	if (IS_ERR(kho_fdt)) {
+		err = PTR_ERR(kho_fdt);
+		pr_err("memblock FDT was not prepared successfully: %d\n", err);
+		return notifier_from_errno(err);
+	}
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserve_mem_table *map = &reserved_mem_table[i];
+
+		err |= kho_preserve_phys(ser, map->start, map->size);
+	}
+
+	err |= kho_preserve_folio(ser, page_folio(kho_fdt));
+	err |= kho_add_subtree(ser, MEMBLOCK_KHO_FDT, page_to_virt(kho_fdt));
+
+	return notifier_from_errno(err);
+}
+
+static int reserve_mem_kho_notifier(struct notifier_block *self,
+				    unsigned long cmd, void *v)
+{
+	switch (cmd) {
+	case KEXEC_KHO_FINALIZE:
+		return reserve_mem_kho_finalize((struct kho_serialization *)v);
+	case KEXEC_KHO_ABORT:
+		return NOTIFY_DONE;
+	default:
+		return NOTIFY_BAD;
+	}
+}
+
+static struct notifier_block reserve_mem_kho_nb = {
+	.notifier_call = reserve_mem_kho_notifier,
+};
+
+static void __init prepare_kho_fdt(void)
+{
+	int err = 0, i;
+	void *fdt;
+
+	if (!reserved_mem_count)
+		return;
+
+	kho_fdt = alloc_page(GFP_KERNEL);
+	if (!kho_fdt) {
+		kho_fdt = ERR_PTR(-ENOMEM);
+		return;
+	}
+
+	fdt = page_to_virt(kho_fdt);
+
+	err |= fdt_create(fdt, PAGE_SIZE);
+	err |= fdt_finish_reservemap(fdt);
+
+	err |= fdt_begin_node(fdt, "");
+	err |= fdt_property_string(fdt, "compatible", MEMBLOCK_KHO_NODE_COMPATIBLE);
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserve_mem_table *map = &reserved_mem_table[i];
+
+		err |= fdt_begin_node(fdt, map->name);
+		err |= fdt_property_string(fdt, "compatible", RESERVE_MEM_KHO_NODE_COMPATIBLE);
+		err |= fdt_property(fdt, "start", &map->start, sizeof(map->start));
+		err |= fdt_property(fdt, "size", &map->size, sizeof(map->size));
+		err |= fdt_end_node(fdt);
+	}
+	err |= fdt_end_node(fdt);
+
+	err |= fdt_finish(fdt);
+
+	if (err) {
+		pr_err("failed to prepare memblock FDT for KHO: %d\n", err);
+		put_page(kho_fdt);
+		kho_fdt = ERR_PTR(-EINVAL);
+	}
+}
+
+static int __init reserve_mem_init(void)
+{
+	if (!kho_is_enabled())
+		return 0;
+
+	prepare_kho_fdt();
+
+	return register_kho_notifier(&reserve_mem_kho_nb);
+}
+late_initcall(reserve_mem_init);
+
+static void *kho_fdt_in __initdata;
+
+static void *__init reserve_mem_kho_retrieve_fdt(void)
+{
+	phys_addr_t fdt_phys;
+	struct folio *fdt_folio;
+	void *fdt;
+	int err;
+
+	err = kho_retrieve_subtree(MEMBLOCK_KHO_FDT, &fdt_phys);
+	if (err) {
+		if (err != -ENOENT)
+			pr_warn("failed to retrieve FDT '%s' from KHO: %d\n",
+				MEMBLOCK_KHO_FDT, err);
+		return ERR_PTR(err);
+	}
+
+	fdt_folio = kho_restore_folio(fdt_phys);
+	if (!fdt_folio) {
+		pr_warn("failed to restore memblock KHO FDT (0x%llx)\n", fdt_phys);
+		return ERR_PTR(-EFAULT);
+	}
+
+	fdt = page_to_virt(folio_page(fdt_folio, 0));
+
+	err = fdt_node_check_compatible(fdt, 0, MEMBLOCK_KHO_NODE_COMPATIBLE);
+	if (err) {
+		pr_warn("FDT '%s' is incompatible with '%s': %d\n",
+			MEMBLOCK_KHO_FDT, MEMBLOCK_KHO_NODE_COMPATIBLE, err);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return fdt;
+}
+
+static bool __init reserve_mem_kho_revive(const char *name, phys_addr_t size,
+					  phys_addr_t align)
+{
+	int err, len_start, len_size, offset;
+	const phys_addr_t *p_start, *p_size;
+	const void *fdt;
+
+	if (!kho_fdt_in)
+		kho_fdt_in = reserve_mem_kho_retrieve_fdt();
+
+	if (IS_ERR(kho_fdt_in))
+		return false;
+
+	fdt = kho_fdt_in;
+
+	offset = fdt_subnode_offset(fdt, 0, name);
+	if (offset < 0) {
+		pr_warn("FDT '%s' has no child '%s': %d\n",
+			MEMBLOCK_KHO_FDT, name, offset);
+		return false;
+	}
+	err = fdt_node_check_compatible(fdt, offset, RESERVE_MEM_KHO_NODE_COMPATIBLE);
+	if (err) {
+		pr_warn("Node '%s' is incompatible with '%s': %d\n",
+			name, RESERVE_MEM_KHO_NODE_COMPATIBLE, err);
+		return false;
+	}
+
+	p_start = fdt_getprop(fdt, offset, "start", &len_start);
+	p_size = fdt_getprop(fdt, offset, "size", &len_size);
+	if (!p_start || len_start != sizeof(*p_start) || !p_size ||
+	    len_size != sizeof(*p_size)) {
+		return false;
+	}
+
+	if (*p_start & (align - 1)) {
+		pr_warn("KHO reserve-mem '%s' has wrong alignment (0x%lx, 0x%lx)\n",
+			name, (long)align, (long)*p_start);
+		return false;
+	}
+
+	if (*p_size != size) {
+		pr_warn("KHO reserve-mem '%s' has wrong size (0x%lx != 0x%lx)\n",
+			name, (long)*p_size, (long)size);
+		return false;
+	}
+
+	reserved_mem_add(*p_start, size, name);
+	pr_info("Revived memory reservation '%s' from KHO\n", name);
+
+	return true;
+}
+#else
+static bool __init reserve_mem_kho_revive(const char *name, phys_addr_t size,
+					  phys_addr_t align)
+{
+	return false;
+}
+#endif /* CONFIG_KEXEC_HANDOVER */
+
 /*
  * Parse reserve_mem=nn:align:name
  */
@@ -2530,6 +2730,11 @@ static int __init reserve_mem(char *p)
 	if (reserve_mem_find_by_name(name, &start, &tmp))
 		return -EBUSY;
 
+	/* Pick previous allocations up from KHO if available */
+	if (reserve_mem_kho_revive(name, size, align))
+		return 1;
+
+	/* TODO: Allocation must be outside of scratch region */
 	start = memblock_phys_alloc(size, align);
 	if (!start)
 		return -ENOMEM;
-- 
2.49.0.604.gff1f9ca942-goog

