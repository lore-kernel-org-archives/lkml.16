Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8ED186A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 19:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743881548; cv=none; b=Sajx7vTldSztPO9SW4Z4SLS0/5dJopEpNMiBWFDqKJHexsfMuQBXfctVFuuGZ8onbpXcVXdKORnk3HB7YBpG0ujNwQyGdRuxMkbnJcPh6S6eIARfKPuiKnMBQZDEnD78C2Gg5optPvDEdtpi0U/dUrAuGKGyyHrBAvTK7PHjEbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743881548; c=relaxed/simple;
	bh=vHvqCSiW2MGBRz0l9bOc/zefZZh5UYTVjxHO1zNxoSA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WP1qNEffb3y08OGJ9u01VvUD/y6P+ciH67DXiwLYjQTovro+wL3D9CbsW1ZTMTB7jsjtIAM5G9gp4I2jLihnNrgqI8JaJ33wy+c9r+f+NJ9vtIoEhcm56s+AyQIfFjlU9BgjVITxdFrwWwzSvaAIbu80S7Iiep9fazQr2Gujv5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-8610d7ec4d3so583194939f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 12:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743881546; x=1744486346;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4bBjSLnZErUVvggytsybtPgXceJw1g6sQ/JR4P2izE=;
        b=n79GJK+kit5W9QHQESwfKKk5nKQq4vLXBcGcWZchVqrg/AXIGQkC4GbtrJkgcKTMhG
         n+uuWjABsb5MnJTCWTXhHkft/1DTdwNlnfN6wPox3fggsLGqp2fmKrkf8aTSTuOb3bA7
         NTXpR55PpDhPWpwKPY+cemZCZ7BrHVLg60j2LH9P3O01zsls/tLYzzghgvQZwNfe2iZs
         pSzKcS3RplK4F3oYU/KE8Z7YRvJvK29TD7p2EVXFj8/5S4G9D8Vzyl75zqLXsTMRzZAR
         /XH2KMSuuzJKlUUfFVtEHQCfxUfYiC5F/Q0yMc2vAZskfe4hdE16WHFR9PJGD4lXD2/P
         XuTQ==
X-Gm-Message-State: AOJu0Ywnzqek96vkIGv6WzfzHNb0hFF3/33BXcR98XQ0evVxcILB7YOg
	KwvqIJcdPYGvReqDJwS+8OEpbyHqwO/Mg6+mF0kYBAemIkvAx/DTYogL5+2fTT1TmPFxTxmvJpF
	Hu64zr4vP/Cw5mW99EODCPo8MA+d/8EuNtyHRLfz7q+76n5e2BbChtuE=
X-Google-Smtp-Source: AGHT+IFgRmEzTEj1oJB91prtSC1x+VEzViUUFN5u8ltAtCczIpDJxkL5cgxBz6VCx2oqSf4qXu45vtyi/r1ignLWXkMcTm9/mP8m
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:188b:b0:3d4:e6:d872 with SMTP id
 e9e14a558f8ab-3d6e533d77amr72903865ab.9.1743881546238; Sat, 05 Apr 2025
 12:32:26 -0700 (PDT)
Date: Sat, 05 Apr 2025 12:32:26 -0700
In-Reply-To: <67ef83fe.050a0220.9040b.0366.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f1854a.050a0220.0a13.0248.GAE@google.com>
Subject: Re: [syzbot] #syz test
From: syzbot <syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test
Author: gshahrouzi@gmail.com

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 0bb21659e252..153ba622cfa0 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -14016,6 +14016,9 @@ inherit_event(struct perf_event *parent_event,
 	if (IS_ERR(child_event))
 		return child_event;
 
+	get_ctx(child_ctx);
+	child_event->ctx = child_ctx;
+
 	pmu_ctx = find_get_pmu_context(child_event->pmu, child_ctx, child_event);
 	if (IS_ERR(pmu_ctx)) {
 		free_event(child_event);
@@ -14037,8 +14040,6 @@ inherit_event(struct perf_event *parent_event,
 		return NULL;
 	}
 
-	get_ctx(child_ctx);
-
 	/*
 	 * Make the child state follow the state of the parent event,
 	 * not its attr.disabled bit.  We hold the parent's mutex,
@@ -14059,7 +14060,6 @@ inherit_event(struct perf_event *parent_event,
 		local64_set(&hwc->period_left, sample_period);
 	}
 
-	child_event->ctx = child_ctx;
 	child_event->overflow_handler = parent_event->overflow_handler;
 	child_event->overflow_handler_context
 		= parent_event->overflow_handler_context;
-- 
2.43.0

