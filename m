Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1DF22D4C0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751609259; cv=none; b=WrQLHPUb2ha40GLH4hPhUTT/Y1HHKBVOxaAJN7FUjMETTR8rfK4Dj6mu06DjVE2F1qSXaHIiyr7mxykbd8LSDKEyCuYvocw5+Cujb3iCNV0KmtE5hanUNcRDNOnaX13hAQASj2pFvSfcNSXuUPIyRt0bvg0admGuHpnBFoJnCos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751609259; c=relaxed/simple;
	bh=ZMGFntAQnjjtMoQxDdiUKIBvPxmH73C1FhJ2CMHVp1Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dmOk1TCuL1iM2UB7tPvU51nOp6XBcQycVdtU1wot7s4vtSCeQbwQyZOYvFzFdOt5VQc5SLTZa4BhxtlhQWFjK/u88clIbpFSndFlfpUcbV1clr5aJ7KyrYkxwvHGZ/x50MDTrgtFlyJj2IFdlBqtmqKwRGE22kFw3UdX1nJV0uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GfFUvIBL; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GfFUvIBL"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-748f13ef248so654680b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751609257; x=1752214057; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Li63ssKppcLITl1ITfej/YujyWpoLXNJQdKFDqdnOTk=;
        b=GfFUvIBLQCAo6ht0eCpGERhFqayrzK5V6J3ggaN38JVh8XOrJ2fXUOW3GNUwQqo15B
         naLl71iKAtRimhZCj1X4U3R23gtJ/TdDF8JgBnUk4iwUzs8DQmAYeqdq46ZnAgJXkFI2
         eFL7K96+8leh888chkb0j2DVLNq9ziYbsa9zsJHg5TAIlSos/GJE9HuQBIp7ZrXJWSAI
         js6A5W4zQUVHZJ4pf6h0gPmbdJtdP5hDF94J7VFl0TmIBYQK1QuZRNT6/gP48zKMjwg9
         eWbJr7vRJyd2tF/BsRjpRjR1TY2vKsUmwOXc6APTfn7LfYVqM9czW+RyTCqzC+MLmaT3
         +8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751609257; x=1752214057;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Li63ssKppcLITl1ITfej/YujyWpoLXNJQdKFDqdnOTk=;
        b=rWp8gvmu5rEnX/VTn+IFe5/dGI7LyzGZC9J81ZPIx7UhODJMASCZ1g1e8868/EGImh
         URT7QZEjmd78pz4ecV5WHjcYYxvRRxj4MU0Wb2N8g4Uw2NPZsMFP1X3tAaERe9cce76Y
         8bAuiishH3PmRdZnSYdQlokSNtyDb7fefYR22GcaP2g3h+GK9WP7ieEFE7ExtT27KeoC
         FlunWfkL5Wn8UswU0YVSujo6Ja3l6c3p5fU8RvBzFKXh6cpyG/hDiK5l8R5opY6gu83n
         Wfbr0BTju7m/h1+V3pbn1c0F2QSiQIEGD+lVjvyEjZE1eF9XHkRs5ESkYo1vGAx+M9kH
         EjbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlwg1IJJYrPyjxk9q6SGc9++ysAjEg6Cp5G5WWtdrlo/IfkmoUNBz5GYb9wdocoPUGc+ZCpAB8UEA8CUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsMM47AznM2rkkAHGxknVHEB95d1Nsj+3SLb6AG7RbM4gk5fvj
	PTOH+mU05lf6YFodqF3CwCVCfMhYYk8H7fAm5YDinLS2F/hw4RjygTxFdH5na+AD0Gj4vU8Wg/K
	tpCTbGg==
X-Google-Smtp-Source: AGHT+IFg2kF2IsphyTUD4Tvtt+9uGgwrJfxzBAwNyZq9idmvq78iXfjYjXpbgDrlsnLunNcFZOzQ5AK3W2w=
X-Received: from pgji5.prod.google.com ([2002:a63:d445:0:b0:b11:3ba:92e4])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e90:b0:222:d817:2f4a
 with SMTP id adf61e73a8af0-22609a8977dmr1043637637.17.1751609256747; Thu, 03
 Jul 2025 23:07:36 -0700 (PDT)
Date: Thu,  3 Jul 2025 23:07:21 -0700
In-Reply-To: <20250704060727.724817-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250704060727.724817-1-surenb@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250704060727.724817-4-surenb@google.com>
Subject: [PATCH v6 3/8] selftests/proc: extend /proc/pid/maps tearing test to
 include vma remapping
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, david@redhat.com, 
	vbabka@suse.cz, peterx@redhat.com, jannh@google.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, paulmck@kernel.org, shuah@kernel.org, adobriyan@gmail.com, 
	brauner@kernel.org, josef@toxicpanda.com, yebin10@huawei.com, 
	linux@weissschuh.net, willy@infradead.org, osalvador@suse.de, 
	andrii@kernel.org, ryan.roberts@arm.com, christophe.leroy@csgroup.eu, 
	tjmercier@google.com, kaleshsingh@google.com, aha310510@gmail.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Test that /proc/pid/maps does not report unexpected holes in the address
