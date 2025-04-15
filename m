Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE8C218AB3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685221; cv=none; b=hxfNxwQ90vwYWBmZsmtLxMG86xA7YLb36pFwaIHDMw01pHUXAsQn8SrmvpHoUwVYllqItnUbVA62oH0QyHfj90r2TyRdsyhEm8d6yp0p8v3eu93WnVTugccNXywnRN880IK+4i5yq8QRn/BHJDp0RQ1il1hFg+K8m9SiLrj8bS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685221; c=relaxed/simple;
	bh=8KxT6StpABCnUuNQIAeV85jX8gee7ZWYN/zcNFzGT4s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fLeWiZuAbZH2x7Nrxcpin5CsWPweD7kqgiTQHNvycTJSBxeqk35yysVvOHdBwDFSB+LUi+7RPUiFDDHQvn2yBgi0xCLSdijvjDJGKB1xr9EzXXqZ/7psl7J+93BUrBj0+vf37fyqPqO9pilp8XtuJN6/kbWjOJ2VnAd5Eedn/AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hA4TWiGa; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hA4TWiGa"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2264aefc45dso74528075ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685219; x=1745290019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ubou74n5eLeoB4dEz2IgWAHxjcUZtEwt6QUiSiKGpOQ=;
        b=hA4TWiGaBdT+RW5VnjUM6tC4UrKaXvoCPUwBytpgIhn/60hJksyYg3EemIvna66WTJ
         4oQ2MyLj1R4QC6qwP1kYEoaaIFtxDafQCqNH0qYeYf7d26FaHhm5g3FtJZCkEeHnYzUu
         jhaiLwX0sANJm6szjo3VJkePNru5Y5H11vsAzCBrmnjKETwNr48YWjW9A3n8EJghXGX1
         iKdJilALnEpKuIayKEAHdS4dvHPG+iMpW1zynIzZnF5ZCQoNbNmJLFJzrgxQy2OP1k8N
         ZZv7lz3CEus9KZnw8uPutC61wd+ZcPGVh67pTvso5bQfsq69/7G6eF4ZUDIGhFiD1XBL
         fhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685219; x=1745290019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ubou74n5eLeoB4dEz2IgWAHxjcUZtEwt6QUiSiKGpOQ=;
        b=SJZcur1OYx9/F8ZF7NWLxWIiLQezBF5xazLlpwY3y08pMOVe9+tQ0qx3G3y4YqmfLU
         I/chue1/0WAiYzSyCMSItBP5HtIWeIym2KnrT3weZH+Jg1dTh+KazI6KZLO3/V42RC4l
         oHg52nPrGTwXt14EOqK+QSrzMMBnUUlcip48mvz5HXvz6rTPgNNXiGEa64c1aP9eVUdY
         T9+L4lc+STaaSLMCYRm1/8bTjxLeB5cJNKjWN/6B95UYMYqFyW1odsgiBuwvBSRApmOJ
         WYoOyeqPovIeD5RdHXaNHqd3zBdxSuRYXINwOA+MVDS7uVpDJ7nTdahWWx8tFKe3nSgK
         YpZA==
X-Gm-Message-State: AOJu0YzAKog62sxPqbPUA8CjL8kl6HspJyB1aXDBr5hKTv/SFFYJdQw/
	hUAJByjxwQqF4h1lHYpUFhxmmnY5UPrkJueZVJxgtDTmAXB6gaMrbxrWTKIOwE4=
X-Gm-Gg: ASbGncv0fQYvQpU1R6lLX95MFciRoWvjdz70JfV2mphw9BH+47JxZp3GtGDRPyFBSEl
	r5yf85GPziL6SP6geLHbzzUJGvkQJNiy0bxx2xMlr3w/nSoirKpkbUnaW1zJvdkiNPxroHP+Uj1
	e+KG4Bc4UIqBpez5HGl4l7GwZpG4MLtPViPFjmtN35V33mVnaa3cIMmH7BtdzHAUINUTV4wGu4K
	2CmWzSv865Ubh1TfAGzOJpbEfrEFSHO9t2/RBFXEDZx2oYNc7RI+xc7Tna9nEvDzo/k5ZEBUYBZ
	nORdgrwPMrt5VH6CWZXbhS17/L+kM3mnvlmp+blPBf/Rk104C1pt/jFAXrdgPEJbcBHET2Qv
X-Google-Smtp-Source: AGHT+IFRGP6yJdpVqApS9S/aczCeDW7cEdxeVDyn5gX3MHZ0LzmgIuZG2begu5ay7gyJ3d0hK4lbIw==
X-Received: by 2002:a17:902:db0e:b0:224:23be:c569 with SMTP id d9443c01a7336-22bea4adf49mr221463895ad.22.1744685219616;
        Mon, 14 Apr 2025 19:46:59 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.46.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:46:59 -0700 (PDT)
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
Subject: [PATCH RFC 12/28] buffer: prevent memory cgroup release in folio_alloc_buffers()
Date: Tue, 15 Apr 2025 10:45:16 +0800
Message-Id: <20250415024532.26632-13-songmuchun@bytedance.com>
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

In the current patch, the function get_mem_cgroup_from_folio() is
employed to safeguard against the release of the memory cgroup.
This serves as a preparatory measure for the reparenting of the
LRU pages.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/buffer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index c7abb4a029dc..d8dca9bf5e38 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -914,8 +914,7 @@ struct buffer_head *folio_alloc_buffers(struct folio *folio, unsigned long size,
 	long offset;
 	struct mem_cgroup *memcg, *old_memcg;
 
-	/* The folio lock pins the memcg */
-	memcg = folio_memcg(folio);
+	memcg = get_mem_cgroup_from_folio(folio);
 	old_memcg = set_active_memcg(memcg);
 
 	head = NULL;
@@ -936,6 +935,7 @@ struct buffer_head *folio_alloc_buffers(struct folio *folio, unsigned long size,
 	}
 out:
 	set_active_memcg(old_memcg);
+	mem_cgroup_put(memcg);
 	return head;
 /*
  * In case anything failed, we just free everything we got.
-- 
2.20.1

