Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5002153C9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744822687; cv=none; b=SIjWLLKjFWuDgvtN6lzi7qkm16MSvmScLumY33G1ut2EfpuQLL1yIa2801bPPbkr6Vqbwjv/QfOQXSuLzauCO3IIir61A0Q4cPUaV1DLjkH70ogdU9gbbF4xnx0b0ph9KoTLxC638bNot2NdiVY7N1lKIPZOtuYOtMx0uUIJYEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744822687; c=relaxed/simple;
	bh=lRe9hLNbP/OaX7MwertBxcNmClmRysFfc7d6hRijpLE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZzvrKuQ1qFvAcIVrzJ+74vNKbhszB8Sbb+yo14LJG+RM/minsHh0Bm431I3DccCUIkimn07+fs21zjf/8QyVz9QL7VRBjGs/mc40VQtJJhhTUYJHD6gegC5END1NPzYrIvuve5GJAqCIkdBtAnoxSWa7KRd93w46vhJHePsUu+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bhVv7x/C; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bhVv7x/C"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39141ffa913so4050755f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744822684; x=1745427484; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tTCjlI4jRJCYXW8u75vTgWDWUcDqLf34EMngrdWGbjQ=;
        b=bhVv7x/CKWnip8gzLTXFXVbMDBHkBKO+3wvFYzFi9uM7cEyLO7pzPo71Ys6Dff28OG
         flXBbV6lKJ9puiotuxVpBaW+d0oIknxoqFN0fuJydB97FxYwlGsl1S6gKwy5Llggmpdf
         p6GKI4/wcBBOvWpZa8yx6X6S/G6ADpHoHE96pEH2A/0WrkBVlO3YdjYbMSq+UHpeTu8v
         FBS3XAGHcAVTc9yI7cMByemb/U9OUblELetW16LCm6gZOIuaIdfeRiyCTM6WHi1d9jsP
         phHpRXSN9/7Y8O1kAqnXMSg39ocGwv/mpFS/ETjco7UDcIm++nO47vxZ36WRQOmWzLSP
         L0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744822684; x=1745427484;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tTCjlI4jRJCYXW8u75vTgWDWUcDqLf34EMngrdWGbjQ=;
        b=c8OemniScfT0blWxvQcsBql5k/hg4u6rnObqyQZygofjru7BNJBUrKmfjLE3T8u1rj
         o3s366uA8BdfEAuU9Oo1zUTmFgKSK3qmVw9D8lmT/C2eu9HaRDPrTuHHSF/dYbOGJbVX
         H80U9Qeod1ejapc+Ha26/0+7suCjJGTY9bmyORJqIZG43/g2VJDZWHwBpTc1JjNP0kpp
         ubcnDO85QsoEM0D0yxzanVZXR8l4w+K1/edOXLyKxdEqkpqP/+8gz8jQojOaNR81/20o
         /xaVk6oo1IrGEyz0nRNQOFP1v9/tlXzjEY2FmL/eC5CB8DBAQQp/dLcwEujTr1ZIVjkk
         uZLg==
X-Forwarded-Encrypted: i=1; AJvYcCWheilmqf5ob/OXePam960PuOIR+ofyTEDRxrR0EaWL5ydMgPjrnQQhR1pRlBYsCjX8AasnuISJWL2Km9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjRn5Qpj/xVZacgbVkYKu4XBtdsBmY0Dg+UZ56tsNdw966Xm7U
	/t7UdbbE8sFU6Z1uEzRR9WwxYlLLky5tAkjLqK4w6DnXS4/qz3a/Ip0vGAztVRcNTW2AuA==
X-Google-Smtp-Source: AGHT+IFjJecSiikc6rQEhoneDuSkFJVjN+/qGiEBByEyYjO0q6UyVDW7J9WRNaZ2JfT+PQvbqLm0Nn/D
X-Received: from wmqd11.prod.google.com ([2002:a05:600c:34cb:b0:43d:58c9:bb51])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4308:b0:391:45e9:face
 with SMTP id ffacd0b85a97d-39ee5bafdf9mr2248386f8f.54.1744822684335; Wed, 16
 Apr 2025 09:58:04 -0700 (PDT)
Date: Wed, 16 Apr 2025 18:57:46 +0200
In-Reply-To: <20250416165743.4080995-6-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416165743.4080995-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2029; i=ardb@kernel.org;
 h=from:subject; bh=10Qa3f8wkjUVpqoovejQoxb1J4k9EmK+vNsm5yY59B0=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf3/w66LT23T1O/2bvrhs2baJ5v3zy792NWsNPVOYMiss
 EU3/TPCOkpZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBE5PQZGd6nL8+J2Hy3tj3D
 bPL2xxKn7T54+YdKrZmrZc95k3tbvx4jw8atcg277qvr7nvT8fb7DlYp54xtVVarzBg85B1O1LU 9ZQQA
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250416165743.4080995-8-ardb+git@google.com>
Subject: [PATCH v2 2/4] x86/boot: Drop redundant RMPADJUST in SEV SVSM
 presence check
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, mingo@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Borislav Petkov <bp@alien8.de>, Dionna Amalie Glaze <dionnaglaze@google.com>, 
	Kevin Loughlin <kevinloughlin@google.com>
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
index 6eadd790f4e5..26ba997c45fa 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -617,30 +617,16 @@ void sev_enable(struct boot_params *bp)
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
2.49.0.805.g082f7c87e0-goog

