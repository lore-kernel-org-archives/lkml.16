Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEED71E47AD
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 21:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749072091; cv=none; b=CDuLjJZeXzsd1lOmZ/9iWOi757l8/uIvUEMapgGblZiJ0nTf3tEk5NFlK/zT39idrQLxwL872lDX/TqodBRm/7rEWbmcEugcR8qBKvPJElpOrU0csbbkKVeE+W+anohcEKps72jIbfsibGJu23qnwCb9jLRzmwne/GY3pYxDhg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749072091; c=relaxed/simple;
	bh=BK+1SY+Abxoz7hiEYp4R+owxezJqIWEq5orq4X2XWNI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G6YA1ye9gDq7IA1+zkmbNx/BVsyNK7rOFq04M0oz9Hngc/tkDbPvGxbwZgu6yIePN4x6gFWRpCyJhV0ZPrVvDVEB/2mou+Swhazm75sOiZMPiANE+eyZSfj3k1HwNMy3q1hIi+tE+I9r3m8+biwgAdFBiN4Hq5I7risoTk3Eyjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tie7wQUG; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tie7wQUG"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70f862dbeaeso4169137b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 14:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749072088; x=1749676888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0fLbUkQjg6oBk00ANTn3zhMmirJmjJ7KF7dIZyS7A0=;
        b=Tie7wQUGKupBmr2iRFdQ8Bsxuj0rM6132v4RUAU9Im2Xkq3rzH7YoacIyvIH8y5e6b
         W2ekFkd1S4ADiujvP8yIQOR99qsKIteYwl1Q5cL4OW1bQlrn5Cz7seXvefVlelD1Oi27
         IQOiXP7aEE3qky42lJGWR9kU2T67RlEqoYkoEJZMmW3dwSeQpi8Ee4ZOC0h7C0/YHJNN
         pGvngOveNkQj3Ew3JVghuEk4CDk4NnecZVdGFrLG/D7P0lDj6etZn7pHmMT7pn6wLo7j
         t92O4jYzJRsMrgJqB3ba+bfkdx35WXvO5SoYBaWpuTIPg/SM278sQE1suD3PUGRJkQJ3
         ps6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749072088; x=1749676888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0fLbUkQjg6oBk00ANTn3zhMmirJmjJ7KF7dIZyS7A0=;
        b=rzsDspElmbvIsN8GQlHMVwXomrkpJBmwkcfNjWuLvp0cIi75FR+pZzorwLPHAO0Lqd
         uY/i+Afb4FIEP97noqUIBE4S40pLPd9vemkl9AF4IY6y+01yGHxZ8hi3RRbD/STmNaJe
         aBcnjaur4YUCJP9ORN+lGypld4wc22iduKBwPqzrQ0chn90idJgtdhR5rEjpGhBfHugs
         JrzYyQMjpzbnjsNXZ17it/91lpPCOnA38qqiI8xmzu1Nl6rQRRRx7Wxi7/55Fw0uY+hL
         iyRpMO11f722awKjEbNKm48Mi5PYao+pwQSFO/fB1XejnaT9t6frDAXeHCJRuwiLpd34
         sKSA==
X-Gm-Message-State: AOJu0Yy4TAoJOhGZTSEr8El6jLQLxGqovqXht/asXSgUYo3kniBZA3j6
	ugzZUTEs9PT5vdsa14YsT6NFqf24JJqipUou3d1GtSrf7cydrifwZ8VgcQL7Tw==
X-Gm-Gg: ASbGncsh8eRHS2apW+UT6J6vA4IFowRrVeOYVc2SE5bka87MmJSgODzZolMy3B4LoBT
	DENNlV9V8N9mOpUt27HAWa6kLol+LtVC47ZIrsYU/0fIz1j8Ol2ns8QMLGFCRQ9wuN0/1L0RZ3/
	C2D30BWhQFxPEZ4R5W2ErX96kojuAkmXtS5BBlsTkCEgokNY1o1MZQZscYhiCSjK99XeUUjVAhj
	y3HQ30G649j2ERNw+kHBOEBh/SnSB+Zjc1112AQiC4shLU5wV8LV8jRLvYC9m3jWAvyPZgMEnGc
	FbRgGR415E7bIC7Q8mFYiBYwBk28hFYp3vYtVKhCRtKwLVDjS3Og1vsV+MNHb7qwxdpx6f2fYTm
	xIBvNKIt6GP0IKQZBI1AtSw==
