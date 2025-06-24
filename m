Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A192EA738
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793653; cv=none; b=KTzS7ESP42uLS0DvkiTKzSs6I5xrp81Z2wEYvYUF+PeTjifX+e4ENGxqjQU5f9HwXtw0dCWT8drfdkpCtjGv6LWZKkonSS7oUz89f/MDfXp/gYIKGd3Fz2Dztt4fHbX9c5lnC5OTlhqE6/Azy/ZZaEdrbUaUE5HzOcG/Rv0K6XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793653; c=relaxed/simple;
	bh=F9xHDiW8Uqm2cMSKOBqvwqb70yMRUXd6tMFuQWLlKP4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nrOchTEoTALUB8Pvrbb6sfeGTt2uPvmCejLOPUa7uNo1BvSE4H8GrvzWEOY5ZOU3XNeAr+8x8h6lvJwphKrvOuxQxAXhh3xkq0lcrzYFTm8vn/pt2iQCgeG8QrPEmZP4eHkHikqRdogz+0RVRORDFXqRIDfeYlO+cOwJ/u8Ene4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AbwDHTy4; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AbwDHTy4"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2eea1c2e97so571252a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750793651; x=1751398451; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yLtEbRv6QyxPjsf9LVAPVV2LoLwOWyeMLnVsJ44IjdU=;
        b=AbwDHTy4bZnt0JWMsRnTvU9Eok/Y74F983dSPXWbA/8swgF3GX/Uq0SefP1ma6Mu8j
         QxN+pNUIcwodjVgXYIdUGmtUcR/gqr8JYh7XKW8KNrNYQG0xRrmhAy5rfsDVlnY370qQ
         OM/gtsIdKdWFqqycBJlSHSOX+1JeisRJ7Gv07WfDfcIKKkQ9qYvrIp0gXVczXkgxqlRy
         dbUJCkGkaKF5ieYthimCOzCnefv55YecppSbIGjX71AQ9HQ2T68Gv2pvq0HjgH00Kk0B
         Z+emEUSNiV4uLSCKqT3v954cZOZKLkqbCPnUvbaSFA5kIIy0slXnmhtYzkwHkW+5VzPI
         URVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793651; x=1751398451;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLtEbRv6QyxPjsf9LVAPVV2LoLwOWyeMLnVsJ44IjdU=;
        b=g/X5nCOUBqHiDbGiqdhT+gnSWa40VXynYU774u/f0EYkfbxRCQcuxUEEkMsQnkEuKM
         QzOtp7iuQgxQfmcaSw11PbzzCXkabm9ZacUgVu1mENgrQfg4Pg4sMXUtN07wV2yq9BaG
         Q1eG2uEkvcBQVsCoZDwvCy62xycg1Emb/WcWNgyD18y0fRtAmPzdNj6dsihK820RL5MO
         0a7ZhPgQOLmJzFScKLzTDxIDwxZFz+IlHXklpb854tlkQWLAoDmZ0/ktoel9Xvlakikv
         OguB6ttqt0GJ9FKnU6mllKFTj3e1sPA03GO1vWjj76/B5gOycVD0KHUwU+kwH3URH8J5
         nI5g==
X-Forwarded-Encrypted: i=1; AJvYcCU6NkHudUeBLZ1eN77viOBrK0Uc6/yoQLWsPyNsMCiXfvnVgE2MQbYq4sZY6e83uOhbOzbv6MDfT9+J/XI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiCILcdFr8LJBLj+3cqEuj/RDwMs9mAzqbi2S5f6ZWSVl7b2Tw
	8jpQTczu4DS0PtQIQhXEUeMsYGbjrh8RvF5SjdbFsuPvLII817lLJw9JZB1bR/MqTMMpqXLvVrE
	Zystdkw==
X-Google-Smtp-Source: AGHT+IHClWuGmDdB+MsMxoQpT43VMdFBAo96rsx+K87NYCqHXT7J+KynqmIRFatckh9qdl8zl/G773J5x/U=
X-Received: from pgww20.prod.google.com ([2002:a05:6a02:2c94:b0:b2c:3d70:9c1])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9d8e:b0:215:e43a:29b9
 with SMTP id adf61e73a8af0-2207f2a49ddmr205722637.33.1750793651161; Tue, 24
 Jun 2025 12:34:11 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:33:56 -0700
In-Reply-To: <20250624193359.3865351-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250624193359.3865351-1-surenb@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250624193359.3865351-5-surenb@google.com>
Subject: [PATCH v5 4/7] selftests/proc: test PROCMAP_QUERY ioctl while vma is
 concurrently modified
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, david@redhat.com, 
	vbabka@suse.cz, peterx@redhat.com, jannh@google.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, paulmck@kernel.org, shuah@kernel.org, adobriyan@gmail.com, 
	brauner@kernel.org, josef@toxicpanda.com, yebin10@huawei.com, 
	linux@weissschuh.net, willy@infradead.org, osalvador@suse.de, 
	andrii@kernel.org, ryan.roberts@arm.com, christophe.leroy@csgroup.eu, 
	tjmercier@google.com, kaleshsingh@google.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Extend /proc/pid/maps tearing test to verify PROCMAP_QUERY ioctl operation
