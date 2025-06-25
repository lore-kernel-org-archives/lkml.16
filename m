Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567F022083
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750815623; cv=none; b=DfuS9jdM4s9XFfmRroXvUVDYMy21cAveMSrLVuLev9UMa/q/dVnbiZTUJpNkYCgH3YNl14hPL41jvg2u2BHH+9IbffEdbFuZsu7gQ0JuSJlHiW3/XYzr0Wfc4gp4WuvNcH+xFBLB8AA3U7RJBBDAje2CpIcYbsmE0yfkra3C4YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750815623; c=relaxed/simple;
	bh=Rp0v8eEoECEueax+THVVGvuQ0+kS7Ek7zNa5/4hNDTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TDK8j8mLOMAPT9wRy6DJQRvQb147DLfrzay1HaMXwBkJwis2XF4b/CmchDeyhk0Gjr56xrjCKQYG+n/Af4Bti9K/UzX2EiIWBulIDvlMxph7v5eTqR/EGau+MCf5Xy6mllRkZyOTk3y7hDxZ+JwzrYdVtZm9lKk9SOSoKHM/W6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=CBULkXrc; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="CBULkXrc"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750815616; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=s3gRp0xJxwb0f1sG+vjcL17ce4cZOv0ZWJkdD4FJg/M=;
	b=CBULkXrcb+xYZBtcoiUc6oSiAWEsEL8h03+Ka2m08bwid9b1D7DmVR3+5z9xCQpOGFnR5IZUDPNPxfvLOdN1lBRfik5EVkhtv9OoQ5l4QSzGr9mrJhug3zml/qS0xT9JEefnLtBcbouGmVL4u8cR69D+ru2C4+fL0c7+OnN6Mzc=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WeqBlig_1750815615 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Jun 2025 09:40:16 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com,
	david@redhat.com
Cc: ziy@nvidia.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are disabled
Date: Wed, 25 Jun 2025 09:40:08 +0800
Message-ID: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When invoking thp_vma_allowable_orders(), if the TVA_ENFORCE_SYSFS flag is not
specified, we will ignore the THP sysfs settings. Whilst it makes sense for the
callers who do not specify this flag, it creates a odd and surprising situation
where a sysadmin specifying 'never' for all THP sizes still observing THP pages
being allocated and used on the system. And the MADV_COLLAPSE is an example of
such a case, that means it will not set TVA_ENFORCE_SYSFS when calling
thp_vma_allowable_orders().

As we discussed in the previous thread [1], the MADV_COLLAPSE will ignore
the system-wide anon/shmem THP sysfs settings, which means that even though
we have disabled the anon/shmem THP configuration, MADV_COLLAPSE will still
attempt to collapse into a anon/shmem THP. This violates the rule we have
agreed upon: never means never.

For example, system administrators who disabled THP everywhere must indeed very
much not want THP to be used for whatever reason - having individual programs
being able to quietly override this is very surprising and likely to cause headaches
for those who desire this not to happen on their systems.

This patch set will address the MADV_COLLAPSE issue.

Test
====
1. Tested the mm selftests and found no regressions.
2. With toggling different Anon mTHP settings, the allocation and madvise collapse for
anonymous pages work well.
3. With toggling different shmem mTHP settings, the allocation and madvise collapse for
shmem work well.
4. Tested the large order allocation for tmpfs, and works as expected.

[1] https://lore.kernel.org/all/1f00fdc3-a3a3-464b-8565-4c1b23d34f8d@linux.alibaba.com/

Changes from v3:
 - Collect reviewed tags. Thanks.
 - Update the commit message, per David.

Changes from v2:
 - Update the commit message and cover letter, per Lorenzo. Thanks.
 - Simplify the logic in thp_vma_allowable_orders(), per Lorenzo and David. Thanks.

Changes from v1:
 - Update the commit message, per Zi.
 - Add Zi's reviewed tag. Thanks.
 - Update the shmem logic.

Baolin Wang (2):
  mm: huge_memory: disallow hugepages if the system-wide THP sysfs
    settings are disabled
  mm: shmem: disallow hugepages if the system-wide shmem THP sysfs
    settings are disabled

 include/linux/huge_mm.h                 | 51 ++++++++++++++++++-------
 mm/shmem.c                              |  6 +--
 tools/testing/selftests/mm/khugepaged.c |  8 +---
 3 files changed, 43 insertions(+), 22 deletions(-)

-- 
2.43.5

