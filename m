Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7C1214204
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745226867; cv=none; b=cGU3QfcW62XeaUH57wj1j8+536pQbdYxKOEsxJYGs3wnkID7ndP2lqEGoEmY29W3t1XD8q9wNvU7UtRDHG4gD++awxeA2dvFN4WV/yjQ9kCeKoaXQv8OrxGYyBp2JaKyKHef2w55ysAKkRLCFgQewg/hemlBpiQfgIQemBzkSO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745226867; c=relaxed/simple;
	bh=xJAn4UIXvQuiDi11k6XmNtizTjAQbPrsINs6eKBFhQk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JwpevJfpMrMJKYZRi+4lf2CU9od5oUAAluFknnpxvsF5VfQHMHj8rwSkF30MQw4lgW4dV+ZyiZ3jvI5Q4+cOINSqx5KyLnsDQETgycXWV4AKC/byNO6p5mf+l+IEsAipn6nFZWxGoVVQS/YZnmP1fPT0Bfqstp+JpeeJwT57va4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RAPJKIgH; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RAPJKIgH"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736c062b1f5so2889726b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 02:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1745226865; x=1745831665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7mT3KrK1rUUgtVlbM9yHGXwYTpp6cBRIH33dYCoAPI=;
        b=RAPJKIgH/+HbKgAhSQxoBZPRxybycMbfUjrU2OhGS9OAajrNxzbcMvoiL+YfsAaeOJ
         k9Ce0DBnc4rdCvI7dhBrQnlQ7flia6aIeWT0vpBGGj0Osn0s8JDHsObdnv2BOs6TPpN9
         hdQH0shIIMYuFSL0K0K/VSWyJb7F8o1WfMnCyH4NqDYzDXUcIujMfM0G64Rl2ai/POZX
         kYaElfrQxriG3lBNP3iJoWADHVvXw0xpLq3RIL1mBm5J0zd9/Pd8kNy06/mRTehgFVkA
         ksPUVkneSNQXqRdk+9R96z3iLNlN6/DwTAdxIilhcmxYNunIpA0YQ9sVUGW238FmLMGF
         RDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745226865; x=1745831665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7mT3KrK1rUUgtVlbM9yHGXwYTpp6cBRIH33dYCoAPI=;
        b=s77v6N+s0p6bg5/y97MvwqVhK6W+eYu3HjSFXuROYCWQ2vq3gm/v5uOtaX/nfgTkJ5
         DiMp4DH5lD/vaCJ165Ip79wxx/K05qekqtkP2ZV8wZhmskUpY45gWhrk7PVJ4ztg4KfR
         tnCd1j36dVx0aIbMBnCj2Ug3CB0Z0c/UzeKcuF3g6lUpP7S4jFZ4x7+HkEosq/6F4RJ0
         ahjdOJWa+hib9QuEPps4MF5G5o+W+I8sX4l4ZxAJsy371+H2WtjZrT/C7bQT5JCH9VAv
         POM1cjTsamvEpDfkiv4EHORd9u6GSuFzP14kytcfwv569d85FyAk2JaNs23fBeYocv9v
         XhNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuUQWoweEjQLULXmSfUxCXip3lT5F1hl7eIrW3Se7TtNwQ+VzEOuQXH444Ti+1cfdPyAUoKjeexL72YUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7gWjPDMtB41lxy8HC/xxgrvVe7Z+ndxoZzJQCPu2KwQeeVGk7
	ng8wixemWox/1grVJlGkBQMKR+6WHjB/61OygCeGbg6zQ1YpNm/90mqdEAc8FYE=
X-Gm-Gg: ASbGncuhUNi0ab+o/eVtXf4vnZ1PWjrEcD86APWBfYFL8oRlNf0C5rjFK8ira5hJR6d
	OVhpt4CIFYW+oQlt9OBjy1JT630act2kykWWXDp6gefxPQTgoeMUk4gtfRJ+6o3ph8CRMPCap14
	V0qCVjXtomflS3QDFUz9jCe/TgLJ1MR9AP3dThO92BSBUYYqbUbN1kWj1kN4CCtZWqoi5u1Lj0h
	9cWBr1EJDxyxpTkhzcP2MH1GD8G6LpOoCK2IpdvvrAHt/rwqi0ZqVH830qexVDNbwFZAC1JpPzf
	Q1uA71xhqKFLPzqlSUbvSILFLMkDhS29G/9Sk/4KDeU+Zm8sKK6CJDms3cS2K6CXLw==