correctness while the vma is being concurrently modified.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 tools/testing/selftests/proc/proc-pid-vm.c | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/tools/testing/selftests/proc/proc-pid-vm.c b/tools/testing/selftests/proc/proc-pid-vm.c
index 1aef2db7e893..b582f40851fb 100644
--- a/tools/testing/selftests/proc/proc-pid-vm.c
+++ b/tools/testing/selftests/proc/proc-pid-vm.c
@@ -486,6 +486,21 @@ static void capture_mod_pattern(int maps_fd,
 	assert(strcmp(restored_first_line->text, first_line->text) == 0);
 }
 
+static void query_addr_at(int maps_fd, void *addr,
+			  unsigned long *vma_start, unsigned long *vma_end)
+{
+	struct procmap_query q;
+
+	memset(&q, 0, sizeof(q));
+	q.size = sizeof(q);
+	/* Find the VMA at the split address */
+	q.query_addr = (unsigned long long)addr;
+	q.query_flags = 0;
+	assert(!ioctl(maps_fd, PROCMAP_QUERY, &q));
+	*vma_start = q.vma_start;
+	*vma_end = q.vma_end;
+}
+
 static inline void split_vma(const struct vma_modifier_info *mod_info)
 {
 	assert(mmap(mod_info->addr, page_size, mod_info->prot | PROT_EXEC,
@@ -546,6 +561,8 @@ static void test_maps_tearing_from_split(int maps_fd,
 	do {
 		bool last_line_changed;
 		bool first_line_changed;
+		unsigned long vma_start;
+		unsigned long vma_end;
 
 		read_boundary_lines(maps_fd, page1, page2, &new_last_line, &new_first_line);
 
@@ -576,6 +593,19 @@ static void test_maps_tearing_from_split(int maps_fd,
 		first_line_changed = strcmp(new_first_line.text, first_line->text) != 0;
 		assert(last_line_changed == first_line_changed);
 
+		/* Check if PROCMAP_QUERY ioclt() finds the right VMA */
+		query_addr_at(maps_fd, mod_info->addr + page_size,
+			      &vma_start, &vma_end);
+		/*
+		 * The vma at the split address can be either the same as
+		 * original one (if read before the split) or the same as the
+		 * first line in the second page (if read after the split).
+		 */
+		assert((vma_start == last_line->start_addr &&
+			vma_end == last_line->end_addr) ||
+		       (vma_start == split_first_line.start_addr &&
+			vma_end == split_first_line.end_addr));
+
 		clock_gettime(CLOCK_MONOTONIC_COARSE, &end_ts);
 	} while (end_ts.tv_sec - start_ts.tv_sec < test_duration_sec);
 
@@ -637,6 +667,9 @@ static void test_maps_tearing_from_resize(int maps_fd,
 
 	clock_gettime(CLOCK_MONOTONIC_COARSE, &start_ts);
 	do {
+		unsigned long vma_start;
+		unsigned long vma_end;
+
 		read_boundary_lines(maps_fd, page1, page2, &new_last_line, &new_first_line);
 
 		/* Check if we read vmas after shrinking it */
@@ -656,6 +689,17 @@ static void test_maps_tearing_from_resize(int maps_fd,
 			assert(!strcmp(new_last_line.text, restored_last_line.text) &&
 			       !strcmp(new_first_line.text, restored_first_line.text));
 		}
+
+		/* Check if PROCMAP_QUERY ioclt() finds the right VMA */
+		query_addr_at(maps_fd, mod_info->addr, &vma_start, &vma_end);
+		/*
+		 * The vma should stay at the same address and have either the
+		 * original size of 3 pages or 1 page if read after shrinking.
+		 */
+		assert(vma_start == last_line->start_addr &&
+		       (vma_end - vma_start == page_size * 3 ||
+			vma_end - vma_start == page_size));
+
 		clock_gettime(CLOCK_MONOTONIC_COARSE, &end_ts);
 	} while (end_ts.tv_sec - start_ts.tv_sec < test_duration_sec);
 
@@ -726,6 +770,9 @@ static void test_maps_tearing_from_remap(int maps_fd,
 
 	clock_gettime(CLOCK_MONOTONIC_COARSE, &start_ts);
 	do {
+		unsigned long vma_start;
+		unsigned long vma_end;
+
 		read_boundary_lines(maps_fd, page1, page2, &new_last_line, &new_first_line);
 
 		/* Check if we read vmas after remapping it */
@@ -745,6 +792,19 @@ static void test_maps_tearing_from_remap(int maps_fd,
 			assert(!strcmp(new_last_line.text, restored_last_line.text) &&
 			       !strcmp(new_first_line.text, restored_first_line.text));
 		}
+
+		/* Check if PROCMAP_QUERY ioclt() finds the right VMA */
+		query_addr_at(maps_fd, mod_info->addr + page_size, &vma_start, &vma_end);
+		/*
+		 * The vma should either stay at the same address and have the
+		 * original size of 3 pages or we should find the remapped vma
+		 * at the remap destination address with size of 1 page.
+		 */
+		assert((vma_start == last_line->start_addr &&
+			vma_end - vma_start == page_size * 3) ||
+		       (vma_start == last_line->start_addr + page_size &&
+			vma_end - vma_start == page_size));
+
 		clock_gettime(CLOCK_MONOTONIC_COARSE, &end_ts);
 	} while (end_ts.tv_sec - start_ts.tv_sec < test_duration_sec);
 
-- 
2.50.0.714.g196bf9f422-goog

