Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EFD30E83A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 18:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750357594; cv=none; b=lsvxxfPpGzU1NeZY0ARw7EoxTDF9E6s3bu3o3OREXRbAU5OcFSuxv+HiIGc05wYst75zQ9/y4m57UZo1eG+c770+cL9c1dfG4t10MK/flUtGXYJ9o6PQhhfcFg0HjdwdixKoKtdwehdLttTSfmgMlg+6FdJMBCVBLj/VoGjQU8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750357594; c=relaxed/simple;
	bh=bf1eMts74yu7D6jH10IbTGmC2cX2IccfD+cBF9tFEzI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G1Dn9SClO5FQesbQ+8cmEvTsTrjQ69zBok0Mi33iBF6+mmcnuh/sz+oTj86HibZeK9Kg4wQaS0Il+VtQiXbpL2CddkQP14c5TSQzpotILyLT8Lf76jlqCbEY3GJQfilmloq1z04uKl8QqUX5dXlcbQiTptyRpzbIkOi3FujCSQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKsyGwrb; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKsyGwrb"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so842401a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750357592; x=1750962392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WPFXPV0QkN55EuX7D7xMkc3nzc5+JHVWmC+JzqRihU=;
        b=XKsyGwrbuLN89VD3UtUh6iQ7UiVWm2Y00AnygEKMRLjdypBCu7eCRdPsT6IGnDRUZk
         pwgl89HyTlkp4SS1gSfw/gUuWaZN9ILi0wIK6/vqe8/ebqumbQuw02ELouXCWdJUpadR
         cdKHC6uKyB6ZPCYUbts/ytJ7E8TBFwSVkwVprnU5Wl+R6bBVpRAd2tKfl+kEZ8oYBpXH
         f3WFBRp0WOaFEXGvCXmm69kZnlBQmJQ6jduvkWB/xlwdafq+sIaFEOyt14eLWtImq4Of
         ZSUQltMLxSkXQq4e+AxrMSEE7H+VQdVNjWi59BVJkyH4e1xb4pFmCmChrjZcwq6TqxsL
         81SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750357592; x=1750962392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WPFXPV0QkN55EuX7D7xMkc3nzc5+JHVWmC+JzqRihU=;
        b=DHYVtl24c8pBgDkPamQ2cAz8HciYbmAxfeiYkFiXgohI+qLMKrT5I40fbxidJFGQna
         BKlGXYUMJwMafciLBhpi8qi5kE9K8LmwN/DN2Vx49w14WezbZRiDt95Q+eIy4xSDl8Zu
         qw1H2E+pC+9/v5lz23hGNI/zNZwCEeuCpovShybgrRJQxswCNz0dOEuSqWXriKZehCCj
         rUI3GTQNgla6Mgxu04J/ZIWcRFaRQofNq9qncRDc/ZcPYtBzk4g9vVONVGOqRrQqdvU/
         H2VHf7rmV4FQ7jb3qMuDScFEjSat/ci+z6f3v0v2pjB7G8GUbC/f2S59mrmaJKEkW9AK
         AYew==
X-Gm-Message-State: AOJu0YyGRabbuDVxb5P5fCZXhI3GPNjndnE3clxvksTUYNhAnqOeMLpj
	Pyd/32fb/EpIYw4FPu0P7SMDaz6l9hzFzesP6Ki7eOllg5XkSbtnssgTWl49OQ==
X-Gm-Gg: ASbGnctEnhMphtJuLi45TKroLn79nZgmkpMDM1Lsryw/HEV2TWZRHmwRnN9vUqhtVpG
	Q8GUzK1Fo4Zf7iYHiQLRXbdJU+J0AQwK02OBqCEYz1e9TB5MbQg2Cos1yD4qOXqZ7g0qp3Vn/Tr
	8n+lbSvhd2+9cL6PcxujumXiorV1ayA0iOxwDsumnxf2K/7lpaPQcEc9VRSq2AROfGl1xMgSqP9
	7rXZcTKpNmJOIKJD9SH3180HZz3U1iAUBg77K3LOnGGxFFAHCrr/e42viqMza9XilzPWZpreDQ5
	djk1NwyE21+GByqQp1UjK7Fvm3NVqxyfb2qEZplKvnVCukYI50DWBJrMYJ76uQ==
X-Google-Smtp-Source: AGHT+IFdc0iBbedgfsZ+dY9PEnKDY20nUmlAE+YJlV+4+gEVEjwwMq3o1XOE5bIAo96BlbzWR86Stw==
X-Received: by 2002:a17:90b:3e86:b0:311:d05c:936 with SMTP id 98e67ed59e1d1-3159d8c8c1bmr400952a91.17.1750357592503;
        Thu, 19 Jun 2025 11:26:32 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a331983sm2532278a91.47.2025.06.19.11.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 11:26:31 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 1/3] bitmap: generalize node_random()
Date: Thu, 19 Jun 2025 14:26:23 -0400
Message-ID: <20250619182626.393541-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619182626.393541-1-yury.norov@gmail.com>
References: <20250619182626.393541-1-yury.norov@gmail.com>
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
 include/linux/nodemask.h | 18 +++---------------
 lib/find_bit.c           | 24 ++++++++++++++++++++++++
 3 files changed, 29 insertions(+), 15 deletions(-)

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
index 81586d24d248..325e1dd3540b 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -488,21 +488,9 @@ static __always_inline int num_node_state(enum node_states state)
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
+	int node = find_random_bit(maskp->bits, MAX_NUMNODES);
+
+	return node < MAX_NUMNODES ? node : NUMA_NO_NODE;
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

