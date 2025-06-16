Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4407B26C3BC
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062087; cv=none; b=UDOVy6VkD5+yhLgW4rolQguJEiRcK6ZCYdfe786lGcKpG+fK2U4CjXmm/dIO4Bf3U8Oy0kp82oJhktY2nRrnGwqzi5Oz7woyJ9bJXs8aV2q/FcoQlFqnI8fZ0KOYzkLaUw/uB9DDbP2f5LK346rfa1IJogarBf2SDv9f2N7NvJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062087; c=relaxed/simple;
	bh=bqUbMYitYOIEdPKh2zm9rWHN/UIj6Ic0SwkTBb2aDp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VSIIEts9TIi0aeNNvKtHWpls6qJI0QbPjPnYC0JkhEriq0Qv5DpKCyY/K1A2VcXNkhEUkHUciVdSW1iMCgMpNl692TXwSKWBGl2BZoAfBHZkBw7s9kv/xNqG3ImXrEpS2Nvs6NOKrydg/t9WZrKNhMfyKa1q0GEsidnKb9+xAL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUxOHt6f; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUxOHt6f"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so3659176f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750062083; x=1750666883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2RUEER0/5r2hh7rXHRzDLr3U9MVy2WDK7Nh2/u0cxaM=;
        b=lUxOHt6fzJpObGp1QHt1oEDW3aIczHuh1CPc34oLjPPB2LZhHj+xSfidrQRJiUIiD1
         yO0QYZCFl7qEOoHjEoSeTnOBOePNGvUWqtUrG0yMRn91QqFPDAKd9IOSy/nYzBOgXfLC
         8HfHSu2uxBAkwmsOGuvOYj16eF/X2/HFxIuFIJNNhxaFG3Gj4EJMY5T/wT3XWNTnFIGF
         MGcQR6GIbEbf8h9ajrfDKn+VWqeI+8AoCvDooDdU84gTA4GOdeCnsjVpnlkTIzUa0Yw2
         awqFvfFjSedoO+89LA0OQdycO8zELoz3nb8VQvHz4YWPygOXpSkpSNJeXQlLYBr/+8+x
         SIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750062083; x=1750666883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2RUEER0/5r2hh7rXHRzDLr3U9MVy2WDK7Nh2/u0cxaM=;
        b=f9I9g9kEGQlccwYrfp70UnwPyROW5gFkVZStYh8QTrT8vCsp0o6zST20VpSAa6OvS8
         TSuyBQCjBBmGUwNkeqegqgdP0abgccR7gsUmgBRQV4aRluRzZcT9i0+p+7qQ0M/yYDvO
         oA/3vZqD1EPbv3fltF1XgIguhXqLvfruddbzttkISdpiCRuSeD0JR9ALdP0emHieot/4
         Pu2blMNHvfjAP/xWgSuHfBwcGtUPuLfl0/qf40l9kfkzcoc5wj/Sp9BcQPqNXDhsSE4Z
         /bf4sYrgASaF1OcXvGoWOuDY546B5k3mQ56lBIujEo/HLi/+Bfc/AJ225goZhNefYmnt
         HIPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5vlho5+mjp5NVgM6CNOXLqRGdzf7tTxNvIJ9DzxQhUOqhdJbGXwn2YsdKcqFTFUCwurkxrv7tlgacAsE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt5UT8NXXXujMewSQ6KojXUPk9MpAKsm6yWwQ8gpBkSQutPzZs
	seGmLcta9inMHnFC12EmFP3V7pCgYVC/sPOrA44NRxuDtVk+Voez8qsP
X-Gm-Gg: ASbGnctadoMdQtN3cwPWRrOEDcaRPSQGhGtcE8KDCvlGN+rs33M7ikypr3TBr1YND/e
	QhVW5mDyeshBUjFlva3F6W1zaclU96jIxuYTBqsK9PqAi5W0AG3P6gpJCN/rBT9Q3ZdU0VmGQuI
	lPRAnpz5uRr/86UlSuvHC3f8fATOveL8aWzSkqYZONwTorSNhggkGwcZkzrJIAVp/+3dm5eg/rq
	UlOXzax4Cac19RnH+Dd8pHLettq0aGBkvLSrXW5O+RpWnGaIky15jWRblVpH2teD6Z7wy64SNjU
	LHQ996uAZl5MUZpOKtHF872Ox+O+MhKJuDKzfDHtp0M6kSesk1Infg==
X-Google-Smtp-Source: AGHT+IFwuu03YSVlrlHUE89ykZu8MMDKzpH07jL4m55qTf/tla6/+/gpksTYwyKhpG5YH4lqNfndEQ==
X-Received: by 2002:a05:6000:2381:b0:3a4:fcc3:4a14 with SMTP id ffacd0b85a97d-3a572e6baeemr7169784f8f.34.1750062083207;
        Mon, 16 Jun 2025 01:21:23 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7e51esm10258097f8f.40.2025.06.16.01.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 01:21:22 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] x86/percpu: Use BIT_WORD() and BIT_MASK() macros
Date: Mon, 16 Jun 2025 10:21:03 +0200
Message-ID: <20250616082119.157062-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use BIT_WORD() and BIT_MASK() macros from <linux/bits.h>
instead of open-coding them.

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/percpu.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
index b0d03b6c279b..69243cb6dc9c 100644
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@ -23,6 +23,7 @@
 #else /* !__ASSEMBLY__: */
 
 #include <linux/args.h>
+#include <linux/bits.h>
 #include <linux/build_bug.h>
 #include <linux/stringify.h>
 #include <asm/asm.h>
@@ -575,9 +576,9 @@ do {									\
 #define x86_this_cpu_constant_test_bit(_nr, _var)			\
 ({									\
 	unsigned long __percpu *addr__ =				\
-		(unsigned long __percpu *)&(_var) + ((_nr) / BITS_PER_LONG); \
+		(unsigned long __percpu *)&(_var) + BIT_WORD(_nr);	\
 									\
-	!!((1UL << ((_nr) % BITS_PER_LONG)) & raw_cpu_read(*addr__));	\
+	!!(BIT_MASK(_nr) & raw_cpu_read(*addr__));			\
 })
 
 #define x86_this_cpu_variable_test_bit(_nr, _var)			\
-- 
2.49.0

