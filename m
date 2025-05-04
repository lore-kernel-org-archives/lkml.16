Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545EF247281
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 18:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746384241; cv=none; b=RNpWFbM/1ekAFKcQda2WMC8p5Gewzz4rbLXcECJ3Qe92lYM/BJqNPwpXZZqo2MWxnIg5rdIKWDZlhw1OH2PQljF0Xq3f5MEHMathBvRnkBGj10f1DqPzpa3dRGV6DDhZDT2BkF3U7pzS1jlqE/EkW/U3zXm750XfZIq5GPc/G8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746384241; c=relaxed/simple;
	bh=YpSrDOpYHtj+P2PvVluA0luq+lo9U5gyhsK5wd8XNHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oUbu8fjI8X7u6G7WIY40PC9l37SaweskuvyQcpnqbwJ8d8M43L5siFLj31k10Y4Y/xtdYtwXUVrxvVLLl0JwGzDdVYYgt2jhgUvoxZi7rrUmPBNagGliXGOplI3jBmrHEpoEFdoqTVF//8Y0jBjtt8eP/TuqdxH026kNp+EeqmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/Z6lSiG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/Z6lSiG"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso2175792f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 11:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746384237; x=1746989037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M474/Wo0FJEjA+4jtZ9z+sbS6P10qu7Y/mOGNdeqZRE=;
        b=b/Z6lSiGcOQ226/zZ+CpTcUQqdhG2wVKA1RF9p2M0Y1UkcmW0plsKIwNMwB6FbneJA
         GqKrk6UFvIBUicDaaCqRHQFj6pfOL2dQaCAvvdtUlygtFx2FzhGPjxAJ0yP+dnmTYgrF
         LZrI06GZRq/QDPZfDiaZFd959YFThqO214aRJyFH9uq0Jb1sfWmfyTEegeva40x5mmkc
         F32OgojdmDvZEdGj0TfR1DfMSU1hGLz6KcKMqvlPbXg9zcOVQzPxQGOtZt1fkNUTkWMe
         0eNWnAaSuAAv9OLj/jh0N1TWk1XSt5M+F2XjbFLKv84sgmWXksp9NQ/lRB43ldsnyypC
         QhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746384237; x=1746989037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M474/Wo0FJEjA+4jtZ9z+sbS6P10qu7Y/mOGNdeqZRE=;
        b=LAlKE/noyLhnIcd7GD4cmebCjFxDRNVS+rje8iDNTCi889iETm1GWk2Ixva/cEKWNN
         XwudvK7kQ9evx1OWRt3Dbrr4OaiSYcBUL1JY9RCuwnrle72DPoydwjbDx8pl3eJvjIiL
         kZtasdVpf0YpElK0Ex22AA6hWooi/5sm1UbO2mkZyEf8ryz1PmezqrzM6z54JJGYZEAf
         jE/0BoMy9UYvDFCsqUe8lZNGi/oPxhcq5qxIsuXbd9eQhS+YDgAxOcteWBLa2biRmBs7
         0wIigxe1PriralhCBnGcVtVJJpTQb2qmj+u/vQXHtIibw7AQQIR+P+HBgyKJ0NPCakEs
         XvuA==
X-Forwarded-Encrypted: i=1; AJvYcCV6xmWFpCJExij803AXhF8oR8omIWx+mOu+iDYFgvFXPcjiI4FePRxsgtSH+YG0dtId9iD6qOT1nXoPGFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNakMmHYJb31PSX9iWug2gCbRHAbtOxfFgdNgkvf0QSu6yuTmF
	M7+NV6LBGe4Ued+yEu4N9Ueq0J5MHIN+oaIbTLtZy6YrVnCNhd6yh4DMLg==
X-Gm-Gg: ASbGncvEFrt/ATinLdzowivSOQK5hE+t2Zl7gc5sLODwN2qn+ShPdGPhpjz8nB05Q1i
	pN0pvjhw00QDV9ewRQp+/52zh7m6yiT26xdNYPn89dhYGNsiSOP0HzWVVSBylSy5FFC67+cCmj+
	ilH5mA1SAZ9nqxuN7klCFhr5nVUW3ZlqhqPyNpMKzxb3WTCcfrm4CPPf1qTNAg9BM2UGUIdrCmg
	rnggZEF/KVBbWfFSVqAK/ov0cFK1Um9sEfe9zoWm8xyp7BPoCK6Bs/Ymc47xmAZRSTF1dMGZdQa
	N1E70tp2OnRnwnnHiVYwFEespr1VpLSqH0tiI+P51C+UXRajZQ==
X-Google-Smtp-Source: AGHT+IFBn2prOpmIRBFD75swOrBg2FxPOApDFlpvmqqKbYLrpcR+QoUPHPZT+8pFnlm3E/o+w/DtLQ==
X-Received: by 2002:a05:6000:178c:b0:39e:dce8:1c07 with SMTP id ffacd0b85a97d-3a099ae93b9mr7188330f8f.46.1746384237333;
        Sun, 04 May 2025 11:43:57 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7afesm7914580f8f.47.2025.05.04.11.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 11:43:56 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH -tip] x86/asm: Use %a instead of %c(%%rip) in rip_rel_ptr()
Date: Sun,  4 May 2025 20:43:23 +0200
Message-ID: <20250504184342.125253-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "a" asm operand modifier substitutes a memory reference, with the
actual operand treated as address.  For x86_64, when a symbol is
provided, the "a" modifier emits "sym(%rip)" instead of "sym".

No functional changes intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/asm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/asm.h b/arch/x86/include/asm/asm.h
index f963848024a5..d7610b99b8d8 100644
--- a/arch/x86/include/asm/asm.h
+++ b/arch/x86/include/asm/asm.h
@@ -116,7 +116,7 @@
 #ifndef __ASSEMBLER__
 static __always_inline __pure void *rip_rel_ptr(void *p)
 {
-	asm("leaq %c1(%%rip), %0" : "=r"(p) : "i"(p));
+	asm("leaq %a1, %0" : "=r"(p) : "i"(p));
 
 	return p;
 }
-- 
2.49.0

