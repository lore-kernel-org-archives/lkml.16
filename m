Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8378D200BBC
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749894859; cv=none; b=LFnY3bK8bpBrciJHLFXZRFOaARaQwcap/IoFeGtR2cMyvtUCBxj5D5cEBcR5X9qvTYPAJNxLH+KqBIBVJZu+9Z2hEb3w+jpzz5VO+PeRviKidlme/ldSZTr5wCjUSYT1ILyrcYvD+eYRR+79GF2TTvvgWVcIN/MEfyXy8ciEPJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749894859; c=relaxed/simple;
	bh=Z5hzu1KYGp1QiejfFXW9fK6Q53roitRAH7xYYDd4dnY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pyzeAPzYwjJ9HgqW+MwmnTVFHIdJsyeWyHjSoN8A7l7DVIMUEY7SwpP+FqbC+51r4qjI2+suMVwUtOxC/IBwn364DC7g8qlOu/JNzva2VIDJwb7pXWAGAE8EMkgzGqVl6lbzLWH2ZYFt58Lh7Gn6ilexhTxMruH1NYu/7p6oE5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFYWjRt1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFYWjRt1"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a575a988f9so257819f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749894856; x=1750499656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdx9zr3Z1yBW7Zs2OBAHWfDA624/sOwZdHmBJOvy5iU=;
        b=NFYWjRt1lIltFpZj386tOhNELwUym8YwqKluwNwvX7reTemKhFBLMqdB8t1OKPHfH/
         QeRKp9Fc/xPnSWRewSsDFdfC4/RKbkPe5Dn+NtE3bCBc0SfC5CMZiNQcwuxgI67iifpK
         5k5Au4qS1kKxYx6VPzilUQ8ikgpawE3ghbcq7v4JTHZLCXuyRZ2YN4iEWKE12nO7UpZQ
         timY48Jk6plax6+zz0RCUtUT3d4HhDWIG6nFszz8osBqQozaoj7x27sNHDdI7ZwjM5pI
         NyS5LLg+setEVIzeWr5IZeG3Fc7ykF4Qp/wWp229xfggcsf6wcPZl9r5amlKJOJW+8zv
         yrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749894856; x=1750499656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdx9zr3Z1yBW7Zs2OBAHWfDA624/sOwZdHmBJOvy5iU=;
        b=OLkf8cvCkhSKZRtWLx+EGXB7mYLTYTRYRpuS27QhlSj4vYBn+kPVEPlJQsSQiuuXR4
         i8x/Duryzx+u69c24ZFp+FAFfzswiPr85mdnajjMrW/zM0qt/turCNYYs9saSF+z96Gv
         i6q6f4PYadU1s/x77gKS4/jEksWDpZ1eJHpPjVwKk34zaxPH9S5229+rRP2XnXvot8ff
         hmZajaZHw9wo9Oo54386w7l4gRyRqLdexakTxpicMvLLaCJtK8lY6M1ydSAU7KQcw6pj
         VkjKrKLIf5Tdbj85ZWm4FrLcgUkjWkTfW0DpzDoxo5qv2aj+W23sFy19c6d3f/DQ7FYi
         WBtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUhhOzIoN22YJMuCI/ZavEBGW+Xjjp9VutXBQy1pDyAyrq+vTkUXXAzXeCnOyFRQCiVjrOjXtf+mCTlu4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe/BKFUZjCamaWh0BlKVep1+ifRpD8jByfEsu894pPNfoOymvi
	cVOb4ftfHO9tNSouMIUz4eiccflhKGbEeMpLOz+vSXYA7/kEw6nukNj4GnkmTQ==
X-Gm-Gg: ASbGncuy53HM/WwpfXgYzPt+YIYkv8uqdcik8eRwq1+p2zkw+fp4aMTvZIzzsR1Vzij
	qk9Rhot64ThL1Q+ocxbDzqmA9a+Q+HkzZwBgjDbTqdMNM+pfSOX6N32in/AbEsroN00tKezbrYy
	tfx0UIjnY2lBrj7yfeLlfYzluw3kov0J7EWyFF1xYSRuaT3jdezL3i977HqAq25NF+XiTFwUVd2
	CK/PvtZIhrBnAb35I9JfyoGdFJqMhrem5+yX3Nn2mG9RXmS1ycYrrFKSCwv70gMo5vh1SURg4DU
	QkCgjCmSPNOFyAUpKt1EIv/ZDf4rbijy7F5kQz82sR4X8sE1HuJsLbh+i6uSubObSmpvFUv97Gt
	mSHIlURCHGG1I5ws6j2IhE912lPTvSHLXS1F7Rb6ub2lBm158Q6f0hw==
X-Google-Smtp-Source: AGHT+IFRtCg+wzVm0vQk2uN9Kk18ZSaVFYJ73nA85I0SubpmWS1UwpViZSgDcDNPhMQlI0jm5e1mWw==
X-Received: by 2002:a05:6000:2003:b0:3a4:dd02:f565 with SMTP id ffacd0b85a97d-3a572397756mr2468489f8f.3.1749894855664;
        Sat, 14 Jun 2025 02:54:15 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b19b32sm4869444f8f.67.2025.06.14.02.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:54:15 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	u.kleine-koenig@baylibre.com,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 next 06/10] lib: test_mul_u64_u64_div_u64: Test both generic and arch versions