space when we concurrently remap a part of a vma into the middle of
another vma. This remapping results in the destination vma being split
into three parts and the part in the middle being patched back from,
all done concurrently from under the reader. We should always see either
original vma or the split one with no holes.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 tools/testing/selftests/proc/proc-maps-race.c | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tools/testing/selftests/proc/proc-maps-race.c b/tools/testing/selftests/proc/proc-maps-race.c
index 10365b4e68e1..764821ffd63d 100644
--- a/tools/testing/selftests/proc/proc-maps-race.c
+++ b/tools/testing/selftests/proc/proc-maps-race.c
@@ -416,6 +416,95 @@ static void test_maps_tearing_from_resize(int maps_fd,
 	signal_state(mod_info, TEST_DONE);
 }
 
+static inline void remap_vma(const struct vma_modifier_info *mod_info)
+{
+	/*
+	 * Remap the last page of the next vma into the middle of the vma.
+	 * This splits the current vma and the first and middle parts (the
+	 * parts at lower addresses) become the last vma objserved in the
+	 * first page and the first vma observed in the last page.
+	 */
+	assert(mremap(mod_info->next_addr + page_size * 2, page_size,
+		      page_size, MREMAP_FIXED | MREMAP_MAYMOVE | MREMAP_DONTUNMAP,
+		      mod_info->addr + page_size) != MAP_FAILED);
+}
+
+static inline void patch_vma(const struct vma_modifier_info *mod_info)
+{
+	assert(!mprotect(mod_info->addr + page_size, page_size,
+			 mod_info->prot));
+}
+
+static inline void check_remap_result(struct line_content *mod_last_line,
+				      struct line_content *mod_first_line,
+				      struct line_content *restored_last_line,
+				      struct line_content *restored_first_line)
+{
+	/* Make sure vmas at the boundaries are changing */
+	assert(strcmp(mod_last_line->text, restored_last_line->text) != 0);
+	assert(strcmp(mod_first_line->text, restored_first_line->text) != 0);
+}
+
+static void test_maps_tearing_from_remap(int maps_fd,
+				struct vma_modifier_info *mod_info,
+				struct page_content *page1,
+				struct page_content *page2,
+				struct line_content *last_line,
+				struct line_content *first_line)
+{
+	struct line_content remapped_last_line;
+	struct line_content remapped_first_line;
+	struct line_content restored_last_line;
+	struct line_content restored_first_line;
+
+	wait_for_state(mod_info, SETUP_READY);
+
+	/* re-read the file to avoid using stale data from previous test */
+	read_boundary_lines(maps_fd, page1, page2, last_line, first_line);
+
+	mod_info->vma_modify = remap_vma;
+	mod_info->vma_restore = patch_vma;
+	mod_info->vma_mod_check = check_remap_result;
+
+	capture_mod_pattern(maps_fd, mod_info, page1, page2, last_line, first_line,
+			    &remapped_last_line, &remapped_first_line,
+			    &restored_last_line, &restored_first_line);
+
+	/* Now start concurrent modifications for test_duration_sec */
+	signal_state(mod_info, TEST_READY);
+
+	struct line_content new_last_line;
+	struct line_content new_first_line;
+	struct timespec start_ts, end_ts;
+
+	clock_gettime(CLOCK_MONOTONIC_COARSE, &start_ts);
+	do {
+		read_boundary_lines(maps_fd, page1, page2, &new_last_line, &new_first_line);
+
+		/* Check if we read vmas after remapping it */
+		if (!strcmp(new_last_line.text, remapped_last_line.text)) {
+			/*
+			 * The vmas should be consistent with remap results,
+			 * however if the vma was concurrently restored, it
+			 * can be reported twice (first as split one, then
+			 * as restored one) because we found it as the next vma
+			 * again. In that case new first line will be the same
+			 * as the last restored line.
+			 */
+			assert(!strcmp(new_first_line.text, remapped_first_line.text) ||
+			       !strcmp(new_first_line.text, restored_last_line.text));
+		} else {
+			/* The vmas should be consistent with the original/resored state */
+			assert(!strcmp(new_last_line.text, restored_last_line.text) &&
+			       !strcmp(new_first_line.text, restored_first_line.text));
+		}
+		clock_gettime(CLOCK_MONOTONIC_COARSE, &end_ts);
+	} while (end_ts.tv_sec - start_ts.tv_sec < test_duration_sec);
+
+	/* Signal the modifyer thread to stop and wait until it exits */
+	signal_state(mod_info, TEST_DONE);
+}
+
 int usage(void)
 {
 	fprintf(stderr, "Userland /proc/pid/{s}maps race test cases\n");
@@ -527,6 +616,9 @@ int main(int argc, char **argv)
 	test_maps_tearing_from_resize(maps_fd, mod_info, &page1, &page2,
 				      &last_line, &first_line);
 
+	test_maps_tearing_from_remap(maps_fd, mod_info, &page1, &page2,
+				     &last_line, &first_line);
+
 	stop_vma_modifier(mod_info);
 
 	free(page2.data);
-- 
2.50.0.727.gbf7dc18ff4-goog

