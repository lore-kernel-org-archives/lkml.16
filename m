Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659B31E9B01
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738245404; cv=none; b=ABEwf9U0k/xnKJqC/7JB4KN2EXyjGcCeQ3ZsQpyPXB2gVk29BDWXkLs4GWEWnGOtcxUnkyB8WQOyBEBpXNAaNfXqh0Q78N28RQq78bu28HhwvcHgdPu7vDIXbjeNto14/Vb5KCQs/hAokKGr8r9EK8/bZF7sBDpTGyadsViMhCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738245404; c=relaxed/simple;
	bh=g0d1WeXvq6Xn8ifYHVuYao7Y1sjKWiBoiqlf7KqX2RY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHTDorQIDNcNrkLPTit+8SmP6HIsfZsBe8p8IlEHbJ55IHvGgi2Mr6VIHLUTTA9UvpXByyUzJxU/czKo1fmt5hki4mnLzTfcadteTUZMTJ3z6g0kw1aOfhdN4GhqTjspO7plpa1T/ujsFRW51/XKIswJ9wHeXyor2HpZquFDZ7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fByHpEPj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fByHpEPj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738245400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pW7fdJ0dDdWhu8G/+S1u5Fbt6vZEjXQe74WQ+27cozU=;
	b=fByHpEPjX0easuT/10MMxn7Kghv+RtZJVWNVSmatWtMrSFVfxPEXntg2g7Qh1eqyFi10Dr
	u5FWOxHBdd50uN6IJ3+oa7HK6mc8qbfkbXvgfY+07saiyVvNAo3QTpbBSY/2SxyODh0n3d
	nsu4xa88R+uKiB+G+nqdSTxn5NrGfkY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-88-86FrBdMHNrC3xcIxhASqEA-1; Thu,
 30 Jan 2025 08:56:35 -0500
X-MC-Unique: 86FrBdMHNrC3xcIxhASqEA-1
X-Mimecast-MFC-AGG-ID: 86FrBdMHNrC3xcIxhASqEA
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B2BCA1801330;
	Thu, 30 Jan 2025 13:56:33 +0000 (UTC)
Received: from pasta.fast.eng.rdu2.dc.redhat.com (unknown [10.45.224.234])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7D59C1800268;
	Thu, 30 Jan 2025 13:56:31 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Andreas Gruenbacher <agruenba@redhat.com>,
	Christoph Hellwig <hch@lst.de>,
	gfs2@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] gfs2: switch to lockref_init(..., 1)
Date: Thu, 30 Jan 2025 14:56:22 +0100
Message-ID: <20250130135624.1899988-3-agruenba@redhat.com>
In-Reply-To: <20250130135624.1899988-1-agruenba@redhat.com>
References: <20250130135624.1899988-1-agruenba@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

In qd_alloc(), initialize the lockref count to 1 to cover the common
case.  Compensate for that in gfs2_quota_init() by adjusting the count
back down to 0; this only occurs when mounting the filesystem rw.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/quota.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 58bc5013ca49..6ae529a5388b 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -236,7 +236,7 @@ static struct gfs2_quota_data *qd_alloc(unsigned hash, struct gfs2_sbd *sdp, str
 		return NULL;
 
 	qd->qd_sbd = sdp;
-	lockref_init(&qd->qd_lockref, 0);
+	lockref_init(&qd->qd_lockref, 1);
 	qd->qd_id = qid;
 	qd->qd_slot = -1;
 	INIT_LIST_HEAD(&qd->qd_lru);
@@ -297,7 +297,6 @@ static int qd_get(struct gfs2_sbd *sdp, struct kqid qid,
 	spin_lock_bucket(hash);
 	*qdp = qd = gfs2_qd_search_bucket(hash, sdp, qid);
 	if (qd == NULL) {
-		new_qd->qd_lockref.count++;
 		*qdp = new_qd;
 		list_add(&new_qd->qd_list, &sdp->sd_quota_list);
 		hlist_bl_add_head_rcu(&new_qd->qd_hlist, &qd_hash_table[hash]);
@@ -1450,6 +1449,7 @@ int gfs2_quota_init(struct gfs2_sbd *sdp)
 			if (qd == NULL)
 				goto fail_brelse;
 
+			qd->qd_lockref.count = 0;
 			set_bit(QDF_CHANGE, &qd->qd_flags);
 			qd->qd_change = qc_change;
 			qd->qd_slot = slot;
-- 
2.48.1

