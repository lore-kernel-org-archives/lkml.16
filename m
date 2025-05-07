Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0771028BA9F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634426; cv=none; b=b8a+SNC9Nov/i6yxsSiP7j4UTsDLoYVTmBckxoPyxGi5OB2c2LPIs8unKQI9lo9QM6laiGxTrMBgJQfs54q724mVGg0wv99Y0eyk2aoOPSqcfXASlaN9pRf3V2gxWk7YqENi2YsUq/okE2jDSpD0E/nS/xm+5Vpe47KfSAW3GPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634426; c=relaxed/simple;
	bh=5e45aDzAH7t95C5B/aJGSYvpa9QuYmtMdfTw6BQKisI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t2xpms/O83kgjLzRfNWTP0EfKklMUKQv5EF6H4K1ncRnJBEt8R40ICAsc8AvUlNN9+CN1GIAOdohEkc12N8u8oYnG5DVihFQJ8DKpMbBob2gpb3liGohIiqF13swuE9Orbw8yuMhBnVjGf4itP7kxA2jM2Jyt8VOxIvee9WLd5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DTbmcNMR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DTbmcNMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746634422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jxzyRfg0ZO1i2ZTEwzpPVyqJr7Rsqgi/bUeevvGUDPk=;
	b=DTbmcNMRu8pfH+EMxe5IoxunJIRBe7AieyeEch4rd/SB3weAsc3qz2VAI4rTVr4+owA3HJ
	bxS43i8MFc/IGlRWNv+a62EmzEWvxb+a8r39hunkF/M9FL+Coz1vpkAbKzYiMqsShU3v0l
	aH+6vAVbZKciBA7JHnd15pi0uIDWTH8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-149-aQe6vRaFNEqwjKu7YY4MRA-1; Wed,
 07 May 2025 12:13:39 -0400
X-MC-Unique: aQe6vRaFNEqwjKu7YY4MRA-1
X-Mimecast-MFC-AGG-ID: aQe6vRaFNEqwjKu7YY4MRA_1746634418
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 605C019560B4;
	Wed,  7 May 2025 16:13:38 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.66.50])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CAF2D1956055;
	Wed,  7 May 2025 16:13:36 +0000 (UTC)
From: Joel Savitz <jsavitz@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Joel Savitz <jsavitz@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH] kernel/nsproxy: guard all put_*_ns() calls
Date: Wed,  7 May 2025 12:13:28 -0400
Message-ID: <20250507161328.156909-1-jsavitz@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

In free_nsproxy() and the error path of create_new_namespaces() all
calls to put_*_ns() are guarded by a null pointer check except for
put_cgroup_ns() and put_net(). When CONFIG_NET_NS or CONFIG_GROUP is
unset, either of these functions may be called with a NULL argument.
This may or may not be handled correctly, but at the very least it is
certainly quicker to just perform the null check in all cases.

Signed-off-by: Joel Savitz <jsavitz@redhat.com>
---
 kernel/nsproxy.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
index c9d97ed20122..2b12d2c5d2e0 100644
--- a/kernel/nsproxy.c
+++ b/kernel/nsproxy.c
@@ -124,9 +124,11 @@ static struct nsproxy *create_new_namespaces(unsigned long flags,
 	return new_nsp;
 
 out_time:
-	put_net(new_nsp->net_ns);
+	if (new_nsp->net_ns)
+		put_net(new_nsp->net_ns);
 out_net:
-	put_cgroup_ns(new_nsp->cgroup_ns);
+	if (new_nsp->cgroup_ns)
+		put_cgroup_ns(new_nsp->cgroup_ns);
 out_cgroup:
 	if (new_nsp->pid_ns_for_children)
 		put_pid_ns(new_nsp->pid_ns_for_children);
@@ -201,8 +203,10 @@ void free_nsproxy(struct nsproxy *ns)
 		put_time_ns(ns->time_ns);
 	if (ns->time_ns_for_children)
 		put_time_ns(ns->time_ns_for_children);
-	put_cgroup_ns(ns->cgroup_ns);
-	put_net(ns->net_ns);
+	if (ns->cgroup_ns)
+		put_cgroup_ns(ns->cgroup_ns);
+	if (ns->net_ns)
+		put_net(ns->net_ns);
 	kmem_cache_free(nsproxy_cachep, ns);
 }
 
-- 
2.45.2

