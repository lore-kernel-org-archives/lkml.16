Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFBA298C36
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 19:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747077104; cv=none; b=pUWjuPkOTD1zaAM8d0jjduSWiyHaGkOWX8AbQOnbZ0WC6ebj8cgFmcfQUBQCav8XL72aEZpWzekzl0mAt4p+OkcuGrt36O3wMouX9LDuQ9TIDAtxJIOayv0LgLBeuwCnQ+4GdgJkWGmsRRntgWiivJXJMMlnyy9/HnUq8Tucw5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747077104; c=relaxed/simple;
	bh=N8lIrN6QnYWQRxj3loyK87tJKBDaO7dJNOxuR7UZwmY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NHzc+dUkgarwqyde1ffuZjQvqMf+BN1HqSlHi0DjGwsl8ZQQdMG/3+IegZNfoCXi3pQyJYGnDWYRwPFt0qJ0TtIUz8tiF2AYBHQYO8otIFig8EDa3VTCJxhrONffkaNeK84DFOjSsqDRAmazvGv58nb+kMw3sgaezQfZKcarlfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wUtImQtJ; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wUtImQtJ"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a2046b5e75so532726f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747077101; x=1747681901; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yAKS3akGBR/9SddxoYh5t/3Kaeg1HbH4Cc4GvmNf7kc=;
        b=wUtImQtJBDXmt4kjPAk33q0f3OAdM1UB9jlrtKhPnGg3zpPfnXRJehSnUe2qoFDXcU
         OBjAvVO13mYD13vYlTkJBXTVDDES8inZHj7ODljrq9uwWWu6vYSVTfVc4xAAd1uk5hP8
         XmUlvtSZoM4EaYhvPsX/l4BhvmDs3ZU6MgUylx6Z5KanRJlN/dDMit53TpItxxDynsTM
         IdtThM6XN97A11VkGM/uu+MjhmjbMnB6VIVc4h6p1T1tkXL5POZvoEMgeQvpEebaRDZy
         g53GxnAIq2W/2UylK+zYESBdlGYxTmoWb3HQRg8Lo5ALgaKx8QGPl/jqp1mbTS2d70wm
         yRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747077101; x=1747681901;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yAKS3akGBR/9SddxoYh5t/3Kaeg1HbH4Cc4GvmNf7kc=;
        b=oHUbhTu+xorw7S7C/EsJGwqSgaYgVnhTlLQschiYWqBrVhj/0s9Hv/dgJ6TPy1NlAn
         HFhOG3uwySe3M37XVJGoNfT0abhEI6RaOfBwClcyxpD8adCvyUTi9WuqpRNP+S/mC1g7
         W4aO1Iarm6hSy13FXVPpVG9imJlHri33I8IqQJFbHq0p/Yfq5VvzNZ2lDzPR+i9proT0
         zOPHhOhMEO9T0gcIf2y/OlcOdlHZ85sz4W89G3Yfps9xcregPdcvUSpBb223FjGVAtF6
         sfX/WUy3FoGHhZk8hdiKXg54iPUahZkENUMV+OowVKNyVzgTgKHsfmxD8k5PKQRmdzdG
         dOyQ==
X-Gm-Message-State: AOJu0YxuN9OiwzxDjTPsJmunnGyrlRLXmDA1Nuq8Ev20nnD/hac0p/tp
	Qdkn6shoKFNnHb4rSEyjLhplmDrSSw6muDErZRXn7bniXWsH7+jTshUhNiMJxtRjPni/Dkk0csq
	cQ1XK92OE8TxTBsF19rJXsP92YiM8U7aLu8e8Q6SKMGjNgr6QDoQd8Xm+2YkicPt9fgbjb38WYL
	7pJ7282kk+hkemjPIDLJUlWmXiVZHJOQ==
X-Google-Smtp-Source: AGHT+IGX1Wukqh3EK0YfLcD9ed759VITS0iUHJbGg2BkqMIQpCmp8NgTxMLsY1cSzdbBmJab7Amumzsu
X-Received: from wmbhh12.prod.google.com ([2002:a05:600c:530c:b0:440:626b:cdc])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:3103:b0:39e:e217:28c0
 with SMTP id ffacd0b85a97d-3a1f642217dmr11281761f8f.10.1747077100813; Mon, 12
 May 2025 12:11:40 -0700 (PDT)
