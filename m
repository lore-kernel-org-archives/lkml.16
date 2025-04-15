Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4483721ABC6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685240; cv=none; b=f7abS8/LM18odO38GG5JIAPLMeEJh0dE5aDlcy6cvBNXmTLhjJ85pOh/FXuy7nPoaYrXKAC7TpnrpUXgn2RUqYuJhVNzcUbbLq94EmT8vREdmL7FTw3cM6qNFryziwG7XjlqDXGlz8/9zUIfAtqkSMAyARoeZGsvO6IZyNsuMLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685240; c=relaxed/simple;
	bh=ExRJlPFqRIPBVplhInN1J+JPDFU1q83KrxCLYkfL8vo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ROJ1/bb8pbVC1dmn3qqZTmLyTbXLqsVoa0vFDt1+Hw87yn2JzQVioV/f7wkw3sy18XQdPgwgKY/LZQa8Cch9Zg2dffGFWFmoo47+WMuAEjgZzjnAl+sLSD+qReU4MoX0qXErHdj15rbbUHj6JbD/DEme2MoOalIcb5k6RfMJS4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kIprf5Nn; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kIprf5Nn"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-227d6b530d8so48305725ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685237; x=1745290037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=048a/COuUtmsXsXzHcibcjt0GyskIDx7SCGdBM7o194=;
        b=kIprf5NnfVr8zwBg2zKmZeWU3jQXAheHtu+IwoDTWZkhXhH0QfBkcKAEd3K5xLaFpQ
         +BDoi0eGkMluXMR9jag9hEjS/2G+8SFsbqQXhSa0iPne6Qr1fWzwH5ulU0w72AMTlkQT
         3tCF05TcFQd2Q7uRsSPQkK5aEEqLNYM+QJmo9xZfqMQPCSsIDnq4pD6waZEYPouCQiKn
         aMI9Wg9iD5TLpj9b+fEJCR/XnFwjc96qtaDjqvP4QBV4vs/gUPWzMtQXm9H7HXsXcz6E
         AN+97XoF/ousv0dN6MaD3PdlxmsUr16nX40tqbBwnoB7zB9deyiS78YQFgeYBayqtynY
         Cw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685237; x=1745290037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=048a/COuUtmsXsXzHcibcjt0GyskIDx7SCGdBM7o194=;
        b=f4NKgsXikm+Jmzswjg2PZ+uAAgu1iL01KhBxl84y0pcoDg0tYXzt2gNp4Dvl4Qpbk8
         ymaOYwxf9ZrgtE79eJvsm2kGEYbN2C2M0khp8dP/vfHISd1xOkLzZSjssnC2XXnuWpsi
         hzrGjc+5Fq3J32vKaAlxViu94ahH/4V8A8FOggpxwdAyHAIt2VVul51jG0Ge8yhjRtiK
         GsY1VrHlULxtvOWkTZp+ZN70SuQKJzN+gq4OQleHZUV6ae+7Apl+1BrIe4/TL28AD/S+
         hYIDsA0N9lWJHk6sQOfpAH+oajD58BHYV4y04MOPP9xf770n6YUUm0/01Kf7zrLpcCJl
         NrJg==
X-Gm-Message-State: AOJu0YzxWpc7MZSlE6vPZVfScDEXv1UnjbrlXfNAL9E8m5M83sCn667h
	s/oSt500uO1wxeDbcyAtTnUj2nL+WxSgej2avkTKUmlDFgH0swroLWOxmSqYENo=
X-Gm-Gg: ASbGncshKjrnJK1N1lftUGt+n6Y/a62GO6b6c/oSjwZ1Xd6BNfHuhrEz4flI+B+5iTG
	EaDgxmHwB39AqsljH/EpYbVkVDvunZ/fK4LD4DXxghDYW1JPTDZWcVWP0sEBAQYzq5iuYl72vdH
	2x7LXyEImmUVhmHQ1WROqKdWXF43RiDDaU+2FRsPV9l7nyYGTzhzAdUea5N3QSE0qu8CLRNo3rx
	72Ev0IJ4UBu/tGlePgZ9cJ7AMEQbKaISTdliU5HlmLnhX9Muk7/jz6zII4PuO72rZSmverJ4iqx
	mC9B9qNPI0+2qAdSKJCpnkwQrnJjF6uYTx8FiTJbxl+5Pj0u+jNiQCYEQ4W3K9qKNDCPUzQ9
X-Google-Smtp-Source: AGHT+IH8mFGGtZG1eAt8IdVT2T6wuIxSclSFtYUMLbYnFcscVwUk704iXPYP1CTuJRMCglCtOnp9BA==
X-Received: by 2002:a17:902:ccc5:b0:221:7b4a:476c with SMTP id d9443c01a7336-22bea4ab854mr201964985ad.18.1744685237616;
        Mon, 14 Apr 2025 19:47:17 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.47.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:47:17 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	david@fromorbit.com,
	zhengqi.arch@bytedance.com,
	yosry.ahmed@linux.dev,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev
Cc: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	hamzamahfooz@linux.microsoft.com,
	apais@linux.microsoft.com,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH RFC 15/28] mm: page_io: prevent memory cgroup release in page_io module
Date: Tue, 15 Apr 2025 10:45:19 +0800
Message-Id: <20250415024532.26632-16-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250415024532.26632-1-songmuchun@bytedance.com>
References: <20250415024532.26632-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the near future, a folio will no longer pin its corresponding
memory cgroup. To ensure safety, it will only be appropriate to
hold the rcu read lock or acquire a reference to the memory cgroup
returned by folio_memcg(), thereby preventing it from being released.

In the current patch, the rcu read lock is employed to safeguard
against the release of the memory cgroup in swap_writepage() and
bio_associate_blkg_from_page().

This serves as a preparatory measure for the reparenting of the
LRU pages.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/page_io.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index 4bce19df557b..5894e2ff97ef 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -280,10 +280,14 @@ int swap_writepage(struct page *page, struct writeback_control *wbc)
 		folio_unlock(folio);
 		return 0;
 	}
+
+	rcu_read_lock();
 	if (!mem_cgroup_zswap_writeback_enabled(folio_memcg(folio))) {
+		rcu_read_unlock();
 		folio_mark_dirty(folio);
 		return AOP_WRITEPAGE_ACTIVATE;
 	}
+	rcu_read_unlock();
 
 	__swap_writepage(folio, wbc);
 	return 0;
@@ -308,11 +312,11 @@ static void bio_associate_blkg_from_page(struct bio *bio, struct folio *folio)
 	struct cgroup_subsys_state *css;
 	struct mem_cgroup *memcg;
 
-	memcg = folio_memcg(folio);
-	if (!memcg)
+	if (!folio_memcg_charged(folio))
 		return;
 
 	rcu_read_lock();
+	memcg = folio_memcg(folio);
 	css = cgroup_e_css(memcg->css.cgroup, &io_cgrp_subsys);
 	bio_associate_blkg_from_css(bio, css);
 	rcu_read_unlock();
-- 
2.20.1

