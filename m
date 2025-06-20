Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715D830E830
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750442780; cv=none; b=e942PeNo9XBfm35dkul/6CWAdnyAujc2FtW6+9vDA87HliIZddos5syDffWg7S3w1U+JdUTjdOsCP97o8pRJSwtmmHHt8wo7P1GIO/CvDd3kHx1aTpeVlP/XO0ckB/UJaXYVL+LRPXqjgdzofwIP3slC9eFEJR7EZ7Hsqq0OwTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750442780; c=relaxed/simple;
	bh=2EU6uSLySp4qVz7CIbQ43H0/LWcWfqXXtcuBhNr1L3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lG3S7Gnt4q/6VQ+KI7K9gjW0kfk3rxQLbTo5xcRoMSw7p3R/FrVyAHl8QJYGTQFzcsPauuFHGN3/0MvKEs5KxENF+uKyP2ZqMDQ3aZoeV6JZ3MLbqxu9sO+INlYw/O2GT3K52JBVIFrzeDasUVyL4APCU2G/wK0GFGk6eK1JsuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WiWcTUvC; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WiWcTUvC"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e8259b783f6so1906260276.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750442777; x=1751047577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0j/ufomlpd6m0gY5tZubbQcVJb6iw7GaPU3GEZa9iYg=;
        b=WiWcTUvC/AOsb7kYgzMO+wdpql29eQai1cRcmhMzsjosHdYf+dIkaVFYrzFOz8sodw
         Ruj36d39WpRSYicdHir8VptQrv0TTRA/vMx8a2vTtQcgdtvINlPIshbZYT9VmpgM4ald
         1lu+sC5i+QHdgISNlVFjOumcCOMXc7R2KpsLSIhw+TfDW37f2iBHW6YDSghXunmqUYCM
         B3sr2bF4Q39xwUvQW4TKnXxSnszUSrwOPxjiNgiKh5WhEU2TRBOAxl4IiFVD9HF3KKyx
         VC4AU7s6ZRICU3LKGu2jatp82YRZRR/+QhVkm9hsIsZikMdBOWmYejpqNTLLwYRjkuIV
         EJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750442777; x=1751047577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0j/ufomlpd6m0gY5tZubbQcVJb6iw7GaPU3GEZa9iYg=;
        b=mqyuwA6pmKmsOeDyXT6vspTPjShU0g4wRQs/pZkG3OMJ9MSm7layF+9JH7XEnMD2Uw
         jmhoxMl98nQoDpNogRDHwP7lszQF5/YtI8iERTSd3IdhzHum7czfe8ERRvkGwlp/E9w9
         T6+CiX8rQOUdDiqiGDKpv4r5jSu8F/5IdpkDexGcKByWmRbGaeM73xVlDBrhxW+nTdVj
         w912D9xN1KjOQJQNzhV7hBU6P8VQ48uZDvyJq3odzC0dU7hmsJfGo0r7LEr7UP2ajoWE
         btd0Ig/9BTwh6oqreRbGaBRl3SgFDErldCZ5SeJXFePq706KB8OYHkz/0psW7DDybXim
         iyZg==
X-Forwarded-Encrypted: i=1; AJvYcCUruXu2J9mH28oIasjeHdDAvyQgpGtj2bilGWKOWyc4Ay+fN5tlXmYOUd+8KSwPtP6JCJdd/AV1AjPMa8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBOWnVRRpGWLswsgUY36S1J3gjxbqUVgJ5qCPjbcgsRuS9+/L8
	tRy86yDExZr7/lTuqvtUAenzjVoMjStIZr4xLEIoQ9Cj2ITfkp96FGpZ
X-Gm-Gg: ASbGncvk5ieevOvGWvjmD5pc9K0pU7bRH7EnfKrrsMq8E4n5YGImukxWHGV1HVPc5o9
	5EFi+FJgIz142d1zyOv5CfawdX57Q+t3t4iHSSHgq/8ZaawtLEzACen1bFciiu5kCIw2kbL8fsX
	v2ebIDcvsccx8gtfIGuva44TkaZ1zjy5Byru+Z5Wwce6u4EQS/ZsqYFUOvppGQ/JyqdCZ9FRQVG
	YkE68n6TH9QwjyxEZlxLkCBe7p1DdWdsJnKKEya7a3ti4owrCtsSJuvEu6PUN11OTndNlOo5f4g
	6XAvb9SALVg3RW/ECQ7MZdhT3n4vzcJpCS9hgXY/AeonX98cfA7TkLELiChyFd6QP6JVp5z0ls9
	qCprRo17cNGxtrJwD
X-Google-Smtp-Source: AGHT+IFyrQuIheL3Km0qq8ibo1UbzCMHoBa2trOpqwGzPvwov2xn22FY5UXwBEYftqbjKKbgjvEBlA==
X-Received: by 2002:a05:6902:631c:b0:e84:37e7:4efc with SMTP id 3f1490d57ef6-e8437e74ffcmr948126276.29.1750442777132;
        Fri, 20 Jun 2025 11:06:17 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:227e:8527:3def:3ad])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842aaed6e4sm769304276.20.2025.06.20.11.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 11:06:16 -0700 (PDT)
From: Bijan Tabatabai <bijan311@gmail.com>
To: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	david@redhat.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	bijantabatab@micron.com,
	venkataravis@micron.com,
	emirakhur@micron.com,
	ajayjoshi@micron.com,
	vtavarespetr@micron.com
Subject: [RFC PATCH v2 1/2] mm/mempolicy: Expose get_il_weight() to MM
Date: Fri, 20 Jun 2025 13:04:57 -0500
Message-ID: <20250620180458.5041-2-bijan311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620180458.5041-1-bijan311@gmail.com>
References: <20250620180458.5041-1-bijan311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bijan Tabatabai <bijantabatab@micron.com>

This patch exposes get_il_weight() in mm/internal.h. This patch is to
allow other parts of the MM subsystem, such as DAMON, to make page
placement decisions based on the global interleave weights.

Signed-off-by: Bijan Tabatabai <bijantabatab@micron.com>
---
 mm/internal.h  | 6 ++++++
 mm/mempolicy.c | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/internal.h b/mm/internal.h
index 3823fb356d3b..b718ebe7cad5 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1169,6 +1169,7 @@ extern int node_reclaim_mode;
 
 extern int node_reclaim(struct pglist_data *, gfp_t, unsigned int);
 extern int find_next_best_node(int node, nodemask_t *used_node_mask);
+extern u8 get_il_weight(int node);
 #else
 #define node_reclaim_mode 0
 
@@ -1181,6 +1182,11 @@ static inline int find_next_best_node(int node, nodemask_t *used_node_mask)
 {
 	return NUMA_NO_NODE;
 }
+
+static inline u8 get_il_weight(int node)
+{
+	return 1;
+}
 #endif
 
 static inline bool node_reclaim_enabled(void)
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 1ff7b2174eb7..b1713430ee9c 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -165,7 +165,7 @@ static unsigned int *node_bw_table;
  */
 static DEFINE_MUTEX(wi_state_lock);
 
-static u8 get_il_weight(int node)
+u8 get_il_weight(int node)
 {
 	struct weighted_interleave_state *state;
 	u8 weight = 1;
-- 
2.43.5

