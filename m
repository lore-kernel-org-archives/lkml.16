Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C361725F99F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611011; cv=none; b=FnNP7NErjryhBRR6BMSQ0On2FmRWfYi0vmFw/kPOvxvrA3DDsxGMRQ7g/3Rc50mfxXFveTTM2ocNzKPtEw34pr0quU9Qj2D8u28hfR9PsrNLRzBRkL+kW9l6IwRsglPAURBftdledKZXApwLAcyo4sWAnrEaV9m52I2b4JXte7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611011; c=relaxed/simple;
	bh=sQU0RMbHENI1IQdHYfMBQ6Y2aFwCkwsnXoWiR43ak4Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NYafQdTY0zmPBFCicbyqKL21Plz7fXKtxj5OryhtXZl+qVlhIerEgCUZeQiqLekgTmFnSaA5BHkugTohbe0Zwp0vBRKEODO7raDV2zyCbTMvolDql4B4BlnxgmcHmQIkfOiffINE2l4S09e6V4CR0IAyq+85Cb0hwxoJFl+840s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86f4f032308so119953239f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751611009; x=1752215809;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+tOh2iu7WL3Y8nA6h8kXyDw5w9BIlgZUzywQJH9r/Bo=;
        b=AjVicDqRbaRhbe0M/Kb/GUrhIN/e55t73LeOf4mrqUGbuyEchWLbuoujgfT6diNR+W
         wZzTFVWT523hgmruFlDJ77fFCCx3H6QFtDAWQKYBEPVC61+b20iw66ARz0+4w3naIE2z
         o9+bOHBkv4dte96yeuWJ3f5f/A5UjqM9YhzZRSk23DUgDTwscuxHQB7ABSV34UWZS6mW
         aJsJ4S2qVVJ8OKYpRTWBCGKzdL5N0hJujeFW1cqgtA4Q0a2lTEPKJrFPAsH63CLoPcAW
         hOljqFNnI1u4yh2csUidlddaEE49GavxOolMrfVjdLISixG1L/1/aZd1bV+MBMrITIbJ
         +91g==
X-Gm-Message-State: AOJu0Yz5tESboAg2KmVEAUpTZh6H50JyCYuy03bNd5d64Xbk4RI04iGi
	pBu8u7BCox2HQLsQ7VyWmW49kUo8UE653DDhvPKSflhiE6CeVOaPXJFHY6PT4R2iSH1Ntxkeigs
	7oTUKGK6WVXqL3tHdCkqosiU2V9wIyegz3NlMFU3NUg1nLccYTSyEv3bTpkQ=
X-Google-Smtp-Source: AGHT+IF2ZizCXerfzeHltsWOthAtvXwBcRY1IXBM3gvAlX/rEb3LUSN/5WAIyijbWFbo15kWvJDxshVCBYdEIwryhuuRqB4TR7TJ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16c7:b0:3dc:87c7:a5a6 with SMTP id
 e9e14a558f8ab-3e1354651b2mr12446135ab.4.1751611008854; Thu, 03 Jul 2025
 23:36:48 -0700 (PDT)
Date: Thu, 03 Jul 2025 23:36:48 -0700
In-Reply-To: <686764a5.a00a0220.c7b3.0013.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68677680.a00a0220.c7b3.0016.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in qdisc_tree_reduce_backlog
From: syzbot <syzbot+1261670bbdefc5485a06@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [net?] general protection fault in qdisc_tree_reduce_backlog
Author: lizhi.xu@windriver.com

#syz test

diff --git a/net/sched/sch_api.c b/net/sched/sch_api.c
index d8a33486c51..7f32347971f 100644
--- a/net/sched/sch_api.c
+++ b/net/sched/sch_api.c
@@ -803,12 +803,13 @@ void qdisc_tree_reduce_backlog(struct Qdisc *sch, int n, int len)
 			break;
 		}
 		cops = sch->ops->cl_ops;
-		if (notify && cops->qlen_notify) {
+		if (cops && notify && cops->qlen_notify) {
 			/* Note that qlen_notify must be idempotent as it may get called
 			 * multiple times.
 			 */
 			cl = cops->find(sch, parentid);
-			cops->qlen_notify(sch, cl);
+			if (virt_addr_valid(cl))
+				cops->qlen_notify(sch, cl);
 		}
 		sch->q.qlen -= n;
 		sch->qstats.backlog -= len;