Date: Sat, 14 Jun 2025 10:53:42 +0100
Message-Id: <20250614095346.69130-7-david.laight.linux@gmail.com>
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

Change the #if in div64.c so that test_mul_u64_u64_div_u64.c
can compile and test the generic version (including the 'long multiply')
on architectures (eg amd64) that define their own copy.

Test the kernel version and the locally compiled version on all arch.
Output the time taken (in ns) on the 'test completed' trace.

For reference, on my zen 5, the optimised version takes ~220ns and the
generic version ~3350ns.
Using the native multiply saves ~200ns and adding back the ilog2() 'optimisation'
test adds ~50ms.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---

New patch for v3, replacing changes in v1 that were removed for v2.

 lib/math/div64.c                    |  8 +++--
 lib/math/test_mul_u64_u64_div_u64.c | 48 ++++++++++++++++++++++++-----
 2 files changed, 47 insertions(+), 9 deletions(-)

diff --git a/lib/math/div64.c b/lib/math/div64.c
index 7850cc0a7596..22433e5565c4 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -178,13 +178,15 @@ EXPORT_SYMBOL(div64_s64);
  * Iterative div/mod for use when dividend is not expected to be much
  * bigger than divisor.
  */
+#ifndef iter_div_u64_rem
 u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
 {
 	return __iter_div_u64_rem(dividend, divisor, remainder);
 }
 EXPORT_SYMBOL(iter_div_u64_rem);
+#endif
 
-#ifndef mul_u64_add_u64_div_u64
+#if !defined(mul_u64_add_u64_div_u64) || defined(test_mul_u64_add_u64_div_u64)
 u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
 {
 	if (WARN_ONCE(!d, "%s: division of (%#llx * %#llx + %#llx) by zero, returning 0",
@@ -196,7 +198,7 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
 		return 0;
 	}
 
-#if defined(__SIZEOF_INT128__)
+#if defined(__SIZEOF_INT128__) && !defined(test_mul_u64_add_u64_div_u64)
 
 	/* native 64x64=128 bits multiplication */
 	u128 prod = (u128)a * b + c;
@@ -270,5 +272,7 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
 
 	return res;
 }
+#if !defined(test_mul_u64_add_u64_div_u64)
 EXPORT_SYMBOL(mul_u64_add_u64_div_u64);
 #endif
+#endif
diff --git a/lib/math/test_mul_u64_u64_div_u64.c b/lib/math/test_mul_u64_u64_div_u64.c
index ea5b703cccff..f0134f25cb0d 100644
--- a/lib/math/test_mul_u64_u64_div_u64.c
+++ b/lib/math/test_mul_u64_u64_div_u64.c
@@ -73,21 +73,34 @@ done
 
  */
 
-static int __init test_init(void)
+static u64 test_mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d);
+
+static int __init test_run(unsigned int fn_no, const char *fn_name)
 {
+	u64 start_time;
 	int errors = 0;
 	int tests = 0;
 	int i;
 
-	pr_info("Starting mul_u64_u64_div_u64() test\n");
+	start_time = ktime_get_ns();
 
 	for (i = 0; i < ARRAY_SIZE(test_values); i++) {
 		u64 a = test_values[i].a;
 		u64 b = test_values[i].b;
 		u64 d = test_values[i].d;
 		u64 expected_result = test_values[i].result;
-		u64 result = mul_u64_u64_div_u64(a, b, d);
-		u64 result_up = mul_u64_u64_div_u64_roundup(a, b, d);
+		u64 result, result_up;
+
+		switch (fn_no) {
+		default:
+			result = mul_u64_u64_div_u64(a, b, d);
+			result_up = mul_u64_u64_div_u64_roundup(a, b, d);
+			break;
+		case 1:
+			result = test_mul_u64_add_u64_div_u64(a, b, 0, d);
+			result_up = test_mul_u64_add_u64_div_u64(a, b, d - 1, d);
+			break;
+		}
 
 		tests += 2;
 
@@ -106,15 +119,36 @@ static int __init test_init(void)
 		}
 	}
 
-	pr_info("Completed mul_u64_u64_div_u64() test, %d tests, %d errors\n",
-		tests, errors);
-	return errors ? -EINVAL : 0;
+	pr_info("Completed %s() test, %d tests, %d errors, %llu ns\n",
+		fn_name, tests, errors, ktime_get_ns() - start_time);
+	return errors;
+}
+
+static int __init test_init(void)
+{
+	pr_info("Starting mul_u64_u64_div_u64() test\n");
+	if (test_run(0, "mul_u64_u64_div_u64"))
+		return -EINVAL;
+	if (test_run(1, "test_mul_u64_u64_div_u64"))
+		return -EINVAL;
+	return 0;
 }
 
 static void __exit test_exit(void)
 {
 }
 
+/* Compile the generic mul_u64_add_u64_div_u64() code */
+#define div64_u64 div64_u64
+#define div64_s64 div64_s64
+#define iter_div_u64_rem iter_div_u64_rem
+
+#undef mul_u64_add_u64_div_u64
+#define mul_u64_add_u64_div_u64 test_mul_u64_add_u64_div_u64
+#define test_mul_u64_add_u64_div_u64 test_mul_u64_add_u64_div_u64
+
+#include "div64.c"
+
 module_init(test_init);
 module_exit(test_exit);
 
-- 
2.39.5

