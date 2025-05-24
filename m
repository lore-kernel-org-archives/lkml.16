Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860371EE01A
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 15:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748102144; cv=none; b=FDki07RTz910Y2DfYYwmYU2lUclDf2gkLXERgTuPt2Fol5/XLtkjd9gQxiTqxI6Ms9fwLb6hGaidTGTSGVzLcm1MHOehAwcL3lRfyN50zFJjBOCMKumUlanvs/J4hycyy/qdP4d+/OxPDrzu1I0nxH8DcqiT2AIt1iGtdjCaOzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748102144; c=relaxed/simple;
	bh=BiM2NZy0yU3c3tGfGJNInsioXzFB56cuue+wIu+rpIs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fgSkAoiKI8L7eR8ZHbdyqSMVra9IrxNwnbiDqR1MmzXCXTfud1dL4OI2ftjWeugfPTiwYDb91UKAkmr17weqFgXhOR2VTO9fHvIEuJcGZR1Iiy3V9l+7ve4t4CAvhFAlUwLtYirz8RyCJ4DVqt27HFB8BHcvzfhcWZj1up8nGPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kK/q4gzM; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kK/q4gzM"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ae727e87c26so379144a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 08:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748102141; x=1748706941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTOfhhx4tmgdgjsjrWN+4ojRH+o9SeAoyKRWolFXyrw=;
        b=kK/q4gzMiFaWVO/kY9XcvKSS5jNrkEavh8j8PhQaJimzS7dEQ3KlptXP/mhdojoWVT
         RUGgA8q/obw+ONgAhGx0YNpZfAB6KTn5uaXY9Mog0ZW5tPWHS88MUYCFmlVkLmw3FScC
         m/3palKr9DgHOddacguRbLdVe2bBQHTFWFIcukXv5XepPwrgHrJIqBI7SR1uSXc0M8/j
         +2HnVDwPnxlBalaekKfsZiNUlJCJlDQgm9SMuhykOBKAT28qQ4MdSPJnGokuMk9kr0bh
         tmr8jrODGr6nKFfhJGumGKuGAw2nVJQaSMvsnzzejqgUNhEs54KFA6ywmRvc45OzDcsf
         nYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748102141; x=1748706941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTOfhhx4tmgdgjsjrWN+4ojRH+o9SeAoyKRWolFXyrw=;
        b=EeKSZqo+kjhQq9qS0N/080XDhzfmqhVdVt0Ue5FvyXAWS3ttmZNDhOOf0bPDwCB9P6
         IxfU7aabnBZ4DDdiwqIHHQAfRL20YOlMc+mqJ40mjc68Q6VXco0sW9zK38Y3SMr0bOcO
         jmfnkmtF/nGM2KpgCGo+NzLGzdGLS4ZH0UYeUX6CXOzdXK0AgBAz403IH3gD6iUYeUGA
         twxvdQ0k7xSfEB0OYbz7jt0mzGJKQc0oLfZZN6qnqMnMqkY05zCHIr4sMXWDfZkaJvAo
         FQ/j/MD98Z0/xr/1oaOdqKHl2RxQwRCepGvGSzv2meupECA3Huw4xW3vYc2nZ4CCaWES
         TD/w==
X-Forwarded-Encrypted: i=1; AJvYcCW57Q93PMZdZ6vLN1F9zRqq/zm6SxWRxCJxcg1sUlzn2apTTPitgqkcExRPFlfV9FkrjY+ch8Ge7ARJtHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeZ9bV7eHEOiMmoWNzimIC1sXvKOm+6JzTgG6Z+AuEGzM0XM93
	qKq9XSk+kcpBblW0LrwkMUrUbkhfnLVBMx5sDLTANdkch30/g/YwUnoshBGtYDN3
X-Gm-Gg: ASbGncsIbGwxBDVWWyQNtUm1zh50oXFgL3B+eel9ZodxXiyFWSTVW5os+Vughz34/nd
	Z7/g8haHT+jUz3cAAExZ2EfzfSwWgAPxBakAtq+F6bC1VCUZXcF/9QtJGXKUL78H6ozpyzgzr4k
	b+5DgFnmNWT+SRrfxo9E27nlOOt1AybuBbEmU0auXY+tbxptNnn2l+Ov1wdA4eY/PsOhKQyKHuf
	hd1p32GqkQ4P/3fe8CCOimQm7ntVqkvg2lGvEgRLAiZHAWDYQpXOMsM2Uf0785ack4kaIjrUlal
	i/YKcqkLF4+BZVnGbd79VKj1U1/spT9Wl6x9ot6cJLgcNY+VkOg4g7JsX7WDJCwZbJlr5frL/zp
	trIxgzw==
X-Google-Smtp-Source: AGHT+IGzb8lXK6JpNh7Jawzjljq6XjfoS2tt2jOQqiGcPa4jJ9wCYrr9Hj9TnlXUNZjSKHaQw0Uczg==
X-Received: by 2002:a17:903:185:b0:223:501c:7576 with SMTP id d9443c01a7336-23414f586a8mr62783105ad.12.1748102140651;
        Sat, 24 May 2025 08:55:40 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234396eaf62sm1200745ad.9.2025.05.24.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 08:55:40 -0700 (PDT)
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
Subject: [PATCH v2 1/3] lib/math/gcd: Use static key to select implementation at runtime
Date: Sat, 24 May 2025 23:55:17 +0800
Message-Id: <20250524155519.1142570-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250524155519.1142570-1-visitorckw@gmail.com>
References: <20250524155519.1142570-1-visitorckw@gmail.com>
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
 lib/math/gcd.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/lib/math/gcd.c b/lib/math/gcd.c
index e3b042214d1b..2898ee0e5add 100644
--- a/lib/math/gcd.c
+++ b/lib/math/gcd.c
@@ -2,6 +2,7 @@
 #include <linux/kernel.h>
 #include <linux/gcd.h>
 #include <linux/export.h>
+#include <linux/jump_label.h>
 
 /*
  * This implements the binary GCD algorithm. (Often attributed to Stein,
@@ -11,16 +12,13 @@
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
 
@@ -44,9 +42,15 @@ unsigned long gcd(unsigned long a, unsigned long b)
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
@@ -54,6 +58,11 @@ unsigned long gcd(unsigned long a, unsigned long b)
 	if (!a || !b)
 		return r;
 
+#if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)
+	if (static_branch_likely(&efficient_ffs_key))
+		return binary_gcd(a, b);
+#endif
+
 	/* Isolate lsbit of r */
 	r &= -r;
 
@@ -80,6 +89,4 @@ unsigned long gcd(unsigned long a, unsigned long b)
 	}
 }
 
-#endif
-
 EXPORT_SYMBOL_GPL(gcd);
-- 
2.34.1

