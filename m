Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCC7256C81
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749894861; cv=none; b=Y9R/LVT9CAJn41GFNwui6wabHPr/3FU8cfnXs3AaoHai3TA3K4vlsKEF2ll8mnV0jG/O7aWUB9ZlIjmK8bD01jTAjwKsGqb7t1+Ey+k23PBqcKbJU6MWJ33wWpCLuT97mHpi9wTl2wSG8bvP0o82wKqjEhUD74Mfio+Gw4JypTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749894861; c=relaxed/simple;
	bh=sw/StANdfeuHD1lCmTFwq6z44Xlo57UZpd7FUXDdO8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RithnU9UB/8+GvJ4pgqu0aZiOpMNsGTCiqsm8MnzIQW2FVhkidhm5O3ytCWZCmyHoYaq7mc+UYB9pIrqVsuXUHXf/HD+4LO+aGzdPVSmmE0O3/vOGpc9NpCQ73gHawlvFBDy/Kq0HJPFGnBuCvFiaaaxAQAk20FozVdj5wXfxYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIrINYXd; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIrINYXd"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a5257748e1so2130152f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749894858; x=1750499658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hU2TAGn71FWrOpga/52dRwN9mYl6H2hUFYejrisY8s=;
        b=hIrINYXd3SFFZXSou03VixHxHTRawvGGPHqn5RUgHwuFXOeGBytd2UaRnWir3ShgkK
         qa1TiEJUwV5SLOPNProN3J5EjQxE+9FR0qd5Yn7QqZZy4mv5FBFAKYu4DnCTcUIZOVEm
         k7q8531/LOQET+8D4LE9816Wy+0NrtbVQy152pmcLx/kd0Re4WZEXt7WQPQegB43JAWJ
         0oKNi8xhRLPY6bXaTDpJqlRIsTbZWgqGhVStd95O5Yxk4Db2mGWUbur2iKjEcP3QlYi5
         hfpB8S9gPqT0r4ksQgE4T6pPCRUj+SH5+Q+LJBfOnIYqhm6Xj49P4DyssiWZUtMsPOgp
         bGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749894858; x=1750499658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hU2TAGn71FWrOpga/52dRwN9mYl6H2hUFYejrisY8s=;
        b=FdPw44uWbozJL0bqvuq24XNU7oWc9K/+ZQr1wba2RL97Ef3vDboJp3KolZeckuKS9z
         XxWCuQxIzi4s+OGumdMJPQWYLQ4JbF6Tpgp0NzjpXy5Q9stuE0PKCZPqUNnU32p2sSPH
         /8+7FgiThA/CMIaBZbzeEzswXGkLGqzP7ZFpQyit6uvHhNYwDBFNUH/VJR1a9Xl1w3zw
         4iiZd6JKYyKYzlaQKN2Q9pCEbgvIKGN1U8qJ0HTWW00JG7UFWYBKvUBVtyHomr1MmRmW
         b6dsSqkaV5+/O53prZn1khs0Rc99hg+mDFzEGBtK7ezGCeeoGlGOMXTHdnHuRjlZTl2y
         7OzA==
X-Forwarded-Encrypted: i=1; AJvYcCWYakRzykyV2nog+fKgQSyTtpHHbiyK+g0M294TTGMlenhDu/c4DriQh9TsatMdp7Xov6QkgkJ+E8r2d1g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd2soVSwNLjo4UPQ2eWtJ8NUH+h9/qihO+f5hlFb7SB1ZMiwLM
	GYwI4nWG/g/C5LZmYIiNHjXnSqvnB9EtfAssGJbgaFhQ+7EePIhAE1uATiczlQ==
