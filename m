Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19D72E7631
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793650; cv=none; b=nlYp6LFD3I9qQceD8gtEFsTbClI5ZwOUlUonh+SAAX9c7aCnQG7WiosXXn/aIHdx+bG3IuNU5WdmUkfdNGBHnVqoJ1pDQdKnj23eA3Y1Kz+cQpn955cusMiJ8zFEGIkF2iUW32GeruOCuZDLgfq9m6/fwMhG9iWhyU6Wc1lgp80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793650; c=relaxed/simple;
	bh=6N56cO+mEI93aCD929OWXgdVDQmRt6u/f2iRrSkiXBY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UNS51So29ewngAhrHgBC+GGO3r9cidTWSOS4mCJfVsYOHXw3MKD5GHR8nvIpMN+XRRxmZFjG1OIcuM3u/TrFMHmScfS4dU5dmUJ68ZMo3adHoW5dFk+waZMj21fJUYGoiPKDiu0P4juuD9Vt1gPSx9kwdyT3f8Vomwo+zMZBbaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tk6JcZJL; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tk6JcZJL"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-748f13ef248so4366778b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750793647; x=1751398447; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UC2aFr+2hBpo4c8OQj6ulNMqnFjS9I9wfu23t0p6gWo=;
        b=tk6JcZJLly3FgBTmdsemuIUDIl7dxcOpbtvOW6o0b+rh/CpFrYJXAwCvXoFhntDkVV
         74ALfeTpNGYWI1BLqtaD9nRF/9nohrsD89N0AgRpBiShYoFZeDkPuXU+kEC7ynAcNKIz
         D78BjZ2j53bgsOBVB9gRuj9LAHW1/gUaNkf+Yo2Q1EyRNfYL2Fc5swKiFlnUjazcWGi1
         /aBke/UaLrt/KaODq9OnUjEmdt38MiahV403+BJbSqO4cuQbgBXxrakwpaWxiAPToRvK
         2VanKTly/kRzdvWjdcsCSER9C07YUac6DJsCpQU1wl1QweDO5MGkqfdPNMfU8g6yX6KL
         nzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793647; x=1751398447;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UC2aFr+2hBpo4c8OQj6ulNMqnFjS9I9wfu23t0p6gWo=;
        b=qk4suVcV4q3eHYlNh2xgkDmolv2CJh/rB2+7apXK1fWZB8UAzO32XnvB1cyFaV2tF4
         bNFDWPWkfsZJJkgfyCQfPLKz+ZbM8yrZkGWstroGy+tBmW6c2tJ9ElufFuv5MXfTqYSY
         /LO8XVJ2nBJPWZG8SvIpETy/r2/3wPpPbFI4wb8Gxj+Jx8FpK4qW0NxGA1+V09hvVFdP
         IfeDTgZyjmjGqlGhUfk5tvzWWS4P0+SGmD/AOh/UFuACfNhmgt3hhQ+jIh78Uud/oiaI
         wi7uZsjdlQnTnuF6LEseks2oHnhgrZ9zc2g+ggAypXheCBDNtPEgoDz60h8QYzQ/+d+5
         7bJA==
X-Forwarded-Encrypted: i=1; AJvYcCXJfPK1KfxWtZF28BWAHruqY8XH4sBw89CHZ0rSpjZnMyxGRnZmiedoWVZwS+O9SzurWJA56xktsxUa7lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YztyTWGvC5CnP7Op6pcBSv6TXfk8+vGvKn1o+EqdxoEZKpSEN7Q
	BhL092bRVKNldmBbKfHckPPDt/XH989Y5bvEE3yO1fOTm8J7fCBHYw4lTSYxjtLa5I681v8oeMh
	Z1uttUA==
X-Google-Smtp-Source: AGHT+IGXFGZq1eG2J9AB8OK4tRQIFjL7wLANvEFPeXTMgxcyIvcd791KpwM8NoFdIHzomkbPKUWUDTzIDUk=
X-Received: from pfwy15.prod.google.com ([2002:a05:6a00:1c8f:b0:739:8cd6:c16c])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:124f:b0:746:1e35:3307
 with SMTP id d2e1a72fcca58-74ad44fa9e5mr508606b3a.14.1750793646830; Tue, 24
 Jun 2025 12:34:06 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:33:54 -0700
