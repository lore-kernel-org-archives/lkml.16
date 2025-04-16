Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F83214A74
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744822685; cv=none; b=tABEHcDPG6OAZlgN7hfli8uPAx14HCdB85vtAsMQa/edAQRLx3Bkez197PY3R9Naaw/VtGVZ8+0v/STa5u2NsQGWBvz2rVdkm/oTlrbeU0YO+TepYjh6XisMSGlWegLPcpO7L6oQiDeCBes0bc3smZwUh+kmHdmakvvMnSH01Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744822685; c=relaxed/simple;
	bh=hLfvkW2dil561oNPEdZlU+Dh02P84Pkkg+e6wBeW1xs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VwTOgKEpTOcQJ4Oj4iFBr48M7m7BLOh/cOiNlAtF+rjf7va5nte3Pr5gXnEFIj8T5zGA8uHkOkg725Yaor/A26Hfnu51gxQO8hRsjDt19K6ZipcYDHY1CmxH4FnXYagTxkig5yDcqYGcGEQixixk+5jLmXa5wBOiUI/EYfEtgcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B74jDL48; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B74jDL48"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3913aaf1e32so4000585f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744822682; x=1745427482; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=upqUq0Fa7EAF72jGlng+4tK3QC6Z7kLIehCFLXDq35M=;
        b=B74jDL48lJ/YoXD8IuAsPtH+uhi6wjwq2Qme8pKEKau6I+TvFSocreQQl9QoZl8eFW
         ZBiq5VN989I+3lbNFXldLWlMlBKQhrlMTGTC6vrJBUacdANa7NT4+Bg1BwRiQ8BbaGQ8
         N+eFqIzQYgAgiUTtKakq5uGEkWh82m62TuMOBHtQKK+jxnxeYOAwJ3z3f4FbpsCGPApb
         laQgQxH+nyba8aTtBi3icw31Q9Z9aRC2AtrefgUfQf4Kr/i9jMdwiZ+wHr59MbKRO52Q
         N5ICfiJWwO5Q2YfvGdhkYmFUolBkCdDgktLz10+pwizku8sMWocdU5fcpJ9TC2wrLhcc
         +IFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744822682; x=1745427482;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=upqUq0Fa7EAF72jGlng+4tK3QC6Z7kLIehCFLXDq35M=;
        b=RH5Gak1RKDY10C3aUrvvv7LnHQ4DG/k57V5TJqWoohC5MghuZ/dR0lgwXrvHcSFlrq
         aXSovAdJr4QY3wcsLifWZhqNDv9wMDEg5Y30syV7e6b8Up6TMZj1spcBPffpsDZMvKSU
         bsWokW58HlhcTnt8G0AujbteJRUCuZ8p/1NPlCIvIwAswBuhrQ+DF76gK8BEa/9iQQ8e
         SXPkdvpuP0SzI5fdcApltvlyfMClHqD2TFt7Q38lVqv5ZuLtFW7+FutUPkqnsSxbiKIO
         Jhwwmp+f5Ve61cSAGQDmyMbJTE/426fs67IQ5MAZf/LUwcHx4yXzAkiUWcraYvjbPuXV
         y9bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcu8q+mK5J7+CU9AQevYWQPzM7q4lcagt3xl3dQmoMha0sz8Isg0SrSImYzaIZ9pquEwuYvEeooqV/zms=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPtaK4qm9rAJTpCpUBPC/CObcsynlXIPPK9hYplYLHUFMKo95N
	cPwJXkpssKAuVo94Xf6oExTq9JgWyi3v/wstqPIVxWmV4WWo374gJbiSWLldjGeMszY7dw==
X-Google-Smtp-Source: AGHT+IF3ubUXtqkFiF/bLP26+ML6WQicJcyTwlloYZXgaklZzd/7iVicbPvQV1q9gab5qSCOg9NeqFCb
X-Received: from wmqh2.prod.google.com ([2002:a05:600c:3502:b0:440:595d:fba9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:184e:b0:391:38a5:efa
 with SMTP id ffacd0b85a97d-39ee5b163c7mr2836685f8f.23.1744822682232; Wed, 16
 Apr 2025 09:58:02 -0700 (PDT)
Date: Wed, 16 Apr 2025 18:57:45 +0200
In-Reply-To: <20250416165743.4080995-6-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416165743.4080995-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196; i=ardb@kernel.org;
 h=from:subject; bh=zoTGlyeTZ8cicOcp90d6H9mDgz3rJQHzXOqjzEb0s/s=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf3/w84HUzf0W75LeWF6fdPR43GNi3/ptuSXe+kLTDEo1
 bIzDnrQUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZSw8HIsMm8LzPgTecT4ah5
 Z3fsnVx5sk5v66fNH6+KfNivpLNgRjEjw957VcW3e6LKeRfFbxa6EbHW7738W/unGnsvPl7Hqua ygRkA
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250416165743.4080995-7-ardb+git@google.com>
Subject: [PATCH v2 1/4] x86/efistub: Obtain SEV CC blob address from the stub
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, mingo@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Borislav Petkov <bp@alien8.de>, Dionna Amalie Glaze <dionnaglaze@google.com>, 
	Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The x86 EFI stub no longer boots via the traditional decompressor but
jumps straight to the core kernel, avoiding all the page fault handling
and other complexity that is entirely unnecessary when booting via EFI.

The SEV startup code expects the address of the CC blob configuration
table in boot_params, so store it there when booting with SEV-SNP
enabled. This removes a dependency on the later call to sev_enable()
(which is going to be removed), and permits the EFI stub to fail
gracefully inside the guest rather than terminate it entirely.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/x86-stub.c | 21 +++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index cafc90d4caaf..d9ae1a230d39 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -681,17 +681,28 @@ static efi_status_t exit_boot(struct boot_params *boot_params, void *handle)
 	return EFI_SUCCESS;
 }
 
-static bool have_unsupported_snp_features(void)
+static bool check_snp_features(struct boot_params *bp)
 {
+	u64 status = sev_get_status();
 	u64 unsupported;
 
-	unsupported = snp_get_unsupported_features(sev_get_status());
+	unsupported = snp_get_unsupported_features(status);
 	if (unsupported) {
 		efi_err("Unsupported SEV-SNP features detected: 0x%llx\n",
 			unsupported);
-		return true;
+		return false;
 	}
-	return false;
+
+	if (status & MSR_AMD64_SEV_SNP_ENABLED) {
+		void *tbl = get_efi_config_table(EFI_CC_BLOB_GUID);
+
+		if (!tbl) {
+			efi_err("SEV-SNP is enabled but CC blob not found\n");
+			return false;
+		}
+		bp->cc_blob_address = (u32)(unsigned long)tbl;
+	}
+	return true;
 }
 
 static void efi_get_seed(void *seed, int size)
@@ -829,7 +840,7 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
 
 	hdr = &boot_params->hdr;
 
-	if (have_unsupported_snp_features())
+	if (!check_snp_features(boot_params))
 		efi_exit(handle, EFI_UNSUPPORTED);
 
 	if (IS_ENABLED(CONFIG_EFI_DXE_MEM_ATTRIBUTES)) {
-- 
2.49.0.805.g082f7c87e0-goog

