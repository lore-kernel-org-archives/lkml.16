Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DB826F469
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352100; cv=none; b=fJb//di8H/Y5fyfKCx+1pAeGsypBWIYjq2/kSzXLBJJksK0Fa9wLRpY+BcBNT/xooojt7pc4kNf5zLP1EOH4G7vNT91k1gXGpb12GOVoJBW3n5w4Nj6Nw1KxUUjDNH1ZEg+YrduPMO5MyFjegfH3b5LnJpIO0ahblUPIk9Ua3TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352100; c=relaxed/simple;
	bh=NBjqECj5dnOHtdl2TSooNWbwidqr7bQ76tClyKra9pc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XiWVNS1kZPV8ax4ULPo4SPF9cOpI2UPQ7qOqsgWgvOiU/c7M8X8C1P++/mNsXr4VaggXJybXq/Vr7zSeQpyI5kJyA/LtqKslQtqa7U+BPz6udWlMhJZLNnXBQU3m+Bw+82kJmCM7bd3WwkPQgwzM1HplVm2bc0PUeTVbbDGGfRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4b6Cvg39X6zKHMZH
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:21:35 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id DC7311A07C0
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:21:33 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP3 (Coremail) with SMTP id _Ch0CgBX98FavDVoK9fhNQ--.12329S2;
	Tue, 27 May 2025 21:21:31 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	pfalcato@suse.de
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	pulehui@huawei.com
Subject: [RFC PATCH v2 0/2] Fix uprobe anon page be overwritten during mremap
Date: Tue, 27 May 2025 13:23:49 +0000
Message-Id: <20250527132351.2050820-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgBX98FavDVoK9fhNQ--.12329S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw1kWFW3uw4Uur45AF1UWrg_yoW3XFcE9w
	4ktryrtFZ8Ga40va1Ikwn5JrWkGayqgr4fAF1YqrZrAr4kGrnrWFZxCrn3Xr1I9w1SvFWD
	WF1DXF93XFnFgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAa
	w2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
	6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUF1v3UUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/

From: Pu Lehui <pulehui@huawei.com>

patch 1: the mainly fix for uprobe anon page be overwritten issue.
patch 2: WARN_ON_ONCE for new_pte not NULL during move_ptes.

RFC v2:
- skip uprobe_mmap on expanded vma.
- add skip_vma_uprobe field to struct vma_prepare and
  vma_merge_struct. (Lorenzo)
- add WARN_ON_ONCE when new_pte is not NULL. (Oleg)
- Corrected some of the comments.

RFC v1:
https://lore.kernel.org/all/20250521092503.3116340-1-pulehui@huaweicloud.com/

Pu Lehui (2):
  mm/mremap: Fix uprobe anon page be overwritten when expanding vma
    during mremap
  mm/mremap: Expose abnormal new_pte during move_ptes

 mm/mremap.c | 2 ++
 mm/vma.c    | 7 ++++++-
 mm/vma.h    | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.34.1

