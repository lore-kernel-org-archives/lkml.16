Received: from mx0a-00007101.pphosted.com (mx0a-00007101.pphosted.com [148.163.135.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F720EAC7
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 03:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746328190; cv=none; b=QLLt9ywzN8JGwuIZAnRyPnHSivQWpU79jfXe+M/Uq/dfHxkQKzH1ZcUNNaS0F1Q/ktjnEPOXo+AsUa6ZDPwiLrmirHCnNasTun9GWMwmgiOxH9oh/p23ukyg/8oaS2PqhBu/wIxoA0U61EVqGZGqCYJROE47tclmlt/Pf1E9NRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746328190; c=relaxed/simple;
	bh=uGSGfd8aJjeZVERz1reCpqzWG2oOKLe7hui5Gt9AY90=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LjADVoPpVhAfvKg5kO1BU8BHxDcMP0poQ9h/4Tqk2BKfO61k8MEKqomOpBz1MZaWvmQUWiusCQDdvOVSaPkeWrR5wjEy1dbRAQi+mmnrH+eU/SQ27T4yVYLTlZswraWH2L2+pi95DDhMuKt+k7uN+nzGdvJLRDqWzZhKI0mZTeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=illinois.edu; spf=pass smtp.mailfrom=illinois.edu; dkim=pass (2048-bit key) header.d=illinois.edu header.i=@illinois.edu header.b=YNj57LkL; arc=none smtp.client-ip=148.163.135.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=illinois.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=illinois.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=illinois.edu header.i=@illinois.edu header.b="YNj57LkL"
Received: from pps.filterd (m0166257.ppops.net [127.0.0.1])
	by mx0a-00007101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543FG3qZ030008;
	Sun, 4 May 2025 01:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=illinois.edu; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=campusrelays; bh=ml0g/r5yh1KDETRwwBFQaC/xbU3HkiU9
	c7/xFhnLE8o=; b=YNj57LkL8FxIQfCiPO017oHyl7UHAhlSjv4r4RV5Qdu043Na
	IlZuDYowsy3jZlWQ+WVaC5QI091pTfUDtAsO3tTklIMLzrfVaePYiFRJqVr0UqDm
	H7RuMS5fM2rXDFEeB3Ujaq2KgLACdhSEXxWBM0K5eN8h+F9KTv8WFNAQoN75VKjm
	776mR9pzRnLCd6ObeDwb3D5CkBxY5TGMzqQHx119jnZhesU04DGwfJ7mibsi9Ip0
	YwP9X5+WU5A6lTi3pRSM4w3PvKfzuI6rMx3JWmfxCg8/2A6E/VQ8zrMN321uPYM0
	jYMD2plXqi0dJq24kIAlOoxjBYkC7vvADr4/yA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-00007101.pphosted.com (PPS) with ESMTPS id 46dbwhm0du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 04 May 2025 01:46:48 +0000 (GMT)
Received: from m0166257.ppops.net (m0166257.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5441klD9007299;
	Sun, 4 May 2025 01:46:47 GMT
Received: from localhost.localdomain ([192.17.102.224])
	by mx0a-00007101.pphosted.com (PPS) with ESMTP id 46dbwhm0ds-1;
	Sun, 04 May 2025 01:46:47 +0000 (GMT)
From: yikangy2@illinois.edu
To: mikulas@artax.karlin.mff.cuni.cz
Cc: linux-kernel@vger.kernel.org, yikangy2@illinois.edu, shaobol2@illinois.edu,
        yiruiz2@illinois.edu, jianh@illinois.edu
Subject: [PATCH] fs/hpfs: Fix error code for new_inode() failure in mkdir/create/mknod/symlink
Date: Sat,  3 May 2025 20:44:34 -0500
Message-Id: <20250504014433.120804-1-yikangy2@illinois.edu>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAxNCBTYWx0ZWRfX2yHQYlIMyS4i DjEUok+MRkiXahWDE4BsS42OG+9guyyxekasAneE4VJolGFNU8RyplzHPX/g5g4p4xxoqpu4TwK IUNYgVbrRJMkWivNQ77ve7OOar/AxM2+vwRZK+zPDmdIVO+jW22wVVr1GRaHjCW2bxXT3FdT2gg
 T/wgmp3303+/iDyGL/IC+qhhzLHQfytyy2/RLCpIH/6ShbyvNdAj53S+aubsMokxmA6njeDyc24 a+mFckhaZ30kI/M7kUtKIzJobX/EWvczAxJFhBd4cHaQi3mobPvksAcJPBq0BhBJNlGiL80xbew xO41RqlPEZmtZiGWkRUs1mxxmD/NOPYEYI5VIi96ZlFNUIRzlVtEa2I3Q+qNAAzYM5N3hxx/EZM o3Y4EsGv
X-Proofpoint-GUID: C-VL-MTQva-TvkhFi8s0p60XKCGP88fT
X-Proofpoint-ORIG-GUID: 3QF4HlxuAvWZLyK2DXoxQ6Qx1Y6NxhlI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=cautious_plus_nq_notspam policy=cautious_plus_nq score=0 clxscore=1011
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=756
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040014
X-Spam-Score: 0
X-Spam-OrigSender: yikangy2@illinois.edu
X-Spam-Bar: 

From: Yikang Yue <yikangy2@illinois.edu>

The function call new_inode() is a primitive for allocating an inode in memory,
rather than planning disk space for it. Therefore, -ENOMEM should be returned
as the error code rather than -ENOSPC.

To be specific, new_inode()'s call path looks like this:
new_inode
  new_inode_pseudo
    alloc_inode
      ops->alloc_inode (hpfs_alloc_inode)
        alloc_inode_sb
          kmem_cache_alloc_lru

Therefore, the failure of new_inode() indicates a memory presure issue (-ENOMEM),
not a lack of disk space. However, the current implementation of
hpfs_mkdir/create/mknod/symlink incorrectly returns -ENOSPC when new_inode() fails.
This patch fix this by set err to -ENOMEM before the goto statement.

BTW, we also noticed that other nested calls within these four functions,
like hpfs_alloc_f/dnode and hpfs_add_dirent, might also fail due to memory presure.
But similarly, only -ENOSPC is returned. Addressing these will involve code
modifications in other functions, and we plan to submit dedicated patches for these
issues in the future. For this patch, we focus on new_inode().

Signed-off-by: Yikang Yue <yikangy2@illinois.edu>
---
 fs/hpfs/namei.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/hpfs/namei.c b/fs/hpfs/namei.c
index e3cdc421dfba..353e13a615f5 100644
--- a/fs/hpfs/namei.c
+++ b/fs/hpfs/namei.c
@@ -52,8 +52,10 @@ static struct dentry *hpfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	dee.fnode = cpu_to_le32(fno);
 	dee.creation_date = dee.write_date = dee.read_date = cpu_to_le32(local_get_seconds(dir->i_sb));
 	result = new_inode(dir->i_sb);
-	if (!result)
+	if (!result) {
+		err = -ENOMEM;
 		goto bail2;
+	}
 	hpfs_init_inode(result);
 	result->i_ino = fno;
 	hpfs_i(result)->i_parent_dir = dir->i_ino;
@@ -153,9 +155,10 @@ static int hpfs_create(struct mnt_idmap *idmap, struct inode *dir,
 	dee.creation_date = dee.write_date = dee.read_date = cpu_to_le32(local_get_seconds(dir->i_sb));
 
 	result = new_inode(dir->i_sb);
-	if (!result)
+	if (!result) {
+		err = -ENOMEM;
 		goto bail1;
-	
+	}
 	hpfs_init_inode(result);
 	result->i_ino = fno;
 	result->i_mode |= S_IFREG;
@@ -239,9 +242,10 @@ static int hpfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 	dee.creation_date = dee.write_date = dee.read_date = cpu_to_le32(local_get_seconds(dir->i_sb));
 
 	result = new_inode(dir->i_sb);
-	if (!result)
+	if (!result) {
+		err = -ENOMEM;
 		goto bail1;
-
+	}
 	hpfs_init_inode(result);
 	result->i_ino = fno;
 	hpfs_i(result)->i_parent_dir = dir->i_ino;
@@ -314,8 +318,10 @@ static int hpfs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 	dee.creation_date = dee.write_date = dee.read_date = cpu_to_le32(local_get_seconds(dir->i_sb));
 
 	result = new_inode(dir->i_sb);
-	if (!result)
+	if (!result) {
+		err = -ENOMEM;
 		goto bail1;
+	}
 	result->i_ino = fno;
 	hpfs_init_inode(result);
 	hpfs_i(result)->i_parent_dir = dir->i_ino;
-- 
2.46.0.windows.1

