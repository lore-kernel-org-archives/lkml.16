Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0468A1DE3A8
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749894859; cv=none; b=Kpt90MlvIkCH5kmcqjZQyJbNzPJfaFMmsiYWqzGEiP7eFvby4JNRzSktk0gX5bYXJyZMttRzks6inFOJOXPX8a5UxNkY1Bzlbf5KRT4ZHX5f41jiIHlE+o24wuzzaJ7R5Sg1PxoFCsPynqYoDlR0n1d2Z/qw95qlewIkcL1FBME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749894859; c=relaxed/simple;
	bh=n94r1iGKEr3TiNgolTbPj8u7MorHH7FIByppBdcWdKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kZnKmM72dftfplYx10xJ48+vb9hTIkf920EA/0YQh+EqWHMxXv/LN13OHXDVtG4JyhZN3Q3db+ORCPcmReQThVoRpRUa8qFhjAqGHd3U530cPfdpXLaEpJJZUT75PI2Kxn5bao/AkSO/YSn07srqLT994ZgjNb2mSQt+Ul/zJDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLHpyKVy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLHpyKVy"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4533bf4d817so4220165e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749894855; x=1750499655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEnTZdM/nEO25TyhM2GgCtjBibybJT5d1uMDui3gNg8=;
        b=OLHpyKVyGYpP7/iUeDEi4asxly6SC3AoKjknM7+u74jKjiasvv1SCSszSLtCqjPKM4
         xaA1UK5pcedzQI7vC648qLyMm/Qti4DD0Dm2sTEZPJVKSqvv1RXISe9eAi7Wfh0Ovywv
         Wfp835gyzn1jCQB2+mLJQmn+frQ9IrBGFLNHrVL1q/W1RMlO0kdutD5xsgopc+cLwIy3
         f9bpPUM+/eUW3T+svLy4SdhXhrRm19uufC2tRgew0gWA2cKhGWOPJ5A2M6p8NBnUyQbS
         UX15GSE9Qjb9ZRh0xeOJRMNm7X9h/H2MnET3J3guXcOKSW0DosGNEEtX8ixg9ZNyrpyd
         PL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749894855; x=1750499655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEnTZdM/nEO25TyhM2GgCtjBibybJT5d1uMDui3gNg8=;
        b=F9UDUc2UQ53QUC0IPwp1/eZ/icAPeGCOVy9AdtIlyCpOAvGdf/p8sh7de9JZ/K9Fy3
         /MfRxHpJH2CxrNBisMaMdkq2n3O2sN7jOpDLNmShhfNsIJoQwJ9Jb8CHfS1JnozI3jox
         ibW6yDHp7MfjuyibGDBt1CjBUFc67nKJtjH6/CbW3REYV49QUs7Sxb46rRqdHQgtVWO7
         21M6oq4rN/6eMONcA0xwnMuwgJfRDelPAdi7c695++IwtSNWW4UPChZY8EGcXsvZSqAz
         STHEMdMT4IJWDoFAi97D8VEzqYEG2WpdWhpaOZGo5C2feGCuCMT2RvSD0yhdkGA/awXk
         OuQA==
X-Forwarded-Encrypted: i=1; AJvYcCWJQQdkgsvIbFpJ/WRul+Eo356D8oitoza8/1uSr/UOoFHysVDFvIqOf7bKL/TaLpvD+CniN+7ptUphMSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPUsX6JvyxqrcQ3lr2dzuk5naKX5OrNnwrEsELub9TBl2/JgLe
	b5TJRTNvfrcP8FdgRqMQPCtacGMZdnPX/meqEtLeOO/cTm/XSmUj4AGK
X-Gm-Gg: ASbGncv+hJ+tODUWIPwmFOej1xTcn4FbZFndaE3KxFghzn6TeQhN5+4MfdWPwXi3znd
	8qX4jgvRYZQMV8dGa6EuMq+O32lzwzoGs9J7axV8PT3GqeOPp4uAIKZWITtIjKkapQqCt1ZPDLJ
	jDDjB0t9NPyy+l8yjVxjZ8VI6DFbRiHwHa+u0lPJbLO4CFuBLtiJl+aA+EpWzVeyODFbvxtSD3C
	TT5nwexrlCrDyRJ5ZBUrorJyXRIBClkfsefAAKbbfUi84sBpJDeWWo8iUCV7exqJiLZqdARHkkE
	16O+IlOg1yVfFKUf1eHF4HSryNixKpSQPqUhZUsFmYNnL2dqtfW3jEAYpU6dW7MRZkhcq+FiSRW
	ZdUnfj5Ju8RR5oH+Yz4fW4fWa/4sV1KYNlaxoU/5rjKY=