X-Google-Smtp-Source: AGHT+IFTmd0T/HXcu3yr2Ci4KMu0d+MmV6LaN3s7vDoYiMpjU3LbXIkbvNPBpWNjBROg83Yrfdjvwg==
X-Received: by 2002:a05:6a21:4002:b0:1f3:194b:30ae with SMTP id adf61e73a8af0-203cbc0a836mr17787188637.1.1745226864958;
        Mon, 21 Apr 2025 02:14:24 -0700 (PDT)
Received: from n37-069-081.byted.org ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db157be12sm5246285a12.64.2025.04.21.02.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:14:24 -0700 (PDT)
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
To: akpm@linux-foundation.org
Cc: hannes@cmpxchg.org,
	mhocko@suse.com,
	yosry.ahmed@linux.dev,
	muchun.song@linux.dev,
	yuzhao@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Zhongkun He <hezhongkun.hzk@bytedance.com>
Subject: [PATCH V4 4/4] mm: using SWAPPINESS_ANON_ONLY in MGLRU
Date: Mon, 21 Apr 2025 17:13:31 +0800
Message-Id: <529db7ae6098ee712b81e4df290622e4e64ac50c.1745225696.git.hezhongkun.hzk@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1745225696.git.hezhongkun.hzk@bytedance.com>
References: <cover.1745225696.git.hezhongkun.hzk@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using SWAPPINESS_ANON_ONLY instead of MAX_SWAPPINESS + 1
to indicate reclaiming only from anonymous pages makes the
code more readable and explicit.

Add some comment in the SWAPPINESS_ANON_ONLY context.

Signed-off-by: Zhongkun He <hezhongkun.hzk@bytedance.com>
---
 mm/vmscan.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index b442c20d1168..24e959881ada 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2698,8 +2698,12 @@ static bool should_clear_pmd_young(void)
 		READ_ONCE((lruvec)->lrugen.min_seq[LRU_GEN_FILE]),	\
 	}
 
+/* Get the min/max evictable type based on swappiness */
+#define min_type(swappiness) (!(swappiness))
+#define max_type(swappiness) ((swappiness) < SWAPPINESS_ANON_ONLY)
+
 #define evictable_min_seq(min_seq, swappiness)				\
-	min((min_seq)[!(swappiness)], (min_seq)[(swappiness) <= MAX_SWAPPINESS])
+	min((min_seq)[min_type(swappiness)], (min_seq)[max_type(swappiness)])
 
 #define for_each_gen_type_zone(gen, type, zone)				\
 	for ((gen) = 0; (gen) < MAX_NR_GENS; (gen)++)			\
@@ -2707,7 +2711,7 @@ static bool should_clear_pmd_young(void)
 			for ((zone) = 0; (zone) < MAX_NR_ZONES; (zone)++)
 
 #define for_each_evictable_type(type, swappiness)			\
-	for ((type) = !(swappiness); (type) <= ((swappiness) <= MAX_SWAPPINESS); (type)++)
+	for ((type) = min_type(swappiness); (type) <= max_type(swappiness); (type)++)
 
 #define get_memcg_gen(seq)	((seq) % MEMCG_NR_GENS)
 #define get_memcg_bin(bin)	((bin) % MEMCG_NR_BINS)
@@ -3858,7 +3862,12 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 	int hist = lru_hist_from_seq(lrugen->min_seq[type]);
 	int new_gen, old_gen = lru_gen_from_seq(lrugen->min_seq[type]);
 
-	if (type ? swappiness > MAX_SWAPPINESS : !swappiness)
+	/* For file type, skip the check if swappiness is anon only */
+	if (type && (swappiness == SWAPPINESS_ANON_ONLY))
+		goto done;
+
+	/* For anon type, skip the check if swappiness is zero (file only) */
+	if (!type && !swappiness)
 		goto done;
 
 	/* prevent cold/hot inversion if the type is evictable */
@@ -5524,7 +5533,7 @@ static int run_cmd(char cmd, int memcg_id, int nid, unsigned long seq,
 
 	if (swappiness < MIN_SWAPPINESS)
 		swappiness = get_swappiness(lruvec, sc);
-	else if (swappiness > MAX_SWAPPINESS + 1)
+	else if (swappiness > SWAPPINESS_ANON_ONLY)
 		goto done;
 
 	switch (cmd) {
-- 
2.39.5

