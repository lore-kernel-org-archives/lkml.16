Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C164291C04
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805957; cv=none; b=T94QCW9p0kzYYkWBB+dfXHF3RhUbMxlMOtqUg4Cwqcj971nEQYNTZwujffHy9h5ETC6bp+6PBnHNtgWbYi+cMt9SDbGl/jsRQqA46PDdejLtKFfC2InUMz18LJtU82BPoZexxO1/jE+oHCRfpBVpGRFAjJoE6mMGs2gpFbRoF2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805957; c=relaxed/simple;
	bh=ytASqrm4mDPNVLNks+mjpMY4nIBPTx8wa4OlEcXVUrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ViLY/0+w1U8H5L+NOHP+/K4fzQRjCy4OIHH62Xb5Gtek72kD2luW5z/j8N+73E/gcOpGg3IdaUR5IoQVHpd20yOrmz7zEpNJRywgUlHftKkagleMkh+kxYr58kUIFtqplyYctIZ2xAfqKVpHMr3UQobRynnasIKn+JkEM48FFg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Squ5aHPw; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Squ5aHPw"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749805951; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=mChSD/u8wIZMVmHw/Zc0kj2t+KuBko5/1GsKc3/KtCc=;
	b=Squ5aHPwL/z24oK8Z1nSD0/eccTHJmoX0v2tYK0b2DuGlZqhuvBze0Ui24m0GpAZxp5fp1W+K7OpYKG621NmNrYs0SB7pMtoYD3Tu3PUMW1QSVOEKpgDMKa0W0O41Ck6CGr1jWARp/G4x7TfZF1hit3v8HzXSKHy7eGywbZDs1c=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wdjy3Cr_1749805950 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 13 Jun 2025 17:12:30 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
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
Subject: [PATCH] mm: huge_memory: fix the check for allowed huge orders in shmem
Date: Fri, 13 Jun 2025 17:12:19 +0800
Message-ID: <529affb3220153d0d5a542960b535cdfc33f51d7.1749804835.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shmem already supports mTHP, and shmem_allowable_huge_orders() will return
the huge orders allowed by shmem. However, there is no check against the
'orders' parameter passed by __thp_vma_allowable_orders(), which can lead
to incorrect check results for __thp_vma_allowable_orders().

For example, when a user wants to check if shmem supports PMD-sized THP
by thp_vma_allowable_order(), if shmem only enables 64K mTHP, the current
logic would cause thp_vma_allowable_order() to return true, implying that
shmem allows PMD-sized THP allocation, which it actually does not.

I don't think this will cause a significant impact on users, and this will
only have some impact on the shmem THP collapse. That is to say, even though
the shmem sysfs setting does not enable the PMD-sized THP, the
thp_vma_allowable_order() still indicates that shmem allows PMD-sized collapse,
meaning it might successfully collapse into THP, or it might not (for example,
thp_vma_suitable_order() check failed in the collapse process). However, this
still does not align with the shmem sysfs configuration, fix it.

Fixes: 26c7d8413aaf ("mm: thp: support "THPeligible" semantics for mTHP with anonymous shmem")
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
Note: this general change is suitable to be split out as a bugfix patch
based on the discussions in the previous thread[1].

[1] https://lore.kernel.org/all/86bf2dcd-4be9-4fd9-98cc-da55aea52be0@lucifer.local/
---
 mm/huge_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d3e66136e41a..a8cfa37cae72 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -166,7 +166,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 	 * own flags.
 	 */
 	if (!in_pf && shmem_file(vma->vm_file))
-		return shmem_allowable_huge_orders(file_inode(vma->vm_file),
+		return orders & shmem_allowable_huge_orders(file_inode(vma->vm_file),
 						   vma, vma->vm_pgoff, 0,
 						   !enforce_sysfs);
 
-- 
2.43.5

