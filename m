Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390B3289E26
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364768; cv=none; b=Bb01ZNKQLp/LRqLPa0TLLAmQS9aiqpkzAkkNOAmo2VxUaCaEuBrKyHmit9LP8k4h2RndSAj4XDznV8h8+mxMgcbTS8JW4WG50m23IUKVNlFXbLyIJEzGLV8V5GTdK9U3kPtrweaMq/KlBkCsE+tMZxLd09cs7+xvjdC3jP53HfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364768; c=relaxed/simple;
	bh=XJsGe/H8petWGr7pZcERTNjxBMU4U6z80oSij/FdtRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZqZKQ/wHXjvn+ZaeWumEj7QlRWKqExpqRmthCDt4S+EzT/ZoBiG39sHN/ZnrB7spH+cdbmUtJxKqPmHTvEys5OJlzifIceMdzKb1poZn5r6+P01FmYOiDnQxwN0IBCBq33v+ZihvolfRTvGFbEocivBaWJhzPSNtIsJ51tU2/4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=RzwzhmA3; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RzwzhmA3"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so1229183a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364766; x=1747969566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/NgZaKsdQuvj1mcoi5mr3qKx+o3KroysYayBW2Uc6Y=;
        b=RzwzhmA3qPmB8CIBOxMjw0i7pCTWiW6Yb+agS+RC6t7UYXRsx3SqVP0p9U7cBHSCz+
         Bi7KEJGrzdkSuFUa9sGgJd2ciKLuqJisc91nAUkvSCqlHQ/SKfxhJfWJnzlW79G3wiAa
         idnxLd9gTKS5rup6ZHhwa8u0TUZEfNunraJnET7Z+IRbmKwVd6osSBhC5owQqwCgxv9K
         uJqyIblr1wpUqg6omggTafO5CK7wKGsQdhMhQ8eU1yVqpFFQkcXRh+Ki5JMzn2BmV79w
         FMUz0Pwnof29WTtJ7Nfklzn5awN7M//B4HexjzljTNkP+fBGvgseJdeO426VpbS4RZJE
         +pnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364766; x=1747969566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/NgZaKsdQuvj1mcoi5mr3qKx+o3KroysYayBW2Uc6Y=;
        b=Tur4FQ/WK1lD6M4Xr4J2gxA66ojAEj8pqigm0VXxk5fvdnBr3jDyuq+r0bJFMgP9fr
         aqSpdhzlCOFIvBM+H+bXcsYzuUozWt0CZMvdYBF+Wem3WXECmq5FSTTrhYwStgzc0h0I
         BHmlj614uPEUVuVqaAAqeNhSMwpg97SM7A6QImtIyCt31m3ACStBouEQmKHnzzOYe0GY
         Eg93onEdrdWPfLaE8UUGu0/DSx/Lsx1xamdqJ5XKlXU9wyuCzZVHpbGefk6LMv1ZUX9c
         bziDwDkCRze2SPo2sBcmJ99dajw60RZCxgjlpYN/phakq6MvSnpGCzQrBODCLNcWZxQX
         G8Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXgGhZX9TCmjH5rzxyyCp9prWs0C5DjW7izKUUnPm3b4xQSjpcuQLsXh7ZKYbXN7A6JrnQVsAPzGhf3dpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoLTdAK+YGG0+G7bwXVEKX46y/w6y6Ozr2MwXUJYU84YpOeDiV
	MIFlmCmyz9fq/mkDz16BKgyUoUGx/NA/8+XdfAp7hOWgRpLAO7nk71hZ4r3d3A03TFI=
X-Gm-Gg: ASbGnctDgHVymLHXOfr3fU5unvC2cFAKqUbHkja3xMQh41XT+oUYRV3fOQCYMSwWxNU
	xl+UIq47CP2RoR4wzon0zG7x56BWhHgN1g06mnxvkjld4w19nEQzuVFBdXDLb8kf7QpqK4+bLJn
	hsOTf3OHyyN8FZz/C5B+ICU8OhCTK53RCSYIzoFfIFA5UGG/miSCbpmGhi4DNnuGW7VOy30mynR
	v/Cl2KwrIjLqXJ789Wmvj59UYoVrbjmKBaCsN8G1LHgxkeckTEYLcLK3+OJK80fUVHCrlvolz28
	r3yx+087v1YBwbMTLYd9vJ5cbC7Ts4C0RccuhRkSUBodE+TjKEhQ4WwPicrfZCqtsYt7iTJWSPS
	RDA2Rh+7nnck=
X-Google-Smtp-Source: AGHT+IHH5HPc3MjrYHiSAPEcwxaJbyqQMeelJYaRlBb5wMzwTBd2eEb1udXse8ywqizLvRN1iMTE/Q==
X-Received: by 2002:a17:903:1b6d:b0:227:e74a:a05a with SMTP id d9443c01a7336-231d454dcf6mr24403685ad.44.1747364766552;
        Thu, 15 May 2025 20:06:06 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.06.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:06:06 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH v2 10/12] riscv: Add SiFive xsfvfwmaccqqq vendor extension
Date: Fri, 16 May 2025 11:03:08 +0800
Message-Id: <20250516030310.16950-11-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SiFive vendor extension "xsfvfwmaccqqq" support to the kernel.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/asm/vendor_extensions/sifive.h | 1 +
 arch/riscv/kernel/vendor_extensions/sifive.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/sifive.h b/arch/riscv/include/asm/vendor_extensions/sifive.h
index 2d05e3e73170..ac00e500361c 100644
--- a/arch/riscv/include/asm/vendor_extensions/sifive.h
+++ b/arch/riscv/include/asm/vendor_extensions/sifive.h
@@ -9,6 +9,7 @@
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD		0
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ		1
 #define RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF		2
+#define RISCV_ISA_VENDOR_EXT_XSFVFWMACCQQQ		3
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_sifive;
 
diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/kernel/vendor_extensions/sifive.c
index 9376e1ce133a..8fcf67e8c07f 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive.c
@@ -10,6 +10,7 @@
 /* All SiFive vendor extensions supported in Linux */
 static const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
 	__RISCV_ISA_EXT_DATA(xsfvfnrclipxfqf, RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF),
+	__RISCV_ISA_EXT_DATA(xsfvfwmaccqqq, RISCV_ISA_VENDOR_EXT_XSFVFWMACCQQQ),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccqoq, RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ),
 };
-- 
2.39.5 (Apple Git-154)

