Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412D7289819
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 17:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749229891; cv=none; b=X7477IFbi8fnUcU1S7js/BEtFXPYaOv5eFWabtaz6aEyaAFV6OPRixo+OqiwkPVXY6awu9/kNh+phk324h3MhjsAnA5PO5qUlG2CHdRgxoJ0grWSClNnZJsjdMaLXpFmtSKLdNwr8v2QJrQxJT4u7xiZAJZO04wikvSOxXQzFgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749229891; c=relaxed/simple;
	bh=qcOfhLcNm7S1SyTd8tK+TKEUQLWhmfWH4aNgAteT74g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FiCgScJTl4Lh+bRm6+QJWPIxON1CzLAoECdmSgFB6/EKkWmQQ3f5KulrU3fISgWi4IhCS7QClpml/m9mEecd6nicrB3OiLGWnOPAU0xruJI38VJTDdlxX7UdvYOErOTho007OgPTspwU8b4/fGDxM+XG+tMCEld5hdRxRN85q8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=Uk4bm9p9; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="Uk4bm9p9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=FXhb5AK4hmzs7wEbphuMQS57/NnaTRqpKXsIVk4kIRA=; b=Uk4bm9p93KKs9rG1MvQKzM7uE2
	mkryQIrbAjoJmYcuJIIm14NBn/aTgKYAC/CQTkld2rrTXPagIaDqqf+FC9JWvFPzAmc0IklhrUa3E
	SV0JWeLZRx1hJeLHG1fzkBMO0daDZhMNUKH3yOjoeADjPu/Q8ox273v8RSlB+YNtqpJnkioA7C53m
	/Bzjn+DbTxVRlabXjejhovkYEKKyvHI41Y/sYENSkjDFPHUAFFDTzkxQbk2WhD9j8WvewrKBvR2GK
	TRPy1aiJUh1eUZiQ9gJipEmjOzA5ANMaq2X4zo6BJUvZQ+wMOtWJMZ1NagRlQT1kvdJS3AAGg1lV8
	B817w3tQ==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uNab3-000000006Se-1ocO;
	Fri, 06 Jun 2025 13:11:13 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	bp@alien8.de,
	x86@kernel.org,
	nadav.amit@gmail.com,
	seanjc@google.com,
	tglx@linutronix.de,
	mingo@kernel.org,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Rik van Riel <riel@surriel.com>
Subject: [PATCH v2 3/3] x86/mm: Change cpa_flush() to call flush_kernel_range() directly
Date: Fri,  6 Jun 2025 13:10:35 -0400
Message-ID: <20250606171112.4013261-4-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606171112.4013261-1-riel@surriel.com>
References: <20250606171112.4013261-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yu-cheng Yu <yu-cheng.yu@intel.com>

The function cpa_flush() calls __flush_tlb_one_kernel() and
flush_tlb_all().

Replacing that with a call to flush_tlb_kernel_range() allows
cpa_flush() to make use of INVLPGB or RAR without any additional
changes.

Initialize invlpgb_count_max to 1, since flush_tlb_kernel_range()
can now be called before invlpgb_count_max has been initialized
to the value read from CPUID.

[riel: remove now unused __cpa_flush_tlb]

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Signed-off-by: Rik van Riel <riel@surriel.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 arch/x86/mm/pat/set_memory.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 30ab4aced761..1da32261bc11 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -399,15 +399,6 @@ static void cpa_flush_all(unsigned long cache)
 	on_each_cpu(__cpa_flush_all, (void *) cache, 1);
 }
 
-static void __cpa_flush_tlb(void *data)
-{
-	struct cpa_data *cpa = data;
-	unsigned int i;
-
-	for (i = 0; i < cpa->numpages; i++)
-		flush_tlb_one_kernel(fix_addr(__cpa_addr(cpa, i)));
-}
-
 static int collapse_large_pages(unsigned long addr, struct list_head *pgtables);
 
 static void cpa_collapse_large_pages(struct cpa_data *cpa)
@@ -444,6 +435,7 @@ static void cpa_collapse_large_pages(struct cpa_data *cpa)
 
 static void cpa_flush(struct cpa_data *cpa, int cache)
 {
+	unsigned long start, end;
 	unsigned int i;
 
 	BUG_ON(irqs_disabled() && !early_boot_irqs_disabled);
@@ -453,10 +445,12 @@ static void cpa_flush(struct cpa_data *cpa, int cache)
 		goto collapse_large_pages;
 	}
 
-	if (cpa->force_flush_all || cpa->numpages > tlb_single_page_flush_ceiling)
-		flush_tlb_all();
-	else
-		on_each_cpu(__cpa_flush_tlb, cpa, 1);
+	start = fix_addr(__cpa_addr(cpa, 0));
+	end =   fix_addr(__cpa_addr(cpa, cpa->numpages));
+	if (cpa->force_flush_all)
+		end = TLB_FLUSH_ALL;
+
+	flush_tlb_kernel_range(start, end);
 
 	if (!cache)
 		goto collapse_large_pages;
-- 
2.49.0

