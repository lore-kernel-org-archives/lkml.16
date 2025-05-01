Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF1927CCCB
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140143; cv=none; b=bgEWRzB5GVJbGVc9fLg3oo/0yGat44/kmR/3rDslbt5B1cgD51WLy5HOUhiNnyBbKM7boxf5V9cWUDEsbDQ2JfqaVgpYC/YEkalSSHtwgaRMvGVoARjUVnXKmculnQf2dMR4hCK97Wjfq82AYBSoiFgWV28sx5xrHzxqgIUP7Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140143; c=relaxed/simple;
	bh=oYNqNInFlHuysKUFql/UZuOEtrEJstFs6B/rxUs7L5g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t/fvtFBGxAN83/aYlcK+Kjrv2Dqu/ic8mP03tYtLErXOM2I3E5Y3SUPX9A+XeMYFbgsNYSSNAu4s5oXeDlmyqhQP4IDyvYIq1i6vTLVEnfulsjgo/8vjkJaNCKadYA/QClUdQuZF9rnvhDOiHsEF4yGZL7lW93/lDaNVn1aKkR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q+kkJASJ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q+kkJASJ"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22de54b0b97so12720865ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 15:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746140141; x=1746744941; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MfewFjZZgA0wbLHZ0utjYl4REWcdoeGGCmHLPQc1YQk=;
        b=q+kkJASJ1tQAmIGX7adK+JUfjAPlW6WzdqAuXE3UwwzXkVvGBpBHwhRPTz4FjUWeGg
         C5lKulyh/TDR4hoQfcOVk2ZcIzyutyFhM4j+vLvxXGHG00U8h8OMV2GIFtKTMm6xrrDR
         m1UIRZDuXk2okBenNvR1PS3EHbRHTx/O/d7y1N6YVvhQFRlX1Qs62xvOVuRmcW24d5CV
         WeB61s/+HWl0S2EEe9kSjmP1cg8ru2xwMAC0KCEy1muNEBaEle0IywczFADdzEwvN6ac
         qx2LSnb/FS4qBXMn26qJ0rfnxnr8ULmegw6VGK9ttk0dI2bXNqWRm2rfDKsZLjmmSUyN
         AcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140141; x=1746744941;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MfewFjZZgA0wbLHZ0utjYl4REWcdoeGGCmHLPQc1YQk=;
        b=VeShjePrPegldksKN+J8UiQ9cZsumD4Wt5tt7wwnzh22rVRbrdsPApMZwmNKZPksmi
         Y5MSh1DkHyhQa+4sett+8M5m+cn38NYEQ2XBJmj/4rsI2wIvJ/d+apVee09xRlfUcqNd
         jZwtoFB9OmS6oLGLTdJdFADAtPh6QhFsD/8aF/HCfSamwmVABd3bkKhEZngxVMA46ZNA
         A73X5AdgaVpdPPj4uK+DwNZ41p5IMbcnHneHl0O8HjgztolCU3DSGZkoMNjPGNZiTyt3
         YBNluuQipyNpPfAPWtEOfw1Ru+iiDc2jgY4Z1Wq21LFqYYY/n+cn7R1OsybUVmAb6CMs
         jhmg==
X-Gm-Message-State: AOJu0Yy083MicK5ASoCoD9BJR9P0euVCzhj5CxmxBFuwJ8sHW5AJ5Jff
	Bq1otfWi1tjlRGfs36Niy8P4rQG9g878MNK0Pe1P7UZv9JiOzPCs3kR3ZmMasy5UfTXIyPzHNY4
	RHiUhZxW6E8utC9YryT6Ae6NtcLmb+82sNJUt1dKOdylqt0L+WagxWn25LAWH0XN8qpjypyS8Yx
	v9DKtiXoj1metzUnVq/DCX923wnjkXZT7T3xsaIN7hSbA4H4FyPolcYgUVJXWctg==
X-Google-Smtp-Source: AGHT+IGItHhc8YdkABGJyaGvVxl19Y7R7MBDsRAPRNtryCWPo0I1aAnulHG4c/Jmy4vZoSyaAqXIqrI14d7kkyuV
X-Received: from plq10.prod.google.com ([2002:a17:903:2f8a:b0:22c:31cd:5f2e])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1a6b:b0:225:adf8:8634 with SMTP id d9443c01a7336-22e103ca1b3mr10294705ad.51.1746140141096;
 Thu, 01 May 2025 15:55:41 -0700 (PDT)
Date: Thu,  1 May 2025 15:54:23 -0700
In-Reply-To: <20250501225425.635167-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501225425.635167-17-changyuanl@google.com>
Subject: [PATCH v7 16/18] memblock: add KHO support for reserve_mem
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: changyuanl@google.com, akpm@linux-foundation.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
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
 mm/memblock.c | 200 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/mm/memblock.c b/mm/memblock.c
index 9202c3412bb19..27b6325a65b00 100644
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
 
@@ -2475,6 +2480,196 @@ int reserve_mem_release_by_name(const char *name)
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
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserve_mem_table *map = &reserved_mem_table[i];
+
+		err |= kho_preserve_phys(map->start, map->size);
+	}
+
+	err |= kho_preserve_folio(page_folio(kho_fdt));
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
+static int __init prepare_kho_fdt(void)
+{
+	int err = 0, i;
+	void *fdt;
+
+	kho_fdt = alloc_page(GFP_KERNEL);
+	if (!kho_fdt)
+		return -ENOMEM;
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
+		kho_fdt = NULL;
+	}
+
+	return err;
+}
+
+static int __init reserve_mem_init(void)
+{
+	int err;
+
+	if (!kho_is_enabled() || !reserved_mem_count)
+		return 0;
+
+	err = prepare_kho_fdt();
+	if (err)
+		return err;
+
+	err = register_kho_notifier(&reserve_mem_kho_nb);
+	if (err) {
+		put_page(kho_fdt);
+		kho_fdt = NULL;
+	}
+
+	return err;
+}
+late_initcall(reserve_mem_init);
+
+static void *__init reserve_mem_kho_retrieve_fdt(void)
+{
+	phys_addr_t fdt_phys;
+	struct folio *fdt_folio;
+	int err;
+	static void *fdt;
+
+	if (fdt)
+		return fdt;
+
+	err = kho_retrieve_subtree(MEMBLOCK_KHO_FDT, &fdt_phys);
+	if (err) {
+		if (err != -ENOENT)
+			pr_warn("failed to retrieve FDT '%s' from KHO: %d\n",
+				MEMBLOCK_KHO_FDT, err);
+		return NULL;
+	}
+
+	fdt_folio = kho_restore_folio(fdt_phys);
+	if (!fdt_folio) {
+		pr_warn("failed to restore memblock KHO FDT (0x%llx)\n", fdt_phys);
+		return NULL;
+	}
+
+	fdt = folio_address(fdt_folio);
+
+	err = fdt_node_check_compatible(fdt, 0, MEMBLOCK_KHO_NODE_COMPATIBLE);
+	if (err) {
+		pr_warn("FDT '%s' is incompatible with '%s': %d\n",
+			MEMBLOCK_KHO_FDT, MEMBLOCK_KHO_NODE_COMPATIBLE, err);
+		fdt = NULL;
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
+	fdt = reserve_mem_kho_retrieve_fdt();
+	if (!fdt)
+		return false;
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
@@ -2530,6 +2725,11 @@ static int __init reserve_mem(char *p)
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
2.49.0.906.g1f30a19c02-goog