X-Google-Smtp-Source: AGHT+IGG7FXFstBCaJSZ99EkRoiD5VoPJ9Uqi8ywctGye8MRdWYs7O71NT1/WI1+uaJ0oiJ5K4lMeQ==
X-Received: by 2002:a05:6000:2486:b0:3a5:52d4:5b39 with SMTP id ffacd0b85a97d-3a572398ea5mr2411614f8f.8.1749894855151;
        Sat, 14 Jun 2025 02:54:15 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b19b32sm4869444f8f.67.2025.06.14.02.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:54:14 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	u.kleine-koenig@baylibre.com,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 next 05/10] lib: Add tests for mul_u64_u64_div_u64_roundup()
Date: Sat, 14 Jun 2025 10:53:41 +0100
Message-Id: <20250614095346.69130-6-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250614095346.69130-1-david.laight.linux@gmail.com>
References: <20250614095346.69130-1-david.laight.linux@gmail.com>
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

Rename the divisor from 'c' to 'd' to match mul_u64_add_u64_div_u64().

It any tests fail then fail the module load with -EINVAL.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---

Changes for v3:
- Rename 'c' to 'd' to match mul_u64_add_u64_div_u64()

 lib/math/test_mul_u64_u64_div_u64.c | 122 +++++++++++++++++-----------
 1 file changed, 73 insertions(+), 49 deletions(-)

diff --git a/lib/math/test_mul_u64_u64_div_u64.c b/lib/math/test_mul_u64_u64_div_u64.c
index 58d058de4e73..ea5b703cccff 100644
--- a/lib/math/test_mul_u64_u64_div_u64.c
+++ b/lib/math/test_mul_u64_u64_div_u64.c
@@ -10,61 +10,73 @@
 #include <linux/printk.h>
 #include <linux/math64.h>
 
-typedef struct { u64 a; u64 b; u64 c; u64 result; } test_params;
+typedef struct { u64 a; u64 b; u64 d; u64 result; uint round_up;} test_params;
 
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
+while read a b d r d; do
+  expected=$( printf "obase=16; ibase=16; %X * %X / %X\n" $a $b $d | bc )
+  given=$( printf "%X\n" $r )
+  if [ "$expected" = "$given" ]; then
+    echo "$a * $b  / $d = $r OK"
+  else
+    echo "$a * $b  / $d = $r is wrong" >&2
+    echo "should be equivalent to 0x$expected" >&2
+    exit 1
+  fi
+  expected=$( printf "obase=16; ibase=16; (%X * %X + %X) / %X\n" $a $b $((d-1)) $d | bc )
+  given=$( printf "%X\n" $((r + d)) )
+  if [ "$expected" = "$given" ]; then
+    echo "$a * $b +/ $d = $(printf '%#x' $((r + d))) OK"
+  else
+    echo "$a * $b +/ $d = $(printf '%#x' $((r + d))) is wrong" >&2
+    echo "should be equivalent to 0x$expected" >&2
+    exit 1
+  fi
+done
+
  */
 
 static int __init test_init(void)
 {
+	int errors = 0;
+	int tests = 0;
 	int i;
 
 	pr_info("Starting mul_u64_u64_div_u64() test\n");
@@ -72,19 +84,31 @@ static int __init test_init(void)
 	for (i = 0; i < ARRAY_SIZE(test_values); i++) {
 		u64 a = test_values[i].a;
 		u64 b = test_values[i].b;
-		u64 c = test_values[i].c;
+		u64 d = test_values[i].d;
 		u64 expected_result = test_values[i].result;
-		u64 result = mul_u64_u64_div_u64(a, b, c);
+		u64 result = mul_u64_u64_div_u64(a, b, d);
+		u64 result_up = mul_u64_u64_div_u64_roundup(a, b, d);
+
+		tests += 2;
 
 		if (result != expected_result) {
-			pr_err("ERROR: 0x%016llx * 0x%016llx / 0x%016llx\n", a, b, c);
+			pr_err("ERROR: 0x%016llx * 0x%016llx / 0x%016llx\n", a, b, d);
 			pr_err("ERROR: expected result: %016llx\n", expected_result);
 			pr_err("ERROR: obtained result: %016llx\n", result);
+			errors++;
+		}
+		expected_result += test_values[i].round_up;
+		if (result_up != expected_result) {
+			pr_err("ERROR: 0x%016llx * 0x%016llx +/ 0x%016llx\n", a, b, d);
+			pr_err("ERROR: expected result: %016llx\n", expected_result);
+			pr_err("ERROR: obtained result: %016llx\n", result_up);
+			errors++;
 		}
 	}
 
-	pr_info("Completed mul_u64_u64_div_u64() test\n");
-	return 0;
+	pr_info("Completed mul_u64_u64_div_u64() test, %d tests, %d errors\n",
+		tests, errors);
+	return errors ? -EINVAL : 0;
 }
 
 static void __exit test_exit(void)
-- 
2.39.5

