Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C48B28936C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 13:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749217689; cv=none; b=hoxDya0Gp1cHYwW5qBOFsx8WnW6LR+MNsn7pSOIKUg9/9yPUarFJuHsbN/Ez6+oHwbXKSF6KmMvyzaMhaQUK3SLtD3FyftqtSmXeOQW/0saDpODUDErv5YEmYyoSwUdPQbSpQR3CjNaopuHpkFwqneulQJBtfbLhitM1Ensq2fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749217689; c=relaxed/simple;
	bh=QAzuCIf6SmB3yJkUb6LPFPckwrq7uhWrHQG0HRpWI6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KXoKSeYcMEMzYHPOVoVJAZqBSoq8rV4mBSJ3yKTzB8YXvw8yRHpniCqZj4qoU0iG0RGXpIGjDSv/LHiZBzuYiQUMWPmLhMGem7d03hv6oJxPDRfcH4FqTo19pS+N22iKHEXRCf1BDt0rD8iITqdwsieiPHD3xhMOnLdRyTLPCvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9b0Og8N; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9b0Og8N"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742c46611b6so2732997b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 06:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749217687; x=1749822487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbLXfMia3LGx0x5vatzlSPOE+phQVH8WezZPhdpMpIw=;
        b=f9b0Og8NfjbE7BHYXqYz5gm5MEaM1m1fR7BCfZF7P2WDq4W8dOP9iae2eu+VMI68zv
         JaEG597oZpi5o5IjGl3c0BCVMAoCfHztWCvkIOBmuLtRSfrbB8kk+n78VdUe3HZNesYK
         TMk8k+Z6Aot1uZ9fgBiqRcXyWkmu05OtiK/tcf3T8irWL/BVW41/S2nYyi5qeTg9cuRt
         u+YCguXZ8YBVXl3VVNlftbiMX98OXT8aeKAfM3ZjL0Cy3xDIENSoo4MvtBRlourr7zoC
         RT/4vuON03WC1+PgMGJXAikdeBftDtDE9DcUMac9O/Qc2EPfkBNP88ofRBAcPkYgMoHy
         Tekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749217687; x=1749822487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbLXfMia3LGx0x5vatzlSPOE+phQVH8WezZPhdpMpIw=;
        b=MYKWiO6wPltM+dSxmuiK/qWAY1iadTpg7ftNjS03in+rtkmIqETWizqaYz1G/+CZkT
         Y2jcQCo8Rg7pBkHfyDVPsCtRBicaDvYRyVcqsePXe/wNBdOW9vzf50GDlALRr5fInZek
         DcpzaCzaPwi5pPz73ixKDJJ3OtKqY+o1lmsU1MddF8eUf5Xg1wuyLcQ38h12XWIUMDfj
         a3y6nf/RyDj3XHO4Lah8z+rJ0CC4SKX+2ZNIU43tu8wZRR0w8lwYITQBncPJ8DCyRnws
         LDQHVR5yiuwWndViaYBIqDCYCnbz7SfDXVtHvVs18HfnGd6HyXn7Ak5JZrQ0f97KmHbi
         xYww==
X-Forwarded-Encrypted: i=1; AJvYcCUR9HtTsnNJ4cotUSA0Fie0Dl52O2zE4aS9aVc07FCvu9dpVlftpyUp/dEOx2Hh0B6WcRL8+hyFKDJrwi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU5Q3ariCjaR3X5/s2fRwGGv1xOLcagF8r+Z9Zan/dCFVfGAy3
	HHF1EQzNWJDEVCMTVg4Gd7XTJlWwD3x9oU95P9OEi0C0B1G+1Nbymo1Bupuq6w==
X-Gm-Gg: ASbGncujCZIBd6H11Ac6bLYnIlp9ex7CbLBVOYPp9l4Po1iifnj7bNSWCrIYmzUaYsd
	atXP+PNu8ehWXf91mQABEdI3kZipJdDBiAGRGlBVk7uUwgx345Q+gnyUS3DQUsQBI479q61r7Q2
	gTMaeY7E5lJtDW5qdgYLV+ZsgFhr3V260B3dHi4DnrCPSROZANGoKmCY9vPk5zPsr5laiUrY6Bo
	De5cU3sseXMsJOtozQvDexufr5LOa3X4bSCN2EPvUHytYIECqsqeI4X5De24R2xjMtVYLu7bX3I
	m3un6ycLYioXPLcT3ukY3GHRuAE1+bsOxJHjftGynZOaqT6vqS/pDihN4cgmzfy5tzjHC2SV6f9
	Yh4O1eeOA1TPqFTB+
