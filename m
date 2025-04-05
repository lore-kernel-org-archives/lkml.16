Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCD71B042E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 20:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743885952; cv=none; b=Ke0SPVJUwNW+ki2W6lr8SaqEMLasCAR52NAxucJiU6Ql7iSlz708tueDFFMZLIHOwUC15jU4Bo0zzU4heONAIU3cdrxEIGX8ciyncpPRJ3IiZ3Agvy0FQ1REfzH3McyqH+y4m837PQmk31/KXtQmW1kxfYuugUXhlQowsPhcnkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743885952; c=relaxed/simple;
	bh=Gn7TKaPIuIMwrNPg9D/QGuXvrMXdxBDSb1KAXHQ/sJI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NHfKxSEHSJ/5QyNI7CU6xKMqSKRxaoktQqj7F1Ytt3onBgltX2+cN8/brVDk9ODvI6Oh9oPCDK7Wvhh4/+EmyvYr+uS3MAweLTnMLauJmoBCYha0I753rP/TqyM/4SXR43Fe+Heo/zTaA4uLn8dpbL8H5/RVmHJ2zs1U/PQtq9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fW5KHPfZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fW5KHPfZ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso28995055e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 13:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743885949; x=1744490749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vzyrEUbK6/zEgenV46lD8iBpFspjFg8gklZpHav+KU=;
        b=fW5KHPfZeMf4fEsQEJa7oUea+WO6FY5zbj/kufISGcwDGLB0HWRjCI+uoLAx53bGYU
         z4WZAPxAP3A1Kj93fr4t6QYIMg0SdxON7cEi0wgJUnoWTovJwKZDklAB7z4ccY+EhhDC
         D9RFZ91mGLCjGXU0eXWOltgH1SakbWZdkh0S+610A5jpMsWZGxwRvkJv5X+o8L4/haUO
         S/H2XIMiqv9cW4KjgJkre5GdnpC0VpLmk+oHFFFy6T8BGUwJwlU55xFJ/LP2/b+lNqJg
         6f63hYCgFYLq5BVLBI134XyZt7hWsUxS4MowySbl25qlFkLMRsRHn9m30Ecw7TaeO/YJ
         jQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743885949; x=1744490749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vzyrEUbK6/zEgenV46lD8iBpFspjFg8gklZpHav+KU=;
        b=bguUv3rQqrRXp7Qsvv/cG3PSnDCreUW+jF6/USskNNnEbVOlBOh4G7W918e1i34Lki
         fR1dsNorNQyUu0j41ZDnbk8XL5MIID+Dk3ZzAz5qKnbV9dUQCqwl/gQdJw3Jclnpannr
         swMgwBTrlWLKugiYQXeuNe5OujZWrpDgV9fTXD256Hn7cS/dkLSp0/79N7a6kbP+CUaG
         AjbPrSSuDIHu2NzhTwndF23+z0t5eDdh1Wk5UwHpwmvRiYYYhfSHq5M0ofFw4fXBfvdk
         1LHMZTo+SCJmUqq9Pf7TEYibstEp3NB7w2qiVui/L0kvruUP+9s3wQF/hHqh1VTLypeW
         da5g==
X-Forwarded-Encrypted: i=1; AJvYcCWODKEPyy6BdJuOgU8CctEF1VCS9OUoAH4qpPTHov+yUbxUDc3TK012azcLfJ8xIm+qXTuUg76g4NY1wTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMoStj1nWsA539pUQKGWi/VZ5HhsZTx2G57gVBl4CmBI7B1kTs
	qKFAakM8NEa77OSihPDlPC6V+V9vhCcT0Jcoc3edLe2H9a8qvl22
X-Gm-Gg: ASbGncuB/ts0fNhYGRS6d3N3vJlYm4o7JoI8EzTMWrdr8mOU0lFuEx33HkznNzugIGN
	9eGSAbf0c2vmfHQV/dsqH70/+N8JyeJrWSFI8psi7n3B1rRPhbk6bq9x3R9gdncwE6RjiplWKGU
	qXTpzPEVkwVa77b4rTmzQ91JGQqw4oXqdl/jLSRKsYWVSgbCUw5UU72PUmYvKKNT0wg2Ljkp8ug
	zHJcs/Y8ZFVstFCdnFoMskQMc5Ym+D05sQlOoNezW4c7607HNpMZXusTUWC3d9LlE3MYI7Kpjw8
	froJsE3kOZ3zXFLyMMZNgtxSuYO8xGGamQ6sFpYm3lrMkoGWm3/YAJ1cg2iIekxEEp4PMSvox7/
	vmtYAjz6r+6/mY/vJJzKmlueSAA==
