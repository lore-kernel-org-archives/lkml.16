Received: from outbound.pv.icloud.com (p-west1-cluster4-host6-snip4-1.eps.apple.com [57.103.65.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD93F1D5ACF
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.65.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747838295; cv=none; b=L9AgEIXEGDTuz/p/PxXoW7ju0YTUCUlo6o9Y372m/cxCET+DwsGb+SOu9fGHfgz0zTbzD4keJnOCZtKsieYuBBmp5kQxSgVocSk2AKffrF3+0HSmhR+6elV6fnLrpK+5mKI2cyLVV02ApgVVxwnm4iCoiVpiDlLh/P1inA0ExXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747838295; c=relaxed/simple;
	bh=VGXc7C9KgOVeivLYtZeEs0rXP2hnNDMMNme/u5LUQ4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BoOm0ceuH2JSLdnFuVWoWAuO6N9aNBXf+j4YqnpJ+uoUxzfUgo3NACS4Rbv4QUKksj/hLCkWzW+ewI7gyC3OPeHXuILChAHRvju0BoQeHbZFJxWvQ8sgPdEnyyq6eFAPpSkiwh8i41wcKUHycdSBUNtgKfQKGFxgEAejKonATJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ai-sast.com; spf=pass smtp.mailfrom=ai-sast.com; dkim=pass (2048-bit key) header.d=ai-sast.com header.i=@ai-sast.com header.b=rLYOnsJN; arc=none smtp.client-ip=57.103.65.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ai-sast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ai-sast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ai-sast.com header.i=@ai-sast.com header.b="rLYOnsJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ai-sast.com; s=sig1;
	bh=IQK5CMvUr7ljq54rqfVmy7AkMHHlxRcPEzHe4uG8uIM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=rLYOnsJNUuzlqo+QKoXeXox4jN/t/4awhM6hNfUOpvmPBczb48X3JMMxdqGoClgzy
	 4mke2eMlCH+MTQiojXdW7UJxSWHO7HZJnYL4gNJ8x0McYL4MPGhsFRv7fXDmJ6brPO
	 20Qrz7Em3/KTQ2wkJa3+nhFf13HcunYFMv3Twoz7Gr0GD8e2h2lgnRQTyQSAnu99eW
	 +w+BAVjd7r31+n3CPgCkdkWEeb9JBCnmeorx9Rx/jCtJhuxxn70V61BHvDF4tmKrEp
	 +dQ7vKoeRbZnripBQYjYyG2p4kcQMyO3uLtRnhsaz+kzkxAleDgGqAR7i44gNrgTYG
	 vlmDGuiJjRjyg==
Received: from outbound.pv.icloud.com (localhost [127.0.0.1])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 4838A1800943;
	Wed, 21 May 2025 14:38:09 +0000 (UTC)
Received: from localhost.localdomain (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 14F4D1800962;
	Wed, 21 May 2025 14:37:46 +0000 (UTC)
From: Ye Chey <yechey@ai-sast.com>
To: idryomov@gmail.com,
	xiubli@redhat.com
Cc: linux-kernel@vger.kernel.org,
	Ye Chey <yechey@ai-sast.com>
Subject: [PATCH] ceph: fix potential NULL pointer dereference in ceph_msgpool_get
Date: Wed, 21 May 2025 22:37:01 +0800
Message-ID: <20250521143701.60625-1-yechey@ai-sast.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EDSiGARDhqu4sopme99PlElsL9QNe9uz
X-Proofpoint-ORIG-GUID: EDSiGARDhqu4sopme99PlElsL9QNe9uz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1030
 mlxlogscore=971 adultscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2503310001 definitions=main-2505210143

Add NULL check for mempool_alloc return value in ceph_msgpool_get to prevent
potential NULL pointer dereference when memory allocation fails.

Signed-off-by: Ye Chey <yechey@ai-sast.com>
---
 net/ceph/msgpool.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/ceph/msgpool.c b/net/ceph/msgpool.c
index e3ecb80cd..e9d81c76d 100644
--- a/net/ceph/msgpool.c
+++ b/net/ceph/msgpool.c
@@ -74,6 +74,10 @@ struct ceph_msg *ceph_msgpool_get(struct ceph_msgpool *pool, int front_len,
 	}
 
 	msg = mempool_alloc(pool->pool, GFP_NOFS);
+	if (!msg) {
+		dout("msgpool_get %s failed\n", pool->name);
+		return NULL;
+	}
 	dout("msgpool_get %s %p\n", pool->name, msg);
 	return msg;
 }
-- 
2.44.0

