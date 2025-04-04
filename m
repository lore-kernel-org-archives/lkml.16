Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF2D2E62C7;
	Fri,  4 Apr 2025 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743760933; cv=none; b=g0pGHgUAtD/lQ+n0XYeO0t0lG7A6SQIW/YEhr/6lTLCKd8JjwMxWMvpHjTmO6GtmDR2rcNpD7XF4/IOdQNqmIfegPBh72XrWfcWESd8d3Tbbu0iBs8xmsfBSdiitspoaMz2fsiPCwHMSixu5AG2wo3BcV7FUCKBVXA0HuXyKe80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743760933; c=relaxed/simple;
	bh=ZxjGpseWbaz2N8lz51IwRNiitLP2Gt3I+sldA++7XfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h03WltkcliKc6YiYoa6Rko0xa74pNQQfwJ3n2OOu88/DugVX4Qg33cAsglrPSz/cLmh7m65K9AVDUjJuVMNihS+7rc4AzZoQKRsJDaaWY70hfL0nH4hXsVphg124sgjMb9Ddqn5KKjZBApfUO1WDQCpYCg9oRm/8JqAsidaNcM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com; spf=pass smtp.mailfrom=pankajraghav.com; dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b=akGA+gGj; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pankajraghav.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b="akGA+gGj"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZTYzy4K2Tz9syv;
	Fri,  4 Apr 2025 12:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pankajraghav.com;
	s=MBO0001; t=1743760926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gVpYu65d0kR5ehI3vJ4JKoscmExvd9Tzl/16BBwPR5I=;
	b=akGA+gGjrYpUfm74/YuZ+Su4tLoG/4vg34vI2tSE2z+6QsUpoKUQLztalYhSXm8SlbG1r8
	kjtMKiVbKb7E6gIEQi1kU4GcjNTwGiuxzb1CVmYj43uyhcrIdObN5aLJdx04BCiLhy5Qmy
	704yr1itTv9cgSJNyM5B53t7AKysO+f9tFyYHf05An0EF4AZsBD3wZwlEOxJM+FfmAz7GP
	PqP+mEOBr52yI/4C9aH2W9CY0p5eNyCIQctD0AowPYgATx99s/FTDEwfP3bHE946SvhX1K
	CXHxw/VpNXgiudhVQTIRd3yT54NjOT1YLfrZgKDvKDX79OMkf0Xg5XPq7zIzPQ==
From: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	willy@infradead.org,
	David Hildenbrand <david@redhat.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	da.gomez@kernel.org,
	mcgrof@kernel.org,
	gost.dev@samsung.com,
	linux-doc@vger.kernel.org,
	kernel@pankajraghav.com,
	Pankaj Raghav <p.raghav@samsung.com>
Subject: [PATCH v2 1/2] docs: update THP admin guide about non-tmpfs filesystem support
Date: Fri,  4 Apr 2025 12:01:58 +0200
Message-ID: <20250404100159.27086-2-kernel@pankajraghav.com>
In-Reply-To: <20250404100159.27086-1-kernel@pankajraghav.com>
References: <20250404100159.27086-1-kernel@pankajraghav.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4ZTYzy4K2Tz9syv

From: Pankaj Raghav <p.raghav@samsung.com>

THP support for non-tmpfs filesystem has been around for some time now.
Update the admin guide to reflect it.

Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/admin-guide/mm/transhuge.rst | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index dff8d5985f0f..01b7ce90d693 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -12,8 +12,8 @@ using huge pages for the backing of virtual memory with huge pages
 that supports the automatic promotion and demotion of page sizes and
 without the shortcomings of hugetlbfs.
 
-Currently THP only works for anonymous memory mappings and tmpfs/shmem.
-But in the future it can expand to other filesystems.
+Currently, THP only works for anonymous memory mappings, tmpfs/shmem and
+filesystems that support large folios.
 
 .. note::
    in the examples below we presume that the basic page size is 4K and
@@ -463,6 +463,10 @@ fields for each mapping. (Note that AnonHugePages only applies to traditional
 PMD-sized THP for historical reasons and should have been called
 AnonHugePmdMapped).
 
+The number of PMD-sized transparent huge pages currently used by
+filesystem data (page cache) is available by reading the FileHugePages field
+in ``/proc/meminfo``.
+
 The number of file transparent huge pages mapped to userspace is available
 by reading ShmemPmdMapped and ShmemHugePages fields in ``/proc/meminfo``.
 To identify what applications are mapping file transparent huge pages, it
-- 
2.47.2

