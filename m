Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0976721931E
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747575544; cv=none; b=JrHAb3Te50QnNk7UBLv76ZWeQekyw7Q02UEu52cjspxEL2R55Tw3KXqAd8bwhk9nLpVFLB/69lw4Bmswga8k+o4DcU4eze/BN1kCSQYuotWspFQlefKpwmmycmOwtK5l3EI5qpBMcDR8O5dsppi5Sh3vcivsqU89aBYb0WL/PzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747575544; c=relaxed/simple;
	bh=ahVKsryo5fJK8cRYJYD2qDeTO3r6r+FuEN+QGZOPkCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=to3LK0PGOUj5cnZqELg0uFKagev8CPkuLApvfcr+3jJvxtBsJEkNNvo6B5/4qAeDINl7CQthL/hxkL0FoX5uPwOf5Tmae8OtcIAWL71lig0JmWBhtENGibpAdI1ULx8lRIYoNtnkTqiMMno073ylvDUUB8j+zZXqdsVYPX9uEv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSEtVG9y; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSEtVG9y"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso32600805e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 06:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747575540; x=1748180340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5l+AFdahfaamX5xz3SGr3TGKeKCr101AWT1rgabtrA=;
        b=DSEtVG9ysQBbLL7deOH43sG84yZjn1opwikgSeZ0Zk2iLupgLZPeXvp9QW/NPLsiET
         iKvbSFYXvdjxdgGKiO00mPCws9DDbt8NulCMeerk33VfAdKPmHH3qPiqX+N1WA8vOezg
         bfvKqiTYELWMkPJ5ecEHbhjoPnWm1Iz/9UYgXrgzu4Cww3Ozb1VNTj2xBmNWpF3SQZoI
         JrfGmflgBpupjSXYZytgpQcT5WVEdCTBrJhrC4MLarJwb8+y/KWO0kfoTYhvd1rWggfC
         2fy/xH8HEjEOali0fwbrj0VunVMDE0oOcPAxfP6F5MWSnk32h5k+J1uaprh/XSekdQdF
         U8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747575540; x=1748180340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5l+AFdahfaamX5xz3SGr3TGKeKCr101AWT1rgabtrA=;
        b=BtS4urpYgPfbIrnEn+BD87Q1AXuFu/htprS8dhsfd9NEFTd3/Rfu2QsvVIcDKtgFop
         dtrvjrLJyrvO936JsSCk2ut1Rll0jlmn35Unsow8uEyNUVfYCBoLJlZ5TjjHimKscajE
         jwccMTS7txEWu86e6leHROoDCoWrTqioPVw4SeqRj9b1HCYvF8oocEp4LgRrlmO7Wddb
         GMuKne9bGna/SmBhFWBg2g5pwfv6tkWHqy6dRG7OB/Co06mv1+IeezqLsa8StJ9kB590
         jFJjnlJZHCLOBCueLnjHvSVdnIzgVIEAr9XTkdlr0ph46PzXMYrpnwg3KaMzWCdq3PaM
         0GVA==
X-Forwarded-Encrypted: i=1; AJvYcCUgUFxWxqNnV1tl9bIVUGWWyfZ+zdAScTiFNqO1+IkZkiVW71te3Hn+qITOalXEYUm3aqMx+khCYQQa+7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGXAoXAHXoAJ4bknV7a83YF83809IRWu4OZKZYl6LRclc9+oRL
	lnTIEMsoIgn6XwOudrwFs8v4lh0Jgb7Dop0d+e8Z2whKXKg4jY/34xH5
X-Gm-Gg: ASbGnctRrtDfH4HZ5TG57h0VcJGGb8G3egs+YP+NNyPNz9oW4kFacwV9UIzRVQSfXHc
	VQF4Npv5z84GobVXPrPucGlZSziaEhgeS9tft3TdrbYWSnK25mTiQdOjyI+pNAEm1tTN9QXRy3g
	f4bmJRTecDG1SjDuDAbrT1zopHaILx7C0aVM9e5tO3dK5POVTHiKhuSycGLcPyUpJRwW1jBl7CA
	n+pFLRYemBPf69l5ELrRWLlesaeHYYGv24ZmwglQK4rIDLqNtBLE8vkyS1rVJzGSX4D87B+1iOL
	slls55M/2+7fH0o2r1Wb3vgJheOdPi0RT/UZdlzVa6NEwd0zS7lrvdDhtlHG0SCJ5EZ4pnIP4I4
	fbDldgpHg9qJjr0zavbsKuqz89v9U4z45
X-Google-Smtp-Source: AGHT+IFf9N/0a43DmFdhhNj8e/1jd5AX2a/Ky8wnQHanBiEgEevHV5wkIKRhR0G0cdqeUwpBPtB19g==
X-Received: by 2002:a05:600d:1c:b0:442:ffb1:b58 with SMTP id 5b1f17b1804b1-442ffb10be7mr71723615e9.12.1747575540144;
        Sun, 18 May 2025 06:39:00 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a7d6sm9429508f8f.30.2025.05.18.06.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 06:38:59 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	u.kleine-koenig@baylibre.com,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 next 4/4] lib: Add tests for mul_u64_u64_div_u64_roundup()
Date: Sun, 18 May 2025 14:38:48 +0100
Message-Id: <20250518133848.5811-5-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250518133848.5811-1-david.laight.linux@gmail.com>
References: <20250518133848.5811-1-david.laight.linux@gmail.com>
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

Changes for v2 (was patch 1/3):
- Include the total number of tests in the final pr_info().

 lib/math/test_mul_u64_u64_div_u64.c | 116 +++++++++++++++++-----------
 1 file changed, 70 insertions(+), 46 deletions(-)

diff --git a/lib/math/test_mul_u64_u64_div_u64.c b/lib/math/test_mul_u64_u64_div_u64.c
index 58d058de4e73..383b0dfc8023 100644
--- a/lib/math/test_mul_u64_u64_div_u64.c
+++ b/lib/math/test_mul_u64_u64_div_u64.c
@@ -10,61 +10,73 @@
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
+	int tests = 0;
 	int i;
 
 	pr_info("Starting mul_u64_u64_div_u64() test\n");
@@ -75,16 +87,28 @@ static int __init test_init(void)
 		u64 c = test_values[i].c;
 		u64 expected_result = test_values[i].result;
 		u64 result = mul_u64_u64_div_u64(a, b, c);
+		u64 result_up = mul_u64_u64_div_u64_roundup(a, b, c);
+
+		tests += 2;
 
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
+	pr_info("Completed mul_u64_u64_div_u64() test, %d tests, %d errors\n",
+		tests, errors);
+	return errors ? -EINVAL : 0;
 }
 
 static void __exit test_exit(void)
-- 
2.39.5

