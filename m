Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9CF1DD9AC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 18:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743617324; cv=none; b=PH6RiAT5qEwLV8PZcmIl/8bEmeG3EPtoZnT3W6EqXRltebBN+nbLgAbw+Zl/0GHVBfRAi09tnyEWyYxSbfYFOq5phKgzNXJe5oeAaXiRdtfS81NLocMt18QXZlSwvYAjYyUvQF3vzi9yEUX5DZugTvbF5f+/3OdtHhEc3qxfdm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743617324; c=relaxed/simple;
	bh=2XFp61LUbantVtompWwXRVGV36s9rYUFINYm6RlQLgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlXebT66dGMMQQ8Dksx2SP1hevbUqnSfo7K9E0VflkFopzHsMNLEM/uqyoWHKGR9Db+P+8k9a6tUAvzTEVwH85tJiUhPNl00PthgMB6XpBkKNlC2BIEq8fxAen63zPAkampjZoZe8/k6A0n4eb7ii+osvnU0HBd3IpHLDJAResQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BghJwoCR; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BghJwoCR"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so7934766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 11:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743617319; x=1744222119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPMsdVc1pXHcg4OtpLAWOiGnzfmJAEzTq2pPxu97R4k=;
        b=BghJwoCRtfYpBKeMzWd7rvA1XvvCYIFNFVUBt1GQ5Q40op5k2EEkanMq5O7TkeiNmL
         rg194AzL3cCiCIX3BKFFZEiyiQ76QMouhNLuCqrkcMA0RuR/0P/tF1kDro0JoxjroUA/
         F6IIjsNjMUh2gemzCO4mxVnsjQLLcwu1X6W7dGJTxbAG8wcaxTjKLKm8SpEw3RhI2dAw
         0B+DPE9mSIkFDdfNEGVz2E0kJFsO4uUPcRAfhDoYGXAhGT2b7KEvJQ6moY2urDbglfF7
         xun3qrM2SoDM+N7qIArfekzePbWz9QG8X2yf5U4G097jElcmRQ7ZzmyIrMAjvb2Uqzrg
         t2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743617319; x=1744222119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPMsdVc1pXHcg4OtpLAWOiGnzfmJAEzTq2pPxu97R4k=;
        b=NussvsypI8wKFjzs/Z3sQWOSqC54jzf6/Ca6JuMF32d2yr1X1fAgaR+dh6/DTJKjkR
         T9o2k+TJSjOQ5+T2U4edWYwfH0yzeidzCv3fciJ/znPRa044rBYj126gwfwtx9g7kruL
         wIJWZ4WMMvq7Gvu7uxzqBy+ALQoWl0ZWR9TBsKifIPgpvEwF1mrFO8Ijhqt/q6E5Bpj2
         u0geXlqR+TYlZRyrFFkcItGZ6ZcgsUjB4WhWjbXOwyd1f1pjX5dtd2WX7BOalFzMO/Fi
         VPBD+Y+bYdDMOFSLMmfD5m3d3dG9SekW+rEfwIxE4gFtSzXzNntVx/SllgUok/yYPW/e
         bgQw==
X-Forwarded-Encrypted: i=1; AJvYcCXS92spdi/Z9gFauWVrzaDVAQJKT+PpH0DNVlYs5lretE1NKAvgVPWMbYdmmO4xL9j/UL2bgatvLwM9XhE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP+LOTFGM1e0YgpxMc8GS/NMydi1wDD4RbWC8/4iaeSaZHzrN0
	EvJzZpnbYhb85pwiKeQKlwVk69fqNdu7zP8oVJoUjP49VLawfEMz
X-Gm-Gg: ASbGncu7B/zpeP0Dt0wMpUJ0QRKPJRRqZpsEFGk+z54tvonMQQeaUEnbjCyEGqAzohc
	dq4tMd2tgqe3v496yI492FAVSjoqnpwCMq5MzKVZz61tRsNmfDD73uoVSTmeBZdFdfiAhuHtM62
	V0jOCX8okYmTVQJumKEud2T/n1Di2IaFrKgO7/a1YBBXXAdVxw52wAFy+IIZ60Gxm3KCUVf5IB9
	QGpAusRjRQx96S6OpqWitmcdm9ugzLAwat+0UkOFYCqPIIOAx1wL+WoLvxTF/GiXrBZOsfuvWQ0
	8BSXf+f8Qu0qx6Jb5u6NxSrdUZnZiPVA85GlShnNgycprVCnK2vi8g==
X-Google-Smtp-Source: AGHT+IEO19+l6ZdSHddwrEzw2oPSANqUTh3iw0/3pszuQFzCZJ2pjqswzhPi5P/3Y6W+h2R+tPknhg==
X-Received: by 2002:a17:907:720b:b0:ac7:364b:7ec6 with SMTP id a640c23a62f3a-ac7826c8598mr832641466b.0.1743617318691;
        Wed, 02 Apr 2025 11:08:38 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f8cfsm942503866b.123.2025.04.02.11.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 11:08:37 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -tip 3/4] x86/idle: Remove unneeded delimiters from asm templates
Date: Wed,  2 Apr 2025 20:08:07 +0200
Message-ID: <20250402180827.3762-3-ubizjak@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250402180827.3762-1-ubizjak@gmail.com>
References: <20250402180827.3762-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delimiters at the end of asm templates are not needed. Remove
them to make asm instruction length calculations more accurate.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/mwait.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/mwait.h b/arch/x86/include/asm/mwait.h
index 006b150bcb5f..65228861b894 100644
--- a/arch/x86/include/asm/mwait.h
+++ b/arch/x86/include/asm/mwait.h
@@ -32,8 +32,8 @@ static __always_inline void __monitor(const void *eax, u32 ecx, u32 edx)
 
 static __always_inline void __monitorx(const void *eax, u32 ecx, u32 edx)
 {
-	/* "monitorx %eax, %ecx, %edx;" */
-	asm volatile(".byte 0x0f, 0x01, 0xfa;"
+	/* "monitorx %eax, %ecx, %edx" */
+	asm volatile(".byte 0x0f, 0x01, 0xfa"
 		     :: "a" (eax), "c" (ecx), "d"(edx));
 }
 
@@ -74,8 +74,8 @@ static __always_inline void __mwaitx(u32 eax, u32 ebx, u32 ecx)
 {
 	/* No MDS buffer clear as this is AMD/HYGON only */
 
-	/* "mwaitx %eax, %ebx, %ecx;" */
-	asm volatile(".byte 0x0f, 0x01, 0xfb;"
+	/* "mwaitx %eax, %ebx, %ecx" */
+	asm volatile(".byte 0x0f, 0x01, 0xfb"
 		     :: "a" (eax), "b" (ebx), "c" (ecx));
 }
 
@@ -133,13 +133,13 @@ static __always_inline void mwait_idle_with_hints(unsigned long eax, unsigned lo
  */
 static inline void __tpause(u32 ecx, u32 edx, u32 eax)
 {
-	/* "tpause %ecx, %edx, %eax;" */
+	/* "tpause %ecx, %edx, %eax" */
 	#ifdef CONFIG_AS_TPAUSE
-	asm volatile("tpause %%ecx\n"
+	asm volatile("tpause %%ecx"
 		     :
 		     : "c"(ecx), "d"(edx), "a"(eax));
 	#else
-	asm volatile(".byte 0x66, 0x0f, 0xae, 0xf1\t\n"
+	asm volatile(".byte 0x66, 0x0f, 0xae, 0xf1"
 		     :
 		     : "c"(ecx), "d"(edx), "a"(eax));
 	#endif
-- 
2.42.0

