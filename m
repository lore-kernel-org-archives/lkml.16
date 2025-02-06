Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C6123642A
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738855457; cv=none; b=jDuUhRAKqfm3v931u60Bruzop3tyUv1dLzB9aOagi258gJXo6pToTy0/ggqHLrazU3V57WFeW9blO1nGEkERYCMpCJPo4Mp6gKnzbUWX04Zst9ANtarRYb9m62zCxTQFaqCFiQkiEsYI/D1sXlWMDkuVmRyKqJc2hx3bnGkultA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738855457; c=relaxed/simple;
	bh=6DbGvh/FCA96H1xrg9jUU9tSpSLpf+H4C3O3av3+/MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joAR89MArprIOZk9Am47xL4iZ1xJoi8+aidgYqCp9eYTHQr0gcT3R8hptoSD6BR6owH36DGnAREOhxEelAYExpQ2En/7lwGCq7Okd+1B7SSApLBdfxbqnw68g1P8+XuysO5zEn4latOcM2Z17+gdaPH6/Fff7GPPOTgP2l17/W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hiGNRe19; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hiGNRe19"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738855453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zI+yoKQYFqNC43fQb7Bn+MO2AksYYcxsUOssleccmqU=;
	b=hiGNRe19VOpZ5aSwU+Ek1aP+JKxo7d9jCnhSdAeEK68aImvJFwhVofAvSdcM7aYx4Yg7E/
	n/Pji5HQcqkuAJChZbo4M4GMJXziiWzQV6ageb7qOrDUUq0BueXeXEjLmFC5P6+crjdaf+
	rt1tVgrSFEgOc4PIKF24oEECdctS4sQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-549-wfw5Qy8GOsSKEjsGiplpHQ-1; Thu,
 06 Feb 2025 10:24:07 -0500
X-MC-Unique: wfw5Qy8GOsSKEjsGiplpHQ-1
X-Mimecast-MFC-AGG-ID: wfw5Qy8GOsSKEjsGiplpHQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D74BA1801A17;
	Thu,  6 Feb 2025 15:24:05 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.34.53])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 58D081956051;
	Thu,  6 Feb 2025 15:24:01 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu,  6 Feb 2025 16:23:39 +0100 (CET)
Date: Thu, 6 Feb 2025 16:23:34 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] exit: kill the pointless
 __exit_signal()->clear_tsk_thread_flag(TIF_SIGPENDING)
Message-ID: <20250206152334.GB14620@redhat.com>
References: <20250206152244.GA14609@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206152244.GA14609@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

It predates the git history and most probably it was never needed. It
doesn't really hurt, but it looks confusing because its purpose is not
clear at all.

release_task(p) is called when this task has already passed exit_notify()
so signal_pending(p) == T shouldn't make any difference.

And even _if_ there were a subtle reason to clear TIF_SIGPENDING after
exit_notify(), this clear_tsk_thread_flag() can't help anyway.  If the
exiting task is a group leader or if it is ptraced, release_task() will
be likely called when this task has already done its last schedule() from
do_task_dead().

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/exit.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 2d7444da743d..0acb94b17caa 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -204,7 +204,6 @@ static void __exit_signal(struct task_struct *tsk)
 	spin_unlock(&sighand->siglock);
 
 	__cleanup_sighand(sighand);
-	clear_tsk_thread_flag(tsk, TIF_SIGPENDING);
 	if (group_dead)
 		tty_kref_put(tty);
 }
-- 
2.25.1.362.g51ebf55


