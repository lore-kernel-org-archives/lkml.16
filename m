Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF3B299A82
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 19:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747077118; cv=none; b=s/taVS17ukhDQmG4Nnc525WWofUzAMMMOindGugj1sn0bdpmkJXS9zyRSSdtfb1uNYo4byUXDfpL4JSRWDdaxiOHS5hElBjvN3cmKMJJiC6VF3chPy68SXJJZp/zJ51KwNst81KE8kjHBn4JDq0uD53QT9AwkbqbAB8uCAao7dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747077118; c=relaxed/simple;
	bh=aDKXddBmfA7RTqjn2IVQf1JJqM5fseVSyiUbPLA7/2U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Gjy6tz3zgjaftnwPIW4G2L0Ic1nsIiu2qAY3945TPZrLk0gGz+vVgBJIQexgg6bKKyT2zYevHgxfoUR7kaF3WadQ04l4vi4UaHstSWscvbnGfpZP3w1FQOslgViYN3LPcUYPOVN6e6lkhQ0f2YLO/QkqHexpcYuc1w156Mvxmas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PRsqtBFr; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PRsqtBFr"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so27259625e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747077115; x=1747681915; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IkqYSPwglKGsOQATio9iDSPAoMiQZFICU2YOedJQt4I=;
        b=PRsqtBFr8bJruAHNjFNqofk3z33T7WwZh2f1xG+mBpHnLw+DfBgKxc6NIVMI+1aH1e
         jtJYCcfAgepFhoJQb9ebz8qV4pCvFnYH9tvlKhG/o5vd4Amrl/3cmdmjMsIoAnZN3xGe
         1+F11CfWNYWRPFHmm35kL8H+5ADNrkYZjZsDn782LQYhpyM7jqk9YjUUBWZ77e7gzpGj
         vsSlGfhUEvqLXgs6O7z+2MMBh7iFkYvImrsrS0HdfaWF3Agt4nsipGux2ydAQzSOvWpM
         sBrqzZKQtBn4Me9H/E9qriScdG0tj+tYig1sWfBAkMAoQJC/E7R9NlhkEzIsfFHzPhpq
         oCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747077115; x=1747681915;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkqYSPwglKGsOQATio9iDSPAoMiQZFICU2YOedJQt4I=;
        b=MTJbyAmNutEHu76OqZLwKeIZTEXsnVA4xvgbbkktRI5Y+8QteEUZuT2zAib6Rdh/gN
         xDLqhIdGApc5WyXL10y41bI3mqfStB5Rj+zTQnWEpjfjS9DPyy8ykbGfK7R+UDHiYtb+
         LBWWGYcTkNyoLHrFz3ymYZxG1RTKG8mwlnSMUjkdXgrU954p2ksAP4K7fwcexI8vJYEm
         MVMgXdohxMqwW7KyWCNZ2wVHpMkXsJb8cdNVG6+2oLrg3VSoeRT7tKkiOMiHusx+dbX7
         idf2AuPds8S2m+oWzZsMp9xChvUQmB894O228QOQz+3i+kYXOfsVplQO9J1POwxjmHID
         TVDQ==
X-Gm-Message-State: AOJu0YzcRlVPjyBeSvMx9wSO0XG/UR2TU2RlBbpor/1u8/J5BaSKNRuW
	cjaepIyVWOzHrRaRtoKYaFpOo9a9dIlvJTUP0ThvnQC7Z1P8OTESOUxvRa6Ljm+gzLRvAEZ//ap
	TcoJGWKMPeq0CzYA+IuugUTiWCIfgG/zu5z5R61H263kq6mJgeC/cxYSKFAJOFTbe3ylkEcwn2T
	KgFibanglRdw+mtxDo+RcGLsba9E4IwQ==
X-Google-Smtp-Source: AGHT+IEaaHhwrXfd/Wzouxv8CS+dY6uNWRlhAgaStz1xy0fKpo+oVpgJ/U/jRB1OuOMvYFuzaKBDVsRR
X-Received: from wmbej13.prod.google.com ([2002:a05:600c:3e8d:b0:43d:1f28:b8bf])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:348e:b0:43d:79:ae1b
 with SMTP id 5b1f17b1804b1-442d6d3db06mr128986795e9.14.1747077115165; Mon, 12
 May 2025 12:11:55 -0700 (PDT)
Date: Mon, 12 May 2025 21:08:46 +0200
In-Reply-To: <20250512190834.332684-23-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250512190834.332684-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030; i=ardb@kernel.org;
 h=from:subject; bh=qYeNzewJfU+/ilrF/EECZk7hASJcT/OB77Eaj+puqno=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUPJ3bO89LCQuM93j1JZ379X39WqK134fljETN2vQvegX
 5js5HUdpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCJLjzP8D867JiCx7F79VzXN
 rZ9embRJJ8SVX9j3SmGO5XflsL5GIUaGDi4/g8i6fRu7X99UnneS623eoQs9k59tT/o467Ti7ax IbgA=
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250512190834.332684-34-ardb+git@google.com>
Subject: [RFT PATCH v3 11/21] x86/boot: Drop redundant RMPADJUST in SEV SVSM
 presence check
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-efi@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

snp_vmpl will be assigned a non-zero value when executing at a VMPL
other than 0, and this is inferred from a call to RMPADJUST, which only
works when running at VMPL0.

This means that testing snp_vmpl is sufficient, and there is no need to
perform the same check again.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/compressed/sev.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index fc0119bdc878..68fc3d179bbe 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -403,30 +403,16 @@ void sev_enable(struct boot_params *bp)
 	 */
 	if (sev_status & MSR_AMD64_SEV_SNP_ENABLED) {
 		u64 hv_features;
-		int ret;
 
 		hv_features = get_hv_features();
 		if (!(hv_features & GHCB_HV_FT_SNP))
 			sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SNP_UNSUPPORTED);
 
 		/*
-		 * Enforce running at VMPL0 or with an SVSM.
-		 *
-		 * Use RMPADJUST (see the rmpadjust() function for a description of
-		 * what the instruction does) to update the VMPL1 permissions of a
-		 * page. If the guest is running at VMPL0, this will succeed. If the
-		 * guest is running at any other VMPL, this will fail. Linux SNP guests
-		 * only ever run at a single VMPL level so permission mask changes of a
-		 * lesser-privileged VMPL are a don't-care.
+		 * Running at VMPL0 is required unless an SVSM is present and
+		 * the hypervisor supports the required SVSM GHCB events.
 		 */
-		ret = rmpadjust((unsigned long)&boot_ghcb_page, RMP_PG_SIZE_4K, 1);
-
-		/*
-		 * Running at VMPL0 is not required if an SVSM is present and the hypervisor
-		 * supports the required SVSM GHCB events.
-		 */
-		if (ret &&
-		    !(snp_vmpl && (hv_features & GHCB_HV_FT_SNP_MULTI_VMPL)))
+		if (snp_vmpl > 0 && !(hv_features & GHCB_HV_FT_SNP_MULTI_VMPL))
 			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_NOT_VMPL0);
 	}
 
-- 
2.49.0.1045.g170613ef41-goog

