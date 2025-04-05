Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C85B1C5F3A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 20:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743885953; cv=none; b=DMEYyH8HfPNvYuUmo9y/gxuRIra78pX/A31p2V4vu7SMDV1flEACnbyiXFm08I8vIPEGGbCGs7QiGX+ICEvEcioMY2b5gRIlhVwrKZcCz83qumboBOSWEbZ35ItaIatZ/W7xJe1WAXR8//HEFQ6DDC8mJZmmb+zUmHnNagQC7zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743885953; c=relaxed/simple;
	bh=5Cjg3Lwm6dTUee9haQdH+9yhyA8h1xcOnP97k1DQK5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VGfMJ/l/DX6QmqyxvltceCi/fe/oOVuNKULqUR6WbXA9emx9ZvpEiEPB8GIcRFcNrSnq4xzy/1lgdIL88GOs6NYPcJhIr/nJp/X06qFcTcA/cBPeLxNzi+sEu0fqHC6JsJxji+tQd1XcCkbDjjDOhu+dEjma4fQZvwlLHLMH1To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgmlopqI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgmlopqI"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so27952475e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 13:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743885950; x=1744490750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9+wSAeBp1V8uCgaufiRNioBi2o/cjCh0uaG9JHkLnY=;
        b=jgmlopqIHzJXa941RXPSMNIRYxPAQZ14/wt/ibWqH0YM9KTpn4+TJ2eZgqecMYOA3Y
         mX4REJVvxP9FdswVt66r+HRrL87FQpfCGvtG0vXfhtEEg3LeOvjDwn/U59d8/M6hZ54v
         LRZRiRAWhi+tIBmkI/XnIt1Fp8R73bWOvPvBonBkmo4D6Ps5lhxDhJNarUP3nMOw5B6H
         80DLBeYDw9G5We4AlkYPUiN/hVfE1iC5tRxn/jiZ8Z6+td//R2PZV5bOkxrvWuPPkL2y
         sGhWkJJ01kbeq62JNmsKYy/Az65f8OMmpgk9vmCIBy9dTfOtCrt4pyuroWIhPuP20zwy
         +OXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743885950; x=1744490750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9+wSAeBp1V8uCgaufiRNioBi2o/cjCh0uaG9JHkLnY=;
        b=AF7/kc9+3oZVwXHXuC+h9T9gJdI490T7AgY1fzYFI6uWoodncTvetjNJXsFIKZ383x
         pBJduja/DpJGmWrGZrBXaUZIddD3azC2r8L2JrePbxdzu1AuCWJ5Sp4zdD/YRe9oyo2x
         HJ01Db2v/W4/kTnu3zcywM1fRozEeKOMrKCqzvo7xI/GDYhRiqF8WySaKRA41GoQj/ah
         x5qRZlAVAOR9Bozx/E6IN77INME9zJyBt64yZ/IJ3Y6YOqvWqNMPfUs4DvzcQDCxuTW+
         jl+9qHx9q7xPv249MeXms0QTHKW7hpI+nFroCxOLfWuo6XRuLZv0u3lRLXvaKMfu7Bby
         u7pA==
X-Forwarded-Encrypted: i=1; AJvYcCUinl/Fc2sR7TFEI1PMoKjdD9mdf7hsArWuJcKLQ0CCU66BJfRAu+v/WM0ixRhButWqvYn7Gedo2ifUvK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFr6gDu6jBVHPcbfGqsGXsHs6dY1rql0EKr4BruzJhYVB5/P2g
	y4zVzL/8GCm9AuJaArA1ZcAZ8KqVZyoru8SCv7yZ7fKGb2awrmFr
X-Gm-Gg: ASbGncsAZOeoosuBSwCb28lz1G/VIy7K/mJyGT+ma1+UQVVMmQMVKnbR/gVfRDomZxF
	J4rayFgW8zwYx1WIzTXffdPWMF38g+P39rMvxJgqlkGncU29DlxlJUfQVq86emctd9DgeQySo37
	VpF4jrsH8V863hDtuE4ro2lChLq4lm2m6M3NqEfYr1lH9YRaYhn41LAcCwoVkSK6LXWjc/uW1SQ
	26wURDNDULj75QriUxlkRZjos3NcN2Ug9ceMgcO5+Onc8lBWAllyRvut2JdlFQdgwZt4FTVEr2S
	nx1EvDxrDfsrDYuk4JteFkS4J4/KribzEGUA3boIv4Q4jv71juFw4iuBih8bIUbeB2DHt8kr4w1
	Spl9XpbueIuPMRZ4BIqJGtlBRuw==
X-Google-Smtp-Source: AGHT+IFriADpLMmuaYM1fnnc6k406s5RbZxeLEntVbm2JLwMsM03VfZuRa8q/zjPyc79VmSqOBi7aQ==
X-Received: by 2002:a05:6000:2509:b0:39c:12ce:1112 with SMTP id ffacd0b85a97d-39c2e651984mr11096988f8f.21.1743885949751;
        Sat, 05 Apr 2025 13:45:49 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096ecasm8027042f8f.18.2025.04.05.13.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 13:45:49 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 3/3] lib: Update the muldiv64 tests to verify the C on x86-64
