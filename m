Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF2726C38B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406640; cv=none; b=AO44P1U0dpBy4euEgM8J7v8r1UOOzJkH39l9i8c2sOApTDGoyimDApxyzVKd5dvNRi+q99T/RrldKUlJAh/IxzfGVVvFrxPXAF/Sps+IqM16SFbksYGbO8gyxRyGNWJmtA+TtV9olDDkhOX0zeqeHvHpoPT8Kl2znQDgwlZNJgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406640; c=relaxed/simple;
	bh=AIhGYwkLeED8QStPdAydMCUNiRnP/CVX0kIh57deXpY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HZyI8qga9rUPOv1rBBIfG3ppaGIN7mx1f26if4iiNn9Ho/UBH2PRZ4kPmGsuisUS4B0OliW6aBAB1I5Z7pOj+iyV8TMgwAJEzWspvpwQ9yA/ak2fDtX8C3fw7Z7XkKQMHWwfD1tXrEa1HVfb+VGCwHhhyAMgcCzjhf8cA+tQGcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NHXc3JyT; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NHXc3JyT"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39ee57e254aso2978762f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745406637; x=1746011437; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b9EdJfoFvntZ3Aijc9ezm1SvO5dYoA86SEzEWFMBPBA=;
        b=NHXc3JyTYp29mEwMOlzM1kpx+KT2QA7/6WpjVaX7UpDF6PZtR1YwKxiEABKZJxEwx8
         ggrmk7qJ4cvYsWsQKyOG4aezL5XOHwFQ3dsmdw6OLWTdrm2KPdvsMh19JYhxIsl7IQ0J
         weaLBMBNqFm8lUhOwfOQeUE/OGuPuoD2YnVC3jv5P9xbX5/3HKNXslcJVNIeRgxgWE+5
         kGNXxg4dW7lufyioi5dOmA2plj5Ok6DVyscgUFCI5CeoP2hpuvLpdsWRb5Fm5Sm3Uobc
         x0o1wiZx+OaO2UMv6Ter7t1mVEQNpQVDzlMyYBUN+XAnXZ7TNRVHvIx3yXQ6ygrczr4l
         cOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406637; x=1746011437;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9EdJfoFvntZ3Aijc9ezm1SvO5dYoA86SEzEWFMBPBA=;
        b=h++hFUbfgekSGrkE+X6fc0t456L8Ts5SUpujxyPzhAqHsv3oE/eh76C7XligEw2ngL
         1D7gRFnS4HOtKXNIbLMonRymNXgS7aKYCq2Bn4b64ROsw3s7qoTeww0j5yoR9ApMUUje
         +9TGvizDwCpfNkEtyDVx84EZeIJWhX3s8bZxdiZj2PbeLnUyO/vMl0it7GTleKFHvieG
         yt81OKsKfLat//mO7XPIgpkPRoU21wOBfrjqMizZ6jZ+6kbiRfZOYQHNKX7l+hsR9J8P
         wpIp8BjPBjq/8/WY4tNF0Bo1PV4Vbi98oceZMp7tpeoEjtWPy3xacGxI29XSHEh9M3J8
         ygLg==
X-Gm-Message-State: AOJu0Yz+SotJQBfxKmHCACvyxvGj9BXIe7ICDTPXFG8CjB4/ZLxTYinQ
	C0oKiXMesh89LglBHBMX/LBH/HvUJLNddFXNnhfffMk4ZkS9A7x67n7ykybm6NvTxLTPcTDsMz0
	hdDyQKqSjFn+brVJy64ZNlyDvtQ7iOvjkRnUKxCaTwAxSjK6rds+n3fbzDLkE9ohY3kXbudjoue
	9l2infOtNhmw+tVaRWmSpH39X93LoZ3Q==
X-Google-Smtp-Source: AGHT+IGh7kubV1d3R3ZD3F79F3LXSp3GH8VsTNG4XhDosIDSpzfMdrMwDFzmMjz7Yn7jCRbX7GhQxSXK
X-Received: from wrbaz1.prod.google.com ([2002:adf:e181:0:b0:39e:e3f9:60d2])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:144a:b0:391:2a9a:478c
 with SMTP id ffacd0b85a97d-39efba3cc88mr16844764f8f.23.1745406637306; Wed, 23
 Apr 2025 04:10:37 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:09:50 +0200
In-Reply-To: <20250423110948.1103030-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423110948.1103030-13-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039; i=ardb@kernel.org;
 h=from:subject; bh=kVSqHU9mGbp8hJj8L+zQL1y2c7Ahk8a3EXR2gn1jxkA=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYPjVJfJ9jUVgpt49pavfxKhmvjpWBGf/IPHtYt8Tr1Yd
 Mh0/3nVjlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjAR015GhqOLvh5rq5vuFLls
 h4C0XAtbY1us4rJNc16Jey/NO2bzpZThf+2MXKeCGWrtrfH8kjOm1K5ZFqrqtk2Sw74p9Pyvhj/ OXAA=
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423110948.1103030-14-ardb+git@google.com>
Subject: [RFC PATCH PoC 01/11] x86/linkage: Add SYM_PI_ALIAS() macro helper to
 emit symbol aliases
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mingo@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Startup code that may execute from the early 1:1 mapping of memory will
be confined into its own address space, and only be permitted to access
ordinary kernel symbols if this is known to be safe.

Introduce a macro helper PI_ALIAS() that emits a __pi_ prefixed alias
for a symbol, which allows startup code to access it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/linkage.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/linkage.h b/arch/x86/include/asm/linkage.h
index b51d8a4673f5..ad59ff384f72 100644
--- a/arch/x86/include/asm/linkage.h
+++ b/arch/x86/include/asm/linkage.h
@@ -141,5 +141,11 @@
 #define SYM_FUNC_START_WEAK_NOALIGN(name)		\
 	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)
 
+#ifdef __ASSEMBLER__
+#define SYM_PI_ALIAS(sym)	SYM_ALIAS(__pi_ ## sym, sym, SYM_L_GLOBAL)
+#else
+#define SYM_PI_ALIAS(sym)	extern typeof(sym) __PASTE(__pi_, sym) __alias(sym)
+#endif
+
 #endif /* _ASM_X86_LINKAGE_H */
 
-- 
2.49.0.805.g082f7c87e0-goog