X-Gm-Gg: ASbGnctKVnBaKZvxil7kWLqBysSpYmsZqLy2hpGvfwjOEm2EZPh8Mhlth99RIG/xNUO
	aFn+/VRB3GZcWn1/sV7/kvZgF8QD5AzAhSFBZNhKXhHA7ES15kgIgDyXWu60ni/rfvEDnCl2Tp3
	RnrKIqTmNiSDz1scEiqyga2USQnvW3PRxHk9UqKV1+WfrqZfPa1LKz8Dzo+KoQaGOFiuFOkwPmg
	tYtLaJ2xhVTiuOg0cIoSqy95ZBG+9O/kp8LVdPS1+hyhoXa4lhbpxvpfkPk8ipkeFWDtJVj+PpX
	j5JFO2V01i4DMNN/IpU3LDXN31X204+P0VckdUwKLNU9a9kh2m55bAxzqggd+N3knAcgUZ4wFn5
	MPkHmnwf4vR06Ac7tbhg8gXrBqFz0Hub6AvGMHZozlCQ=
X-Google-Smtp-Source: AGHT+IFNq8WKXC8iWJP1ApWys1+VExNhCOBY+Wn3G77QMl9MpTqIxPJ8mysvwAhoiiZ+XZuLFhDiiA==
X-Received: by 2002:a5d:5e8b:0:b0:3a4:d0fe:429f with SMTP id ffacd0b85a97d-3a5723717f5mr2331756f8f.14.1749894857647;
        Sat, 14 Jun 2025 02:54:17 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b19b32sm4869444f8f.67.2025.06.14.02.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:54:17 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	u.kleine-koenig@baylibre.com,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 next 10/10] lib: test_mul_u64_u64_div_u64: Test the 32bit code on 64bit
Date: Sat, 14 Jun 2025 10:53:46 +0100
Message-Id: <20250614095346.69130-11-david.laight.linux@gmail.com>
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

There are slight differences in the mul_u64_add_u64_div_u64() code
between 32bit and 64bit systems.

Compile and test the 32bit version on 64bit hosts for better test
coverage.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---

new patch for v3.

 lib/math/test_mul_u64_u64_div_u64.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/lib/math/test_mul_u64_u64_div_u64.c b/lib/math/test_mul_u64_u64_div_u64.c
index f0134f25cb0d..ff5df742ec8a 100644
--- a/lib/math/test_mul_u64_u64_div_u64.c
+++ b/lib/math/test_mul_u64_u64_div_u64.c
@@ -74,6 +74,10 @@ done
  */
 
 static u64 test_mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d);
+#if __LONG_WIDTH__ >= 64
+#define TEST_32BIT_DIV
+static u64 test_mul_u64_add_u64_div_u64_32bit(u64 a, u64 b, u64 c, u64 d);
+#endif
 
 static int __init test_run(unsigned int fn_no, const char *fn_name)
 {
@@ -100,6 +104,12 @@ static int __init test_run(unsigned int fn_no, const char *fn_name)
 			result = test_mul_u64_add_u64_div_u64(a, b, 0, d);
 			result_up = test_mul_u64_add_u64_div_u64(a, b, d - 1, d);
 			break;
+#ifdef TEST_32BIT_DIV
+		case 2:
+			result = test_mul_u64_add_u64_div_u64_32bit(a, b, 0, d);
+			result_up = test_mul_u64_add_u64_div_u64_32bit(a, b, d - 1, d);
+			break;
+#endif
 		}
 
 		tests += 2;
@@ -131,6 +141,10 @@ static int __init test_init(void)
 		return -EINVAL;
 	if (test_run(1, "test_mul_u64_u64_div_u64"))
 		return -EINVAL;
+#ifdef TEST_32BIT_DIV
+	if (test_run(2, "test_mul_u64_u64_div_u64_32bit"))
+		return -EINVAL;
+#endif
 	return 0;
 }
 
@@ -149,6 +163,21 @@ static void __exit test_exit(void)
 
 #include "div64.c"
 
+#ifdef TEST_32BIT_DIV
+/* Recompile the generic code for 32bit long */
+#undef test_mul_u64_add_u64_div_u64
+#define test_mul_u64_add_u64_div_u64 test_mul_u64_add_u64_div_u64_32bit
+#undef BITS_PER_ITER
+#define BITS_PER_ITER 16
+
+#define mul_add mul_add_32bit
+#define mul_u64_u64_add_u64 mul_u64_u64_add_u64_32bit
+#undef mul_u64_long_add_u64
+#undef add_u64_long
+
+#include "div64.c"
+#endif
+
 module_init(test_init);
 module_exit(test_exit);
 
-- 
2.39.5

