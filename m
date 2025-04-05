Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FAC155C83
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 22:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743893934; cv=none; b=kG1hzriSJDl1KqcIO2+2+HjiYK7DwTUmFKWMDXbI5hwQAkqBTh5Jl6eld4ok/mwfbLvPqdwZnD1+OQAesj+oY9zknq8NGl1/Ila3YBqBkfJl7ZJvin+twrqOHQ3XDgoSr/K5mWtup6fUyWB5WqxbycGi0QQeVUps2932005TqbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743893934; c=relaxed/simple;
	bh=Vv/1nrjbB0N6oSUQnle4z/hmp/ZoxYc2QLsAtVlSJGw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WOcQgmmXAQpFoGC7tLbfBPNm8WTsGawnsHr8NDNnDFf2YlaQYVNtvKDjZ/K6l/ubK++x5o8MkD2J4upqg9wXhHK5MwaSorhvNirEaGb1Lep+n/aCN92i7+szVRKBGghfrNhwdvNr34RgpcYyPCbGgtQdq71inXGDH3eLuVjcAIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d453d367a0so71059775ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 15:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743893931; x=1744498731;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HVXdluS3rhDlFu5VAlXH7P2j11H3pZJUuHk2z4o3VnU=;
        b=vY/UklUW5mMJbAn2cYJ/B3B4+NFxGUlXPuIo5s/xYAFHXPgoFg+MdwWkHey56lj61L
         d/Mbdjnlc9mZ+ILGvqNYzjS7tNeqgLkUQwSiiFVEzgipyVv2csEFXFng0HJrWkYyJsmn
         wXt2PgN2hVAfsSZvDkDl3rBomNmq4Lg/mgr73wLygsuy7IK3HE01bu8MHrRQ722pO342
         m1emR1jAYxxVBOtuNjhwo/YPRqImIbfJSRJ1pR3OSw9RZxcRrhSPvdVTxncxh9E4BnaI
         Fs0vef0T+QVDQq6JFyGThcPX8a/gyNnqMbPk1B4qufPcgylDON9zqBK9scgx3ixI8/er
         0GEQ==
X-Gm-Message-State: AOJu0YxD6/A4zPkRBIXmlTTlrRNfD2Oj4AbhoAbgtCVE2v+zvItZAa/q
	0fgh6/VwGGajJv6V++8G03KJzq4PpjgbPleKuQ0QnMCdjijP0Sx2vZ1JMhiiruqoA8VEFj8fIlG
	QaPkM94mymb3my7wX5s478Jz8x/I8D8byMtDxULN7YKO9xPw/ezgmo14=
X-Google-Smtp-Source: AGHT+IFKBabwy73/oIkRyHZQiqG5UNpPv08gzd2VVQDS2AtOvNaj534iQZoIemDZBUrFUTs1AoHKkmYbfAQwRxVN+oMKNb19a1bj
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:216b:b0:3d4:2306:6d6 with SMTP id
 e9e14a558f8ab-3d6e3f89f84mr106999145ab.21.1743893931422; Sat, 05 Apr 2025
 15:58:51 -0700 (PDT)
Date: Sat, 05 Apr 2025 15:58:51 -0700
In-Reply-To: <67ef83fe.050a0220.9040b.0366.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f1b5ab.050a0220.0a13.024f.GAE@google.com>
Subject: Re: [syzbot] #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 5fc31936081919a8572a3d644f3fbb258038f337
From: syzbot <syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 5fc31936081919a8572a3d644f3fbb258038f337
Author: gshahrouzi@gmail.com

Move the get_ctx(child_ctx) call and the child_event->ctx assignment to
occur immediately after the child event is allocated. Ensure that
child_event->ctx is non-NULL before any subsequent error path within
inherit_event calls free_event(), satisfying the assumptions of the
cleanup code.

Reported-by: syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ff3aa851d46ab82953a3
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 kernel/events/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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

