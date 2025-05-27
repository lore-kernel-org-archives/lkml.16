Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D4C34CDD
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352099; cv=none; b=LNMZPlIhdFiuN9pkIEqRDpCjqejJmKsmi18YrmBTB7ZFzCWN2t//RYd1aO7FELJcunILKpc1IL1jndVSffJ2ihmuZ8g0xFGMevzZu4YFEpcZb4txFxFTg6F1gLpK8HLINZONgyrW5cu8DfQHYy1Ui7ScNBrRVAYsNBEtIwCjIfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352099; c=relaxed/simple;
	bh=us/0eJOctHjFvBrPh/V3uCaMRE92YvukXrpOzn0thTI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Im2r0Y7Cs1buw9BrACmhbMqGGWCfEJffxERb7bisKHggprpcRWJDPsrkOEc8gCnLJIm7Ot0oURjT6UduitvDmSXH+jG/HiWADEIvijrJrFQxY2CJ3HD4eXyjSmaEUophZwJfWsQo0xFsk2BKBXqbLddhk/BA7Kmhv2rIqjIxgLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4b6Cvg3jkczKHMZ2
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:21:35 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id F0C921A1BEA
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:21:33 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP3 (Coremail) with SMTP id _Ch0CgBX98FavDVoK9fhNQ--.12329S3;
	Tue, 27 May 2025 21:21:33 +0800 (CST)
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
Subject: [RFC PATCH v2 1/2] mm/mremap: Fix uprobe anon page be overwritten when expanding vma during mremap
Date: Tue, 27 May 2025 13:23:50 +0000
Message-Id: <20250527132351.2050820-2-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527132351.2050820-1-pulehui@huaweicloud.com>
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgBX98FavDVoK9fhNQ--.12329S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCw15WrWfZFy3Xr4DJF1xAFb_yoWrAF18pF
	s2v3Z8KFs7JFsYkry7Zryqvry3KwnakFWUCry5X34Y9ryagrsIqFWfAF47Cry5GFZ29a4S
	qr48tryftay2qaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
	A2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI
	0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2uyI
	UUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/

From: Pu Lehui <pulehui@huawei.com>

We encountered a BUG alert triggered by Syzkaller as follows:
   BUG: Bad rss-counter state mm:00000000b4a60fca type:MM_ANONPAGES val:1

And we can reproduce it with the following steps:
1. register uprobe on file at zero offset
2. mmap the file at zero offset:
   addr1 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
3. mremap part of vma1 to new vma2:
   addr2 = mremap(addr1, 4096, 2 * 4096, MREMAP_MAYMOVE);
4. mremap back to orig addr1:
   mremap(addr2, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, addr1);

In the step 3, the vma1 range [addr1, addr1 + 4096] will be remap to new
vma2 with range [addr2, addr2 + 8192], and remap uprobe anon page from
the vma1 to vma2, then unmap the vma1 range [addr1, addr1 + 4096].
In tht step 4, the vma2 range [addr2, addr2 + 4096] will be remap back
to the addr range [addr1, addr1 + 4096]. Since the addr range [addr1 +
4096, addr1 + 8192] still maps the file, it will take
vma_merge_new_range to merge these two addr ranges, and then do
uprobe_mmap in vma_complete. Since the merged vma pgoff is also zero
offset, it will install uprobe anon page to the merged vma. However, the
upcomming move_page_tables step, which use set_pte_at to remap the vma2
uprobe anon page to the merged vma, will over map the old uprobe anon
page in the merged vma, and lead the old uprobe anon page to be orphan.

Since the uprobe anon page will be remapped to the merged vma, we can
remove the unnecessary uprobe_mmap on merged vma, that is, do not
perform uprobe_mmap on expanded vma.

This problem was first find in linux-6.6.y and also exists in the
community syzkaller:
https://lore.kernel.org/all/000000000000ada39605a5e71711@google.com/T/

The complete Syzkaller C reproduction program is as follows:

#define _GNU_SOURCE
#include <fcntl.h>
#include <unistd.h>
#include <syscall.h>
#include <sys/mman.h>
#include <linux/perf_event.h>

int main(int argc, char *argv[])
{
    int fd = open(FNAME, O_RDWR|O_CREAT, 0600);
    struct perf_event_attr attr = {
        .type = 9,
        .uprobe_path = (long) FNAME,
        .probe_offset = 0x0,
    };
    void *addr1, *addr2;

    write(fd, "x", 1);
    mmap(NULL, 4096, PROT_EXEC, MAP_PRIVATE, fd, 0);

    syscall(__NR_perf_event_open, &attr, 0, 0, -1, 0);
    addr1 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
    addr2 = mremap(addr1, 4096, 2 * 4096, MREMAP_MAYMOVE);
    mremap(addr2, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, addr1);

    return 0;
}

Fixes: 78a320542e6c ("uprobes: Change valid_vma() to demand VM_MAYEXEC rather than VM_EXEC")
Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 mm/vma.c | 7 ++++++-
 mm/vma.h | 7 +++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/mm/vma.c b/mm/vma.c
index 1c6595f282e5..6445f515c7f2 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -358,7 +358,8 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
 
 	if (vp->file) {
 		i_mmap_unlock_write(vp->mapping);
-		uprobe_mmap(vp->vma);
+		if (!vp->skip_vma_uprobe)
+			uprobe_mmap(vp->vma);
 
 		if (vp->adj_next)
 			uprobe_mmap(vp->adj_next);
@@ -737,6 +738,7 @@ static int commit_merge(struct vma_merge_struct *vmg)
 	if (vma_iter_prealloc(vmg->vmi, vma))
 		return -ENOMEM;
 
+	vp.skip_vma_uprobe = vmg->skip_vma_uprobe;
 	vma_prepare(&vp);
 	/*
 	 * THP pages may need to do additional splits if we increase
@@ -1151,6 +1153,9 @@ int vma_expand(struct vma_merge_struct *vmg)
 	if (remove_next)
 		vmg->__remove_next = true;
 
+	/* skip uprobe_mmap on expanded vma */
+	vmg->skip_vma_uprobe = true;
+
 	if (commit_merge(vmg))
 		goto nomem;
 
diff --git a/mm/vma.h b/mm/vma.h
index 9a8af9be29a8..56cc0364d239 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -19,6 +19,8 @@ struct vma_prepare {
 	struct vm_area_struct *insert;
 	struct vm_area_struct *remove;
 	struct vm_area_struct *remove2;
+	/* Whether to skip uprobe_mmap on vma */
+	bool skip_vma_uprobe;
 };
 
 struct unlink_vma_file_batch {
@@ -120,6 +122,11 @@ struct vma_merge_struct {
 	 */
 	bool give_up_on_oom :1;
 
+	/*
+	 * Whether to skip uprobe_mmap on merged vma.
+	 */
+	bool skip_vma_uprobe :1;
+
 	/* Internal flags set during merge process: */
 
 	/*
-- 
2.34.1

