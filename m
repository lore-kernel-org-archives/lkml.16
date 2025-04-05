Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92061865E3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 22:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743893144; cv=none; b=Rgfcdo4k0iMDy6fvS/1gzaGhHfnAh4qggclx4nlfnu9Kw8hJznCCO5VWAh6xatKJMWl/rLgG1GFW/MfL4JTvcxQ4/yydA+sJP3In6c/e5WI0AljgfEDX5VGrjzT7gAvkh6mzO/TpZ8zfDQvznrjotFRqX8gQ6Q0skQ34SEzjDBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743893144; c=relaxed/simple;
	bh=vXrhIOF4ZU3aW0HkhIw3HhIbl7AJE4qK7/LV2XqqabI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HuRhvyfw2tfqj5zE9Ije9HWoO1l6nW/48zYxaSjZshx09+phre4wFDOg9BlmvxPwmZJoNSFJqnjL2qjw47MhW4tCRc7z8Dmqb0KxCjaBb/OGnXkO1rZ529WrzVHPLqAK3PmSGRsAHJAfl+i+SM4otolG4en5JCyGMyaMkoUJc6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b418faf73so740508039f.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 15:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743893142; x=1744497942;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O2qfbwdToQX+L9OrY30l80wmXKfRnxSnf5RIZPHXkVc=;
        b=gohcecIfigorZKNmrqBpnNa6FzlDbuy/VMLTVcX2JmxFw7or9KH/RuDe+XwCK0HR3t
         HT/v7UoV1av/J/6xbPs8vtrDtdtxWaWFVsZajuLbWvnDcj4qAxhaSsBxdGEVROB2SJB3
         IkoNHD1VMS/sLa98Gcu6QkoEySMKHCP7QxjmTUsYHsXymTdku5Z0X10o7pZm3S3p6Rg9
         dKJPAgSh5BD20I4SFKZkLFdJV/a47VqS7HKeI7RcBsd4McZNCXrW2gfgetD+8HQ5htln
         o79aL/O27UrDTe/iZtYEPGYMGvWzc1tF9Ge1dE1M71Q2T0e5ScAyxdyCpVvim57n45S8
         femg==
X-Gm-Message-State: AOJu0YzGCHi3ypc9zsHZ3QOeYGYILelr5dU9H5vSt/enSPF25NbEuDz+
	9G1JGc0sXcnmwWZy5RDxxcg/keex33lS4HrTCstldHz/9lHCdR5kjRWPDUnUlGqktheAQFUorWX
	UXruThAlUEOYJbzS4/MHoCmJZkLIS6X2THX97yjbnr5fAv9g+0esk92E=
X-Google-Smtp-Source: AGHT+IGZCzIGT3Yy+6p05jbQkgK/WkUjoNNX73ciCqfxvySOybq/Lmaa9CC9zQCz6rlYSs2829xwVfR3yATgklf3LwMzv9OP4AME
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:339f:b0:3d3:f040:5878 with SMTP id
 e9e14a558f8ab-3d6e5999368mr91080625ab.21.1743893141972; Sat, 05 Apr 2025
 15:45:41 -0700 (PDT)
Date: Sat, 05 Apr 2025 15:45:41 -0700
In-Reply-To: <67ef83fe.050a0220.9040b.0366.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f1b295.050a0220.0a13.024b.GAE@google.com>
Subject: Re: [syzbot] #syz test: git://git.kernel.dk/linux.git syztest
From: syzbot <syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test: git://git.kernel.dk/linux.git syztest
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