Date: Sat,  5 Apr 2025 21:45:30 +0100
Message-Id: <20250405204530.186242-4-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250405204530.186242-1-david.laight.linux@gmail.com>
References: <20250405204530.186242-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

div64.c contains a 128 by 64 division algorithm which x86-64 overrides
it with an asm implementation.
So running the muldiv64 tests only verifies the asm code.
Since x86-64 is the most likely test system compile the default
code into an x86-64 kernel (under a different name) when the tests
are being built.
Verify that both the asm and C functions generate the correct results.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 lib/math/div64.c                    | 18 ++++++++++++++++--
 lib/math/test_mul_u64_u64_div_u64.c | 26 ++++++++++++++++++++------
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/lib/math/div64.c b/lib/math/div64.c
index 50e025174495..38ee5c01c288 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -25,6 +25,8 @@
 #include <linux/minmax.h>
 #include <linux/log2.h>
 
+#include <generated/autoconf.h>
+
 /* Not needed on 64bit architectures */
 #if BITS_PER_LONG == 32
 
@@ -183,10 +185,22 @@ u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
 }
 EXPORT_SYMBOL(iter_div_u64_rem);
 
-#if !defined(mul_u64_add_u64_div_u64)
+/*
+ * If the architecture overrides the implementation below and the test module
+ * is being built then compile the default implementation with a different name
+ * so that it can be tested.
+ */
+#if defined(mul_u64_add_u64_div_u64) && (defined(CONFIG_TEST_MULDIV64) || defined(CONFIG_TEST_MULDIV64_MODULE))
+#define TEST_MULDIV64
+#undef mul_u64_add_u64_div_u64
+#define mul_u64_add_u64_div_u64 mul_u64_add_u64_div_u64_test
+u64 mul_u64_add_u64_div_u64_test(u64 a, u64 b, u64 c, u64 d);
+#endif
+
+#if !defined( mul_u64_add_u64_div_u64) || defined(TEST_MULDIV64)
 u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
 {
-#if defined(__SIZEOF_INT128__)
+#if defined(__SIZEOF_INT128__) && !defined(TEST_MULDIV64)
 
 	/* native 64x64=128 bits multiplication */
 	u128 prod = (u128)a * b + c;
diff --git a/lib/math/test_mul_u64_u64_div_u64.c b/lib/math/test_mul_u64_u64_div_u64.c
index 9548eb7458c7..e2289b412601 100644
--- a/lib/math/test_mul_u64_u64_div_u64.c
+++ b/lib/math/test_mul_u64_u64_div_u64.c
@@ -73,6 +73,10 @@ done
 
  */
 
+#ifdef mul_u64_add_u64_div_u64
+u64 mul_u64_add_u64_div_u64_test(u64 a, u64 b, u64 add, u64 c);
+#endif
+
 static int __init test_init(void)
 {
 	int errors = 0;
@@ -80,21 +84,31 @@ static int __init test_init(void)
 
 	pr_info("Starting mul_u64_u64_div_u64() test\n");
 
-	for (i = 0; i < ARRAY_SIZE(test_values); i++) {
-		u64 a = test_values[i].a;
-		u64 b = test_values[i].b;
-		u64 c = test_values[i].c;
-		u64 expected_result = test_values[i].result;
+	for (i = 0; i < ARRAY_SIZE(test_values) * 2; i++) {
+		u64 a = test_values[i / 2].a;
+		u64 b = test_values[i / 2].b;
+		u64 c = test_values[i / 2].c;
+		u64 expected_result = test_values[i / 2].result;
 		u64 result = mul_u64_u64_div_u64(a, b, c);
 		u64 result_up = mul_u64_u64_div_u64_roundup(a, b, c);
 
+#ifdef mul_u64_add_u64_div_u64
+		if (i & 1) {
+			/* Verify the generic C version */
+			result = mul_u64_add_u64_div_u64_test(a, b, 0, c);
+			result_up = mul_u64_add_u64_div_u64_test(a, b, c - 1, c);
+		}
+#else
+		i++;
+#endif
+
 		if (result != expected_result) {
 			pr_err("ERROR: 0x%016llx * 0x%016llx / 0x%016llx\n", a, b, c);
 			pr_err("ERROR: expected result: %016llx\n", expected_result);
 			pr_err("ERROR: obtained result: %016llx\n", result);
 			errors++;
 		}
-		expected_result += test_values[i].round_up;
+		expected_result += test_values[i / 2].round_up;
 		if (result_up != expected_result) {
 			pr_err("ERROR: 0x%016llx * 0x%016llx +/ 0x%016llx\n", a, b, c);
 			pr_err("ERROR: expected result: %016llx\n", expected_result);
-- 
2.39.5