X-Google-Smtp-Source: AGHT+IE6+gHi6YaqfT+JwWcRseDP+9X0E2J0h932dQThJkZQBpH1nbA18RNPZvtvhtzSv2o34R6LUg==
X-Received: by 2002:a05:600c:45cc:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-43ecfa19d6bmr48430845e9.33.1743885948523;
        Sat, 05 Apr 2025 13:45:48 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096ecasm8027042f8f.18.2025.04.05.13.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 13:45:48 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 2/3] lib: Add tests for mul_u64_u64_div_u64_roundup()
Date: Sat,  5 Apr 2025 21:45:29 +0100
Message-Id: <20250405204530.186242-3-david.laight.linux@gmail.com>
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

Replicate the existing mul_u64_u64_div_u64() test cases with round up.
Update the shell script that verifies the table, remove the comment
markers so that it can be directly pasted into a shell.

It any tests fail then fail the module load with -EINVAL.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 lib/math/test_mul_u64_u64_div_u64.c | 112 ++++++++++++++++------------
 1 file changed, 66 insertions(+), 46 deletions(-)

diff --git a/lib/math/test_mul_u64_u64_div_u64.c b/lib/math/test_mul_u64_u64_div_u64.c
index 58d058de4e73..9548eb7458c7 100644
--- a/lib/math/test_mul_u64_u64_div_u64.c
+++ b/lib/math/test_mul_u64_u64_div_u64.c
@@ -10,61 +10,72 @@
 #include <linux/printk.h>
 #include <linux/math64.h>
 
