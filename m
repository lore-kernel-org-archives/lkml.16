Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7683E1DC9B5
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 19:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749411944; cv=none; b=r2wcG5V3tacGCU2zKkQp6NRUkqODkEFYHPnlks/+5d73sl/eicogGyepAqsxrdfxlOiaxJi24ydk6rYx9+AV9hg/6mWi/iCqYXSns6er62+4jgmt0HgzEUGgxUJ3niAJhIXkrCNoTDDXYR38lX2aEZ/NtDG5pDawCMKGocB5HW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749411944; c=relaxed/simple;
	bh=jvuqwmr/lQkbwxt68cOjpoUWY69SjpwbKNgucT7YAco=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAqh2gJEwNXchGo0//a77r90hQAYs5yniIXVp9qE+fLhjNZbbC7/rF81jfOYj+xsa4KENujRsDR3aOLIMVnEl2lp/E3zzYXF2y1MwO1PlTH44T4dGttuytXw8inmHP9cDh6+6KvaiaJOxG1z7h3OjDlNtqkX0Xtm6Luhw8WDx2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Caquv0n8; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Caquv0n8"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70f862dbeaeso36331617b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 12:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749411940; x=1750016740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ebejc2TdXmHZ5n4W7AD5k9zbeVCnHTbGLamRWttPuWM=;
        b=Caquv0n8d0wxEHZqxXuzSdsOqqx3JghPHPtfX2i/GGd41tYS521835ykOntjegqBEN
         6LM2QuQ1OPtcAta5ch30sOulFdyBdnLXBFl0YJa+epeZG89Lcmk+BYw1pzmSMVCIzcMz
         Kz7hRO/fsGpM57vIY9Nv20J5mTw5RcyCpEdvwCKW1Q6THGTDr9C5vWjBEhzV/zoQYz4S
         CMzBuWT9fxd4PYrPxfnDyzpa6aylOMeHy8jJn90u+syqziwXd/w4Wbx5a1O3iumnGMP3
         2ELjSQjtCoYtxuyWz/4/tP//CxccEp0slvkuLhy41/gLlz4dkTJW89cE6zBNbm15l9ZL
         jC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749411940; x=1750016740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ebejc2TdXmHZ5n4W7AD5k9zbeVCnHTbGLamRWttPuWM=;
        b=n2AP3LvthB53vN7MrDMrnSVuV4mI03jLG51jf2I8VPoPJifxsSrol/Tnk7r55wnpBW
         XVeGVtiT5Xe1YQItYdTn4LAu1T99mWlNgBzD6DTyLzQZS8jMsmiz34sgGSOAAGgsq7rJ
         3IMplyI7vk/FEegtYmXW1hi7Lp0u9xLpx/dJBmOqk5KFzWquZ3T9XNCM2RhvxulOO/T1
         5+mK/wq8ABK3w9EZR9t8i+BjiXXrBGDq4yqxZy1m2zp7ginJrtEz4rUke0bcPSqT68OD
         I2pCSJNLB735q/GV09Jub/TsGWsfaEOZRa5IUDqKSLdKiHt6ZfPxFMqkLmJ/1l2PCuUk
         QPSg==
X-Gm-Message-State: AOJu0YyhX3oR7ian0GPsj7u6Jg3/u40C/kcXsczEKYtfMUBSRbkCP8MH
	82GDMo+Ghar2kWEUadsV7EONL6Jo5fy7oi8xaTzwJZ9ggs6n+zva3YiHrq7z7w==
X-Gm-Gg: ASbGncsQ44+ZZzg9++DlUC0DRFW7BpbD0TrWQxKjLiS8/TNY5aNlQUf8r3DU+ODXd+g
	0vsa7ChBvspAA8HCY8Nn9EzudXuKQMJYHwZz9MrG3NC12+Fb2IICw+cAjKRrFFPDzS+1vNwJMKR
	kY5mrg19gG54l3kxn7cZ60qBFG4ePRrpg7awcP6orTOX0rzaHAdDomS2a/ZnGtjnoV5tSZd3485
	ZH8vO19Er4F3HXzmAU+OvZTzloeYDsnhymhAqiQg2MPMeAy23cwDW6c9VcWaM64Bu7ddWe/KHhe
	5+S2VIzsbZPot9uicHGjkRj7Hx0ppPebdMC/aIrSJT2IqA6KGwK8lLhTGnNWFJdsUxcYG+RZ5jP
	tVMfkCuNew7en9B2MeHOV2A==
X-Google-Smtp-Source: AGHT+IFenZ/M1QgntFujjQr/MFL/cFeOqebzDK8Hf+6P/+v+M61FHONB48XPcZ13vZR56miRRKOJ2A==
X-Received: by 2002:a05:690c:9987:b0:70e:731f:d4c7 with SMTP id 00721157ae682-710f762e824mr137930027b3.8.1749411940267;
        Sun, 08 Jun 2025 12:45:40 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f98afb31sm10052557b3.24.2025.06.08.12.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 12:45:39 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/3] bitmap: generalize node_random()
Date: Sun,  8 Jun 2025 15:45:33 -0400
Message-ID: <20250608194536.28130-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250608194536.28130-1-yury.norov@gmail.com>
References: <20250608194536.28130-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>

Generalize node_random() and make it available to general bitmaps and
cpumasks users.

Notice, find_first_bit() is generally faster than find_nth_bit(), and we
employ it when there's a single set bit in the bitmap.

See commit 3e061d924fe9c7b4 ("lib/nodemask: optimize node_random for
nodemask with single NUMA node").

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 include/linux/find.h     |  2 ++
 include/linux/nodemask.h | 17 +----------------
 lib/find_bit.c           | 24 ++++++++++++++++++++++++
 3 files changed, 27 insertions(+), 16 deletions(-)

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
index f08ae71585fa..d49f3bd3e20b 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -91,7 +91,6 @@
 #include <linux/bitmap.h>
 #include <linux/minmax.h>
 #include <linux/nodemask_types.h>
-#include <linux/random.h>
 
 extern nodemask_t _unused_nodemask_arg_;
 
@@ -492,21 +491,7 @@ static __always_inline int num_node_state(enum node_states state)
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
index 06b6342aa3ae..d4b5a29e3e72 100644
--- a/lib/find_bit.c
+++ b/lib/find_bit.c
@@ -18,6 +18,7 @@
 #include <linux/math.h>
 #include <linux/minmax.h>
 #include <linux/swab.h>
+#include <linux/random.h>
 
 /*
  * Common helper for find_bit() function family
@@ -291,3 +292,26 @@ EXPORT_SYMBOL(_find_next_bit_le);
 #endif
 
 #endif /* __BIG_ENDIAN */
+
+/**
+ * find_random_bit - find a set bit at random position
+ * @addr: The address to base the search on
+ * @size: The bitmap size in bits
+ *
+ * Returns: a position of a random set bit; >= @size otherwise
+ */
+unsigned long find_random_bit(const unsigned long *addr, unsigned long size)
+{
+	int w = bitmap_weight(addr, size);
+
+	switch (w) {
+	case 0:
+		return size;
+	case 1:
+		/* Performance trick for single-bit bitmaps */
+		return find_first_bit(addr, size);
+	default:
+		return find_nth_bit(addr, size, get_random_u32_below(w));
+	}
+}
+EXPORT_SYMBOL(find_random_bit);
-- 
2.43.0

