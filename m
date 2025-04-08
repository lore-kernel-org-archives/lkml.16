Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BD122A7F0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744125358; cv=none; b=DBQrjuOP4nmoeUWqVjURjLU7XNI18X3l1huQaf7Q61dVtSSy0buRBk1Jwh0vk8QyJd/Sfh8/ys8NwpgKYgZlVxT4tWmX2L+vA9mlDhSUCGjCBjqHCDzVpBpMjrzH+IcUn1cLyk2+Au42JNP8OcKR1ZPDlYpqzKOljmW/w5Dl7Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744125358; c=relaxed/simple;
	bh=ainJ8POMj8RrEfY9h5Q1DWfm+Uy+xKaAeKxKVn1bQ+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ewtxvUVvxBfEvnLsVMwgYoy5mEnHBUeIIWAq/LGhpV3YwrrX2Q+sCyxADshEAicBHmqkli+9tbIIKywSg4Xnv/4HbFtscYEApLa/iJJm27RR/yEPqmXXD1XDURh2ZXV0qKaoX9PepuiGH/VEmpHU2Y9/Ua8lXx1ALxlzmZTAedo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCqlASPT; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCqlASPT"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54963160818so7127400e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744125354; x=1744730154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C987dsaCFSnQpOspzfFowBGnUvHHdcohVT9+02heJfk=;
        b=jCqlASPT25ptyNvPjgdM2LI2dFf4gpYxA5jyKd7KEZ7E5ME1Tz99Nl16pRltfLDecO
         xFrnn4pVpdE+ptoH6OOU+ju11m6olrJh6hELp68ryLhOs2Fj8qHT6vzqH4xyEn1GRltj
         0vlYYdfbB1oFRW41Md/z8zw5/TcKsBTyCNkQAuC+g90kh1BN91NOyKkK0BV0Kzxy7Iqb
         X7QgooeSmWBHljIq+j+cDkOVMVARO/ZfyzFwWy49ArbOmg09PRqvjUzjDHpRK9woMkpN
         w0p0SpkZ5G1/SIlzVatbUFlkDgLfsukHHwHYD8MiozZ84RGJDLSJ+0rjIflU33reapoi
         PjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744125354; x=1744730154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C987dsaCFSnQpOspzfFowBGnUvHHdcohVT9+02heJfk=;
        b=SMZawyIm0A762RDxoCF4sOZHyViBMwAaXhOq59OPYO2zXjHlLC/smnHvKWM2wqhfv2
         njDPOab+4MXaPzCYZ37+tfea0DDHg7VuL/L2dB5jXZHc3m6+dCgzjEsZiQtXHa7VLlEd
         aKH0hMAi3ieeopeVeiAHDWYXtOQvmQLNy4fRlg/+fOhG/7ZYOQozI2j2BTjfOHFm9ZXf
         yPUlrbfo4sIpTYLnlgPeqTKGZh43plQQalsXYXeLXlDaXKujiTznpCeHzEG+RXjWEShv
         qq/IfIm98FoUAfBRsImTqMb9QOFwWkuiKeKfk9ZRKk+PFd3PjitvIL7/zljeXcn61hha
         VpQA==
X-Forwarded-Encrypted: i=1; AJvYcCV70YItOZoeOwS5ldlmPU4XaJuih/w3VVDkEHG+ernxa4LHZbSxi4G8lVftdT0QdX2J6ooMCyMb2YNiT+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YykruHvGdS/CMnDZ+KZ7J5vVlp7HYgg7NCy2CgSfglQIARFR0V8
	7XCfp+qCqdDo6WMb2hljdHxAUVXPhSBQwr3lzlbL4boKj9GNLboh
X-Gm-Gg: ASbGncuADBLFK9FE/+HD90LfJsvWWMbNUhmcgxyAIBRbOf/DU+9fo9AbQsl0kaUexK4
	P3Hv4yR3ETLNPVPjbgjCtOL4kg/3MDYrj4ON3VHnnXAKKj4pLhzPgiDIwk90U5RXYhURWUfM0fF
	67VTyWAALgMEWz0aagpUNPc6Ye6TQ9DzG/QSSzpsrLRoet5qg80vaK/kwuQX5gVpbDi7NcSLaz2
	faXRHxOYALUN7ToDlc1ZhYwOyr+JkDAkhXzl/lx6jI6DCLHZiMabe9mjvAtc3spdZuJU4Iu1GbY
	JPxbl+AfBA44lYyBT73gMG/OELH40QYpPVhdxOh7
X-Google-Smtp-Source: AGHT+IGSF2HnP3yRze+As2thftbPhIbuKmnguOUsoyY3r1XcM9ZtXg/ca94vPr1eGcrAnz6wMQyT7A==
X-Received: by 2002:a05:6512:1154:b0:545:2f0c:a29c with SMTP id 2adb3069b0e04-54c23346c48mr4241134e87.36.1744125354157;
        Tue, 08 Apr 2025 08:15:54 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65db49sm1548603e87.206.2025.04.08.08.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:15:53 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: [PATCH 3/3] vmalloc: Use for_each_vmap_node() in purge-vmap-area
Date: Tue,  8 Apr 2025 17:15:49 +0200
Message-Id: <20250408151549.77937-3-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408151549.77937-1-urezki@gmail.com>
References: <20250408151549.77937-1-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update a __purge_vmap_area_lazy() to use introduced helper.
This is last place in vmalloc code. Also this patch introduces
an extra function which is node_to_id() that converts a vmap_node
pointer to an index in array.

__purge_vmap_area_lazy() requires that extra function.

Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3ff9acd64c077..409b8f372647f 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -923,6 +923,19 @@ id_to_node(unsigned int id)
 	return &vmap_nodes[id % nr_vmap_nodes];
 }
 
+static inline unsigned int
+node_to_id(struct vmap_node *node)
+{
+	/* Pointer arithmetic. */
+	unsigned int id = node - vmap_nodes;
+
+	if (likely(id < nr_vmap_nodes))
+		return id;
+
+	WARN_ONCE(1, "An address 0x%p is out-of-bounds.\n", node);
+	return 0;
+}
+
 /*
  * We use the value 0 to represent "no node", that is why
  * an encoded value will be the node-id incremented by 1.
@@ -2259,9 +2272,7 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
 	 */
 	purge_nodes = CPU_MASK_NONE;
 
-	for (i = 0; i < nr_vmap_nodes; i++) {
-		vn = &vmap_nodes[i];
-
+	for_each_vmap_node(vn) {
 		INIT_LIST_HEAD(&vn->purge_list);
 		vn->skip_populate = full_pool_decay;
 		decay_va_pool_node(vn, full_pool_decay);
@@ -2280,7 +2291,7 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
 		end = max(end, list_last_entry(&vn->purge_list,
 			struct vmap_area, list)->va_end);
 
-		cpumask_set_cpu(i, &purge_nodes);
+		cpumask_set_cpu(node_to_id(vn), &purge_nodes);
 	}
 
 	nr_purge_nodes = cpumask_weight(&purge_nodes);
-- 
2.39.5

