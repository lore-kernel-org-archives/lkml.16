Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2601BC2A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 17:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743873137; cv=none; b=kxdjggsvqQK2PIUZHEjlkMLs0Skw4Yy9/oD9ZxJgh5w0gzuCDVAunC7Y9B3P+KjSvNSkoot4kg1rK3jOH4RhQ8UI9V42n/Jjfc0C3o5QH5WkEBu3bubcTo2b1dujqTgJ0URn5av7+1Q4bEhX6HsSK5y4tgsJxz7A9VVZgUrLfU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743873137; c=relaxed/simple;
	bh=CVOcKUDZBIPDU8lXdK+Y0lVv6c+uU5JjYv7RWMPVzqs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qqI8VwXPy7DBTouIhXM8+bAg8+ENE9lwIr8MlgBvQGwyxy2aQ96UJ1Yn3NvydHfiK/C6HvroxoVFOB0xXRY5IR+3ympC78El5FV5dXqrfCuDJ+y5qym3u9G9ntMMVCmeocLb3+9RRkl6C6P7ttNNe0Pjdz+ttWRfRaxgomkOVKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d5b38276deso53410045ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 10:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743873134; x=1744477934;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nT+HSTHiZ9CsHaz5CeBYSjEeXYVheQIiifj11yIZg9s=;
        b=Fa8DI56XiL9hBPf+mGynBxGtvm+hhEvLKyBZtjz8MVLvSd9Uusv5Z+N3gL+ZiUGUua
         gnWeu24NnWL8nakmrkKdn8I/bxln54+kO2BZsFmBJyfxLo+SanjAYzX8+aMmOA1eSnPw
         ILyovLMQ/A2q7g0iV9iIkY9bWmR+K2lujQjgash2ITGOebny6C+pwQ/SkIP8x93low/Z
         GDmsfOVUftKndNG4hMKH204QGtr1bTufaLrjPF7bl4Ao6mFhn3npK06VRpNoc2Tl0S8j
         8rxUqLC2gLOD62DyamCM9VHBIKhaYR3OVGQzrUe7a0JPL30m1xrqLk9wzZ78xQ0ejnMs
         tmkg==
X-Gm-Message-State: AOJu0YxaIgoIZNHcQf3sWTP1zwexGa4svY5NJkjL2m3mM+Wu82a7kDOr
	8mQJx8lEIjqa+LBWnS4Z8YHwyXkJmk9lO21eCsFQ1tRrchflNNh8hCoo1lPKcO5ey7R7k5a970M
	xL52aLCJLW8sS4+uZVi1xow9A1GEi2Pz7sGPJBy5denJKhRVIR2BJmPs=
X-Google-Smtp-Source: AGHT+IGSYu5a65fgnsqoWEpL4xU+Z+4XO0o5Xuv7h/2MYMzgKYNA+3jIEDgSrziQlRknQyuFDLWzXRWqB+1EUxRpjBu7/Vq78ZQs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3089:b0:3d1:7835:1031 with SMTP id
 e9e14a558f8ab-3d6e53181dfmr82745475ab.7.1743873134667; Sat, 05 Apr 2025
 10:12:14 -0700 (PDT)
Date: Sat, 05 Apr 2025 10:12:14 -0700
In-Reply-To: <67ef83fe.050a0220.9040b.0366.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f1646e.050a0220.0a13.0243.GAE@google.com>
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

+       get_ctx(child_ctx);
+       child_event->ctx = child_ctx;
+
        pmu_ctx = find_get_pmu_context(child_event->pmu, child_ctx,
child_event);
        if (IS_ERR(pmu_ctx)) {
                free_event(child_event);
@@ -14037,8 +14040,6 @@ inherit_event(struct perf_event *parent_event,
                return NULL;
        }

-       get_ctx(child_ctx);
-
        /*
         * Make the child state follow the state of the parent event,
         * not its attr.disabled bit.  We hold the parent's mutex,
@@ -14059,7 +14060,6 @@ inherit_event(struct perf_event *parent_event,
                local64_set(&hwc->period_left, sample_period);
        }

-       child_event->ctx = child_ctx;
        child_event->overflow_handler = parent_event->overflow_handler;
        child_event->overflow_handler_context
                = parent_event->overflow_handler_context;
-- 
2.43.0
