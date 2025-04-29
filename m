Received: from ssh247.corpemail.net (ssh247.corpemail.net [210.51.61.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917AE14EC5B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745905969; cv=none; b=V5D50XtKuTJbSgjPAlpt9eciEK7byaQyoLVEkNAT5N3uIGxvhJFJqEJP+2Qlm4H8B7um9NDPjGXvvUJBd+uAF4m6SJFMjt0IuVEGa+F+cIjnL/ldKWQQUnVIWV1YiwBdZEL9XoSuicxcrnFWp40NQ0u7gRTf6uwEIam12lYSw5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745905969; c=relaxed/simple;
	bh=+akeY5z7w1RyXiz6j2QAfwfh2W+sUGoBrjaV5TEkxNQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=joVvfewamGBJwqtbvx41PKmfNDeh4ApdUnNcqnygYk9yh/eQx9qdiswpBrDz09qdbL+gjYYkCDQh4khWmcA7rcaMoZ8/Sm3ZzBnypDM/+hJ9BWIVX9h8baTI00x3HtsuBqjTr/Ej4Bc5R0JvbxypfM9hJfFoP0/VutRbhCv0wsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201622.home.langchao.com
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id 202504291351301089;
        Tue, 29 Apr 2025 13:51:30 +0800
Received: from localhost.localdomain (10.94.5.55) by
 jtjnmail201622.home.langchao.com (10.100.2.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Apr 2025 13:51:29 +0800
From: Bo Liu <liubo03@inspur.com>
To: <agruenba@redhat.com>
CC: <gfs2@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Bo Liu
	<liubo03@inspur.com>
Subject: [PATCH]  gfs2: Remove set but not used variable 'xattr_initialized'
Date: Tue, 29 Apr 2025 01:49:16 -0400
Message-ID: <20250429054916.2343-1-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: Jtjnmail201616.home.langchao.com (10.100.2.16) To
 jtjnmail201622.home.langchao.com (10.100.2.22)
tUid: 2025429135130a959781ce626ab25329c3b92bffbd5f4
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

The variable xattr_initialized is assigned and never used, so can be removed.

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 fs/gfs2/inode.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 95c39798901b..f87f21b93b43 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -701,7 +701,6 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	u32 aflags = 0;
 	unsigned blocks = 1;
 	struct gfs2_diradd da = { .bh = NULL, .save_loc = 1, };
-	bool xattr_initialized = false;
 
 	if (!name->len || name->len > GFS2_FNAMESIZE)
 		return -ENAMETOOLONG;
@@ -843,10 +842,8 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	if (error)
 		goto fail_gunlock3;
 
-	if (blocks > 1) {
+	if (blocks > 1)
 		gfs2_init_xattr(ip);
-		xattr_initialized = true;
-	}
 	init_dinode(dip, ip, symname);
 	gfs2_trans_end(sdp);
 
-- 
2.31.1

