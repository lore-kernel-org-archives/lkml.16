Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D691531E8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685256; cv=none; b=UXD0GbvUgVq7g/6/OiQh+gBEyEbhZacpg89I5VSl7mJTe72rzOwCbJQs1wx3NrJqdNbkTrZCismfICaRxth7iBLbYA2NFF2L9zLOc1U7VDfI/Ro3ddJE18U0xw98adKgfFHaj7I8Xs3kCelgGbaKl5Sbmg0skPT2jsfH4yhqhRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685256; c=relaxed/simple;
	bh=wFI5xoUcr+PPoN6JLmUH0KSJpkttQ6kHDTWRm3toq2M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UCzbPqgrOSrYWDsluvCxpqc9eTY7/uwYom+gts2alIjh9SN41WnaDEO+d3cpAIdDy75TVX2wmN5bPXxEvYhD366frultgV2jVm//1NkQcFpBpFJ7yj54XWH+6jphdbdIWwtZGufp/H1/Y5ZLPDwBJ9uR/It0DGRd2jW17W2XpQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fPRMKG5g; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fPRMKG5g"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227cf12df27so40404525ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685254; x=1745290054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXD1JHisUM2V0YMP9gwUIK79l/C4R22oOynHqMcLpgg=;
        b=fPRMKG5g6Y4dHSqFrX0n2724FhvwdUsiZGPNJiB7fDJexa/TcNF+jVGi2OvahkabJf
         iO5817tdTejqojD61CIp2CbNG1k5HMEQQsDFPCx8j7SSREWKdI8TRRtShuSNQVIZhhBu
         7zGMRbRAHc4EtRxx6GjMFzKZzifCoj4kIGGQgyrNg8EHU7CbbYgwTk+cLUc8sv743LhN
         MKYNydY7KbEL6LuleCP4CMUAyNAcPBk3qqIx1fx1W8A5Vn6M6sFJJzsrNYbcCBwoA1Ai
         xFYLuImy5NcNEhAvT3aAEATnvDzBJjaZ7iIMiHlnhA9JT+LsrCv2PwZks9TvuJHGNClr
         2XTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685254; x=1745290054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXD1JHisUM2V0YMP9gwUIK79l/C4R22oOynHqMcLpgg=;
        b=blMaetGnWirmcMLpUE87rY2ifen9V5RsZ2UhLLwJVfxj/YPvOY7aW91RaGfe7xpx3W
         92zOwlUvUmGSMhtHUNy5ciCr5z0ZQ/pD3vbfi4ATv1K/sBST8TrNfTZvbkt4vJb1ODgf
         S6KsQiOR4il49FWrqXXFRLwMVVE+nYJTSa7asy1IYio3wKU8ZLXcTxeeKsknSu460Zjd
         wwtjHwGyh2uKDD3MCscvfU8bhRy/tbVuq4RX07AqQwWP8lOeHy0G8LJwsf0N3u4bLP5+
         Nh5ydkdaIERoYPp1+gUBE63S+tfiyPieeS2u3B/8++gfsl7vLbFkvWBqL3fzM0XKI0uA
         P7ow==
X-Gm-Message-State: AOJu0YyE0v5FOvIJwdSeoVgQJ8TIpPw8gUbI5A+T6K3OK1F2LqC6j7uk
	pFhsRkhLppkzB7u8mOU8Jx5gf8swE2zpHsM/QQuxMkanODGjXWS5UZviCK4raxY=
X-Gm-Gg: ASbGncskErdD/lGMg9QubBevklH7nIvSUdrI0gamlV3mFiVT1+RvO9gX5z3R4AVNHjw
	1u0fn35MglUo0nyuEBFETZ0vdEH0G72aU+zguY7S7kVt145QNfkS8HyJepRjIOLI+Xchbsd0C2Z
	x/4tHDK3ErcWcTkEmNlHRdHRyIsRU5yptmw12XlzofLHXckBh3vJpX3wj3wJGtqgW1pkb+ChwTN
	iZEdADxhM5mtmJyT+KOnzLAA6XTyWiRHKbrMFIhHmU9qsgIucHTHMyibXAy+rjFt/fS+S1SNWXJ
	5ZSqnu0jo5MfTI34DWloB4+QldoGhUP7AP44DxP9Hzd5guDFdbCA2pgMgEInNlmOgbzojt5k
X-Google-Smtp-Source: AGHT+IGov3Ukjqy6KHI2Ta9mNCWkvrqJ5tO5c4YlNBGkmYhVlyky9mFum65/WmO/B3bYIoz2x2Rf2g==
X-Received: by 2002:a17:902:c942:b0:215:b1e3:c051 with SMTP id d9443c01a7336-22c24984d66mr19690505ad.11.1744685254245;
        Mon, 14 Apr 2025 19:47:34 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.47.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:47:33 -0700 (PDT)
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
Subject: [PATCH RFC 18/28] mm: memcontrol: prevent memory cgroup release in mem_cgroup_swap_full()
Date: Tue, 15 Apr 2025 10:45:22 +0800
Message-Id: <20250415024532.26632-19-songmuchun@bytedance.com>
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
against the release of the memory cgroup in mem_cgroup_swap_full().

This serves as a preparatory measure for the reparenting of the
LRU pages.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/memcontrol.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 09ecb5cb78f2..694f19017699 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5097,17 +5097,21 @@ bool mem_cgroup_swap_full(struct folio *folio)
 	if (do_memsw_account())
 		return false;
 
-	memcg = folio_memcg(folio);
-	if (!memcg)
+	if (!folio_memcg_charged(folio))
 		return false;
 
+	rcu_read_lock();
+	memcg = folio_memcg(folio);
 	for (; !mem_cgroup_is_root(memcg); memcg = parent_mem_cgroup(memcg)) {
 		unsigned long usage = page_counter_read(&memcg->swap);
 
 		if (usage * 2 >= READ_ONCE(memcg->swap.high) ||
-		    usage * 2 >= READ_ONCE(memcg->swap.max))
+		    usage * 2 >= READ_ONCE(memcg->swap.max)) {
+			rcu_read_unlock();
 			return true;
+		}
 	}
+	rcu_read_unlock();
 
 	return false;
 }
-- 
2.20.1

