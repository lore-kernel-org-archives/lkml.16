Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3B62A1AA
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747145884; cv=none; b=REDZDyQOPjMEj6FG6PTv+06utJ8ziiAuvnxvdNsKhp/erZs7xGWSp7EXDeI4gyssDWLovB4RNM5RfPIYVFeVAE4QuCRmxiwUlRpz40k4PD07fUAgpK2vy+xptYMCBLdtseJ56twafHCjeW5qLXP5N1OBgUVTM62XzRSRy3JIY6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747145884; c=relaxed/simple;
	bh=0vVZ9uZv4N+z1CabtlXF1uBHTuuTeXd2ojcUCJ5trIE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yoe6bHIXiN6rx/b2GbRWFNOAi58WhGFv0CMLg52HDgQIzOlDIXydX7l8LmpgFjD0/Wuy9bvaUOTtiRhHmCuyXzuGqzHv4s8lmhxRJoTfBt20voHFGdeECnVUymlPGq82VMT1l+4Ywr6OYuKLhi9zXyz0ZjKCfToHw1py/Mkyly4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MVyf4ht4; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MVyf4ht4"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-442dc6f0138so15594025e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747145880; x=1747750680; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XzhZRrqUU4KfVs0I1M4dfZB+MArRCTM32K6j0BNb1Yg=;
        b=MVyf4ht4lY8Do/R26NL4e6B+wmitgn8lsHqNtcc+k9pWXwGXZyiovZj9ArqHH6EMBo
         jjW3BnE1+6tIPYNjgs42qfCsFvTk9N6ivBDmzNiKiponQgsaRIR23vUKbBrh34JAQgXl
         KzyZM1YIQ7tfbDlS/Cplxpexg63IIzRtjCFPUsbxJkmO0s4N2A8LhCL6N3EVaXJjtDMO
         tgY5Z/CVoUMAP6gO9A8WkFPj30S5zTuy+Qc7HZIgQPb+v7E25J2Yl+FaJkWfY5PdrbZz
         iHI43pOlit2oQ1OsJiQ88fxYIel1L0vvjL6IhCkOCSBIi1dVovtzbGb9uf5f6MLSzyzX
         cbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747145880; x=1747750680;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XzhZRrqUU4KfVs0I1M4dfZB+MArRCTM32K6j0BNb1Yg=;
        b=keuLtFiSsBOECHS7w3/xuMw9aT9wEE/yG6/Uzj3CD+tb/ezBBp/f+0gEZ3l16weWjP
         SnAFNmKuKs7lM1zopTGcw9lw7fr4QQZz28CgNzJvp3pQLZyNC9EcALoxTnO8O1OxyNp/
         g0bwAJVhTxdL7rGM4XG4l0nwTL4kXCPoztuSbSlZD28JOnTJwNus7XezXiFXjuofKAfE
         y5R/Fc3KBrrXIhUYHqUK3TtFrDcxoM+rq9fDyRb5HUKuwuKCJzZhWjmeOjXcf2op2M2W
         7lDL14U+krRrXnnUe7VC3LgiRIAdyCjOkWG0rr5jFvmztf2HFhuaVZwNT7zaxUVxn8IL
         1CWA==
X-Gm-Message-State: AOJu0YzNiIte6AnKb66OOKocEU1d+Ayvu6xfwl2ySEGXGx6S0dCCOfy9
	xXjRQ1KKz0kL7ereR05VS6K4PXEzZWRlUJrHF0fXNkO21gCtTXjw72hhfNZyK/IKUsfsTGAXK3x
	uwspoSq6rwYVzsQcS30kflk/PN2rKG9qgpAnl00Idg3L8WXhK5HOiSGQl1UxTBsBU1KSoYKwN0A
	orpsi7yUj9C/YJyo2V3hwYZeaoQ6SZVw==
