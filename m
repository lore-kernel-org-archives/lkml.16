Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5471531E8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685245; cv=none; b=VVi2W3xnnpiVuWK7Kv9VbWfBPXQM2ZdbPfpRASvyCJSHtO/NCExxava6j7nYuZCkKmt1fztQE6U6WVygppLIIJYUoY+ph1pVrWdP3Ci0RJ+HMjKWfwyHL5bJ/4hpkExfF87gK6y35Z5sftDCgkIWQM1A5tyeP5yORdo3gYMq6HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685245; c=relaxed/simple;
	bh=v5yMn5IixgDIQc8oleyaSWuKuE9z67T/Dq0pK11nZuI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qka+6FSY59cRvYr5m+EiCTVbIj8gDyFhYht24SnfcrC8UtsBzufyMiC7ovJ1v89fq/tNBy2Oo3pNjkNSayRuNDQccSrh/lKih0lcM5DUjSi5gvHmZjJAXuRIi7aPQw5flExfiJK22bwN1sHhqzKm3po55OoWjPj4OUBQfkTvxRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=OQOaleIw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="OQOaleIw"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2240b4de12bso68177975ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685244; x=1745290044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5EyQKk8+6fTeRtjB7wRmwigOpyCG4thZQUtLcFoNss=;
        b=OQOaleIwWH8SiioPA7QjEmUZKtNsgGvNAClUiOjgHKllSTzbhThqIOh2R2FKNlGlV4
         NhGVzNHLrrC1JjcivD1R/3lucZD504VLoOOmgUaEACPQkQY+Mv+65wbipbjY0tUrjm3a
         tL4X4hkswJBuqirz4kCSU9kBWhMFzid7IfEIe4e6Hy4kTFoM4GDO57jP8oMwoM8sK2V+
         SiM4t4laA2I8kav++Yj73sV5I7Qiy9iIZsSAppwCLdUL+o1mrWNlaHUHMim0VpYiLCbT
         c1dfj5DuApjBJWUG41fatIpI8yDFLqLn5ZZcnWy0umwuv9ZVD3VvhidnnVpq7SYpYpON
         +pzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685244; x=1745290044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5EyQKk8+6fTeRtjB7wRmwigOpyCG4thZQUtLcFoNss=;
        b=mTb/WaP8Ri0xgpx0Ehkgrr865BIstB+lgiylJRVNrZAqLEIaodg0OBjf+2hq6HA9fE
         Ty/c6zXxs/VnQ8K96sby1pdSyJm+1b6bIKwdDdCuV6AumySLRq7ONV4dH0kdLMhNo2W3
         8WyH1VdBYMNryQZ8ogH+qqLEFxGZjQiOHUEa26RDseHP17J0uvlFL0iNenzJakqMiM7j
         C0d8iLSMIgePcELCnFK5IlFDBOrD0GkYD/NtfVzLWRggMZtwZBOcg0hP/Z5S+hgl/qsh
         qyo23aCiulLgsS/0SqO4/+2n/mrdjNAb+UTTBguRCj0RKhfF363OPvL/SUa5Kvyzl4tL
         k6bA==
X-Gm-Message-State: AOJu0YysAHjH0MzEJY0cH2C9jR0wT9Z80qiBBYF1u1gWrMTVYShQT2qh
	5JqbIq4v6NxPqwD3+v5IeiklDCANhMMziUXCjq3EWpQt3Jl/SlXPfpac6jX/mFY9L31befaxHJu
	Oq+aeBA==
X-Gm-Gg: ASbGncvvdv+nsWjAqkgfkG9hVWko5JsnEY4OkpYrbtYz40xIN96bXwZTvOtnLjRxGQ8
	fXHMu8D8Gsd9rE1s1YkeijSTHmrTkKPbHwbyvXuH1rkq79GzxW0KYAVOqVWlw2BpWAYavf5qwlp
	OphyG10tbwZmQOdjFeMAQjtJK+0cv2+pyvKI/EuLtv1xCTpjaQcHgHvDl2AHTuh+cErUGyoaf0a
	CmROIagKkyKCTYUzEBKCXEtX0rQlvZXT5CzI6WmaOqOVJO7OxQOhuwvp3sbICX2Nvkn/LYVw1v0
	3UQbXC4Bm8hRXv/OIOJZIcSON2t0JiwDux0a9D2Cc9GuiWiW5FD/vL9iSiwpSoViAih31C5r
X-Google-Smtp-Source: AGHT+IHMPzkkwvrvPUMjLd8RH358czmXgq5CB+tWd2lPWjwDGWGWGLk2G1vtiG4B5iGYuVvrrbfcCQ==
X-Received: by 2002:a17:902:f70f:b0:224:5a8:ba29 with SMTP id d9443c01a7336-22bea50ba50mr238795615ad.43.1744685243640;
        Mon, 14 Apr 2025 19:47:23 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.47.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:47:23 -0700 (PDT)
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
Subject: [PATCH RFC 16/28] mm: migrate: prevent memory cgroup release in folio_migrate_mapping()
Date: Tue, 15 Apr 2025 10:45:20 +0800
Message-Id: <20250415024532.26632-17-songmuchun@bytedance.com>
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
against the release of the memory cgroup in folio_migrate_mapping().

This serves as a preparatory measure for the reparenting of the
LRU pages.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/migrate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/migrate.c b/mm/migrate.c
index f3ee6d8d5e2e..2ff1eaf39a9e 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -565,6 +565,7 @@ static int __folio_migrate_mapping(struct address_space *mapping,
 		struct lruvec *old_lruvec, *new_lruvec;
 		struct mem_cgroup *memcg;
 
+		rcu_read_lock();
 		memcg = folio_memcg(folio);
 		old_lruvec = mem_cgroup_lruvec(memcg, oldzone->zone_pgdat);
 		new_lruvec = mem_cgroup_lruvec(memcg, newzone->zone_pgdat);
@@ -592,6 +593,7 @@ static int __folio_migrate_mapping(struct address_space *mapping,
 			__mod_lruvec_state(new_lruvec, NR_FILE_DIRTY, nr);
 			__mod_zone_page_state(newzone, NR_ZONE_WRITE_PENDING, nr);
 		}
+		rcu_read_unlock();
 	}
 	local_irq_enable();
 
-- 
2.20.1

