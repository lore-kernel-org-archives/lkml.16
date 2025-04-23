Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA45D26D4F3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406652; cv=none; b=j+Xhm4YvW8e3BOBLyQY/6PK0EqTgTPoKcd0NvYRr7Mi5kv2qss3PHe7sZrWcQ6zIH/F25MsDN7LH0F6unAcaS4KPeN0QoVb3xkWxpkhLTDkbtx4o961tlcTb1AKRDtN1SZYi+IRZri1cuXOdGmoAxhpB1VaERjVNVwBqAKYmgBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406652; c=relaxed/simple;
	bh=WiElLAcWG7Yok/aR7PkCV8+EXk5A56tbQMYc7mBZbEk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KLNCD+CiDmXAfqEMiMwRF+qyF9uPDRuwtrP4SDp7YyA3XI/PqyzC1YL6z2GvdwOSv9jkjZoMdH8UmdKcSTUhrEuGwSpz2y+9xYyHCfdOSoZfuBgkRXHGOESj2QHAWv/z/TD7skcKf44Sltjhhl2Ka06eIY/KAlTNSY/zHZ1jtWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EbB5q3qz; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EbB5q3qz"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d08915f61so34198295e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745406649; x=1746011449; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Zcjkai0mBWP8Xx+OqiAgnAgZ8TAN8uUF5bmFIuXhSo=;
        b=EbB5q3qzJ1/T++/3fldtvAQxvM+krelSwqfzruSdBDhamN1iPqcsxiWOG+mAGL/dKt
         ItqnlhFznG8T09qtykZHkQ5bmx/lQI5dzDCfmFLabHfBFeaJ6x54X3I1+a7kjjLkJ/ph
         wD6qfNm3NWEewQwZw0dQqshQzxMHGFeaIja+ZK9XsG7iQsf9wBmsYpmiXD5RWjZDe6zB
         +TlcI1HegK6Y9ts9wyxNl+m24h5EXhFffDSxZYkRegMQmiM8nNBayWs8JtftmOynzvGO
         m7PIb8z3HnnRIC8+rYKzGu9mXEnFC9M2ecfcHWBT1GAlielPQ18XKnYIgn5CEYK0W1b4
         J+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406649; x=1746011449;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Zcjkai0mBWP8Xx+OqiAgnAgZ8TAN8uUF5bmFIuXhSo=;
        b=qA3V6S4Ik29BAstsiE26VEuTwyi0aZuMEfcg0radjYRhnR++RHeBEqfdQQkYJWhCGY
         e2RkX5VKeWiR4jnj1VaEpEVwRdJ8GvOxhrYa+D8h3w9QH3CUBW01SlwiU6MD1xs6MuPX
         T0B25+hb8QqCuVxZaEobO3iYdLZMB9jyzE/YzywHkpoZhbu47gZ55R2iJ4fLRks68dU+
         UoAN/LLfyFuYUwVirWtu2p58ODNPYhWve1PVCtXXD3dBdLrGeknbxkji+AL2vqOB/WqN
         c/FkHDrDXgFiMT7McuOjl7gaiJHICa4aavtB/m26b8eA3OFacmUe2j7sp0zHb/nicCNp
         hkHg==
X-Gm-Message-State: AOJu0YxyabUyDNhNVAdl4Yw2sg3Kbk4E0I3fY6K8U1TXM+qmdctdxN8V
	B3a3F2IH4nGYVTIbvJbtwkPZDIdIbzohUGcGt9eZypcukcc1n8d3XQXi0RoAgHgRJi+uiFHQIF9
	8c6x3BxuAT3FrGpdGn4RBbT15F5FVF58EdLIC3POHJRSYGWGvSPol7MISHUF4EHxowEv7V7TTOV
	jJTu6qbmGio43MePf3P3N06rWwb6ELgg==
X-Google-Smtp-Source: AGHT+IF/BrPBwefAZAF+nPxA4LKULExZ+5b87PotOGvn8JR8KwxYqyA6g4kDf2MukF+hhkIvJJDwIr0S
X-Received: from wmbep21.prod.google.com ([2002:a05:600c:8415:b0:43d:1873:dbaf])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3555:b0:43c:fa3f:8e5d
 with SMTP id 5b1f17b1804b1-4406ab7efd0mr181899565e9.2.1745406649377; Wed, 23
 Apr 2025 04:10:49 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:09:56 +0200
In-Reply-To: <20250423110948.1103030-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423110948.1103030-13-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2384; i=ardb@kernel.org;
 h=from:subject; bh=MKwZOwyHZp2LktNRJNcNIldmDczuXL1yEG/m0Ieip+s=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYPj1NSewwzX18rNm8twa/eBX8KXM8/Hbp73ufOwzKu/e
 X71rJs1O0pZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBETiYx/Heynu76UyhKzr7z
 x/qotmjf3ZktISIzxfSPlDNtVZm45CXDX5mdJl8nhF1IiucW1Iy6XFqpfOth9/WV3UX54nyy17/ 95wEA
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423110948.1103030-20-ardb+git@google.com>
Subject: [RFC PATCH PoC 07/11] HACK: work around sev-startup.c being omitted
 for now
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mingo@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Add some PI aliases that shouldn't be needed once sev-startup.c is also
built with __pi_ aliases.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/startup/sev-startup.c | 3 +++
 arch/x86/include/asm/sev.h          | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/startup/sev-startup.c b/arch/x86/boot/startup/sev-startup.c
index 36a75c5096b0..7b9de4479c0c 100644
--- a/arch/x86/boot/startup/sev-startup.c
+++ b/arch/x86/boot/startup/sev-startup.c
@@ -562,6 +562,7 @@ void __head early_snp_set_memory_shared(unsigned long vaddr, unsigned long paddr
 	 /* Ask hypervisor to mark the memory pages shared in the RMP table. */
 	early_set_pages_state(vaddr, paddr, npages, SNP_PAGE_STATE_SHARED);
 }
+SYM_PI_ALIAS(early_snp_set_memory_shared);
 
 /* Writes to the SVSM CAA MSR are ignored */
 static enum es_result __vc_handle_msr_caa(struct pt_regs *regs, bool write)
@@ -1383,8 +1384,10 @@ bool __head snp_init(struct boot_params *bp)
 
 	return true;
 }
+SYM_PI_ALIAS(snp_init);
 
 void __head __noreturn snp_abort(void)
 {
 	sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SNP_UNSUPPORTED);
 }
+SYM_PI_ALIAS(snp_abort);
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index a8661dfc9a9a..9ba1f30eb03e 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -494,6 +494,7 @@ void snp_set_memory_private(unsigned long vaddr, unsigned long npages);
 void snp_set_wakeup_secondary_cpu(void);
 bool snp_init(struct boot_params *bp);
 void __noreturn snp_abort(void);
+void __noreturn __pi_snp_abort(void);
 void snp_dmi_setup(void);
 int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call, struct svsm_attest_call *input);
 void snp_accept_memory(phys_addr_t start, phys_addr_t end);
@@ -541,7 +542,6 @@ static inline void snp_set_memory_shared(unsigned long vaddr, unsigned long npag
 static inline void snp_set_memory_private(unsigned long vaddr, unsigned long npages) { }
 static inline void snp_set_wakeup_secondary_cpu(void) { }
 static inline bool snp_init(struct boot_params *bp) { return false; }
-static inline void snp_abort(void) { }
 static inline void snp_dmi_setup(void) { }
 static inline int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call, struct svsm_attest_call *input)
 {
-- 
2.49.0.805.g082f7c87e0-goog

