Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306E42F0035
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190943; cv=none; b=t1c8yicXAqt6RzUIsVv8qW35i5hT33zzdbkU5qeddtyF/1n/eALncKyfcQBWyP3iC6JMV0XMTnh8Dol+RFoTXyKPrBekI4MVuhFV2nSPKcAEMjS8dXEg+vd0gHyIhaZUN4d0q+IklP83TptIgj5vNmpMekHvmaNeqytUYVAkfCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190943; c=relaxed/simple;
	bh=y/92ANFHZ511JoHlisgi/C+y3GJFbQaZiVIkYRVBlNk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFsIrbEXhmV/GoADwhumT4xh90sgVUdTVd0fHqWr69sfESv3Qk5SIsOPaqpAa5Oq5BXfobkDqxTDKo/REIRkMO5OhD22LHdpdDhVUpaBUOViJuPUYVJUUGEqBQ5oy0/ElJYJq6N9xe5HpsBEKQEpVFrWKjCQgZVqs6OWnfQyQZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+Jwwots; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+Jwwots"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b3192eab3c9so4242800a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750190941; x=1750795741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00q9qP51ZqXMmsGMK1vazt4rv0rlL3V11s+lyKYXhXE=;
        b=R+JwwotsZ9b6GNVaM2ErqnQ5mNDFubeBAwEuN4TKl2VCjQsVPQqxm4M++Fpq4OKpoz
         j3/h6SzXCM1SWOyTbyTxL4RTjHkoUAlDya2F3DEvMlbiM8HRIhnfEE9m7qKDaIyASiUy
         guvWpIJ/WqhLHGzw2X0GiKNEY5mwK20bZLlh3kyVGAcXH+U3rwaT6KX/5D5l3yubGboq
         8BEoQUmtky3Vo25qDn7yG77TEyrJDFi8ye6Zra8bgvRZvXxZ6ANBVju0LAVCEXKfmVHZ
         Jm9dNYFIJhE0H0j0P8y/xASUhgHPbcRjT45ymf/jZbuukPVabrq/ehXWO7Nmsj2bhrat
         NFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190941; x=1750795741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00q9qP51ZqXMmsGMK1vazt4rv0rlL3V11s+lyKYXhXE=;
        b=AuYnDgpC+Hd3zNV7v6NAuieZ4nxrDjHIz3wF//WqUy/Nz7r27Tqg8N2yjjXTdD92b+
         9B5RBENS+yMkCaO8AdF7JtjmyM7/vxvy1S/c9gH4O2KsIWPGYGDyEWcL+e47UlIKYH67
         ZAVjEsZxm7GYp6HHghVzy0SzMhGRonecceg2Jsn2UXEkMbXGKKvQDU//KCHbzn8g1X+l
         OcEulO3owaw7JToB/xD8m1+ogwkgfrLOYJXPrT4z6AXj6Y283XMww1HkEjztW7eO8ck7
         Z3r9UOHeuQMS4roMpxydMmI9tO15tn1fsaaRxR8/CYKqns0lZRBJpq36kDK4eJdmOH9I
         Pbaw==
X-Gm-Message-State: AOJu0Yxzi/eCEwsgY3YoCNQvg8npwV0lLBLAbFClQOCeaTSpgg4grfki
	02CVL2reDEsWg/SS6nN/fJkiihObsnVb6nyRKJxbddvdlJA7l1c/YsqRfpS0Jg==
X-Gm-Gg: ASbGncvSaSgB24xptzf1bn8ZqzyKEw5R4r/HMvdilcGAgw+EeZRnHh57/5Ib2H+VDIJ
	uleXFFEjBaPe6hePfqb1RtFT5dj5TU6xn+lH7P7kXUcZtOBibX9PI9qZYTR9/BdYBurdph6WVWl
	XATTIO7LWP6j4NfoN8vc33W/Kufckmr53L3D9IoxA/rnngrbISJKaWCrS2KhGuoANuq9Khi5Jqq
	RiOkvmMyeB6w0LBTyMyRKpaG5liDror4xcfdrypIs6FGhadnbdbfUBXGQFOZMZq/o1BEkRioPSq
	reYFgoPRpRpdP4P/nJg0T5zSfiuE2vGhZzQbyMWGw3hujBayz9afAiQsdTFc0Q==
X-Google-Smtp-Source: AGHT+IH4aJlT4Jznp4cFCkV03jW/H5H2uxAyPFy6FzGxp9BA0qtEcKBLdDrG1BpopG6M5fjnOQXJZA==
X-Received: by 2002:a05:6a20:47e4:b0:215:e60b:3bd3 with SMTP id adf61e73a8af0-21fbd57fbdcmr17971190637.29.1750190941232;
        Tue, 17 Jun 2025 13:09:01 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680c54sm9390462a12.47.2025.06.17.13.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:09:00 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 1/3] bitmap: generalize node_random()
Date: Tue, 17 Jun 2025 16:08:51 -0400
Message-ID: <20250617200854.60753-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617200854.60753-1-yury.norov@gmail.com>
References: <20250617200854.60753-1-yury.norov@gmail.com>
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
 include/linux/nodemask.h | 16 +---------------
 lib/find_bit.c           | 24 ++++++++++++++++++++++++
 3 files changed, 27 insertions(+), 15 deletions(-)

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

