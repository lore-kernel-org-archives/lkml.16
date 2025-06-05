Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04F81B3930
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749110485; cv=none; b=md9lRo5hSqF06gK/CvtQYrM02308X67z8SHnqEuIspZ/5jls+iz96ySfyFgGlblN3/BI2l0ZlOrCxoJWw2eB3fVTjFRLN1HfSHnTA7ssjOjZ1dnkID01M1RZgt7f3ttjuP6+qAvU2vKeuIlCyv2BtaMtKnTladzcLJnC3w9RjSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749110485; c=relaxed/simple;
	bh=7lVFMr2qHvXJ7srcM0DVQjtUrZTgTa2o39ZSuSEDDUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rLh70Col+4GtBAQPS3THAR+0pb9+nV14kkltlC8LotaBYH7lsElymymuwb0LvKDnAbv7Yt8YIY0g7Em4a/egsNG2Lp2S0lUe50f4SptplYU48sTQnpU7IDOh0ZhhulJiQfqyTebYUbIKd5DaOqtKYvbBDBVD2osi/96lBike4TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=BOQ3MG/o; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="BOQ3MG/o"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749110473; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=AqxjQY2xO7aD1LKxAitZE+GQP9wGkDye004QOn2nxH0=;
	b=BOQ3MG/o/hW3If/be4gg7T3KX9TMrc9ldvVZydq458zjNk19mNouVliOzSPSD6PnqhfsoHTVPbqKZIxLrl16ZhFcAaK9YAny3rNHd/Y4dKO2urQ09MawH4Dy4eKgfMGRtQwaHB9nJ3KkY2kX+fQLAFPPLx30vNtJL77RDLziRxM=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wd7QUzk_1749110472 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Jun 2025 16:01:12 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com,
	david@redhat.com
Cc: lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] fix MADV_COLLAPSE issue if THP settings are disabled
Date: Thu,  5 Jun 2025 16:00:57 +0800
Message-ID: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As we discussed in the previous thread [1], the MADV_COLLAPSE will ignore
the system-wide anon/shmem THP sysfs settings, which means that even though
we have disabled the anon/shmem THP configuration, MADV_COLLAPSE will still
attempt to collapse into a anon/shmem THP. This violates the rule we have
agreed upon: never means never. This patch set will address this issue.

[1] https://lore.kernel.org/all/1f00fdc3-a3a3-464b-8565-4c1b23d34f8d@linux.alibaba.com/

Changes from v1:
 - Update the commit message, per Zi.
 - Add Zi's reviewed tag. Thanks.
 - Update the shmem logic.

Baolin Wang (2):
  mm: huge_memory: disallow hugepages if the system-wide THP sysfs
    settings are disabled
  mm: shmem: disallow hugepages if the system-wide shmem THP sysfs
    settings are disabled

 include/linux/huge_mm.h | 23 +++++++++++++++++++----
 mm/huge_memory.c        |  2 +-
 mm/shmem.c              |  6 +++---
 3 files changed, 23 insertions(+), 8 deletions(-)

-- 
2.43.5

