Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7784278E5D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.251.27.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744367446; cv=none; b=e6ho4bO1ltM+qLrHZlfrslMBrwNHMuoD8BBtahHayrFA+k6G/k5NZ+lxP7kQsc1cj3E4B/mYZpC+LtcVdzPqqpujzDFFOUIq8Ytqw0gCMu675TtA03f4OwpZ/UQXzQePd0OERM3Qwl5d0SmjnZYn5YTVqXBttXrH1bO+/dNY0Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744367446; c=relaxed/simple;
	bh=F9ZVS7uMc2q4H4pc2JAAa9mcfQxEK9dcS46bLi6g7U4=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=be4gf+eiaBRO88E4ZK4zTpY/yDaWXhrQ5c2a8a4PQrHY8/93t613XOY7kK62IimL/LhfjRDPlLLompbKgAdC8c0UIzHcIdquPpwimnaErdpLn6yHNJkrZ6VGWJ51MAtQ3NwwOKz6UlkwPJVt9ZBQmETuwmxWRVedp58pUhctP74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=58.251.27.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZYt9G3RBTzKjJ
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:25:06 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4ZYt990HDXzBRHKW
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:25:01 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZYt8z3Tztz5B1J4;
	Fri, 11 Apr 2025 18:24:51 +0800 (CST)
Received: from njy2app03.zte.com.cn ([10.40.13.14])
	by mse-fl2.zte.com.cn with SMTP id 53BAOjIV027590;
	Fri, 11 Apr 2025 18:24:46 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njb2app05[null])
	by mapi (Zmail) with MAPI id mid204;
	Fri, 11 Apr 2025 18:24:48 +0800 (CST)
Date: Fri, 11 Apr 2025 18:24:48 +0800 (CST)
X-Zmail-TransId: 2afd67f8edf0fffffffff09-ab5a3
X-Mailer: Zmail v1.0
Message-ID: <20250411182448645tJ7XVmvNHqUXluy9xYQ_7@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.kun2@zte.com.cn>
To: <tglx@linutronix.de>, <frederic@kernel.org>, <peterz@infradead.org>,
        <oleg@redhat.com>, <brauner@kernel.org>, <joel.granados@kernel.org>,
        <viro@zeniv.linux.org.uk>, <lorenzo.stoakes@oracle.com>,
        <linux-kernel@vger.kernel.org>
Cc: <fan.yu9@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBzaWduYWw6IFVwZGF0ZSBzZW5kX3NpZ25hbF9sb2NrZWQgaW4gcmVsZXZhbnQgY29tbWVudHM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 53BAOjIV027590
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67F8EE01.000/4ZYt9G3RBTzKjJ

From: Fan Yu <fan.yu9@zte.com.cn>

The __send_signal has been renamed to __send_signal_locked,
after the following commit:

'commit 157cc18122b4 ("signal: Rename send_signal send_signal_locked")'

But some comments have not been modified along with the
code, so they need to be updated. This will help readers
better understand the code.

Signed-off-by: Fan Yu <fan.yu9@zte.com.cn>
---
 kernel/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index 148082db9a55..af5f8bb50491 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -2252,7 +2252,7 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
 			sig = 0;
 	}
 	/*
-	 * Send with __send_signal as si_pid and si_uid are in the
+	 * Send with __send_signal_locked as si_pid and si_uid are in the
 	 * parent's namespaces.
 	 */
 	if (valid_signal(sig) && sig)
-- 
2.25.1
