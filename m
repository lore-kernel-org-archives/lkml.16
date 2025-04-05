Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EF942069
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 22:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743893578; cv=none; b=ZZpWjxKXewem74oqFRkZ6vxMlppYSpizsd3Av+cjYyOTH7i7s14B5GY9YOpgvW2c6DP7oL9ZaY3QepZImAZIuE8GMDub1L43U5R4gKUhK77OCjMUh38rUYP0WA1WU1uk5D3SeDLIdOhO+oS1aJ/vI5wJ6IFt/IpAJZmiEfIFoFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743893578; c=relaxed/simple;
	bh=vLAgDUGwFY1RpwaMRwbUxIAOvcczmxQd8B4F18vrRTk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=H577e3FI+gEgSz7/4b4MtIJUvzLXldHgXfgcDLbLLtDwolExK1Udsuf+1meMgilcAnUHg6jw3QWbFmzGJubP+QQ9LwffDmUksqWDF5tyszVxUqRTDa9R39SWCBiBb/MUOTPsXLd96wymtz61REs1wxs/a1KnjsvqQp5Oqk63kEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ce8dadfb67so40426755ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 15:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743893576; x=1744498376;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vM2U36HAJ7vgnqg7dmENYBbu8/qhFzocNaHLQf68foE=;
        b=NGQEQGGhbdzcxxDsROn+enw6t0bhrAYHZwZ5Wr6iRP6Qpmu8lYjoHRJx5ooKqz6RXj
         yykwcjbTn1MBdDbE8uCc3J49okmTvdhTT4woRspUamX73LNy/w7rofXOh26rtsrI88DN
         mK8LAD2ELDIRAGn83WQozns5VREFQxGo8Cr7k/009TWB0yB+lQWij3YqbnDXs/yHXiXR
         k2k+aZtvwI9OCYFuhBDtZ8NFnrUR/ioG/KPKrRtljSvjsYyw/ksdPRrSRPl9pPyMuAFb
         vs6p/Osve4f8RdTsesblVoMBaCl2uGUaa7ACgp37eA3ZxLqrGO8KnZgFuvLeXdx4vR1I
         eGdQ==
X-Gm-Message-State: AOJu0Yxg8x+G1WoQ9PY0O091RElZJHB1/yFGbeRpiHRGSLs6WQrf9lVK
	Jne1r1JQyBMYbVM1lBVnZkDgXaTjz5RwpbpwVmlWVcNAt9u7kQgvVdsfMxCAoaPXYC5broh7pn0
	1VGh/JRKrp0s5yY8dhKyFH9j8K16LrATIV/YMpycYEGKYXseBF7Dsvv0=
X-Google-Smtp-Source: AGHT+IEGcfBkjlTyrqpFLx4LFda6UTljl8JpKzObVYu5PQEapXpU4nn87nDdBQBEokPmMG7rIJF97/mr1APXPZqS+EtLdC03wTXu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3081:b0:3d3:cdb0:a227 with SMTP id
 e9e14a558f8ab-3d6e5324ab2mr71173785ab.9.1743893576079; Sat, 05 Apr 2025
 15:52:56 -0700 (PDT)
Date: Sat, 05 Apr 2025 15:52:56 -0700
In-Reply-To: <67ef83fe.050a0220.9040b.0366.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f1b448.050a0220.0a13.024d.GAE@google.com>
Subject: Re: [syzbot] #syz test: git://git.kernel.dk/linux.git master
From: syzbot <syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test: git://git.kernel.dk/linux.git master
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