In-Reply-To: <20250624193359.3865351-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250624193359.3865351-1-surenb@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250624193359.3865351-3-surenb@google.com>
Subject: [PATCH v5 2/7] selftests/proc: extend /proc/pid/maps tearing test to
 include vma resizing
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

Test that /proc/pid/maps does not report unexpected holes in the address
space when a vma at the edge of the page is being concurrently remapped.
This remapping results in the vma shrinking and expanding from  under the
reader. We should always see either shrunk or expanded (original) version
of the vma.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 tools/testing/selftests/proc/proc-pid-vm.c | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/tools/testing/selftests/proc/proc-pid-vm.c b/tools/testing/selftests/proc/proc-pid-vm.c
index 6e3f06376a1f..39842e4ec45f 100644
--- a/tools/testing/selftests/proc/proc-pid-vm.c
+++ b/tools/testing/selftests/proc/proc-pid-vm.c
@@ -583,6 +583,86 @@ static void test_maps_tearing_from_split(int maps_fd,
 	signal_state(mod_info, TEST_DONE);
 }
 
+static inline void shrink_vma(const struct vma_modifier_info *mod_info)
+{
+	assert(mremap(mod_info->addr, page_size * 3, page_size, 0) != MAP_FAILED);
+}
+
+static inline void expand_vma(const struct vma_modifier_info *mod_info)
+{
+	assert(mremap(mod_info->addr, page_size, page_size * 3, 0) != MAP_FAILED);
+}
+
+static inline void check_shrink_result(struct line_content *mod_last_line,
+				       struct line_content *mod_first_line,
+				       struct line_content *restored_last_line,
+				       struct line_content *restored_first_line)
+{
+	/* Make sure only the last vma of the first page is changing */
+	assert(strcmp(mod_last_line->text, restored_last_line->text) != 0);
+	assert(strcmp(mod_first_line->text, restored_first_line->text) == 0);
+}
+
+static void test_maps_tearing_from_resize(int maps_fd,
+					  struct vma_modifier_info *mod_info,
+					  struct page_content *page1,
+					  struct page_content *page2,
+					  struct line_content *last_line,
+					  struct line_content *first_line)
+{
+	struct line_content shrunk_last_line;
+	struct line_content shrunk_first_line;
+	struct line_content restored_last_line;
+	struct line_content restored_first_line;
+
+	wait_for_state(mod_info, SETUP_READY);
+
+	/* re-read the file to avoid using stale data from previous test */
+	read_boundary_lines(maps_fd, page1, page2, last_line, first_line);
+
+	mod_info->vma_modify = shrink_vma;
+	mod_info->vma_restore = expand_vma;
+	mod_info->vma_mod_check = check_shrink_result;
+
+	capture_mod_pattern(maps_fd, mod_info, page1, page2, last_line, first_line,
+			    &shrunk_last_line, &shrunk_first_line,
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
+		/* Check if we read vmas after shrinking it */
+		if (!strcmp(new_last_line.text, shrunk_last_line.text)) {
+			/*
+			 * The vmas should be consistent with shrunk results,
+			 * however if the vma was concurrently restored, it
+			 * can be reported twice (first as shrunk one, then
+			 * as restored one) because we found it as the next vma
+			 * again. In that case new first line will be the same
+			 * as the last restored line.
+			 */
+			assert(!strcmp(new_first_line.text, shrunk_first_line.text) ||
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
 static int test_maps_tearing(void)
 {
 	struct vma_modifier_info *mod_info;
@@ -674,6 +754,9 @@ static int test_maps_tearing(void)
 	test_maps_tearing_from_split(maps_fd, mod_info, &page1, &page2,
 				     &last_line, &first_line);
 
+	test_maps_tearing_from_resize(maps_fd, mod_info, &page1, &page2,
+				      &last_line, &first_line);
+
 	stop_vma_modifier(mod_info);
 
 	free(page2.data);
-- 
2.50.0.714.g196bf9f422-goog