X-Google-Smtp-Source: AGHT+IEWQEWWMghu/cP6dwFr5jCrVGt0sZKMZoG/iTAmXCUcpXkPFPhjT4lzx4jV92YNz8SClJVpsg==
X-Received: by 2002:a05:6a00:4884:b0:748:3385:a4a with SMTP id d2e1a72fcca58-74833850decmr553711b3a.23.1749217686884;
        Fri, 06 Jun 2025 06:48:06 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c1168sm1296798b3a.136.2025.06.06.06.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:48:06 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v3 1/3] lib/math/gcd: Use static key to select implementation at runtime
Date: Fri,  6 Jun 2025 21:47:56 +0800
Message-Id: <20250606134758.1308400-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606134758.1308400-1-visitorckw@gmail.com>
References: <20250606134758.1308400-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On platforms like RISC-V, the compiler may generate hardware FFS
instructions even if the underlying CPU does not actually support them.
Currently, the GCD implementation is chosen at compile time based on
CONFIG_CPU_NO_EFFICIENT_FFS, which can result in suboptimal behavior on
such systems.

Introduce a static key, efficient_ffs_key, to enable runtime selection
between the binary GCD (using ffs) and the odd-even GCD implementation.
This allows the kernel to default to the faster binary GCD when FFS is
efficient, while retaining the ability to fall back when needed.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/gcd.h |  3 +++
 lib/math/gcd.c      | 27 +++++++++++++++------------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/include/linux/gcd.h b/include/linux/gcd.h
index cb572677fd7f..616e81a7f7e3 100644
--- a/include/linux/gcd.h
+++ b/include/linux/gcd.h
@@ -3,6 +3,9 @@
 #define _GCD_H
 
 #include <linux/compiler.h>
+#include <linux/jump_label.h>
+
+DECLARE_STATIC_KEY_TRUE(efficient_ffs_key);
 
 unsigned long gcd(unsigned long a, unsigned long b) __attribute_const__;
 
diff --git a/lib/math/gcd.c b/lib/math/gcd.c
index e3b042214d1b..62efca6787ae 100644
--- a/lib/math/gcd.c
+++ b/lib/math/gcd.c
@@ -11,22 +11,16 @@
  * has decent hardware division.
  */
 
+DEFINE_STATIC_KEY_TRUE(efficient_ffs_key);
+
 #if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)
 
 /* If __ffs is available, the even/odd algorithm benchmarks slower. */
 
-/**
- * gcd - calculate and return the greatest common divisor of 2 unsigned longs
- * @a: first value
- * @b: second value
- */
-unsigned long gcd(unsigned long a, unsigned long b)
+static unsigned long binary_gcd(unsigned long a, unsigned long b)
 {
 	unsigned long r = a | b;
 
-	if (!a || !b)
-		return r;
-
 	b >>= __ffs(b);
 	if (b == 1)
 		return r & -r;
@@ -44,9 +38,15 @@ unsigned long gcd(unsigned long a, unsigned long b)
 	}
 }
 
-#else
+#endif
 
 /* If normalization is done by loops, the even/odd algorithm is a win. */
+
+/**
+ * gcd - calculate and return the greatest common divisor of 2 unsigned longs
+ * @a: first value
+ * @b: second value
+ */
 unsigned long gcd(unsigned long a, unsigned long b)
 {
 	unsigned long r = a | b;
@@ -54,6 +54,11 @@ unsigned long gcd(unsigned long a, unsigned long b)
 	if (!a || !b)
 		return r;
 
+#if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)
+	if (static_branch_likely(&efficient_ffs_key))
+		return binary_gcd(a, b);
+#endif
+
 	/* Isolate lsbit of r */
 	r &= -r;
 
@@ -80,6 +85,4 @@ unsigned long gcd(unsigned long a, unsigned long b)
 	}
 }
 
-#endif
-
 EXPORT_SYMBOL_GPL(gcd);
-- 
2.34.1

