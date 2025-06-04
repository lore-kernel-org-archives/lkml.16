Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A36426D4FC
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 23:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749078739; cv=none; b=RJhyrkEHpLm+BR3xoTIOI9MMAHRjDD2tTVkc1lBe/AV1d46xFwhPcX5N0LyMxVZ8DMVl5Kgod2fhjZcRGGYKdGFMv6ga2bkPgWoRBBo5fYDtnU/M6ywn5iFUBGgQLs4alQJJTj9W2YJjJq5G3R5RGFcponVJTgs2bX1r/8qxZLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749078739; c=relaxed/simple;
	bh=dCLw+ICLttM4i4IEom05wydD/h2oK6xFIKv3feG6V1A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hgz0CF2PAA/bBihlcMzyPRCbU2ei7bTmauATGnNPw1di5nh+ve6RXpqlA8ev0pzUbLdjh2vUo3jPy9w1SOXQjOSHXx5m1neIh9qSNnix/Yqn3fHsnlAwXiuahrEyiceAly++hIFbqIomYTYIn8MjCpbgVd97/xZ77bZqUZ7DbZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J8Xr+/jh; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J8Xr+/jh"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2f02cd1daeso177235a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 16:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749078735; x=1749683535; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3EJSuX6VivEZXPaW3XME5tQsWEwW8pbNYvF2lTXxKJY=;
        b=J8Xr+/jh2ZWSfJ/rkH4EBF3MTEUO37iRHY1X1uz8tQbe2ejieqiaZjHSRpmyfmwvYG
         Eh+4ikcPYINf5/T6cfb7iesbFimRF79RIPTcqmWLK3Oa0Mm9A4DopJRji9Xkv/MDSJOp
         h1ZS1+apfXWSDs1XcXprpcBPIJNpCBHpB4KZ6FJR/aUKVfNYHnuNEDKBavZHYqZBG9rF
         15ilghJ5dSctik9G3fnO+I8tY+udyyk3xZPw4NUn4rurQrnjx8xRVdBKxmtlQnAJAD/k
         XoxKgp9JlfGDsw0tWehalW7BYr8TJBCMPSxJWhZX7Z+LSR7KMGG8JBiHBe8P6cIr0INl
         ZF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749078735; x=1749683535;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3EJSuX6VivEZXPaW3XME5tQsWEwW8pbNYvF2lTXxKJY=;
        b=kI8EdoBshj+TFGOLy7NJgYTIs8iGTdWrX5l0f3jsDl+GKivXaKWBua+XQMhSrbR1Ke
         tONvOL5JOQwkq4p4y/uW+Qmipax2eKVAwD2kkBFVRwNLlnfRdtyn5chbC16FRNQUatv0
         p6cCzGZmpTkhY45EOsfP96hGPMvjabaymSttrtaIhd2WKH//jL1E1e5QuJIs3i8F00Mz
         wsd//3VFJxHQyy+/nNX/SfCk2FM7HU01VpFg8+78PDv5i/VxECBFakYhYesfPy6DWXl+
         INKrPOH4xYQNLLaVvIGC9YSkpYXV9LIncdTo1RLeiR8fCUKQMyJvTisqVSV1HKCqzN1M
         OBlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUatiwpsiEOwIZ7rgox+Mdgyp+yByKjccsDj+tnyyndp/Hk3ySGZ1p+aezlWBrI+/ziAtF5iSW8TrpHKoU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6/kN1J+rN/LaAWQeZgXa1K9TrDIfRHJwtLsD8wwcV8cVBSvXm
	XQuK3VViYOvUROAfKH2VJscmWblqvUBbAljaZ90p312P8bQbw6Qs6ZL0TGdy3PmYTBxBMdsrWmO
	JRXxb4Q==
X-Google-Smtp-Source: AGHT+IHIqm60fqw2WryyH60UqB66621hhhJyFpfZGiBWNrQf8PvcWHbFtpXkM6N/7/aBYh63wkE29sbA5cw=
X-Received: from pga12.prod.google.com ([2002:a05:6a02:4f8c:b0:b2c:4ef2:ca0e])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9990:b0:1d9:c615:d1e6
 with SMTP id adf61e73a8af0-21d22a7a486mr6852001637.0.1749078735331; Wed, 04
 Jun 2025 16:12:15 -0700 (PDT)
Date: Wed,  4 Jun 2025 16:11:48 -0700
In-Reply-To: <20250604231151.799834-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250604231151.799834-1-surenb@google.com>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Message-ID: <20250604231151.799834-5-surenb@google.com>
Subject: [PATCH v4 4/7] selftests/proc: test PROCMAP_QUERY ioctl while vma is
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
2.49.0.1266.g31b7d2e469-goog

