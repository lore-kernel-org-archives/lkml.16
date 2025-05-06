Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C086E281524
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507960; cv=none; b=oWaoEKNzwRbLTKeeNrOySmiRPInBX3QIzku5II3LMYOyETp/5F2rN+S09mW4swkicuzbW/I4PdzTVEw/ICZWPD7Q1qHQ+yY1m+VYsuQVpz2+a71Lt2lNCdCgqiJeMPKteXUvqs9SX34QKZnRNSD1ZSnM2meCJbkxTwUiw9AwJYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507960; c=relaxed/simple;
	bh=Lp2IiLxIFt9UF0/d0IsIEvQjKn+VOgfUztSA9UPwsEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3PByID6og1mffwysotc+OBsqy3PWCamOZyckBy7h+Wz2Se5LZp/Sbd3chY5/z72B4YwwEN51DPfeRTVukDn8UwuiFS/735H2KGBK4WA/T/wielIMQ14JJH473OzzZxUx5DL/bNeNGXGNBqNa8GqiZhxWUJ4jP7/fp0he5pQyd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Cg10qTw3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VM9GPDIm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Cg10qTw3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VM9GPDIm"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NuehcSvFnpfG/1uDY81jXunTUz2s6/y3uBQJDT8uOYc=;
	b=Cg10qTw3/Sn5VPc4C3qyeIWT6LddzCA7aD5gWzqy/718g73hcxMWPMNz5nen276F4eUPwM
	vHZJ6fmjT03uMFH9BBG859Cnw+HZZD8iVbErcz00v76kpT3AMuY+oXCSBnOlS/hYom4/g+
	uVgaCsjniojFktcfWumru7+tYlJriXn10tTKhgCs0Rgp+W2qdNP+RxyYrBuUUDvebN7dRL
	45hF44Twoelmi+4TIChmF6x4eBZvoW9kdnf93Aj7HXNjPIk8XBwpqWjG5ZzKp5e4lvuXiM
	L6ISgm6tlRxXjUe74+Aj+W7z29GHtv1oaDsl9KgJWDlAnQ1SeXVd7nqcVu3KIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NuehcSvFnpfG/1uDY81jXunTUz2s6/y3uBQJDT8uOYc=;
	b=VM9GPDImbhXZCeX9VyvgAlu4ijGujOoDZmZy5/pg1IR707xTWN031lH5FVAGshsdCT/sqf
	NAh/GtRWwZ/PrdCA==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 24/26] x86/cpuid: scanner: Add CPUID table rescan support
Date: Tue,  6 May 2025 07:04:35 +0200
Message-ID: <20250506050437.10264-25-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add system CPUID table(s) rescan support through cpuid_rescan_cpu().

This will be needed for handling events that can change the system CPUID
state; e.g. disabing the Processor Serial Number (PSN) or performing a
late microcode update.

Follow-up commits will change the call sites in need of CPUID table
rescan one by one.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/table_api.h |  1 +
 arch/x86/kernel/cpu/cpuid_scanner.c    | 52 +++++++++++++++++++++++---
 2 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/table_api.h b/arch/x86/include/asm/cpuid/table_api.h
index 5c4788741dfb..af145fbed9f1 100644
--- a/arch/x86/include/asm/cpuid/table_api.h
+++ b/arch/x86/include/asm/cpuid/table_api.h
@@ -115,5 +115,6 @@
 	(struct cpuid_regs *)cpudata_cpuid_index(_cpuinfo, _leaf, _idx)
 
 void cpuid_scan_cpu(struct cpuinfo_x86 *c);
+void cpuid_rescan_cpu(struct cpuinfo_x86 *c);
 
 #endif /* _ASM_X86_CPUID_TABLE_API_H */
diff --git a/arch/x86/kernel/cpu/cpuid_scanner.c b/arch/x86/kernel/cpu/cpuid_scanner.c
index 664946ebe675..74d34c06d8de 100644
--- a/arch/x86/kernel/cpu/cpuid_scanner.c
+++ b/arch/x86/kernel/cpu/cpuid_scanner.c
@@ -149,6 +149,36 @@ static void cpuid_scan(const struct cpuid_scan_info *info)
 	}
 }
 
+/*
+ * @c: CPU capability structure associated with the current CPU
+ * @clear_cpuid_table: Zero out the CPUID table before populating it.
+ *
+ * The CPUID scanner code expects a zeroed table since the accessor macros at
+ * <cpuid/table_api.h> use the leaf's "nr_entries" field as a marker for its
+ * validity (otherwise NULL is returned.)
+ *
+ * At boot time, all CPUID tables within the CPU capability structure(s) are
+ * already zeroed.  For subsequent CPUID table scans, which are normally done
+ * after hardware state changes, the table might contain stale data that must
+ * be cleared beforehand; e.g., a CPUID leaf that is no longer available, but
+ * with a "nr_entries" value bigger than zero.
+ */
+static void __cpuid_scan_cpu(struct cpuinfo_x86 *c, bool clear_cpuid_table)
+{
+	struct cpuid_table *table = &c->cpuid_table;
+
+	const struct cpuid_scan_info info = {
+		.cpuid_table	= table,
+		.entries	= cpuid_common_scan_entries,
+		.nr_entries	= cpuid_common_scan_entries_size,
+	};
+
+	if (clear_cpuid_table)
+		memset(table, 0, sizeof(*table));
+
+	cpuid_scan(&info);
+}
+
 /**
  * cpuid_scan_cpu() - Populate CPUID data for the current CPU
  * @c:		CPU capability structure associated with the current CPU
@@ -159,11 +189,21 @@ static void cpuid_scan(const struct cpuid_scan_info *info)
  */
 void cpuid_scan_cpu(struct cpuinfo_x86 *c)
 {
-	const struct cpuid_scan_info info = {
-		.cpuid_table	= &c->cpuid_table,
-		.entries	= cpuid_common_scan_entries,
-		.nr_entries	= cpuid_common_scan_entries_size,
-	};
+	__cpuid_scan_cpu(c, false);
+}
 
-	cpuid_scan(&info);
+/**
+ * cpuid_rescan_cpu() - Re-populate CPUID data for the current CPU
+ * @c:		CPU capability structure associated with the current CPU
+ *
+ * Zero-out the CPUID table embedded within @c, then re-populate it using
+ * a fresh CPUID scan.  Since all the CPUID instructions are run locally,
+ * this function must be called on the CPU associated with @c.
+ *
+ * A CPUID table rescan is usually required after system changes that can
+ * affect CPUID state; e.g., Processor Serial Number (PSN) disable.
+ */
+void cpuid_rescan_cpu(struct cpuinfo_x86 *c)
+{
+	__cpuid_scan_cpu(c, true);
 }
-- 
2.49.0