X-Google-Smtp-Source: AGHT+IE0c6xhdnyjsmDqNhD7sNfOQJbrLaexN6B2Ln+EHdv8nj90nt1QtXP+WootdiiTFN1FjNrKeQ==
X-Received: by 2002:a05:690c:25ca:b0:710:e8a8:7768 with SMTP id 00721157ae682-710e8a87c5bmr12278467b3.31.1749072088560;
        Wed, 04 Jun 2025 14:21:28 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8ac0f423sm31416157b3.60.2025.06.04.14.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 14:21:28 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/3] bitmap: generalize node_random()
Date: Wed,  4 Jun 2025 17:21:21 -0400
Message-ID: <20250604212125.25656-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250604212125.25656-1-yury.norov@gmail.com>
References: <20250604212125.25656-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

Generalize node_random and make it available to general bitmaps and
cpumasks users.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 include/linux/find.h     |  2 ++
 include/linux/nodemask.h | 16 +---------------
 lib/find_bit.c           | 17 ++++++++++++++++-
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/include/linux/find.h b/include/linux/find.h
index 5a2c267ea7f9..98c61838002c 100644
--- a/include/linux/find.h
+++ b/include/linux/find.h
@@ -44,6 +44,8 @@ unsigned long _find_next_bit_le(const unsigned long *addr, unsigned
 				long size, unsigned long offset);
 #endif
 
+unsigned long find_random_bit(const unsigned long *addr, unsigned long size);
+
 #ifndef find_next_bit
 /**
  * find_next_bit - find the next set bit in a memory region
diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index f08ae71585fa..1cedc7132b76 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -492,21 +492,7 @@ static __always_inline int num_node_state(enum node_states state)
 static __always_inline int node_random(const nodemask_t *maskp)
 {
 #if defined(CONFIG_NUMA) && (MAX_NUMNODES > 1)
-	int w, bit;
-
-	w = nodes_weight(*maskp);
-	switch (w) {
-	case 0:
-		bit = NUMA_NO_NODE;
-		break;
-	case 1:
-		bit = first_node(*maskp);
-		break;
-	default:
-		bit = find_nth_bit(maskp->bits, MAX_NUMNODES, get_random_u32_below(w));
-		break;
-	}
-	return bit;
+	return find_random_bit(maskp->bits, MAX_NUMNODES);
 #else
 	return 0;
 #endif
diff --git a/lib/find_bit.c b/lib/find_bit.c
index 06b6342aa3ae..2118ea23bed8 100644
--- a/lib/find_bit.c
+++ b/lib/find_bit.c
@@ -18,6 +18,7 @@
 #include <linux/math.h>
 #include <linux/minmax.h>
 #include <linux/swab.h>
+#include <linux/random.h>
 
 /*
  * Common helper for find_bit() function family
@@ -287,7 +288,21 @@ unsigned long _find_next_bit_le(const unsigned long *addr,
 	return FIND_NEXT_BIT(addr[idx], swab, size, offset);
 }
 EXPORT_SYMBOL(_find_next_bit_le);
-
 #endif
 
+unsigned long find_random_bit(const unsigned long *addr, unsigned long size)
+{
+	int w = bitmap_weight(addr, size);
+
+	switch (w) {
+	case 0:
+		return size;
+	case 1:
+		return find_first_bit(addr, size);
+	default:
+		return find_nth_bit(addr, size, get_random_u32_below(w));
+	}
+}
+EXPORT_SYMBOL(find_random_bit);
+
 #endif /* __BIG_ENDIAN */
-- 
2.43.0

