Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC09E2836A3
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635410; cv=none; b=ocM8NgHqYuLfzZ7lFNZvZZuRgAZ0d54tYJaJYxCEnUnOJKx9gY9w+qQk2HSc4con1gPyzbWSpgFJFauC9vjP+XPGasB6lm2a8w0QWVZINxNj/n3yAS/4Myde9L/ecOsHDV4pSBHETywNbVC9/vdg1vcot3U1GseISAh919DAi4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635410; c=relaxed/simple;
	bh=XRQdsbpohIJQx39lQd5ufvr9OER85OhmOTqmMz0Mvsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8q8/we5oITG05v8px9EUEpVegYZErp+Stk0FCCpe7AXFiko+zU5hEibgULUcjC1fExCMa1ysotLaTMl21XONBPam/O0SAisGCdXfgs+aSuf0UdDhTRyyuJrc2HdHANXHPPBuhFXb62m9TbPqqDvbX91gu87jxzHgB/0VKm9fxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iLXdVc6C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iLXdVc6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748635407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v4pwi3lxjSBtkiKQkrg6DQ1FECfBbO4dmGW/XGDv6cM=;
	b=iLXdVc6CTPDwQYCavHkSIvbavdAjKpsFO+pcCY3tStUsC1OBJ80M9OYD0QvYagx05thShX
	/0/kURRdNGQE+2T/1mXe/fQS6VSBFhx5h4C4OP+7bNbKivZj6VZk8j+C9RhlMydQgcn5CL
	5AQ4IlcI0j9X20If59pWCUKLdMVrIKY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-dgOqtYwOMrGnYxKkT_HQ2g-1; Fri,
 30 May 2025 16:03:24 -0400
X-MC-Unique: dgOqtYwOMrGnYxKkT_HQ2g-1
X-Mimecast-MFC-AGG-ID: dgOqtYwOMrGnYxKkT_HQ2g_1748635403
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F27F81956046;
	Fri, 30 May 2025 20:03:22 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.64.162])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D85EE1954195;
	Fri, 30 May 2025 20:03:21 +0000 (UTC)
From: Joel Savitz <jsavitz@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Joel Savitz <jsavitz@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 3/3] kernel/nsproxy: utilize cleanup helper for nsproxy references
Date: Fri, 30 May 2025 16:03:06 -0400
Message-ID: <20250530200305.85319-5-jsavitz@redhat.com>
In-Reply-To: <20250530200305.85319-2-jsavitz@redhat.com>
References: <20250530200305.85319-2-jsavitz@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

A cleanup helper for nsproxy references was added by commit d057c108155a
("nsproxy: add a cleanup helper for nsproxy") however it is only used in
commit 5b08bd408534 ("pidfs: allow retrieval of namespace file
descriptors").

Simplify nsproxy code by using this cleanup helper.

Signed-off-by: Joel Savitz <jsavitz@redhat.com>
---
 kernel/nsproxy.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
index 20b07120dbfd..c623e9ce3c2a 100644
--- a/kernel/nsproxy.c
+++ b/kernel/nsproxy.c
@@ -228,7 +228,7 @@ int unshare_nsproxy_namespaces(unsigned long unshare_flags,
 
 void switch_task_namespaces(struct task_struct *p, struct nsproxy *new)
 {
-	struct nsproxy *ns;
+	struct nsproxy *ns __free(put_nsproxy) = NULL;
 
 	might_sleep();
 
@@ -236,9 +236,6 @@ void switch_task_namespaces(struct task_struct *p, struct nsproxy *new)
 	ns = p->nsproxy;
 	p->nsproxy = new;
 	task_unlock(p);
-
-	if (ns)
-		put_nsproxy(ns);
 }
 
 void exit_task_namespaces(struct task_struct *p)
@@ -368,7 +365,7 @@ static int validate_nsset(struct nsset *nsset, struct pid *pid)
 	unsigned flags = nsset->flags;
 	struct user_namespace *user_ns = NULL;
 	struct pid_namespace *pid_ns = NULL;
-	struct nsproxy *nsp;
+	struct nsproxy *nsp __free(put_nsproxy) = NULL;
 	struct task_struct *tsk;
 
 	/* Take a "snapshot" of the target task's namespaces. */
@@ -483,8 +480,6 @@ static int validate_nsset(struct nsset *nsset, struct pid *pid)
 out:
 	put_user_ns(user_ns);
 	put_pid_ns(pid_ns);
-	if (nsp)
-		put_nsproxy(nsp);
 
 	return ret;
 }
-- 
2.45.2

