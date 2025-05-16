Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E209622CBCC
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383333; cv=none; b=MBjeBvrpzP+0MLJRPgCiQbjHEun2bAEOeyzT3P0nFk8wCc3Hj8Psyuzp8Wq2xpqlekJJQI/r2/2BMzZLtgxFvRH9/4hbMd5k4f8SwqBdiJI+enw1RnspxNfkPnCidaujsyiA/3/KpXyLnhwM5sODUWOxtxYlg+v9faAlSJFb+m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383333; c=relaxed/simple;
	bh=u7TQLclURhqvIONaGUJ90uZf4sRaHuwSF46nl8kNkng=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NvGhsrPBLMJ1PphkzJzNUqqMkHUuei7+k/HZ44v9Qkgf2SydlNsIbXfcrZNvc5bsNlzogJbfsUFyCd+mQcXDaI95bhNmNWUA8FDTtQmK/1Fkh2pspVDVpyYoTo6GHzq84YTjesOeGsOoNj3+CavsDTUE5lnWz/p6bj3DLuU75NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4ZzKd91PWxz4f3jtW
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:15:09 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id CACFF1A07BB
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:15:28 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.101.6])
	by APP3 (Coremail) with SMTP id _Ch0CgDnOsUe9CZo9fSDMQ--.49450S4;
	Fri, 16 May 2025 16:15:28 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org
Cc: ryncsn@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] mm: shmem: add missing shmem_unacct_size() in __shmem_file_setup()
Date: Sat, 17 May 2025 01:09:36 +0800
Message-Id: <20250516170939.965736-3-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20250516170939.965736-1-shikemeng@huaweicloud.com>
References: <20250516170939.965736-1-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgDnOsUe9CZo9fSDMQ--.49450S4
X-Coremail-Antispam: 1UD129KBjvdXoW7GrW3JrWDtw4rZF4xAr1UKFg_yoWDZrcEk3
	y8Jr4rGFsxXrnxXF4jka92gryfXFWqyFZxWryfK343ZF1DtrykGFZ5ZrZIgry7Z3WFqas8
	Aw18ZrsIgF429jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbDAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l87I20VAvwVAaII0Ic2I_JFv_Gryl82
	xGYIkIc2x26280x7IE14v26r15M28IrcIa0xkI8VCY1x0267AKxVW8JVW5JwA2ocxC64kI
	II0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7
	xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2
	z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxV
	WUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j9739U
	UUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

We will miss shmem_unacct_size() when is_idmapped_mnt() returns a failure.
Move is_idmapped_mnt() before shmem_acct_size() to fix the issue.

Fixes: 7a80e5b8c6fa7 ("shmem: support idmapped mounts for tmpfs")
Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/shmem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 980fa15f393e..495e661eb8bb 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -5812,12 +5812,12 @@ static struct file *__shmem_file_setup(struct vfsmount *mnt, const char *name,
 	if (size < 0 || size > MAX_LFS_FILESIZE)
 		return ERR_PTR(-EINVAL);
 
-	if (shmem_acct_size(flags, size))
-		return ERR_PTR(-ENOMEM);
-
 	if (is_idmapped_mnt(mnt))
 		return ERR_PTR(-EINVAL);
 
+	if (shmem_acct_size(flags, size))
+		return ERR_PTR(-ENOMEM);
+
 	inode = shmem_get_inode(&nop_mnt_idmap, mnt->mnt_sb, NULL,
 				S_IFREG | S_IRWXUGO, 0, flags);
 	if (IS_ERR(inode)) {
-- 
2.30.0

