Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189002E3385;
	Thu,  3 Apr 2025 10:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743676698; cv=none; b=TblkngtxzdVA68E4TwfhNICg8WKyfCiy8GIQQxqE4A8qSs5jrO+ZmzFX4wWNEhfbTXxIuZppAeE4oeZJE5ZYNkDCOEjxo/A+vLOQqeEX5oqXJ4Q3P9FA8H2d5sb83dKaD69Mh79WV0MovSO39soHqUX7BzuiDfHW9ZZPhb74lK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743676698; c=relaxed/simple;
	bh=Z72AwzHJ4cbpRqtqDVuCMJ1Ie1ku2WoDMt1mydBBtWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DuVMzfeyEXv5G4sobxIlOkVwWwDyFOwQNoQpXp3pcXNV3vkuHOedBbnS/1lwuM/NoL1bRJtEm0vGVSfawCbjLNAK/h8z0zKE2ufFgCFhkdjLX+qiYFGMBMrzu8dyfjIXZY35x8htlpOVamPmRSUD1csmpATEKSAgjnvbhsILXzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com; spf=pass smtp.mailfrom=pankajraghav.com; dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b=ykqJVM+l; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pankajraghav.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b="ykqJVM+l"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZSyr42sfXz9t0t;
	Thu,  3 Apr 2025 12:38:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pankajraghav.com;
	s=MBO0001; t=1743676692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l+z1/Zyn5HmKuUJTv24M67f5IzWj0CacYuYhfJZ4e+M=;
	b=ykqJVM+liavA+BklyaFz/qTCE1INxJagZrxrDAextxtobXTwLKKngkLlGMBAz+T4t/JMWF
	eY5jTWiUHIz9K6mZD4k79yF7CvFI6N7cW1RZ2Ou1ZMbNnOdonQ3LUjNCela9yEflAA47fx
	Qe69zUPV35avOcmymgZN/LB42qRdeaoWczKpbcppFmH2ZqA2+eIDcqFx1VBHzZZh0QzeXo
	LbL8+LJ/IG7HZcIXb44B7CyOe5cE+g5svb7xO5PzsmBFx44QJRpJmZrVUokR3A3A0Oc2OM
	4WLvFoiOz5Wujag+jlhoAt/8mUKkqoNfJvH9OgZefPFEAppRmnx5FmO7gNaWww==
From: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org,
	willy@infradead.org,
	linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	da.gomez@kernel.org,
	mcgrof@kernel.org,
	gost.dev@samsung.com,
	linux-doc@vger.kernel.org,
	kernel@pankajraghav.com,
	Pankaj Raghav <p.raghav@samsung.com>
Subject: [PATCH] docs: update THP admin guide about non-tmpfs filesystem support
Date: Thu,  3 Apr 2025 12:38:05 +0200
Message-ID: <20250403103805.173761-1-kernel@pankajraghav.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pankaj Raghav <p.raghav@samsung.com>

THP support for non-tmpfs filesystem has been around for some time now.
Update the admin guide to reflect it.

Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
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

base-commit: f0a16f5363325cc8d9382471cdc7b654c53254c9
-- 
2.44.1

