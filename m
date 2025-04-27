Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECAE1FBEA8
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 18:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745779973; cv=none; b=uBOSdW7W8sbfwpl86B8D2jaS3YdjLtgzXdxpM7YeJcqyTyBXBZ95Z4f1lA/hLko0eSCPavnP/bsPyEqH7JkJGD+pj3N0wgYQdvM3oCQkgwxI3JEdqaKyGTfWVQC2CxS33qzYsGrRkxpl2/1c8ow9Iu0KbBaShlifFLWQz/lO4hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745779973; c=relaxed/simple;
	bh=pqbhSihCYsOMPL4uXkzSmS/h3GOaMiX+inFO7uRy0A4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IxIonN83m5OukIAKGlCHRwiMdXFoPBta4bs8wYRG07ap0IjDuN3xxnrVtxKoZJk8bMTJO2l84Ca0tU37LI4i5Ue8zlMRRKDcC+4R7tXfK0HzaH+SE12yo6g8VwE+Gra7RNLmwOH7XSL4zTQ7C6O7kD3EXAoYXbZzWBm7DVIA9o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5WkZduP; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5WkZduP"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22423adf751so41642455ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 11:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745779971; x=1746384771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0h/Q0ZqpcrRUzIyzjMSsOP16UaeOVdlzCI6vE/Tuxw=;
        b=Y5WkZduP6u248hrewtMlY/PDjsMNLcz8Lqm5mz46mhCBz5UDHaa1YKGw0Yx/qJjQBx
         Fi3olgdJhIao2IcyxfBPuO2J/Za1ZPhnYMRsarDbpc/3lquUgPKvhaEM46BX2jOhshu0
         ZVKM1IC7C3u3EoBo0oyhazLtZOe1jhHSX2MWKkDDIWHPq365q0XPvl0+5hJ1M9OOe5ty
         WmZublM3L7uBhKL+ERnwXgW3Diitx2cjVCnKObiAvvfxUi6ywazO/aunB5YRjDBOh2DS
         TGQ3sdectczkX/T2zbRTLRhHLMJM1Xo4gptxEw1zxuPU+DVlLDyL3YUrTUvQ7BYqaYLS
         WOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745779971; x=1746384771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0h/Q0ZqpcrRUzIyzjMSsOP16UaeOVdlzCI6vE/Tuxw=;
        b=waVphwTtyRnrShUxZRUvj67+YGwqIoXpilgdgQvvHKqEQMxXt3wKM2lanXSH5higma
         uqm9Q0C3tBamIDMzNUfcu87FIbi5eeH6IuoJ1svIUQr/tjicBMSGX0GM+WBMu64wMKv3
         3FbUEwFUA5PAsbemjsOoshNtW0ZoS9aF8b/Rv/CbluSkwIWmUvLDfBeZ4pWQAXz/X25o
         D46k/7e87BFcYLD2K4SWOcHnDA0qqU8It14RPpvE5h+GlydcPF7P+HAP2VjBZcIVO6/P
         99uOpV3dyhrhzCQvJ6ArzvaZEQg+bbnh59zSq7SO4DnZZOa0T7jJazgwSPyaPyT4bvBW
         /cwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLanL52nrQxwIhWXQQvAN/ZshuiobtcJHpF0iA5nv3Mvxy871yDXZ2hmwGtomqIpKHNMqxKtrusaPaEWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqMZw/AKstBIq/TnI/irvqVCDvkgKK1mmagJgJKYlV0t/d2w4L
	t3uZQY98GYOtFsvJIzaQuDeKr4QQqEi08Wc/xVbSLrfMJQcn4lt5f/b+rS69
X-Gm-Gg: ASbGncv2PEURNEjPoUdm9/ClWpvOFYrkoqevBlD4ZqN2+hpwEclxtHH88O8GjY2FG8v
	dW3XD7nbiMAXwQGG/LjOlQPpTyANuXxoEXA275aXcHiY1cIWOPhpbjM5bSGi7/x26BpszNy3y4b
	Wgu5LSxFzeEfwDnv6UMOlsyu/FOcJX9Y2ZTg+kvoS9Li58YEmdny30piMK/dF2WIvdDK20LRapi
	2KrurDbKR0MZlVnq2i2ybsaW2kQvkj7IieDsRUmDB1FAas3y6JewA6Q0MfO7eomwkpHnTyvqLMt
	F9GY1Tl//urS6G5/1LdMUFAWyJoqwCIcbLWWA2MR
