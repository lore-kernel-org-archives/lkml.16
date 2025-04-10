Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAF21D5CFD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744258979; cv=none; b=IN3M3kDDGLN/V4Jc3GNL9Z3JLVcuJWS1hQEre022DGmNstofEsog2ByYuzwOmxAAMqPe1RX+0yzLguwcbTgVUeN5/D3Bi7JheaO8dyc/dmYq3R6T5ZlFo2rOavuFFDZyjhWeZgD5M2rcyDADwygVrp+2gF93eyBEdoU/g8el9eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744258979; c=relaxed/simple;
	bh=WT2yPYUqVLfzKKpbAL190/kCzBlT5OxuNjut9M0Yhjc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EjNycWaXcGulUe3U3RroMBlUTsbYpxCNt7QgUXJpVTzk5soWz6pFne75j82mxxK4fz+yyGAZPw8dNTDcgFhuom/b9BWgdTWPQsMw1GZ6J+XsBnaaKtc4wcB07WZb0RiYhYEZH8x4M+G85IxAQTUrKeqDym8bNhcZLc2N0qEU4uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201622.home.langchao.com
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202504101222487160;
        Thu, 10 Apr 2025 12:22:48 +0800
Received: from localhost.localdomain (10.94.13.146) by
 jtjnmail201622.home.langchao.com (10.100.2.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Apr 2025 12:22:49 +0800
From: Bo Liu <liubo03@inspur.com>
To: <xiang@kernel.org>, <chao@kernel.org>
CC: <linux-erofs@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Bo Liu
	<liubo03@inspur.com>
Subject: [PATCH 1/2] erofs: remove duplicate code
Date: Thu, 10 Apr 2025 00:20:47 -0400
Message-ID: <20250410042048.3044-2-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20250410042048.3044-1-liubo03@inspur.com>
References: <20250410042048.3044-1-liubo03@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: Jtjnmail201613.home.langchao.com (10.100.2.13) To
 jtjnmail201622.home.langchao.com (10.100.2.22)
tUid: 202541012224878572f2772b211192696efaeb6fd526f
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

Remove duplicate code in function z_erofs_register_pcluster()

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 fs/erofs/zdata.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 0671184d9cf1..5c061aaeeb45 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -725,7 +725,6 @@ static int z_erofs_register_pcluster(struct z_erofs_frontend *fe)
 	lockref_init(&pcl->lockref); /* one ref for this request */
 	pcl->algorithmformat = map->m_algorithmformat;
 	pcl->pclustersize = map->m_plen;
-	pcl->pageofs_in = pageofs_in;
 	pcl->length = 0;
 	pcl->partial = true;
 	pcl->next = fe->head;
-- 
2.31.1