Date: Mon, 12 May 2025 21:08:39 +0200
In-Reply-To: <20250512190834.332684-23-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250512190834.332684-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2831; i=ardb@kernel.org;
 h=from:subject; bh=gyvK1vVt7xT2yPdX1EeqNZBgIdQd81Ru1FpgpHIYf3o=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUPJ3UbMLaG9Z8ePSUG7V/zZ0Gt39cOFEv7j8hw9drPiU
 6MfbdvSUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZy+R4jw8Iq14cHUy47Hbwz
 /Rz3Uw7zD7whh9wn1m5f/oA/IbNv80WG36y1Ghd9X/WmWtx/u+rrCY73Ykmx/t9O7yz0eWXFs7L 7CC8A
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250512190834.332684-27-ardb+git@google.com>
Subject: [RFT PATCH v3 04/21] x86/sev: Run RMPADJUST on SVSM calling area page
 to test VMPL
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-efi@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Determining the VMPL at which the kernel runs involves performing a
RMPADJUST operation on an arbitary page of memory, and observing whether
it succeeds.

The use of boot_ghcb_page in the core kernel in this case is completely
arbitary, but results in the need to provide a PIC alias for it. So use
boot_svsm_ca_page instead, which already needs this alias for other
reasons.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/compressed/sev.c      | 2 +-
 arch/x86/boot/startup/sev-shared.c  | 5 +++--
 arch/x86/boot/startup/sev-startup.c | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index bc4ec45d9935..2141936daba7 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -327,7 +327,7 @@ static bool early_snp_init(struct boot_params *bp)
 	 * running at VMPL0. The CA will be used to communicate with the
 	 * SVSM and request its services.
 	 */
-	svsm_setup_ca(cc_info);
+	svsm_setup_ca(cc_info, rip_rel_ptr(&boot_ghcb_page));
 
 	/*
 	 * Pass run-time kernel a pointer to CC info via boot_params so EFI
diff --git a/arch/x86/boot/startup/sev-shared.c b/arch/x86/boot/startup/sev-shared.c
index 297d2abe8e3d..9c8dd6bfe833 100644
--- a/arch/x86/boot/startup/sev-shared.c
+++ b/arch/x86/boot/startup/sev-shared.c
@@ -782,7 +782,8 @@ static void __head pvalidate_4k_page(unsigned long vaddr, unsigned long paddr,
  * Maintain the GPA of the SVSM Calling Area (CA) in order to utilize the SVSM
  * services needed when not running in VMPL0.
  */
-static bool __head svsm_setup_ca(const struct cc_blob_sev_info *cc_info)
+static bool __head svsm_setup_ca(const struct cc_blob_sev_info *cc_info,
+				 void *page)
 {
 	struct snp_secrets_page *secrets_page;
 	struct snp_cpuid_table *cpuid_table;
@@ -805,7 +806,7 @@ static bool __head svsm_setup_ca(const struct cc_blob_sev_info *cc_info)
 	 * routine is running identity mapped when called, both by the decompressor
 	 * code and the early kernel code.
 	 */
-	if (!rmpadjust((unsigned long)rip_rel_ptr(&boot_ghcb_page), RMP_PG_SIZE_4K, 1))
+	if (!rmpadjust((unsigned long)page, RMP_PG_SIZE_4K, 1))
 		return false;
 
 	/*
diff --git a/arch/x86/boot/startup/sev-startup.c b/arch/x86/boot/startup/sev-startup.c
index a1d5a5632d58..1f928e8264bb 100644
--- a/arch/x86/boot/startup/sev-startup.c
+++ b/arch/x86/boot/startup/sev-startup.c
@@ -303,7 +303,7 @@ static __head void svsm_setup(struct cc_blob_sev_info *cc_info)
 	 * running at VMPL0. The CA will be used to communicate with the
 	 * SVSM to perform the SVSM services.
 	 */
-	if (!svsm_setup_ca(cc_info))
+	if (!svsm_setup_ca(cc_info, rip_rel_ptr(&boot_svsm_ca_page)))
 		return;
 
 	/*
-- 
2.49.0.1045.g170613ef41-goog