X-Google-Smtp-Source: AGHT+IHK3xnT18KzOjeXUa/Hk9HDjKHuRIcuSFrRBci4CoJ11vLoBGmDKq2nOqcrvR0gSOQogj3jHg==
X-Received: by 2002:a17:902:ce8f:b0:224:b60:3cd3 with SMTP id d9443c01a7336-22dbf5f080dmr139096945ad.19.1745779971492;
        Sun, 27 Apr 2025 11:52:51 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7a40sm67519005ad.147.2025.04.27.11.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 11:52:50 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	James Morse <james.morse@arm.com>
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Tony Luck <tony.luck@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] find: add find_first_andnot_bit()
Date: Sun, 27 Apr 2025 14:52:29 -0400
Message-ID: <20250427185242.221974-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427185242.221974-1-yury.norov@gmail.com>
References: <20250427185242.221974-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>

The function helps to implement cpumask_andnot() APIs.

Tested-by: James Morse <james.morse@arm.com>
Reviewed-by: James Morse <james.morse@arm.com>
Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 include/linux/find.h | 25 +++++++++++++++++++++++++
 lib/find_bit.c       | 11 +++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/linux/find.h b/include/linux/find.h
index 68685714bc18..5a2c267ea7f9 100644
--- a/include/linux/find.h
+++ b/include/linux/find.h
@@ -29,6 +29,8 @@ unsigned long __find_nth_and_andnot_bit(const unsigned long *addr1, const unsign
 					unsigned long n);
 extern unsigned long _find_first_and_bit(const unsigned long *addr1,
 					 const unsigned long *addr2, unsigned long size);
+unsigned long _find_first_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
+				 unsigned long size);
 unsigned long _find_first_and_and_bit(const unsigned long *addr1, const unsigned long *addr2,
 				      const unsigned long *addr3, unsigned long size);
 extern unsigned long _find_first_zero_bit(const unsigned long *addr, unsigned long size);
@@ -347,6 +349,29 @@ unsigned long find_first_and_bit(const unsigned long *addr1,
 }
 #endif
 
+/**
+ * find_first_andnot_bit - find the first bit set in 1st memory region and unset in 2nd
+ * @addr1: The first address to base the search on
+ * @addr2: The second address to base the search on
+ * @size: The bitmap size in bits
+ *
+ * Returns the bit number for the first set bit
+ * If no bits are set, returns >= @size.
+ */
+static __always_inline
+unsigned long find_first_andnot_bit(const unsigned long *addr1,
+				 const unsigned long *addr2,
+				 unsigned long size)
+{
+	if (small_const_nbits(size)) {
+		unsigned long val = *addr1 & (~*addr2) & GENMASK(size - 1, 0);
+
+		return val ? __ffs(val) : size;
+	}
+
+	return _find_first_andnot_bit(addr1, addr2, size);
+}
+
 /**
  * find_first_and_and_bit - find the first set bit in 3 memory regions
  * @addr1: The first address to base the search on
diff --git a/lib/find_bit.c b/lib/find_bit.c
index 0836bb3d76c5..06b6342aa3ae 100644
--- a/lib/find_bit.c
+++ b/lib/find_bit.c
@@ -116,6 +116,17 @@ unsigned long _find_first_and_bit(const unsigned long *addr1,
 EXPORT_SYMBOL(_find_first_and_bit);
 #endif
 
+/*
+ * Find the first bit set in 1st memory region and unset in 2nd.
+ */
+unsigned long _find_first_andnot_bit(const unsigned long *addr1,
+				  const unsigned long *addr2,
+				  unsigned long size)
+{
+	return FIND_FIRST_BIT(addr1[idx] & ~addr2[idx], /* nop */, size);
+}
+EXPORT_SYMBOL(_find_first_andnot_bit);
+
 /*
  * Find the first set bit in three memory regions.
  */
-- 
2.43.0

