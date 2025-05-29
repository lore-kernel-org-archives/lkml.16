Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2CB2DCBE6
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 07:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748504116; cv=none; b=VhQbuYy2t+oZeqtfDRGTvBdvXu3laSSsRgLEA2+5y5o7+IaSH6GDXlMmPXj3LyPONkH2N7oijkhEf1NKe9wuEqWGa/9JXLiggm/faGbm0cCti3gIYRwgxhtx0Mf+UrMlYgm4x7rk3Hh/qJogAZdeLORb4Z+PCo3J/7zUlwUn+E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748504116; c=relaxed/simple;
	bh=FxiGK0m4sF+Iy0qaP75FOEtroibjZfeuWs5XT7JobEk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=D95mZ2bH4yKfn6vz/5zytVibh/seGGUg3hd5r8ad/sqsarh3kC2k0nE/Vfs8ZNs4Gp1bXyxgFRrn2faOR8R5OvXn6YNGlHbzLuacP1npE3kQnGwoGaAXsqf2DTphoCWnG8I+2jlPctpPG0XI12zB9jPXny4ts5yivYmOuUB6bXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jNBF8eCm; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jNBF8eCm"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a3591847a5so224344f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 00:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748504113; x=1749108913; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lcQZPNOwVritWIDtMp41b7bB5T4gHCJ575UDlNYCGTU=;
        b=jNBF8eCm0sg2kYyZyfS210RgVWuliKn2EUSmk+Uzi2VPKebAMiF2mik4NMah8Nda2U
         an8w35M8peQHgghz2XKHtkm3CoIqhw39ojxZX2Idsrz1i0HnBeG1UWBJuugJXm7bQHcs
         w3+zgWHddtL1lTpFrsRcWpAbbaJROsYJ6LAJi0bmhA5GLIs4/xFde6fyNrDFG7hG2GDb
         iO8u6gJfo+9XvC6pODuFikCGx8G5/YWi2mHLHnUMbFdkSIQURQS6Ap1z0s29+fl/d+Ck
         tEbigkXTc+WRBPutzd3ABKDW1mNRzpYBNMiNh3d7DzRQBK9h8LYcvT+oV9BNEEOLtyja
         t5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748504113; x=1749108913;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lcQZPNOwVritWIDtMp41b7bB5T4gHCJ575UDlNYCGTU=;
        b=vOd8L4cnyy6TnNRAxauVtXa4rfpw5+gWilHEjJO0/2bATrOX4nPaSAdX/kbJ+7dHOn
         Kli8bVUoATgSZVwqr3zPS22jKu34Ztkv8bzd/QLcUlRUYpyPepjVQpYmrtD+WMR4M1B9
         jAbfjkIfU46bVLyAa7kKjR4F0RjJ1pJNGYVODLo8KSAb0DNDDVsUJc/yaaisfuiPO180
         LsFN7k1km033kdefYelAGUUQgDiJXwWBRP+ircsAbMiFmt8BNtC7RCRJzkWphmC/HMJZ
         ebFY2UlD0w6KmxKP6jGl4AU+YNnna1JrJF+JhfV635FeVE8jVGSWKEzlfyTZqX2b1V5r
         IXsA==
X-Forwarded-Encrypted: i=1; AJvYcCUPc6hKMbi8RrF9FGfKW1e96/ZSH118EJWoc33nDB8wgL0QoxhUXUinklE0GwLwUyoNtr6+oZ00mC6nphg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw17l43UHlUKNUL6jSljUSN0qqnYczPZCiT0CB5ODsWsaS67s1p
	HW1fLfIcJCi1tQXVNgkm9jTITFRpnZyzfgxrNHtNEz2Y7nFPSq+2wS3TulU81N48q5zPjrZsWA=
	=
X-Google-Smtp-Source: AGHT+IEjieu1PVP6lrScJ37wIH5pXuxZNzIy4/yXl2IhlnKgrGkcAzIB+hUnC+Uf0+4+b4ccTu67Tb52
X-Received: from wrbgz6.prod.google.com ([2002:a05:6000:4806:b0:3a3:62c7:3b9b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:430a:b0:3a4:e6e4:6ee7
 with SMTP id ffacd0b85a97d-3a4f35e1c93mr941938f8f.45.1748504113015; Thu, 29
 May 2025 00:35:13 -0700 (PDT)
Date: Thu, 29 May 2025 09:35:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=ardb@kernel.org;
 h=from:subject; bh=H0IRuCkh1pL6XzUoM1zoycMKPDG3rt06UIiGp6YYXNM=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIcOCT+eV/PQbb3Y++uR4799xfrUfRzZNiU+7XO/WWWp0d
 8/fkxOEOkpZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEBK0Z/vArbN31x7K9yT7k
 bpuPGof5t4qK/96T/HY2X4j6tcGa5RAjw3e1WIdvL0sM/Lcc/5fEaTU7Yu2zFQf2S7cz7lrX6JI 3lQsA
X-Mailer: git-send-email 2.49.0.1238.gf8c92423fb-goog
Message-ID: <20250529073507.2984959-2-ardb+git@google.com>
Subject: [PATCH] arm64: Disable LLD linker ASSERT()s for the time being
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, will@kernel.org, 
	catalin.marinas@arm.com, nathan@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

It turns out that the way LLD handles ASSERT()s in the linker script can
result in spurious failures, so disable them for the newly introduced
BSS symbol export checks.

Link: https://github.com/ClangBuiltLinux/linux/issues/2094
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/image-vars.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index c5266430284b..86f088a16147 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -10,6 +10,10 @@
 #error This file should only be included in vmlinux.lds.S
 #endif
 
+#if defined(CONFIG_LD_IS_LLD) && CONFIG_LLD_VERSION < 210000
+#define ASSERT(...)
+#endif
+
 #define PI_EXPORT_SYM(sym)		\
 	__PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
 #define __PI_EXPORT_SYM(sym, pisym, msg)\
@@ -142,4 +146,6 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
 _kernel_codesize = ABSOLUTE(__inittext_end - _text);
 #endif
 
+#undef ASSERT
+
 #endif /* __ARM64_KERNEL_IMAGE_VARS_H */
-- 
2.49.0.1238.gf8c92423fb-goog

