Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D771B413D;
	Fri,  4 Apr 2025 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743760937; cv=none; b=iV7ZCrIjyqN/uqMpTguI8M6rCrLkU1lk6zCZrqcIAiXtpIUloZz0QTzkrsfVjMvM8++vLpbl4NDO2b7QpJfGmV2PPTRB5sXVdw/HDMg18lf5mXU8SKxIMcfd74krIFpQ7lrgkVdRbuj2VwwLnFFey95Paq65djFCG5u82/NqDs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743760937; c=relaxed/simple;
	bh=eoO4M3E5GGTJhnb4f/GuPEChAiCrDwbkxmtLPkfgcAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lg3RHRq108LOASlAHa0XI2CvAdH/3hCdF4568eLRtTV5/LqCx863WfIlwwdZw7k9L3Y+HVC9EvKOKkG3HjyGhEC4K78lZe5emKcx1FfJXX3b28xurOhZsiO51EfYwxB/e8DHkvZv5FNxJh/TzFzaIg2H/AnxFMtPb7CwbeAPKOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com; spf=pass smtp.mailfrom=pankajraghav.com; dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b=slo0eJoL; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pankajraghav.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b="slo0eJoL"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZTZ015Z3nz9t6y;
	Fri,  4 Apr 2025 12:02:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pankajraghav.com;
	s=MBO0001; t=1743760929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r1n2IxWlUE89EoDyUJBLsMZNprUF531kxdOHKEj7v28=;
	b=slo0eJoLEEk/AJi3BQQ0cMlesfWdKZO/53yPXbi4i+Wct5sKcHpwiGdxEbx0Kh9mn3aMsR
	HyhXrg7ZvYO4cg3KJ92KTCqQSbV3z/hqBGE2/RGGl1UZoNwt5JMyTNDkmJwxPMiO2XWaDR
	G+pcXDAzD/ZbPhtHCMI2Yjg3/CfVlpVyMlDmShr69OnLcXB0aI3BtlDmVlAvKUkb1H2//f
	xxkif4/lENVztAdS3sA3uG6gxqoV6nFN7TyYCdfHNsKOltSJ5Ip5T4fgSXa1WSBqEwYdQY
	Ne0O6V5VJH2NMeLUYF62gyJjr5DIaDFQrT3Y++qyVDvDZJmI3j5JMpcmKQ2N5w==
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
Subject: [PATCH v2 2/2] docs: clarify THP admin guide about (File|Shmem)PmdMapped and ShmemHugePage
Date: Fri,  4 Apr 2025 12:01:59 +0200
Message-ID: <20250404100159.27086-3-kernel@pankajraghav.com>
In-Reply-To: <20250404100159.27086-1-kernel@pankajraghav.com>
References: <20250404100159.27086-1-kernel@pankajraghav.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pankaj Raghav <p.raghav@samsung.com>

Move FilePmdMapped to previous paragraph for clarity, and clarify
ShmemPmdMapped & ShmemHugePage.

Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 Documentation/admin-guide/mm/transhuge.rst | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index 01b7ce90d693..b0b9d578732b 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -465,13 +465,17 @@ AnonHugePmdMapped).
 
 The number of PMD-sized transparent huge pages currently used by
 filesystem data (page cache) is available by reading the FileHugePages field
-in ``/proc/meminfo``.
+in ``/proc/meminfo``. The number of these huge pages that are mapped to userspace
+is available by reading FilePmdMapped field in ``proc/meminfo``. To identify
+what applications are mapping these huge pages, it is necessary to read
+``/proc/PID/smaps`` and count the FilePmdMapped fields for each mapping.
 
-The number of file transparent huge pages mapped to userspace is available
-by reading ShmemPmdMapped and ShmemHugePages fields in ``/proc/meminfo``.
-To identify what applications are mapping file transparent huge pages, it
-is necessary to read ``/proc/PID/smaps`` and count the FilePmdMapped fields
-for each mapping.
+The number of PMD-sized transparent huge pages currently used by
+tmpfs/shmem is available by reading the ShmemHugePages field
+in ``/proc/meminfo``. The number of these huge pages that are mapped to userspace
+is available by reading ShmemPmdMapped field in ``proc/meminfo``. To identify
+what applications are mapping these huge pages, it is necessary to read
+``/proc/PID/smaps`` and count the ShmemPmdMapped fields for each mapping.
 
 Note that reading the smaps file is expensive and reading it
 frequently will incur overhead.
-- 
2.47.2

