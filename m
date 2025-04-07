Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A68201024
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040344; cv=none; b=IiUsGOYA1ehNiM7gRpydvtTzLeAaQduBYPX0UI4wxt2qsNNnSEpAHJbQNKtJ0P6vNdi9q5VI0iU0TTISin6RiMLirgqxy2vt1joZfR70+TefuvYxXxJaDOfgiupsokVf2t/7SiBtX/Nx/tWZZouy8x0L9Uy+lnDoLpVjSdnUyrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040344; c=relaxed/simple;
	bh=a8JHMzhzYG758Tnl/DZgrwwRUDHVUlCO333Gr7EpXFg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PdbSGU7S52D9Jt7IRrHrhwVUTUxKd44QAVh69wpSD1oY5rb73G3wv7ZBpWIBpFaVXuI5zEzY1gkpFj9FjoeZDk5Rv3KjKDxylNXQ6dVjd9a5Q26XoLZkkK0yY/2e82MR9x/YQN6VQR8S5Sq5TZS3KkynLGwct0V/D6+SKjR5vw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VL0brsXa; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VL0brsXa"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-700b17551cdso43111287b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744040341; x=1744645141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YobkztMKnvk249lFXQRoFaShwGuxuoRz0jtkrT6QWQE=;
        b=VL0brsXafL7oNTiiXGC/yhPUcDJoNZLJpZ/6yaSWwPQCPThV2rD27+F5y4i4xm1ifA
         rW3uxGlQBLYOjeT3H8w6A8cfEaV14ChGj99oL/kH4Lf0JOVfbV6nms1SK+TLtjfXY7w4
         FoZ7OuE96//9JpYNrxNFqnRHx5mtkOZMCmaQwZqzvGgnCNduIFt3WYHh1OzKrZvScIGK
         Z1ZUMNjURZ+J6pjQEDz8TqE1R0iWX3H4az5gKfioAGZEGgeaG5fzhPG3SdTAl5+jzaQG
         dVUPiNBY09UVh0yRJdsigDqBRW8Cgf+RJ2uYRR+pcAvxMsvUowqwaAgxOnhZpr9bicqO
         hJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744040341; x=1744645141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YobkztMKnvk249lFXQRoFaShwGuxuoRz0jtkrT6QWQE=;
        b=ETbPc3SKq6Gxzo57J68X582PvZgjziBoe8NcpNcut1nQAVXLm+eyOmLsPg5NQ1MZRX
         yNGPCvEGPucFOr4ePiElbcCPf6XO1LWdoLlFhz1vzjZ84f6ZeI1tpDFez0HDoFTrQ9du
         fCeKTNCM1GHsx61qCR1z6Bfy8w4u6s6ZezNW4cXi2NL/wK2bilTQiS66gnhvxe8FS+B6
         92Nn6El8Gsn9zRJkE6bwjxKdQS/1ZqNeUhq/OiZVGDOVMJ7uMEFFgAIg41cZ8jmpYX4u
         cBKtFQcH4SGnbF91sH4bPiclCakXM0c5Le1nMj5Pk9mO3N0LtXYvUnWczq6qeIxl4d6w
         nNsA==
X-Forwarded-Encrypted: i=1; AJvYcCVIdG+BGcVk5VZe9qbaa7bV8i6a6ej6kMsqAilmFVc/l8SoDsbjiyhagX9s/0JtesOuAIg2FCRS30uxYOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxUSI0FchgsF5c903mJIpmpp1xUawz7NKJy2vApbIpwRpCyfbp
	G9+jfLoKxl9JWXIaiPRFFfskVSANurXNePgGNjahTboLCV/nwpH2HSeaaBlm
X-Gm-Gg: ASbGncvPioHFHXBi5EOiB2xJzigsd0kL3DmJaAxuQF0P2EcEP6S5+zxEvT9fyfd5uDx
	rgE+JaLzp+eJl0xpYiSbfiqD8DZ+2Lt48HncUQIKbovoKQAK/aN5WWNT3CafV/5a94vZgxm7Itk
	PgrZdEB61/cQ7oqAAn5BHGUiHnuQu3AW1vIk84w6G1Lkakhhy/RZj5dWa5dbRAui/F3O0Gyj8Zg
	QLsoiq0mvxmIUypeOidED65Hg+ETdkKh/ZhAZqWSW4Jv+IFJ+e2+6C5dZ6/i8T7EPTjv8EF6EEI
	UHuz1d00jfHUgJ1uoLvBAdrOfANKBor9ix9lbhtee9PXhZmHR1uFCDcJKJiVXlzzouKBIFPxj5/
	wLq/D
X-Google-Smtp-Source: AGHT+IHmz5WoV9i7L7rT8MD50liCBf6aVMxiEzKBiZURGiemYCV9je1fD7No+Y7mq6erBRWmPhrplQ==
X-Received: by 2002:a05:690c:f8b:b0:703:c3b4:45d7 with SMTP id 00721157ae682-703e16337d5mr227561357b3.28.1744040341328;
        Mon, 07 Apr 2025 08:39:01 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-703d1f70626sm26143867b3.69.2025.04.07.08.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:39:00 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] find: add find_first_andnot_bit()
Date: Mon,  7 Apr 2025 11:38:53 -0400
Message-ID: <20250407153856.133093-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407153856.133093-1-yury.norov@gmail.com>
References: <20250407153856.133093-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

The function helps to implement cpumask_andnot() APIs.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 include/linux/find.h | 25 +++++++++++++++++++++++++
 lib/find_bit.c       | 11 +++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/linux/find.h b/include/linux/find.h
index 68685714bc18..d1578cfb667c 100644
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
+ * Returns the bit number for the matched bit
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

