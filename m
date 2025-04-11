Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467BA29AB1E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373982; cv=none; b=CBiJgY/IoLshz3oNjLgAN6AOnQmDhjd9JnIbD9MzlVB67vW8eHfjjon1xPTrylzvA729ljAlfNcqiSA1834Lnuj8J36xgy7pnoGA5P8G7QzWAUx4YCJjipFnPNQqQPPpgW4v5tubk2twO/ujbzwv2oTmJUA4qihlcgesNQjlKWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373982; c=relaxed/simple;
	bh=BZ1hw4hPnDqdx9SZMRS1DCWbSn/pHxaYjOx+c/l9exU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ri0Rp/jPBnuQsWWVBk/vt+tv+rGtlGH9mNdl+cEBO1OXPoBTnuo1i0by8xUOiBs60K2U8e7VJuxoNDURAUnhaNNSUilor0fh9i77U1ywRzXOvtiZVzH1cStJpwlK9ULYbyHbbLmhEK8Ff6/YlJzIVUqU0MBHE61Z87iFU6Eri8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WzoC44jV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WzoC44jV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744373979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=fRHnGzdHn9ejE3pccxgqN42b7XxG3q84PE7dcsxvZ1w=;
	b=WzoC44jVCkUab45YoUxxVz4wrPocMnRu2+6UV/+Wy48Qm3j4tAIDCNYsw6gTYHp4zQnn+5
	pj/cp0t8/xwPPNPtqGZBwBxghRO87hHmWAqEbq/0yTJ/v+Y+6mj57cwWXs/7Yvle0NENSZ
	j9mj1Bdrc78SJoR0BB47Pe3LynfMUcI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-339-MMYjxpdPNh6qCqQ_cpmk7A-1; Fri,
 11 Apr 2025 08:19:37 -0400
X-MC-Unique: MMYjxpdPNh6qCqQ_cpmk7A-1
X-Mimecast-MFC-AGG-ID: MMYjxpdPNh6qCqQ_cpmk7A_1744373976
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 62271180025B;
	Fri, 11 Apr 2025 12:19:36 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.222])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 1C2CE180174E;
	Fri, 11 Apr 2025 12:19:33 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 11 Apr 2025 14:19:00 +0200 (CEST)
Date: Fri, 11 Apr 2025 14:18:57 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>,
	Mateusz Guzik <mjguzik@gmail.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] release_task: kill the no longer needed
 get/put_pid(thread_pid)
Message-ID: <20250411121857.GA10550@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

After the commit 7903f907a2260 ("pid: perform free_pid() calls outside
of tasklist_lock") __unhash_process() -> detach_pid() no longer calls
free_pid(), proc_flush_pid() can just use p->thread_pid without the
now pointless get_pid() + put_pid().

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/exit.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 1b51dc099f1e..96d639383f86 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -239,7 +239,6 @@ void release_task(struct task_struct *p)
 {
 	struct release_task_post post;
 	struct task_struct *leader;
-	struct pid *thread_pid;
 	int zap_leader;
 repeat:
 	memset(&post, 0, sizeof(post));
@@ -253,8 +252,6 @@ void release_task(struct task_struct *p)
 	pidfs_exit(p);
 	cgroup_release(p);
 
-	thread_pid = get_pid(p->thread_pid);
-
 	write_lock_irq(&tasklist_lock);
 	ptrace_release_task(p);
 	__exit_signal(&post, p);
@@ -282,8 +279,8 @@ void release_task(struct task_struct *p)
 	}
 
 	write_unlock_irq(&tasklist_lock);
-	proc_flush_pid(thread_pid);
-	put_pid(thread_pid);
+	/* p->thread_pid can't go away until free_pids() below */
+	proc_flush_pid(p->thread_pid);
 	add_device_randomness(&p->se.sum_exec_runtime,
 			      sizeof(p->se.sum_exec_runtime));
 	free_pids(post.pids);
-- 
2.25.1.362.g51ebf55


