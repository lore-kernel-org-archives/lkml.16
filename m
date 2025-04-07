Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E5D2135B3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 02:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743994501; cv=none; b=tHQfLEhEXfXF3Jr7nTIDQ+fudTH1lkubD5JD+Xuka35Cos7TwHPVz1CiwRhba9iW3zvUhsGjIQ7gXpv09hwMw5rOmd4b42pS5h0yF7I2cGSxkZvcDWpsZ0QdCW4dvxjNYuia24slw9IBCqFOvbk6ehwaV+/hzFGjZQ7gpsjhEZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743994501; c=relaxed/simple;
	bh=fgNOo1RBDGsDwaNmxIhAID/iWNiPamzWQDxl+5zrnkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMRPNpobZfKmmk1MNnc8GAeMKMwkKQzt2CzFvH9hTRjTPv1cd+7sVvANIzPm0VIp/er9ULhCSgZNxOdGBJShzy6/uWQMe9Juu+TQ4IyoHa6csIxRfAact0uElrciilGJ/8NA1/8X94+0S0llBXQ+4HrgofmiSug5DYZssBkDnlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIErUaBJ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIErUaBJ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso7370910a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 19:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743994497; x=1744599297; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bl6aLTFU+MzMGcQGZ+J3WrHMYXUZpVFn3O0zDOI2smo=;
        b=VIErUaBJwGo0NMV3fLWo41kIfZhMjLac7ZBRyCkph1ujEi/+jwUq6m/td6XYzzQ3HD
         nEujiwhlnbIzyuj6uEAMfXGASRWyFb6RS/5J4zfd/v0poYIfjbNt6aL4mtC7WSBa1tBf
         6MqS92H5hzAhiXqeADmPRzeS3UhgVIRcaJqwjJaxob3kUNMO9+BLODjQkWNLlalKYONX
         NxTG4fyb3D4u17XFqwZQPbovjyWKiZAIKtyrCo0jT66AwYlFjU51r7IR6Kpj/+IU4z+9
         s4+1kbtZXE85tEGrBCLibnQ3f82b9FLqzk+K2/jlhPUM23YAk0x6BIwUbiNFfsAaVcdh
         dz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743994497; x=1744599297;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bl6aLTFU+MzMGcQGZ+J3WrHMYXUZpVFn3O0zDOI2smo=;
        b=WNh/tzNEjKx3TKkkZVm3bgrxT+l3SY5Yhl02eU/FnPONeI5ta+Og12Nbj1TZC/PsBj
         qa20B05LGXgxi1A62GUzvhTGAOHpSyikg2f5Sa7NgDs08/01wWWt/xZ1c9XmoWAuiOsX
         A9ysLPMk0+UR6vdAcwQb9pZB9qHKIw/bKTCEXB4VcZymPPI5YIYkg43EzmtNrscBtCT5
         BySBozbe5BfCTnmWGbXDN1E7Fl6u46WY1zS9UxHRuacxZ+Upefaf2fO/YZa/iwzYe++Y
         cjAWAR9HS9mqSLNKXvSNtn2Puq02GX/ynf+K7of+FwXaUYl/V82HDlEOyUq0mXjQLT1D
         eadw==
X-Forwarded-Encrypted: i=1; AJvYcCVki5LdcoSuTjnLGGfQMUnntsEwbJ2atyc411+q53jQu2dw3ocIGDTJCzl36YcSr0HKDzB6w1BpJ5DpgF8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdc+ymMBOzO+aPTRNDsNdvLjvfC24iMloVarbCMiPtWx/XvNAZ
	VsEWBP6GLg2yTgg5jEMMxPpWuqhhmwmPfnVKQnos1GRh6BSyVo4h
X-Gm-Gg: ASbGncukQQliymvhHO8tBMropSNrIxJcc3vEUi8ej9ykfgOq7oxxrMMAVsG7HA1ojKe
	ze2Y4xjiN1RqBTHcE+267o/Ha3vUWYMJbcdNRtmTPBcHizR3/vgNqz+weW4DrigQ6RVwh/UP9Bl
	KpkEPzWrTNW7AQV07aHRn+4Xa7rZ3jTtt7DJuF5Bdi1nm9efqO/nKMf7IIQQVd78NwcO7oTFPLx
	XSc//pkmsjZi75fJxM80IOPJOubxp1aVA//RpGEJv6R3tNuDSTeNbySjremJEwDpJRmTKWlDJsN
	3hFETZwIx5cT/qRzyBWIZFPuK/fXIskLIPAM+6gghd7f
