Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC12B23C51A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819384; cv=none; b=OrWIQZmnCOmyUlARaPPYgraCyqqRWxlXhq3o57eozhfDyO0zYC+YzsjYYySdpapk0pe9gXg6SNZsOBOrfm+nbecpLwNTdLxS06rcLx7QWttq6QPwnpDadO94EIIpDS9+iFjwU/sKYTMxz7rhDygyqSyv76eYuVa7j0y1GW3x+OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819384; c=relaxed/simple;
	bh=7TWfyuQGehMlwy6wQ854Zjiz2fwqm0HkfmnWjVAVV1c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pHJ7ElIubgxif6D3wnL05PgyZn/TZ36uifOBjfq4ZI66pB24gttFNRoriVgsknZYjUzS0CmfKnsgVRd2uESOiiUn2NhIBU8vpjutF/Ixs53dj+yWJabmTDtGhgbUK5+cY5OsAYe5gnChNLRJUxU2+mBVvXybF1sDRWNpze4ib90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4b2QtV3WdNz4f3jMf
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:22:26 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 83DC11A0359
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:22:51 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP3 (Coremail) with SMTP id _Ch0CgC3VcBomy1orXF3Mw--.54633S2;
	Wed, 21 May 2025 17:22:49 +0800 (CST)
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
Subject: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when expanding vma during mremap
Date: Wed, 21 May 2025 09:25:03 +0000
Message-Id: <20250521092503.3116340-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgC3VcBomy1orXF3Mw--.54633S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw15WrWfZFy3Xr4DJF1xAFb_yoW7JFykpF
	Wvv398KFWrJa1vgr98Zw1qvry3tws2yr4UAry5X34Y9r9Igr43tFs3AF48Ary5JFZ2vr1f
	tF4UKryftFW2va7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0E
	n4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU17KsUUUUUU==
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
remove the unnecessary uprobe_mmap at merged vma, that is, do not
perform uprobe_mmap when there is no vma in the addr range to be
expaned.

This problem was first find in linux-6.6.y and also exists in the
community syzkaller:
https://lore.kernel.org/all/000000000000ada39605a5e71711@google.com/T/

The complete Syzkaller C reproduction program is as follows:

#define _GNU_SOURCE
#include <sys/mman.h>
#include <linux/perf_event.h>
#include <linux/hw_breakpoint.h>

#include <fcntl.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <syscall.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    // Find out what type id we need for uprobes
    int perf_type_pmu_uprobe;
    {
        FILE *fp = fopen("/sys/bus/event_source/devices/uprobe/type", "r");
        fscanf(fp, "%d", &perf_type_pmu_uprobe);
        fclose(fp);
    }

    const char *filename = "./bus";

    int fd = open(filename, O_RDWR|O_CREAT, 0600);
    write(fd, "x", 1);

    void *addr = mmap(NULL, 4096, PROT_READ | PROT_WRITE | PROT_EXEC,
                      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);

    // Register a perf uprobe on "./bus"
    struct perf_event_attr attr = {};
    attr.type = perf_type_pmu_uprobe;
    attr.uprobe_path = (unsigned long) filename;
    syscall(__NR_perf_event_open, &attr, 0, 0, -1, 0);

    void *addr2 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
    void *addr3 = mremap((void *) addr2, 4096, 2 * 4096, MREMAP_MAYMOVE);
    mremap(addr3, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, (void *) addr2);

    return 0;
}

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 mm/vma.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/mm/vma.c b/mm/vma.c
index 3ff6cfbe3338..9a8d84b12918 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -325,7 +325,7 @@ static void vma_prepare(struct vma_prepare *vp)
  * @mm: The mm_struct
  */
 static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
-			 struct mm_struct *mm)
+			 struct mm_struct *mm, bool handle_vma_uprobe)
 {
 	if (vp->file) {
 		if (vp->adj_next)
@@ -358,7 +358,8 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
 
 	if (vp->file) {
 		i_mmap_unlock_write(vp->mapping);
-		uprobe_mmap(vp->vma);
+		if (handle_vma_uprobe)
+			uprobe_mmap(vp->vma);
 
 		if (vp->adj_next)
 			uprobe_mmap(vp->adj_next);
@@ -549,7 +550,7 @@ __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	}
 
 	/* vma_complete stores the new vma */
-	vma_complete(&vp, vmi, vma->vm_mm);
+	vma_complete(&vp, vmi, vma->vm_mm, true);
 	validate_mm(vma->vm_mm);
 
 	/* Success. */
@@ -715,6 +716,7 @@ static int commit_merge(struct vma_merge_struct *vmg)
 {
 	struct vm_area_struct *vma;
 	struct vma_prepare vp;
+	bool handle_vma_uprobe = !!vma_lookup(vmg->mm, vmg->start);
 
 	if (vmg->__adjust_next_start) {
 		/* We manipulate middle and adjust next, which is the target. */
@@ -748,7 +750,7 @@ static int commit_merge(struct vma_merge_struct *vmg)
 	vmg_adjust_set_range(vmg);
 	vma_iter_store_overwrite(vmg->vmi, vmg->target);
 
-	vma_complete(&vp, vmg->vmi, vma->vm_mm);
+	vma_complete(&vp, vmg->vmi, vma->vm_mm, handle_vma_uprobe);
 
 	return 0;
 }
@@ -1201,7 +1203,7 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
 
 	vma_iter_clear(vmi);
 	vma_set_range(vma, start, end, pgoff);
-	vma_complete(&vp, vmi, vma->vm_mm);
+	vma_complete(&vp, vmi, vma->vm_mm, true);
 	validate_mm(vma->vm_mm);
 	return 0;
 }
-- 
2.34.1

