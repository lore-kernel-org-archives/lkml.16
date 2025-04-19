Received: from out30-70.freemail.mail.aliyun.com (out30-70.freemail.mail.aliyun.com [115.124.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7292D13B59B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 06:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745045655; cv=none; b=jgI9WWkG0+3pfw8PjMDbAJ6qvzyBZdvWvI6vjJ6iUVtsotJPV5yKzY0+4KDMjB28rkZCfTOd/m4qo3+JxCd+CiqJoW3pwg6wJfzUY/zDpoxUk7rgCdx7S5vhrkVmxHUKT5nValLX70f192rbgbMeEfGegbDv92kSeg7W9Wc8KaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745045655; c=relaxed/simple;
	bh=GRK/TMnKIRbN3f50Ord9TYPfQJd5iwKhvarfamW6RT4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Rg01iCJoPKw+sOcneKlOhMffRnyQO6vKDx1HH5ycy5NRqqjlFMVOhoyVQRHfPs1rrBtOhm0I4KGohzIV3SVShwEEBQVmHDwbsPzxqRr7tNdQpalel5004vLEmEhI77NZgfMDLhV09rT67yA6S4HXk5ShWmFfaFG+cuKP+Hww80E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliyun.com; spf=pass smtp.mailfrom=aliyun.com; dkim=pass (1024-bit key) header.d=aliyun.com header.i=@aliyun.com header.b=U/fFFUTX; arc=none smtp.client-ip=115.124.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliyun.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliyun.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliyun.com header.i=@aliyun.com header.b="U/fFFUTX"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=aliyun.com; s=s1024;
	t=1745045650; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=C8XoKMiLqO8DLqaALb1HR/c8BmRawjzkgbEfveu42O4=;
	b=U/fFFUTXiZAPM6IfSdlj4K/R9E3R3TTM46HjazLyG1TMr8Skgzsd5ozFw/kcFR1FWxUClRQ4cphlfGV5sfI2+fsvEkub186hIzbMNxsfV/F7NPZ/PqfDbtoiUCk5jGxDLOYlsHBy6GO+9D36EAXS7TYs+mmL95HOSNkfSe3dMyA=
Received: from wdhh6.sugon.cn(mailfrom:wdhh6@aliyun.com fp:SMTPD_---0WXM57Cr_1745045649 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 19 Apr 2025 14:54:09 +0800
From: Chaohai Chen <wdhh6@aliyun.com>
To: agruenba@redhat.com
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chaohai Chen <wdhh6@aliyun.com>
Subject: [PATCH] fs:gfs:glock: Delete the invalid pointer insert_pt in add_to_queue()
Date: Sat, 19 Apr 2025 14:53:35 +0800
Message-Id: <20250419065335.211252-1-wdhh6@aliyun.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The point insert_pt is always NULL, no one will change it, delete the code
and useless logic about it.

Signed-off-by: Chaohai Chen <wdhh6@aliyun.com>
---
 fs/gfs2/glock.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 65c07aa95718..8a0f2140b9b3 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1483,7 +1483,6 @@ __acquires(&gl->gl_lockref.lock)
 {
 	struct gfs2_glock *gl = gh->gh_gl;
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
-	struct list_head *insert_pt = NULL;
 	struct gfs2_holder *gh2;
 	int try_futile = 0;
 
@@ -1525,15 +1524,7 @@ __acquires(&gl->gl_lockref.lock)
 	trace_gfs2_glock_queue(gh, 1);
 	gfs2_glstats_inc(gl, GFS2_LKS_QCOUNT);
 	gfs2_sbstats_inc(gl, GFS2_LKS_QCOUNT);
-	if (likely(insert_pt == NULL)) {
-		list_add_tail(&gh->gh_list, &gl->gl_holders);
-		return;
-	}
-	list_add_tail(&gh->gh_list, insert_pt);
-	spin_unlock(&gl->gl_lockref.lock);
-	if (sdp->sd_lockstruct.ls_ops->lm_cancel)
-		sdp->sd_lockstruct.ls_ops->lm_cancel(gl);
-	spin_lock(&gl->gl_lockref.lock);
+	list_add_tail(&gh->gh_list, &gl->gl_holders);
 	return;
 
 trap_recursive:
-- 
2.34.1

