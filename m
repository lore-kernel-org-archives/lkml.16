Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9784D2236E4
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704625; cv=none; b=eWyBTXRsPiKtqM3mRFH0etvV15R1r3tnq0yIh9tiPLyHtJA16NI5FZmmKbSRa/4vK+5bIoofd4YPi/vz8em8slEAOxxV9yCWzUv4TAj5QvlXhgtVLS+6dWOVEMKV70uzquHpxhELLgpv8Pljh3V9Nzj4EBo5/9RSNNTkQH5s9jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704625; c=relaxed/simple;
	bh=mVxjU99n31HrBlGza8EtQuypLaCGN7Humj2ntyYV4Uc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tlAecCMEn0nmUUZpzzaEJcSS/LPz77g9ULXlWlSlHzRpTbc5hGEncvMGS3tsTzoatMDqzNlIiO/Z4InRxgbQfqZsqqNO5nLPRbkOvvJy81rSmTwracJU+6CXxcdOnW+MAgW+AyT/B6eAPKE+y6jy62zX//CosyW007XoMm/kJVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EsKgS2Ou; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EsKgS2Ou"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso6064165e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 04:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746704621; x=1747309421; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bpwm6pDMroooW2YqC/KslLIOgf8WNN2/GA1ulGmQzEk=;
        b=EsKgS2OuoGn5Jg8jtUHkUc0xdXZvUzjetUDbp3HROK3ixRrOptloytZjI1s8/8R6co
         Pfe+E258fO4S2Sgeg8zFcZzE8FE92vPADFjhgevAK6dzivKQuIJq0ypOjiS7WTtdqZ0x
         fu14mKdUgtCu5EMaht47mix3taC1gl0m6sGSCpg9OB2ho4osJjyfgx8SN9aRq0oykW8M
         G/7SUHDgBI/MRVi/Z/leVedBoQUywjw+VRlArcSIrbeHymP47Y5L3zfF5Kw0RGHRqtrg
         fdmfabgf/JiiCFiBBpfCyCR/fw6lGzXDriz1yCZwlZPvwOfg76MEvKIDZmiiL8p6b6T7
         aDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704621; x=1747309421;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bpwm6pDMroooW2YqC/KslLIOgf8WNN2/GA1ulGmQzEk=;
        b=rGbQ10JEFheTpu22IUPyLC6KYGsIa03LhgXjgYnsOowIOl5IBwZUju6ogQDBfIDqHW
         wccLHzjt4/iLejWnpuAFQxsRiOV34bxukDA2vI8LGFwCXahIhHTdbg73VPfxF4JOXF/R
         49/8OaeiJrhk7xQOyZ6JRMd/oUGxJHd+6oXiBrPs3ljIk/NNU4aa1++dZT7jF6b8QSUk
         e6+cZtPzzRJWPsAPKk7r8LaC85FrqLhuYjMiToHaBH8SH0zyXFnUcCfTvXCcHpOFqScx
         jJZi5LkdU7qCiw+2eF5tUepMeGEyHnjzTnsQbjTSMNb9Pm8HSTkj3MuENejRsjNwi1z+
         yYHQ==
X-Gm-Message-State: AOJu0YznsYb5JBeKhbvtt+bRsHLBKa0r2nRz4R9ibSH4KCgcWTFY+l+A
	gzgUNFNI8THmHDUqfMfkHJ4+AWo7mAxuHyZGTf6O3Nq7bbgD+VtXMQ1EyE70zgbdqYcn7g==
X-Google-Smtp-Source: AGHT+IFG/ZuCQ/+26pPq9ukelXiqSOvAL5bCK15tfzAkfYjQ6XoSb9As+yOPtVe7L+pFX8orsfcASQ1E
X-Received: from wmbdo21.prod.google.com ([2002:a05:600c:6815:b0:43c:f6b3:fa10])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8714:b0:43d:1b95:6d0e
 with SMTP id 5b1f17b1804b1-442d033a3d9mr26273835e9.23.1746704621043; Thu, 08
 May 2025 04:43:41 -0700 (PDT)
Date: Thu,  8 May 2025 13:43:31 +0200
In-Reply-To: <20250508114328.2460610-5-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250508114328.2460610-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2150; i=ardb@kernel.org;
 h=from:subject; bh=CKHvAG0z7Zm+FmDzWOKAeYGz1T+VYqK4Y0hoS74iP5w=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNmxpNSuUXf5nPfSf8WKnSK9eTdh2w755dfWXug0Wfut
 IMfw1eGdZSyMIhxMMiKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJBDcx/JVdc6HXd8cCV0GR
 ophczU0npNZFH95/kp9/0vn9gRyOu6wY/im8lZhWNCfu+uVpgi81Zrc0r/x+YdYh8VuWEtJ7Ln6 W3sUGAA==
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250508114328.2460610-7-ardb+git@google.com>
Subject: [PATCH v2 2/3] arm64/boot: Move global CPU override variables out of BSS
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Accessing BSS will no longer be permitted from the startup code in
arch/arm64/kernel/pi, as some of it executes before BSS is cleared.
Clearing BSS earlier would involve managing cache coherency explicitly
in software, which is a hassle we prefer to avoid.

So move some variables that are assigned by the startup code out of BSS
and into .data.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 22 ++++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 4c46d80aa64b..2cac5e5ca94d 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -765,17 +765,17 @@ static const struct arm64_ftr_bits ftr_raz[] = {
 #define ARM64_FTR_REG(id, table)		\
 	__ARM64_FTR_REG_OVERRIDE(#id, id, table, &no_override)
 
-struct arm64_ftr_override id_aa64mmfr0_override;
-struct arm64_ftr_override id_aa64mmfr1_override;
-struct arm64_ftr_override id_aa64mmfr2_override;
-struct arm64_ftr_override id_aa64pfr0_override;
-struct arm64_ftr_override id_aa64pfr1_override;
-struct arm64_ftr_override id_aa64zfr0_override;
-struct arm64_ftr_override id_aa64smfr0_override;
-struct arm64_ftr_override id_aa64isar1_override;
-struct arm64_ftr_override id_aa64isar2_override;
-
-struct arm64_ftr_override arm64_sw_feature_override;
+struct arm64_ftr_override __read_mostly id_aa64mmfr0_override;
+struct arm64_ftr_override __read_mostly id_aa64mmfr1_override;
+struct arm64_ftr_override __read_mostly id_aa64mmfr2_override;
+struct arm64_ftr_override __read_mostly id_aa64pfr0_override;
+struct arm64_ftr_override __read_mostly id_aa64pfr1_override;
+struct arm64_ftr_override __read_mostly id_aa64zfr0_override;
+struct arm64_ftr_override __read_mostly id_aa64smfr0_override;
+struct arm64_ftr_override __read_mostly id_aa64isar1_override;
+struct arm64_ftr_override __read_mostly id_aa64isar2_override;
+
+struct arm64_ftr_override __read_mostly arm64_sw_feature_override;
 
 static const struct __ftr_reg_entry {
 	u32			sys_id;
-- 
2.49.0.987.g0cc8ee98dc-goog

