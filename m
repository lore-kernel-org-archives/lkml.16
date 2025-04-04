Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCCB28E8;
	Fri,  4 Apr 2025 14:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743775628; cv=none; b=L4+7w7FPEgJubuh/QiVetnnVAyOHLQgDppFSoZVqGFnlLXlsSykoWKUwt3cGW97fyJ9encdZPncSyY74K9V0g2pcMXctt0cb0iMRYm2ylWn8u/PEfMDgFcqCkTMIoSGyxFR+V+/gIMaTCot5kA9nvHW2aWGK6ZgzC+ZujlRCO0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743775628; c=relaxed/simple;
	bh=h5We3wwreBm5Qak5TXwz0wc70IIQzs51jy6CwBitbAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QX+2IAkWQWch6eFsNBmGZoTzyEE09tyehrkY3/eRabfpWm6yBCAEKxqbM1T3zCUrfa9daDLx2R4bG5Ykio/NsNMZVlS3f3HqQvg9TFNPt+VRfJt6TYjpplPdBXcyLHvUG/VfgzT/X/6YzyhY6SCuWL/84tcw33qV1dpAgZ8VHlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com; spf=pass smtp.mailfrom=pankajraghav.com; dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b=whQHZy5T; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pankajraghav.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b="whQHZy5T"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZTgQZ6fzfz9t1V;
	Fri,  4 Apr 2025 16:07:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pankajraghav.com;
	s=MBO0001; t=1743775623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d3LlMKgq7dBlVlNItWKVgpXkIcgbMa8xNdNgsyJKxAM=;
	b=whQHZy5TryGkrcao/56NMXr9BSIDzrhhw/CJjRYFZKIFT51nZ+xw7DbYoi3dYCEEKkQy1v
	tIUJhIBcIRC0Cf10W45O5/taj9HdgHqhTMb3147cdgoc8iY00DVc3SW9GkEd0zBGG0PeTK
	clizK9FRHiA61i/LDYEAnYKY/r5A/g1F7CRSnp8n59lKblgM30YB89ZkKI3LlbjPk/BXhf
	kFl0yJckd3fAMJsWI8sQVNhQbvXIz2ayoij9HYW1q45eqJXSAUZJVjxGhWIsGZqsFrjPsZ
	+GtzIsmm4564YOoMMqXxQwRwIyyvZqb3YfUV0fGnMNHlUQjt36Wly3Bh/Hegag==
From: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org,
	willy@infradead.org,
	linux-mm@kvack.org,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	da.gomez@kernel.org,
	mcgrof@kernel.org,
	gost.dev@samsung.com,
	linux-doc@vger.kernel.org,
	kernel@pankajraghav.com,
	Pankaj Raghav <p.raghav@samsung.com>
Subject: [PATCH v3] docs: update THP admin guide about non-tmpfs filesystem support
Date: Fri,  4 Apr 2025 16:06:57 +0200
Message-ID: <20250404140657.29285-1-kernel@pankajraghav.com>
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

While we are at it, move FilePmdMapped to previous paragraph for clarity,
and clarify ShmemPmdMapped & ShmemHugePage.

Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
Acked-by: David Hildenbrand <david@redhat.com>
---

Changes since v2:
- Address comment from Bagas Sanjaya
- Squash commits and Ack from David

 Documentation/admin-guide/mm/transhuge.rst | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index dff8d5985f0f..f8aae64e38d0 100644
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
@@ -463,11 +463,19 @@ fields for each mapping. (Note that AnonHugePages only applies to traditional
 PMD-sized THP for historical reasons and should have been called
 AnonHugePmdMapped).
 
-The number of file transparent huge pages mapped to userspace is available
-by reading ShmemPmdMapped and ShmemHugePages fields in ``/proc/meminfo``.
-To identify what applications are mapping file transparent huge pages, it
-is necessary to read ``/proc/PID/smaps`` and count the FilePmdMapped fields
-for each mapping.
+The number of PMD-sized transparent huge pages currently used by
+filesystem data (page cache) is available by reading the FileHugePages field
+in ``/proc/meminfo``. The number of these huge pages that are mapped to userspace
+is available by reading FilePmdMapped field in ``proc/meminfo``. To identify
+what applications are mapping these huge pages, it is necessary to read
+``/proc/PID/smaps`` and count the FilePmdMapped fields for each mapping.
+
+In similar fashion, the number of PMD-sized transparent huge pages currently
+used by tmpfs/shmem is available by reading the ShmemHugePages field
+in ``/proc/meminfo``. The number of these huge pages that are mapped to userspace
+is available by reading ShmemPmdMapped field in ``proc/meminfo``. To identify
+what applications are mapping these huge pages, it is necessary to read
+``/proc/PID/smaps`` and count the ShmemPmdMapped fields for each mapping.
 
 Note that reading the smaps file is expensive and reading it
 frequently will incur overhead.

base-commit: f0a16f5363325cc8d9382471cdc7b654c53254c9
-- 
2.47.2