X-Google-Smtp-Source: AGHT+IEcNP9o4w0XpqRgycv3AvhCjpvOJ8idOILkXTyqG3mrXZAI840xHguuVsB0WukhbTL/zIaKvDDf
X-Received: from wmcn15.prod.google.com ([2002:a05:600c:c0cf:b0:43c:fe64:2de3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:b85:b0:43d:fa58:700e
 with SMTP id 5b1f17b1804b1-442d6ddd22emr129801015e9.33.1747145880685; Tue, 13
 May 2025 07:18:00 -0700 (PDT)
Date: Tue, 13 May 2025 16:17:45 +0200
In-Reply-To: <20250512190834.332684-23-ardb%2Bgit%40google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250512190834.332684-23-ardb%2Bgit%40google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3735; i=ardb@kernel.org;
 h=from:subject; bh=4uNgR2G1votCZZ2OYep52ckeNUP6192/vly7oEiUnY8=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUM5pDPuH+/hhjWp17KmVnW772v8GfznX9NHmTyrcwx/9
 nY96/PqKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABN5HM7IsMF9y6rrBbXLV7F/
 6xM4pWO1t0SauZprybRZd9u1T5n9i2D4KzT7iZrSdK6UpfbbdkqVFFqmFWbstG/w0q15Kfbnids WVgA=
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250513141744.905614-2-ardb+git@google.com>
Subject: [PATCH] fixup! x86/sev: Share implementation of MSR-based page state change
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Ingo Molnar <mingo@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

This is a fixup for the mentioned patch in principle but it applies to
the end of the v3 series so all subsequent conflicts have already been
resolved.

Without it, PVALIDATE will be passed the PA instead of the VA, which
will break if the early page state API is used after the 1:1 mapping is
unmapped.

Cc: Borislav Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
---
 arch/x86/boot/compressed/sev.c      | 6 +++---
 arch/x86/boot/startup/sev-shared.c  | 8 ++++----
 arch/x86/boot/startup/sev-startup.c | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index 79309944cb19..f1600b57ff0d 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -55,7 +55,7 @@ void snp_set_page_private(unsigned long paddr)
 		return;
 
 	msr = sev_es_rd_ghcb_msr();
-	__page_state_change(paddr, SNP_PAGE_STATE_PRIVATE,
+	__page_state_change(paddr, paddr, SNP_PAGE_STATE_PRIVATE,
 			    (struct svsm_ca *)boot_svsm_caa_pa,
 			    boot_svsm_caa_pa);
 	sev_es_wr_ghcb_msr(msr);
@@ -69,7 +69,7 @@ void snp_set_page_shared(unsigned long paddr)
 		return;
 
 	msr = sev_es_rd_ghcb_msr();
-	__page_state_change(paddr, SNP_PAGE_STATE_SHARED,
+	__page_state_change(paddr, paddr, SNP_PAGE_STATE_SHARED,
 			    (struct svsm_ca *)boot_svsm_caa_pa,
 			    boot_svsm_caa_pa);
 	sev_es_wr_ghcb_msr(msr);
@@ -100,7 +100,7 @@ void snp_accept_memory(phys_addr_t start, phys_addr_t end)
 	u64 msr = sev_es_rd_ghcb_msr();
 
 	for (phys_addr_t pa = start; pa < end; pa += PAGE_SIZE)
-		__page_state_change(pa, SNP_PAGE_STATE_PRIVATE,
+		__page_state_change(pa, pa, SNP_PAGE_STATE_PRIVATE,
 				    (struct svsm_ca *)boot_svsm_caa_pa,
 				    boot_svsm_caa_pa);
 	sev_es_wr_ghcb_msr(msr);
diff --git a/arch/x86/boot/startup/sev-shared.c b/arch/x86/boot/startup/sev-shared.c
index 77b34ab6c7d8..5ab171120448 100644
--- a/arch/x86/boot/startup/sev-shared.c
+++ b/arch/x86/boot/startup/sev-shared.c
@@ -590,8 +590,8 @@ static void pvalidate_4k_page(unsigned long vaddr, unsigned long paddr,
 	}
 }
 
-static void __page_state_change(unsigned long paddr, enum psc_op op,
-			        struct svsm_ca *caa, u64 caa_pa)
+static void __page_state_change(unsigned long vaddr, unsigned long paddr,
+				enum psc_op op, struct svsm_ca *caa, u64 caa_pa)
 {
 	u64 val;
 
@@ -600,7 +600,7 @@ static void __page_state_change(unsigned long paddr, enum psc_op op,
 	 * state change in the RMP table.
 	 */
 	if (op == SNP_PAGE_STATE_SHARED)
-		pvalidate_4k_page(paddr, paddr, false, caa, caa_pa);
+		pvalidate_4k_page(vaddr, paddr, false, caa, caa_pa);
 
 	/* Issue VMGEXIT to change the page state in RMP table. */
 	sev_es_wr_ghcb_msr(GHCB_MSR_PSC_REQ_GFN(paddr >> PAGE_SHIFT, op));
@@ -616,7 +616,7 @@ static void __page_state_change(unsigned long paddr, enum psc_op op,
 	 * consistent with the RMP entry.
 	 */
 	if (op == SNP_PAGE_STATE_PRIVATE)
-		pvalidate_4k_page(paddr, paddr, true, caa, caa_pa);
+		pvalidate_4k_page(vaddr, paddr, true, caa, caa_pa);
 }
 
 /*
diff --git a/arch/x86/boot/startup/sev-startup.c b/arch/x86/boot/startup/sev-startup.c
index 21424157819c..023a157e8563 100644
--- a/arch/x86/boot/startup/sev-startup.c
+++ b/arch/x86/boot/startup/sev-startup.c
@@ -57,7 +57,7 @@ early_set_pages_state(unsigned long vaddr, unsigned long paddr,
 	paddr_end = paddr + (npages << PAGE_SHIFT);
 
 	while (paddr < paddr_end) {
-		__page_state_change(paddr, op, caa, caa_pa);
+		__page_state_change(vaddr, paddr, op, caa, caa_pa);
 
 		vaddr += PAGE_SIZE;
 		paddr += PAGE_SIZE;
-- 
2.49.0.1045.g170613ef41-goog

