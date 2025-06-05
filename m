Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E59C284695
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151531; cv=none; b=Ffsy04ixYoPLtIG+8b7U7O+40oYDf5lNuJlhZu+bDj49H0sOpQZSL3Vb9HM7jqnlSTnPshKdjDrXDisYgp0+O+nmmql2W7m07N2P+c17oxKhWw3Ak1e7LQkwhHs03n8Lv4dIbJ1diqVg0HjJUvYUUO3bZThd8eEbmykSFtPJ5kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151531; c=relaxed/simple;
	bh=F3VBsvBWaXgoJf3PVV9A2l5bXC3TcwMyGK1nkWMIrUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZF9bF644n422awIqymuRk9sde5f/ee7jby/So2nw04SA73SqHmU4+r5ibwnVmKE/mco9VOY0IXyQgJg3Y67I+1aAcYALIo6eL7N7JB8hp2v+spMcKufu6Ag4Iim/OIgVKlJ4jUp7/N5VpZIz0bsXH8wcBsVnx+q8MJQxUO25IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bAic/721; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KfxDWXt5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bAic/721";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KfxDWXt5"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749151528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KW5WdGb/m4hgqnmYLiE2ZFB6NP3p8ik4xLAbGqDxgGw=;
	b=bAic/721kWhc7AJFRHFNiWZQUefcrEsD7x6B6+AHRQGiSs4cczCrwTuMRVFcTcyNiPAYfd
	R4RRMSfzoPw0lluIDneAWOHC0Fr6trBijS8qWBHv2HgL3TfNV+cSF07tey2PZAW1pHyEOY
	zyKsM/2jOWJdSpDy4/M09wPlSr3KEbaYkIPwaXyslS56cnqwStQ0zgMwzI+oh1HJqe0FDR
	5NCiD2M1aUrl2PXGQ4CAMzeoSPyJi52GCdcrWa1552khCGXDTCkjTrIOCjTREYWsg+rEo1
	LFeov9W2yHctIMMYhhD2D5Q3MifdDXqvKWDKgwn4oLRXa2BaN4eaoGBsqDjusg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749151528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KW5WdGb/m4hgqnmYLiE2ZFB6NP3p8ik4xLAbGqDxgGw=;
	b=KfxDWXt5OtfvcQSIt5wVx43xb3b3wKzw6b5LhGBkdEtCKO7Dvbjb4Ud20dq0UQ/PSjiz4P
	tXEUVPPvppw6rTCQ==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v2 25/27] x86/cpuid: Add CPUID parser table rescan support
Date: Thu,  5 Jun 2025 21:23:54 +0200
Message-ID: <20250605192356.82250-26-darwi@linutronix.de>
In-Reply-To: <20250605192356.82250-1-darwi@linutronix.de>
References: <20250605192356.82250-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPUID table(s) rescan support through cpuid_parser_rescan_cpu().

This will be needed for handling events that can change the system CPUID
state; e.g. disabing the Processor Serial Number (PSN) or performing a
late microcode update.

Call sites in need of CPUID table rescan will be updated next.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/api.h   |  1 +
 arch/x86/kernel/cpu/cpuid_parser.c | 42 +++++++++++++++++++++++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 82d36d210930..235f1a05792a 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -519,5 +519,6 @@ static inline bool cpuid_amd_hygon_has_l3_cache(void)
  */
 
 void cpuid_parser_scan_cpu(struct cpuinfo_x86 *c);
+void cpuid_parser_rescan_cpu(struct cpuinfo_x86 *c);
 
 #endif /* _ASM_X86_CPUID_API_H */
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index 1f3b4cd6b411..b7a44026ab1a 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -156,6 +156,30 @@ cpuid_fill_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[]
 	}
 }
 
+/*
+ * __cpuid_parser_scan_cpu() - Populate current CPU's CPUID table
+ * @c:			CPU capability structure associated with the current CPU
+ * @clear_cpuid_table:	Zero-out the CPUID table residing within @c before populating it
+ *
+ * The CPUID parser code expects a zeroed-out CPUID table since the accessor macros at
+ * <cpuid/api.h> use the leaf's "nr_entries" field as a validity marker; otherwise NULL is
+ * returned.
+ *
+ * At boot, all CPUID tables within the CPU capability structure(s) are zeroed.  For
+ * subsequent CPUID table scans, which are normally done after hardware state changes, the
+ * table might contain stale data that must be cleared beforehand; e.g., a CPUID leaf that
+ * is no longer available, but with a "nr_entries" value bigger than zero.
+ */
+static void __cpuid_parser_scan_cpu(struct cpuinfo_x86 *c, bool clear_cpuid_table)
+{
+	struct cpuid_table *table = &c->cpuid;
+
+	if (clear_cpuid_table)
+		memset(table, 0, sizeof(*table));
+
+	cpuid_fill_table(table, cpuid_common_parse_entries, cpuid_common_parse_entries_size);
+}
+
 /**
  * cpuid_parser_scan_cpu() - Populate current CPU's CPUID table
  * @c:		CPU capability structure associated with the current CPU
@@ -165,5 +189,21 @@ cpuid_fill_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[]
  */
 void cpuid_parser_scan_cpu(struct cpuinfo_x86 *c)
 {
-	cpuid_fill_table(&c->cpuid, cpuid_common_parse_entries, cpuid_common_parse_entries_size);
+	__cpuid_parser_scan_cpu(c, false);
+}
+
+/**
+ * cpuid_parser_rescan_cpu() - Re-populate current CPU's CPUID table
+ * @c:		CPU capability structure associated with the current CPU
+ *
+ * Zero-out the CPUID table embedded within @c, then re-populate it using a fresh CPUID scan.
+ * Since all CPUID instructions are invoked locally, this function must be called on the CPU
+ * associated with @c.
+ *
+ * A CPUID table rescan is usually required after system changes that can affect CPUID state;
+ * e.g., disabing the Processor Serial Number (PSN) or performing a late microcode update.
+ */
+void cpuid_parser_rescan_cpu(struct cpuinfo_x86 *c)
+{
+	__cpuid_parser_scan_cpu(c, true);
 }
-- 
2.49.0

