Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B9B2264A0
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 20:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968581; cv=none; b=eSLtWbdkASt4cGY449WabqVIOOBdMNvhf/tBs3Vc5Bz4Ju3umKk3b/ZbkKaeWYGK0wkrsF/K6z++sq4soaCiuSaZfVgL6+sUMzwFdovq20MZIwfoH7zx8+VU2L2laxMA+IZ3YlGvrf+GpZxAAQgTPIfj8JPLYKyuQYMmesdVxL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968581; c=relaxed/simple;
	bh=Rrj5yGIe5m6mweZt31ZjU8b8vbNeF5DLnhNfqTUP8VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MUHI1T7+1XKhJ7ThqpVMBsZHbjkWmYuANBuhZZbYAtJKeoH+sYpDcybcfzJfzyxfoV6MM5P3PVXEWVaLI1EhS4FHRjHS6sXcK8GvWQ1rWWkTypRobfVuy1a7PPM8inlJHsv2NE4xOaTECtikWDnNmE1f7RI2jheJ1GC8SE27cs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnKY7IQi; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnKY7IQi"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e81f311a86fso1159468276.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750968578; x=1751573378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIXH2jDsEXRyQiyezBO6V6Tp3e9zFpAPHpDQGbN97l8=;
        b=MnKY7IQi64d6K6t6pTxkgHeIwiwclKMGC1NSG5J7CTsKCwe6IUgL3Lc0MweVVUVm8U
         U1d6GMOVta3AArinQRdj3pKCun2fKbuEyvEzE5nj2EwpmVrBEctXe7CDYNc0hq2ZUr9Z
         SHhi1KSAw5cX2cRVuy3PsdD/TmD0HTHcs9cFoKOGYvqEbI+8+Tjy0Dxv55PJ7DMbykky
         UVHWsFE52obFHXt/YbFOowr0y9JOyHRXwJzk/gBhjBipG0qonDu8uekz36XJ+wyzWJVV
         w1G8P+lEFqZro2CWdRz9L4VhOUgQGvWZZUDaIdeV3bpekBtNDLfL9hqKqW8oqQE+2Ef9
         0EEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968578; x=1751573378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIXH2jDsEXRyQiyezBO6V6Tp3e9zFpAPHpDQGbN97l8=;
        b=TBofhSAdLyZMGgGWcOJK0yCeynHff9HtJ7BEjVXLO5vWlfti96ycZuJhsDTFVXyBbS
         W32ibKt/fK9J4l68x3a16TD1F6yo6BQxf+s8wTLFFzENsA82zUrAeO9kCSmKoo9SrorT
         hY/I4ArsI2GsYD+ZUnmYwddpQ9byw5Kv0WJOV6d+RAiV/BUCmXbVt2Aom4F9JmNxMoJ0
         DNPQ6FodDT49NGVdMXdN3U6eMjlxLE+Tay9d6J2dX1Jowy5C82uun87cv4ZcITbKDm7A
         lL5GNVvWPd8GbQfvyu1xjmhS0o6+Opt3nf68bUSDzkp3cJqrP1OM1S4a1pO5Oh2l3e3A
         k4YQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0SkrJ2jwQE+BSNso/2iGIHAaci0trNP98RkYeZx2D5hXSjGaIAMxKDumJLRuy23p1E+X1Sk9SkUA+Jic=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRNHO5IuUH8lbFCNIxre45Z3I9J+tdncdseXJAWRtrsBn4kFaI
	55Fg3qMuNtALj92grKCRqVVL5qNd0Advwxi0HVwB9lRbMm+rWDsnD1eLj20X7g==
X-Gm-Gg: ASbGncuP1em83Aqp9TBdMWJig5AOUPzhEDgCW+80Ks2mgPS/ehUXbKLaeG2VofayKy1
	iUaSRSnslqQQUZasBW0Wnq90ZvJMICLX0LkmflPc/sSblf6LbAhznhJCdT5jwpEwti+EP2vSdfu
	QkqqmfwcipphApaiSCyTWmMNk/gYvNVAQgNaU5wyK9r0YrB/XDgyPUBlckOenmHmXwpWSCj78QD
	ebfm8FOpWbkYAQqemdeWHQjhG0Lg2HFlwPiNL6Y9FvY76QfwLYI8zREnJAat/2cYmAsNoqwxvjl
	PoOBnmAZAWEOwqUDZoOU9T1UoLeLvYm5hha6XtaAzrKegjLQhBb33PnkHLQHMQ==
X-Google-Smtp-Source: AGHT+IF2X81Mk0skntP3pvL/HL/hnTf+lp4HUwMV9tg3dOtroLbD1UFIYUBqhDtlaW0PIuIyQKapJA==
X-Received: by 2002:a05:6902:1103:b0:e81:88a0:bd0d with SMTP id 3f1490d57ef6-e87a7b0d170mr1222002276.12.1750968578140;
        Thu, 26 Jun 2025 13:09:38 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:72::])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e87a6bd0402sm178409276.29.2025.06.26.13.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 13:09:37 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Gregory Price <gourry@gourry.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	Byungchul Park <byungchul@sk.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com
Subject: [PATCH 1/2] mm/mempolicy: Simplify weighted interleave bulk alloc calculations
Date: Thu, 26 Jun 2025 13:09:33 -0700
Message-ID: <20250626200936.3974420-2-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250626200936.3974420-1-joshua.hahnjy@gmail.com>
References: <20250626200936.3974420-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the math used to figure out how many pages should be allocated
per node. Instead of making conditional additions and deletions, we can just
make them unconditional by using min(). No functional changes intended.

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

---
 mm/mempolicy.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 3b1dfd08338b..78ad74a0e249 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2645,18 +2645,15 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 	for (i = 0; i < nnodes; i++) {
 		node = next_node_in(prev_node, nodes);
 		weight = weights[node];
-		node_pages = weight * rounds;
-		/* If a delta exists, add this node's portion of the delta */
-		if (delta > weight) {
-			node_pages += weight;
-			delta -= weight;
-		} else if (delta) {
-			/* when delta is depleted, resume from that node */
-			node_pages += delta;
+		/* when delta is depleted, resume from that node */
+		if (delta && delta < weight) {
 			resume_node = node;
 			resume_weight = weight - delta;
-			delta = 0;
 		}
+		/* Add the node's portion of the delta, if there is one */
+		node_pages = weight * rounds + min(delta, weight);
+		delta -= min(delta, weight);
+
 		/* node_pages can be 0 if an allocation fails and rounds == 0 */
 		if (!node_pages)
 			break;
-- 
2.47.1