X-Google-Smtp-Source: AGHT+IG6VJPOQELgVQs5gKuf++fq8aYY/Q8dCrFAAzQ/YMedhN7VVD7vW16xy6SI86TkSh8Jg46EjQ==
X-Received: by 2002:a05:6402:280b:b0:5e6:44d9:57f7 with SMTP id 4fb4d7f45d1cf-5f0b3e4732amr8812253a12.26.1743994497443;
        Sun, 06 Apr 2025 19:54:57 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f088084e49sm5881725a12.50.2025.04.06.19.54.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Apr 2025 19:54:56 -0700 (PDT)
Date: Mon, 7 Apr 2025 02:54:56 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] tools/testing/selftests: assert that anon merge
 cases behave as expected
Message-ID: <20250407025455.67nhchndedotn57g@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <cover.1742245056.git.lorenzo.stoakes@oracle.com>
 <e9e016392b6ceb5c58a868439fd7039e31bfda18.1742245056.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9e016392b6ceb5c58a868439fd7039e31bfda18.1742245056.git.lorenzo.stoakes@oracle.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, Mar 17, 2025 at 09:15:05PM +0000, Lorenzo Stoakes wrote:
>Prior to the recently applied commit that permits this merge,
>mprotect()'ing a faulted VMA, adjacent to an unfaulted VMA, such that the
>two share characteristics would fail to merge due to what appear to be
>unintended consequences of commit 965f55dea0e3 ("mmap: avoid merging cloned
>VMAs").
>
>Now we have fixed this bug, assert that we can indeed merge anonymous VMAs
>this way.
>
>Also assert that forked source/target VMAs are equally
>rejected. Previously, all empty target anon merges with one VMA faulted and
>the other unfaulted would be rejected incorrectly, now we ensure that
>unforked merge, but forked do not.
>
>Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>---
> tools/testing/selftests/mm/.gitignore     |   1 +
> tools/testing/selftests/mm/Makefile       |   1 +
> tools/testing/selftests/mm/merge.c        | 454 ++++++++++++++++++++++
> tools/testing/selftests/mm/run_vmtests.sh |   2 +
> 4 files changed, 458 insertions(+)
> create mode 100644 tools/testing/selftests/mm/merge.c
>
>diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
>index c5241b193db8..91db34941a14 100644
>--- a/tools/testing/selftests/mm/.gitignore
>+++ b/tools/testing/selftests/mm/.gitignore
>@@ -58,3 +58,4 @@ hugetlb_dio
> pkey_sighandler_tests_32
> pkey_sighandler_tests_64
> guard-regions
>+merge
>diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
>index 8270895039d1..ad4d6043a60f 100644
>--- a/tools/testing/selftests/mm/Makefile
>+++ b/tools/testing/selftests/mm/Makefile
>@@ -98,6 +98,7 @@ TEST_GEN_FILES += hugetlb_madv_vs_map
> TEST_GEN_FILES += hugetlb_dio
> TEST_GEN_FILES += droppable
> TEST_GEN_FILES += guard-regions
>+TEST_GEN_FILES += merge
> 
> ifneq ($(ARCH),arm64)
> TEST_GEN_FILES += soft-dirty
>diff --git a/tools/testing/selftests/mm/merge.c b/tools/testing/selftests/mm/merge.c
>new file mode 100644
>index 000000000000..9cc61bdbfba8
>--- /dev/null
>+++ b/tools/testing/selftests/mm/merge.c
>@@ -0,0 +1,454 @@
>+// SPDX-License-Identifier: GPL-2.0-or-later
>+
>+#define _GNU_SOURCE
>+#include "../kselftest_harness.h"
>+#include <stdio.h>
>+#include <stdlib.h>
>+#include <unistd.h>
>+#include <sys/mman.h>
>+#include <sys/wait.h>
>+#include "vm_util.h"
>+
>+FIXTURE(merge)
>+{
>+	unsigned int page_size;
>+	char *carveout;
>+	struct procmap_fd procmap;
>+};
>+
>+FIXTURE_SETUP(merge)
>+{
>+	self->page_size = psize();
>+	/* Carve out PROT_NONE region to map over. */
>+	self->carveout = mmap(NULL, 12 * self->page_size, PROT_NONE,
>+			      MAP_ANON | MAP_PRIVATE, -1, 0);
>+	ASSERT_NE(self->carveout, MAP_FAILED);
>+	/* Setup PROCMAP_QUERY interface. */
>+	ASSERT_EQ(open_self_procmap(&self->procmap), 0);
>+}
>+
>+FIXTURE_TEARDOWN(merge)
>+{
>+	ASSERT_EQ(munmap(self->carveout, 12 * self->page_size), 0);
>+	ASSERT_EQ(close_procmap(&self->procmap), 0);
>+}
>+
>+TEST_F(merge, mprotect_unfaulted_left)
>+{
>+	unsigned int page_size = self->page_size;
>+	char *carveout = self->carveout;
>+	struct procmap_fd *procmap = &self->procmap;
>+	char *ptr;
>+
>+	/*
>+	 * Map 10 pages of R/W memory within. MAP_NORESERVE so we don't hit
>+	 * merge failure due to lack of VM_ACCOUNT flag by mistake.
>+	 *
>+	 * |-----------------------|
>+	 * |       unfaulted       |
>+	 * |-----------------------|
>+	 */
>+	ptr = mmap(&carveout[page_size], 10 * page_size, PROT_READ | PROT_WRITE,
>+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
>+	ASSERT_NE(ptr, MAP_FAILED);
>+	/*
>+	 * Now make the first 5 pages read-only, splitting the VMA:
>+	 *
>+	 *      RO          RW
>+	 * |-----------|-----------|
>+	 * | unfaulted | unfaulted |
>+	 * |-----------|-----------|
>+	 */
>+	ASSERT_EQ(mprotect(ptr, 5 * page_size, PROT_READ), 0);
>+	/*
>+	 * Fault in the first of the last 5 pages so it gets an anon_vma and
>+	 * thus the whole VMA becomes 'faulted':
>+	 *
>+	 *      RO          RW
>+	 * |-----------|-----------|
>+	 * | unfaulted |  faulted  |
>+	 * |-----------|-----------|
>+	 */
>+	ptr[5 * page_size] = 'x';
>+	/*
>+	 * Now mprotect() the RW region read-only, we should merge (though for
>+	 * ~15 years we did not! :):
>+	 *
>+	 *             RO
>+	 * |-----------------------|
>+	 * |        faulted        |
>+	 * |-----------------------|
>+	 */
>+	ASSERT_EQ(mprotect(&ptr[5 * page_size], 5 * page_size, PROT_READ), 0);
>+
>+	/* Assert that the merge succeeded using PROCMAP_QUERY. */
>+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
>+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
>+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
>+}
>+
>+TEST_F(merge, mprotect_unfaulted_right)
>+{
>+	unsigned int page_size = self->page_size;
>+	char *carveout = self->carveout;
>+	struct procmap_fd *procmap = &self->procmap;
>+	char *ptr;
>+
>+	/*
>+	 * |-----------------------|
>+	 * |       unfaulted       |
>+	 * |-----------------------|
>+	 */
>+	ptr = mmap(&carveout[page_size], 10 * page_size, PROT_READ | PROT_WRITE,
>+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
>+	ASSERT_NE(ptr, MAP_FAILED);
>+	/*
>+	 * Now make the last 5 pages read-only, splitting the VMA:
>+	 *
>+	 *      RW          RO
>+	 * |-----------|-----------|
>+	 * | unfaulted | unfaulted |
>+	 * |-----------|-----------|
>+	 */
>+	ASSERT_EQ(mprotect(&ptr[5 * page_size], 5 * page_size, PROT_READ), 0);
>+	/*
>+	 * Fault in the first of the first 5 pages so it gets an anon_vma and
>+	 * thus the whole VMA becomes 'faulted':
>+	 *
>+	 *      RW          RO
>+	 * |-----------|-----------|
>+	 * |  faulted  | unfaulted |
>+	 * |-----------|-----------|
>+	 */
>+	ptr[0] = 'x';
>+	/*
>+	 * Now mprotect() the RW region read-only, we should merge:
>+	 *
>+	 *             RO
>+	 * |-----------------------|
>+	 * |        faulted        |
>+	 * |-----------------------|
>+	 */
>+	ASSERT_EQ(mprotect(ptr, 5 * page_size, PROT_READ), 0);
>+
>+	/* Assert that the merge succeeded using PROCMAP_QUERY. */
>+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
>+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
>+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
>+}
>+
>+TEST_F(merge, mprotect_unfaulted_both)
>+{
>+	unsigned int page_size = self->page_size;
>+	char *carveout = self->carveout;
>+	struct procmap_fd *procmap = &self->procmap;
>+	char *ptr;
>+
>+	/*
>+	 * |-----------------------|
>+	 * |       unfaulted       |
>+	 * |-----------------------|
>+	 */
>+	ptr = mmap(&carveout[2 * page_size], 9 * page_size, PROT_READ | PROT_WRITE,
>+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
>+	ASSERT_NE(ptr, MAP_FAILED);
>+	/*
>+	 * Now make the first and last 3 pages read-only, splitting the VMA:
>+	 *
>+	 *      RO          RW          RO
>+	 * |-----------|-----------|-----------|
>+	 * | unfaulted | unfaulted | unfaulted |
>+	 * |-----------|-----------|-----------|
>+	 */
>+	ASSERT_EQ(mprotect(ptr, 3 * page_size, PROT_READ), 0);
>+	ASSERT_EQ(mprotect(&ptr[6 * page_size], 3 * page_size, PROT_READ), 0);
>+	/*
>+	 * Fault in the first of the middle 3 pages so it gets an anon_vma and
>+	 * thus the whole VMA becomes 'faulted':
>+	 *
>+	 *      RO          RW          RO
>+	 * |-----------|-----------|-----------|
>+	 * | unfaulted |  faulted  | unfaulted |
>+	 * |-----------|-----------|-----------|
>+	 */
>+	ptr[3 * page_size] = 'x';
>+	/*
>+	 * Now mprotect() the RW region read-only, we should merge:
>+	 *
>+	 *             RO
>+	 * |-----------------------|
>+	 * |        faulted        |
>+	 * |-----------------------|
>+	 */
>+	ASSERT_EQ(mprotect(&ptr[3 * page_size], 3 * page_size, PROT_READ), 0);
>+
>+	/* Assert that the merge succeeded using PROCMAP_QUERY. */
>+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
>+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
>+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 9 * page_size);
>+}
>+
>+TEST_F(merge, mprotect_faulted_left_unfaulted_right)
>+{
>+	unsigned int page_size = self->page_size;
>+	char *carveout = self->carveout;
>+	struct procmap_fd *procmap = &self->procmap;
>+	char *ptr;
>+
>+	/*
>+	 * |-----------------------|
>+	 * |       unfaulted       |
>+	 * |-----------------------|
>+	 */
>+	ptr = mmap(&carveout[2 * page_size], 9 * page_size, PROT_READ | PROT_WRITE,
>+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
>+	ASSERT_NE(ptr, MAP_FAILED);
>+	/*
>+	 * Now make the last 3 pages read-only, splitting the VMA:
>+	 *
>+	 *             RW               RO
>+	 * |-----------------------|-----------|
>+	 * |       unfaulted       | unfaulted |
>+	 * |-----------------------|-----------|
>+	 */
>+	ASSERT_EQ(mprotect(&ptr[6 * page_size], 3 * page_size, PROT_READ), 0);
>+	/*
>+	 * Fault in the first of the first 6 pages so it gets an anon_vma and
>+	 * thus the whole VMA becomes 'faulted':
>+	 *
>+	 *             RW               RO
>+	 * |-----------------------|-----------|
>+	 * |       unfaulted       | unfaulted |
                   ^^^

According to your previous comment convention, the comment here describe the
result after ptr[0] = 'x'.

faulted is the correct description here?

>+	 * |-----------------------|-----------|
>+	 */
>+	ptr[0] = 'x';
>+	/*
>+	 * Now make the first 3 pages read-only, splitting the VMA:
>+	 *
>+	 *      RO          RW          RO
>+	 * |-----------|-----------|-----------|
>+	 * |  faulted  |  faulted  | unfaulted |
>+	 * |-----------|-----------|-----------|
>+	 */
>+	ASSERT_EQ(mprotect(ptr, 3 * page_size, PROT_READ), 0);
>+	/*
>+	 * Now mprotect() the RW region read-only, we should merge:
>+	 *
>+	 *             RO
>+	 * |-----------------------|
>+	 * |        faulted        |
>+	 * |-----------------------|
>+	 */
>+	ASSERT_EQ(mprotect(&ptr[3 * page_size], 3 * page_size, PROT_READ), 0);
>+
>+	/* Assert that the merge succeeded using PROCMAP_QUERY. */
>+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
>+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
>+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 9 * page_size);
>+}
>+
>+TEST_F(merge, mprotect_unfaulted_left_faulted_right)
>+{
>+	unsigned int page_size = self->page_size;
>+	char *carveout = self->carveout;
>+	struct procmap_fd *procmap = &self->procmap;
>+	char *ptr;
>+
>+	/*
>+	 * |-----------------------|
>+	 * |       unfaulted       |
>+	 * |-----------------------|
>+	 */
>+	ptr = mmap(&carveout[2 * page_size], 9 * page_size, PROT_READ | PROT_WRITE,
>+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
>+	ASSERT_NE(ptr, MAP_FAILED);
>+	/*
>+	 * Now make the first 3 pages read-only, splitting the VMA:
>+	 *
>+	 *      RO                RW
>+	 * |-----------|-----------------------|
>+	 * | unfaulted |       unfaulted       |
>+	 * |-----------|-----------------------|
>+	 */
>+	ASSERT_EQ(mprotect(ptr, 3 * page_size, PROT_READ), 0);
>+	/*
>+	 * FAult in the first of the last 6 pages so it gets an anon_vma and
            ^

s/A/a/

>+	 * thus the whole VMA becomes 'faulted':
>+	 *
>+	 *      RO                RW
>+	 * |-----------|-----------------------|
>+	 * | unfaulted |        faulted        |
>+	 * |-----------|-----------------------|
>+	 */
>+	ptr[3 * page_size] = 'x';
>+	/*
>+	 * Now make the last 3 pages read-only, splitting the VMA:
>+	 *
>+	 *      RO          RW          RO
>+	 * |-----------|-----------|-----------|
>+	 * | unfaulted |  faulted  |  faulted  |
>+	 * |-----------|-----------|-----------|
>+	 */
>+	ASSERT_EQ(mprotect(&ptr[6 * page_size], 3 * page_size, PROT_READ), 0);
>+	/*
>+	 * Now mprotect() the RW region read-only, we should merge:
>+	 *
>+	 *             RO
>+	 * |-----------------------|
>+	 * |        faulted        |
>+	 * |-----------------------|
>+	 */
>+	ASSERT_EQ(mprotect(&ptr[3 * page_size], 3 * page_size, PROT_READ), 0);
>+
>+	/* Assert that the merge succeeded using PROCMAP_QUERY. */
>+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
>+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
>+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 9 * page_size);
>+}
>+
>+TEST_F(merge, forked_target_vma)
>+{
>+	unsigned int page_size = self->page_size;
>+	char *carveout = self->carveout;
>+	struct procmap_fd *procmap = &self->procmap;
>+	pid_t pid;
>+	char *ptr, *ptr2;
>+	int i;
>+
>+	/*
>+	 * |-----------|
>+	 * | unfaulted |
>+	 * |-----------|
>+	 */
>+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
>+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
>+	ASSERT_NE(ptr, MAP_FAILED);
>+
>+	/*
>+	 * Fault in process.
>+	 *
>+	 * |-----------|
>+	 * |  faulted  |
>+	 * |-----------|
>+	 */
>+	ptr[0] = 'x';
>+
>+	pid = fork();
>+	ASSERT_NE(pid, -1);
>+
>+	if (pid != 0) {
>+		wait(NULL);
>+		return;
>+	}
>+
>+	/* Child process below: */
>+
>+	/* Reopen for child. */
>+	ASSERT_EQ(close_procmap(&self->procmap), 0);
>+	ASSERT_EQ(open_self_procmap(&self->procmap), 0);
>+
>+	/* unCOWing everything does not cause the AVC to go away. */
           ^^^

Before ptr[i] = 'x', we have unCOWed pages in vma. What we are doing here is
COWing, right?

>+	for (i = 0; i < 5 * page_size; i += page_size)
>+		ptr[i] = 'x';
>+
>+	/*
>+	 * Map in adjacent VMA in child.
>+	 *
>+	 *     forked
>+	 * |-----------|-----------|
>+	 * |  faulted  | unfaulted |
>+	 * |-----------|-----------|
>+	 *      ptr         ptr2
>+	 */
>+	ptr2 = mmap(&ptr[5 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
>+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
>+	ASSERT_NE(ptr2, MAP_FAILED);
>+
>+	/* Make sure not merged. */
>+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
>+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
>+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 5 * page_size);
>+}
>+
>+TEST_F(merge, forked_source_vma)
>+{
>+	unsigned int page_size = self->page_size;
>+	char *carveout = self->carveout;
>+	struct procmap_fd *procmap = &self->procmap;
>+	pid_t pid;
>+	char *ptr, *ptr2;
>+	int i;
>+
>+	/*
>+	 * |............|-----------|
>+	 * | <unmapped> | unfaulted |
>+	 * |............|-----------|

I am not sure "unmapped" is correct here. The range has already been mapped by
FIXTURE_SETUP(merge).

>+	 */
>+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
>+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
>+	ASSERT_NE(ptr, MAP_FAILED);
>+
>+	/*
>+	 * Fault in process.
>+	 *
>+	 * |............||-----------|
>+	 * | <unmapped> ||  faulted  |
>+	 * |............||-----------|
                         ^

Extra line here?

>+	 */
>+	ptr[0] = 'x';
>+
>+	pid = fork();
>+	ASSERT_NE(pid, -1);
>+
>+	if (pid != 0) {
>+		wait(NULL);
>+		return;
>+	}
>+
>+	/* Child process below: */
>+
>+	/* Reopen for child. */
>+	ASSERT_EQ(close_procmap(&self->procmap), 0);
>+	ASSERT_EQ(open_self_procmap(&self->procmap), 0);
>+
>+	/* unCOWing everything does not cause the AVC to go away. */

Same as above.

>+	for (i = 0; i < 5 * page_size; i += page_size)
>+		ptr[i] = 'x';
>+
>+	/*
>+	 * Map in adjacent VMA in child, ptr2 before ptr, but incompatible.
>+	 *
>+	 *      RWX      forked RW
>+	 * |-----------|-----------|
>+	 * | unfaulted |  faulted  |
>+	 * |-----------|-----------|
>+	 *      ptr2        ptr
>+	 */
>+	ptr2 = mmap(&carveout[6 * page_size], 5 * page_size, PROT_READ | PROT_WRITE | PROT_EXEC,
>+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
>+	ASSERT_NE(ptr2, MAP_FAILED);
>+

I think pt2 is after ptr. Do I miss something?

>+
>+	/* Make sure not merged. */
>+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
>+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
>+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 5 * page_size);
>+
>+	/*
>+	 * Now mprotect forked region to RWX so it becomes the source for the
>+	 * merge to unfaulted region:
>+	 *
>+	 *      RWX      forked RWX
>+	 * |-----------|-----------|
>+	 * | unfaulted |  faulted  |
>+	 * |-----------|-----------|
>+	 *      ptr2        ptr
>+	 */
>+	ASSERT_EQ(mprotect(ptr, 5 * page_size, PROT_READ | PROT_WRITE | PROT_EXEC), 0);
>+	/* Again, make sure not merged. */
>+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
>+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
>+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 5 * page_size);
>+}
>+
>+TEST_HARNESS_MAIN
>diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
>index 9aff33b10999..0b2f8bb91433 100755
>--- a/tools/testing/selftests/mm/run_vmtests.sh
>+++ b/tools/testing/selftests/mm/run_vmtests.sh
>@@ -421,6 +421,8 @@ CATEGORY="madv_guard" run_test ./guard-regions
> # MADV_POPULATE_READ and MADV_POPULATE_WRITE tests
> CATEGORY="madv_populate" run_test ./madv_populate
> 
>+CATEGORY="vma_merge" run_test ./merge
>+

./run_vmtests.sh -h would show a list of categories. 

How about add the new category "vma_merge" into the list.

> if [ -x ./memfd_secret ]
> then
> (echo 0 > /proc/sys/kernel/yama/ptrace_scope 2>&1) | tap_prefix
>-- 
>2.48.1
>

-- 
Wei Yang
Help you, Help me
