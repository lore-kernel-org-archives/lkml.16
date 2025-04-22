Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBB12139D2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316473; cv=none; b=clN3PgbnIgqi3o1T4D76buaqVLz+72X3WNXplQ0t6MQIiqwMhG8GUBFhl4Pwf5b3bX5FPVPWnHD131B65x8P2qrEB9Ex39sy7DMrYe1wCfIOv5v1Bo5/ab/Xj3KX/rtMBorj92ZVxizwKbNFDu1Lvuh048C6AyvwL9acDlsXgGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316473; c=relaxed/simple;
	bh=KKcbrMdslJS3KqxM2rvT9SplQa/vHb1kxDbA0qf2uN4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ELDq91snXjni8Y8bCpC7bX5G+9V5AXZXGjwUfubtzXOKTO71BWzfWsRVyd93fHZDeU97Tgz10Nxs/+54IUyCLqz/db50X9CUdWwjwnDkWJx0VnCCFjHF03/4NFOdmf7giEklkY8bvpd763pr7pWCK0rXYUw938sM5/tngcYFR2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vrBDxmLe; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vrBDxmLe"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso27578085e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745316470; x=1745921270; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L7Kr6vDedMX0dT5Gf6cxn3wiC8Sh0DwFdYKN5ceJbMA=;
        b=vrBDxmLeb0baJGXB3OLhVqILR8eVUcm1HJbjIE9g9KjjZNXqz/KyqMe3sehegM6brR
         l6UYyFKI2tdrcvBSOQGCz4iSIbF6wbfgNWAvHAQ6KYTM5Uz0vnmf/H6akFRNBVjzJG45
         7kYvHI4GNIRBZReMk+NxA2Y5oBVW0n/DvHBCJXq1CWXhIIhXEpVu0mamYv8nWM546bz5
         oDt4Mre7MzE4NBYTCyHn/NbvML3rdzkjfwkFqP1T48swova3vMXHEQ6zASmnN1AFcIE1
         jx6wQ20Own3OnfLoatLjYp618OWp97IQ4lzjkCYxZ/VpaLZRV1Rd1TSrwg9CjF0Gwfta
         FpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316470; x=1745921270;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7Kr6vDedMX0dT5Gf6cxn3wiC8Sh0DwFdYKN5ceJbMA=;
        b=GH5SgKOrilzCT8TDSq7vACXYedfzZw3ZAnix/L9VUrEBL282vTiQfx0LzAKc4j8zan
         7vq4CNitzyCABMPiaAJSP9orlNHHdir9e+XXaxlzzG8kusLTF3eQ3NK6tQVG4vaXm2P3
         PY07WCuCtZEevsGBeYVxb3svKBBp0Q0PBKBf+izn5UH33rVxPUJWTtt9uvjKXvWtVTHi
         pWzVQgjyR2OzqZJ3UR2XSq1ch/ETbbqorrRYr7gtcpDZKC4UfdCrRxQ7S9YguzQeZTwz
         /w5nxejG5wsBKY0QNoLSBtwnqd42pamPP5lqkevw5yxCxq/XYWBSrr8RSD9t1IEhLTzh
         nT5A==
X-Forwarded-Encrypted: i=1; AJvYcCWVlbCGdwt73UYBbZjCzo135DWURpQZUaEi3xSMo+YjjSM3q1NqLakVY8xigGOwcRXbn4eSUeve2Qp1XAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUfrw7pmM90O2n2aBlhREflFSAuVYieooOG5isIZ0/sxlNUQD3
	bky1Ig99t99VKHx2KppXt2GqIDKmg8s1+sWRexQLlWx5XJyna4k2+inkz0eg+fYiK9P6hw==
X-Google-Smtp-Source: AGHT+IFmFUN1kctZDCn1yQZ52mc7bsumWthyC0zjUXvM1+3eOyXNDdJZE7OfEKY1eyc74rzPAkGNr9N3
X-Received: from wmbbd21.prod.google.com ([2002:a05:600c:1f15:b0:43c:f7c3:c16e])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5023:b0:43c:fa0e:4713
 with SMTP id 5b1f17b1804b1-4406ab7efadmr150700145e9.2.1745316470037; Tue, 22
 Apr 2025 03:07:50 -0700 (PDT)
Date: Tue, 22 Apr 2025 12:07:32 +0200
In-Reply-To: <20250422100728.208479-7-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422100728.208479-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2029; i=ardb@kernel.org;
 h=from:subject; bh=PPMFqT/zi9DvnPqyl+cEjK3zE5nLJOScfPcUNRpIYsc=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYM9K2Pe2poFH8/IHl5zcyvXu86v7DMnsZsu+vB/nfH8J
 QxN8TE/O0pZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEPNYw/JVZXDb3y5tvCf//
 1yv4mP1PDH/odi1yyl1VVXXJS00mvzIZGfZLT+wu/l+msmt7AcOCOfmmX5tdXdP3Pz69Z1/mjgc LfNkA
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250422100728.208479-10-ardb+git@google.com>
Subject: [PATCH v3 3/5] x86/boot: Drop redundant RMPADJUST in SEV SVSM
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
index 478c65149cf0..91a2836b20a1 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -582,30 +582,16 @@ void sev_enable(struct boot_params *bp)
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

