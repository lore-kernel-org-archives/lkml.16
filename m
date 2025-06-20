Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CA0224AE1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402605; cv=none; b=mcKGwt4ibx/JHFwHcwjQEWjIbZDM8Aj9zPcsWJIimPofe4ePZxxPIz3e0ehkcgwVZ0bzI6gqKi986YL9afcwWLa0FlOsXUaKPJtv5TYy4JrLgNcozsI9G8Pj48+XnsRFK+TmXKNSDglVcci34DZN4PoQ4+xnNyEsOC+uJPUDqFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402605; c=relaxed/simple;
	bh=RpfBozZlB7PLU4txdk5jNCCIRJOsGiM2ZcARWN2Ju7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bh38axJtID/vaSRjKdKxEVDFGZiqTDdMdSIITSgCL/Hte040euwPBrxaIZ3N46wWoV4v6NI0NaHJGAhpNn7kk3V3tAtC/pE6mMzouPQFTmCFL4Cn9ijO8noGo6LKPsX1Rh6k952HXcdykOsau4LenHaDVdS9aLt0DSf4v9lgFlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Q55SJTDL; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q55SJTDL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=pSUFZgYSNKQI7ds6d0I70QyYwFZd2u6fu/dstHNKPaQ=; b=Q55SJTDLYNuXxLM0q/922sBY9B
	OeBTdtBSoVojYPDSZfdlbKK3WXZGoCq8iVzNi4Wb1bULCDLEQ+WPqQvu//Fv8hZXCy40gcMqpSXnF
	DG6SU2Pdh//RKeUHGdDmgitlYgbR8quc51BdWPlkYkL5xMaI5zW7/cHMXZHM10iWyd360Ljp9ZZ8Q
	M13ZiaGpp4fUBb5C9WCixi+OE9PNH/WZH11tZ1IHzhXTWnmsz5RPIADuUScYjlyJgAKdnnPjsVtfT
	611BiuN2cNN0DFIUwSNMq8aIYRlyiKHz1DGMSJJAQwMvE96X7IV8lZODCp44vlSFckLLPlgoY8Q/k
	ocJrMPag==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSVg0-0000000EuC4-2n7n;
	Fri, 20 Jun 2025 06:56:40 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	"Bryan O'Donoghue" <pure.logic@nexus-software.ie>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH] x86/platform/quark: fix kernel-doc warnings in imr.c
Date: Thu, 19 Jun 2025 23:56:39 -0700
Message-ID: <20250620065639.3348609-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix all kernel-doc warnings in imr.c:

imr.c:300: warning: Function parameter or struct member 'rmask' not described in 'imr_add_range'
imr.c:300: warning: Function parameter or struct member 'wmask' not described in 'imr_add_range'
imr.c:300: warning: Excess function parameter 'read_mask' description in 'imr_add_range'
imr.c:300: warning: Excess function parameter 'write_mask' description in 'imr_add_range'

Fixes: 28a375df16c2 ("x86/intel/quark: Add Isolated Memory Regions for Quark X1000")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: "Bryan O'Donoghue" <pure.logic@nexus-software.ie>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
---
 arch/x86/platform/intel-quark/imr.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- lnx-616-rc2.orig/arch/x86/platform/intel-quark/imr.c
+++ lnx-616-rc2/arch/x86/platform/intel-quark/imr.c
@@ -291,8 +291,8 @@ static inline int imr_address_overlap(ph
  *
  * @base:	physical base address of region aligned to 1KiB.
  * @size:	physical size of region in bytes must be aligned to 1KiB.
- * @read_mask:	read access mask.
- * @write_mask:	write access mask.
+ * @rmask:	read access mask.
+ * @wmask:	write access mask.
  * @return:	zero on success or negative value indicating error.
  */
 int imr_add_range(phys_addr_t base, size_t size,