-typedef struct { u64 a; u64 b; u64 c; u64 result; } test_params;
+typedef struct { u64 a; u64 b; u64 c; u64 result; uint round_up;} test_params;
 
 static test_params test_values[] = {
 /* this contains many edge values followed by a couple random values */
-{                0xb,                0x7,                0x3,               0x19 },
-{         0xffff0000,         0xffff0000,                0xf, 0x1110eeef00000000 },
-{         0xffffffff,         0xffffffff,                0x1, 0xfffffffe00000001 },
-{         0xffffffff,         0xffffffff,                0x2, 0x7fffffff00000000 },
-{        0x1ffffffff,         0xffffffff,                0x2, 0xfffffffe80000000 },
-{        0x1ffffffff,         0xffffffff,                0x3, 0xaaaaaaa9aaaaaaab },
-{        0x1ffffffff,        0x1ffffffff,                0x4, 0xffffffff00000000 },
-{ 0xffff000000000000, 0xffff000000000000, 0xffff000000000001, 0xfffeffffffffffff },
-{ 0x3333333333333333, 0x3333333333333333, 0x5555555555555555, 0x1eb851eb851eb851 },
-{ 0x7fffffffffffffff,                0x2,                0x3, 0x5555555555555554 },
-{ 0xffffffffffffffff,                0x2, 0x8000000000000000,                0x3 },
-{ 0xffffffffffffffff,                0x2, 0xc000000000000000,                0x2 },
-{ 0xffffffffffffffff, 0x4000000000000004, 0x8000000000000000, 0x8000000000000007 },
-{ 0xffffffffffffffff, 0x4000000000000001, 0x8000000000000000, 0x8000000000000001 },
-{ 0xffffffffffffffff, 0x8000000000000001, 0xffffffffffffffff, 0x8000000000000001 },
-{ 0xfffffffffffffffe, 0x8000000000000001, 0xffffffffffffffff, 0x8000000000000000 },
-{ 0xffffffffffffffff, 0x8000000000000001, 0xfffffffffffffffe, 0x8000000000000001 },
-{ 0xffffffffffffffff, 0x8000000000000001, 0xfffffffffffffffd, 0x8000000000000002 },
-{ 0x7fffffffffffffff, 0xffffffffffffffff, 0xc000000000000000, 0xaaaaaaaaaaaaaaa8 },
-{ 0xffffffffffffffff, 0x7fffffffffffffff, 0xa000000000000000, 0xccccccccccccccca },
-{ 0xffffffffffffffff, 0x7fffffffffffffff, 0x9000000000000000, 0xe38e38e38e38e38b },
-{ 0x7fffffffffffffff, 0x7fffffffffffffff, 0x5000000000000000, 0xccccccccccccccc9 },
-{ 0xffffffffffffffff, 0xfffffffffffffffe, 0xffffffffffffffff, 0xfffffffffffffffe },
-{ 0xe6102d256d7ea3ae, 0x70a77d0be4c31201, 0xd63ec35ab3220357, 0x78f8bf8cc86c6e18 },
-{ 0xf53bae05cb86c6e1, 0x3847b32d2f8d32e0, 0xcfd4f55a647f403c, 0x42687f79d8998d35 },
-{ 0x9951c5498f941092, 0x1f8c8bfdf287a251, 0xa3c8dc5f81ea3fe2, 0x1d887cb25900091f },
-{ 0x374fee9daa1bb2bb, 0x0d0bfbff7b8ae3ef, 0xc169337bd42d5179, 0x03bb2dbaffcbb961 },
-{ 0xeac0d03ac10eeaf0, 0x89be05dfa162ed9b, 0x92bb1679a41f0e4b, 0xdc5f5cc9e270d216 },
+{                0xb,                0x7,                0x3,               0x19, 1 },
+{         0xffff0000,         0xffff0000,                0xf, 0x1110eeef00000000, 0 },
+{         0xffffffff,         0xffffffff,                0x1, 0xfffffffe00000001, 0 },
+{         0xffffffff,         0xffffffff,                0x2, 0x7fffffff00000000, 1 },
+{        0x1ffffffff,         0xffffffff,                0x2, 0xfffffffe80000000, 1 },
+{        0x1ffffffff,         0xffffffff,                0x3, 0xaaaaaaa9aaaaaaab, 0 },
+{        0x1ffffffff,        0x1ffffffff,                0x4, 0xffffffff00000000, 1 },
+{ 0xffff000000000000, 0xffff000000000000, 0xffff000000000001, 0xfffeffffffffffff, 1 },
+{ 0x3333333333333333, 0x3333333333333333, 0x5555555555555555, 0x1eb851eb851eb851, 1 },
+{ 0x7fffffffffffffff,                0x2,                0x3, 0x5555555555555554, 1 },
+{ 0xffffffffffffffff,                0x2, 0x8000000000000000,                0x3, 1 },
+{ 0xffffffffffffffff,                0x2, 0xc000000000000000,                0x2, 1 },
+{ 0xffffffffffffffff, 0x4000000000000004, 0x8000000000000000, 0x8000000000000007, 1 },
+{ 0xffffffffffffffff, 0x4000000000000001, 0x8000000000000000, 0x8000000000000001, 1 },
+{ 0xffffffffffffffff, 0x8000000000000001, 0xffffffffffffffff, 0x8000000000000001, 0 },
+{ 0xfffffffffffffffe, 0x8000000000000001, 0xffffffffffffffff, 0x8000000000000000, 1 },
+{ 0xffffffffffffffff, 0x8000000000000001, 0xfffffffffffffffe, 0x8000000000000001, 1 },
+{ 0xffffffffffffffff, 0x8000000000000001, 0xfffffffffffffffd, 0x8000000000000002, 1 },
+{ 0x7fffffffffffffff, 0xffffffffffffffff, 0xc000000000000000, 0xaaaaaaaaaaaaaaa8, 1 },
+{ 0xffffffffffffffff, 0x7fffffffffffffff, 0xa000000000000000, 0xccccccccccccccca, 1 },
+{ 0xffffffffffffffff, 0x7fffffffffffffff, 0x9000000000000000, 0xe38e38e38e38e38b, 1 },
+{ 0x7fffffffffffffff, 0x7fffffffffffffff, 0x5000000000000000, 0xccccccccccccccc9, 1 },
+{ 0xffffffffffffffff, 0xfffffffffffffffe, 0xffffffffffffffff, 0xfffffffffffffffe, 0 },
+{ 0xe6102d256d7ea3ae, 0x70a77d0be4c31201, 0xd63ec35ab3220357, 0x78f8bf8cc86c6e18, 1 },
+{ 0xf53bae05cb86c6e1, 0x3847b32d2f8d32e0, 0xcfd4f55a647f403c, 0x42687f79d8998d35, 1 },
+{ 0x9951c5498f941092, 0x1f8c8bfdf287a251, 0xa3c8dc5f81ea3fe2, 0x1d887cb25900091f, 1 },
+{ 0x374fee9daa1bb2bb, 0x0d0bfbff7b8ae3ef, 0xc169337bd42d5179, 0x03bb2dbaffcbb961, 1 },
+{ 0xeac0d03ac10eeaf0, 0x89be05dfa162ed9b, 0x92bb1679a41f0e4b, 0xdc5f5cc9e270d216, 1 },
 };
 
 /*
  * The above table can be verified with the following shell script:
- *
- * #!/bin/sh
- * sed -ne 's/^{ \+\(.*\), \+\(.*\), \+\(.*\), \+\(.*\) },$/\1 \2 \3 \4/p' \
- *     lib/math/test_mul_u64_u64_div_u64.c |
- * while read a b c r; do
- *   expected=$( printf "obase=16; ibase=16; %X * %X / %X\n" $a $b $c | bc )
- *   given=$( printf "%X\n" $r )
- *   if [ "$expected" = "$given" ]; then
- *     echo "$a * $b / $c = $r OK"
- *   else
- *     echo "$a * $b / $c = $r is wrong" >&2
- *     echo "should be equivalent to 0x$expected" >&2
- *     exit 1
- *   fi
- * done
+
+#!/bin/sh
+sed -ne 's/^{ \+\(.*\), \+\(.*\), \+\(.*\), \+\(.*\), \+\(.*\) },$/\1 \2 \3 \4 \5/p' \
+    lib/math/test_mul_u64_u64_div_u64.c |
+while read a b c r d; do
+  expected=$( printf "obase=16; ibase=16; %X * %X / %X\n" $a $b $c | bc )
+  given=$( printf "%X\n" $r )
+  if [ "$expected" = "$given" ]; then
+    echo "$a * $b  / $c = $r OK"
+  else
+    echo "$a * $b  / $c = $r is wrong" >&2
+    echo "should be equivalent to 0x$expected" >&2
+    exit 1
+  fi
+  expected=$( printf "obase=16; ibase=16; (%X * %X + %X) / %X\n" $a $b $((c-1)) $c | bc )
+  given=$( printf "%X\n" $((r + d)) )
+  if [ "$expected" = "$given" ]; then
+    echo "$a * $b +/ $c = $(printf '%#x' $((r + d))) OK"
+  else
+    echo "$a * $b +/ $c = $(printf '%#x' $((r + d))) is wrong" >&2
+    echo "should be equivalent to 0x$expected" >&2
+    exit 1
+  fi
+done
+
  */
 
 static int __init test_init(void)
 {
+	int errors = 0;
 	int i;
 
 	pr_info("Starting mul_u64_u64_div_u64() test\n");
@@ -75,16 +86,25 @@ static int __init test_init(void)
 		u64 c = test_values[i].c;
 		u64 expected_result = test_values[i].result;
 		u64 result = mul_u64_u64_div_u64(a, b, c);
+		u64 result_up = mul_u64_u64_div_u64_roundup(a, b, c);
 
 		if (result != expected_result) {
 			pr_err("ERROR: 0x%016llx * 0x%016llx / 0x%016llx\n", a, b, c);
 			pr_err("ERROR: expected result: %016llx\n", expected_result);
 			pr_err("ERROR: obtained result: %016llx\n", result);
+			errors++;
+		}
+		expected_result += test_values[i].round_up;
+		if (result_up != expected_result) {
+			pr_err("ERROR: 0x%016llx * 0x%016llx +/ 0x%016llx\n", a, b, c);
+			pr_err("ERROR: expected result: %016llx\n", expected_result);
+			pr_err("ERROR: obtained result: %016llx\n", result_up);
+			errors++;
 		}
 	}
 
-	pr_info("Completed mul_u64_u64_div_u64() test\n");
-	return 0;
+	pr_info("Completed mul_u64_u64_div_u64() test, %d errors\n", errors);
+	return errors ? -EINVAL : 0;
 }
 
 static void __exit test_exit(void)
-- 
2.39.5

