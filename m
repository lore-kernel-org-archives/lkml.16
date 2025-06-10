Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68412286D6E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547324; cv=none; b=t3oH9vzO3DPgn0q58AaW95Nh6cF+abD605sUWJvIgYD7oE8ocUXmAut625713dsYC1462dsRx8LS5429HIzFwCoqtTjJ2qrjLs5uUbhk4jJ5VlHS34+ytPYmz1F9LBgTBX3UTfGhmlKyxSQabnaYuGjO5smMw7yp3KAKVisu6Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547324; c=relaxed/simple;
	bh=YGXBP9lwMZfji91RKvnUA24jkXgM6whNm6o4hq7TUoM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GkHpiVZtK/0FNoIEh8m7un0pObFLeJnVCVzjcTVARL+12eVYor+QO/3ptaj1HAkfAx6Z1OdVgXR5/Izyt/vZ2RHHssvw+eJUjIdyiZTdViJaaFGfMJeVoYUadTWvMn4GWCXz6poM1IEgGNXpy3tTPs/nOTw0ubkHMfcJN6sU8KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=svACTFx0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="svACTFx0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C35C4CEEF;
	Tue, 10 Jun 2025 09:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749547323;
	bh=YGXBP9lwMZfji91RKvnUA24jkXgM6whNm6o4hq7TUoM=;
	h=From:To:Cc:Subject:Date:From;
	b=svACTFx09ibq9oXJmJ5KtYYuSNq+csVKSuSUFl0u+XBinwGs078V0humsqDKKCwEX
	 FjWoMA/LrI51XhkQ9JNaocFw3mfRzWRJAZeJy32EWwV4D1vcQ8pV1J92cCq5o5z8ta
	 XFIOJuib7imHaaxDV6RjcHX1yYVfePRuf0M1PJueMiFN3oiJD8dWJ4rBb/W5JEAmls
	 KpkMp2vWAY43Yn4RIRmBlGlaDfLwRFpD6b+FJQv8KCNGIoQYqI8up0qne7yaEiZBVC
	 m5KCHidQ7h07//TeBMRQYOTL/3Nr7bHAfAf91sXjVaJkDu8679kn6gOqV8fKrWJRLu
	 zHjDRTJY05IVA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] lib/test_hmm: reduce stack usage
Date: Tue, 10 Jun 2025 11:21:50 +0200
Message-Id: <20250610092159.2639515-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The various test ioctl handlers use arrays of 64 integers that add up to 1KiB
of stack data, which in turn leads to exceeding the warning limit in some
configurations:

lib/test_hmm.c:935:12: error: stack frame size (1408) exceeds limit (1280) in 'dmirror_migrate_to_device' [-Werror,-Wframe-larger-than]

Use half the size for these arrays, in order to stay under the warning limits.
The code can already deal with arbitrary lengths, but this may be a little less
efficient.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 lib/test_hmm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 5b144bc5c4ec..761725bc713c 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -330,7 +330,7 @@ static int dmirror_fault(struct dmirror *dmirror, unsigned long start,
 {
 	struct mm_struct *mm = dmirror->notifier.mm;
 	unsigned long addr;
-	unsigned long pfns[64];
+	unsigned long pfns[32];
 	struct hmm_range range = {
 		.notifier = &dmirror->notifier,
 		.hmm_pfns = pfns,
@@ -879,8 +879,8 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[64] = { 0 };
-	unsigned long dst_pfns[64] = { 0 };
+	unsigned long src_pfns[32] = { 0 };
+	unsigned long dst_pfns[32] = { 0 };
 	struct migrate_vma args = { 0 };
 	unsigned long next;
 	int ret;
@@ -939,8 +939,8 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[64] = { 0 };
-	unsigned long dst_pfns[64] = { 0 };
+	unsigned long src_pfns[32] = { 0 };
+	unsigned long dst_pfns[32] = { 0 };
 	struct dmirror_bounce bounce;
 	struct migrate_vma args = { 0 };
 	unsigned long next;
@@ -1144,8 +1144,8 @@ static int dmirror_snapshot(struct dmirror *dmirror,
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	unsigned long addr;
 	unsigned long next;
-	unsigned long pfns[64];
-	unsigned char perm[64];
+	unsigned long pfns[32];
+	unsigned char perm[32];
 	char __user *uptr;
 	struct hmm_range range = {
 		.hmm_pfns = pfns,
-- 
2.39.5

