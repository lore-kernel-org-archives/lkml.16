Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EDB1E32C3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751610826; cv=none; b=prC5dFQsEAPIQzB6Dw4jZzpixLqgr6s1eVRu71UO2jiarDqGfLII5Yk2XLT24oWQI1JI3+xfVI7cpQ7m+zRSuxMmMeIx7GShtza4oVpjjNLlmp1CRAeFyo5aJwAbEXHqzGVE/43/hSCqIEn9eAkVSKzdPy+DvepEOAVL9pI57cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751610826; c=relaxed/simple;
	bh=k7k5OZzJpyYd95KtdrF/chWl0ISEUPuvFaH8MzwPyHc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=n34SX44xFSl1TefLwtk0RZeu+jvwjEVpfOWFRramJP9FOnI8Wkxv0DIxiN7rurF1vHWK8wiqjvWgRnYIFYihAwNepLZU6itjhqhwjae8UAQoQlXnrgS6T6FVfwgG63es4CW7233NZ2fMAy4IiaLZyb8y1+8XiHMo2/GJTbLN74g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86d1218df67so58664739f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751610824; x=1752215624;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jOc3bFQPduUDqo0bIEl3+qN43uOpyZwy+s5XaMWjAqw=;
        b=PAo7Bc1iV8PYgbKHrisr5ZkloJgzZm544zoIvcfBvJr+BDh51t4YlUKcZvmojkLDN3
         KWS6qV6ieVkCE969o1NKfivKGJWmCsb8QhvI0b3FjBX8MZhaUkx8sshvY35P+dk2kZk5
         SdyVJSvEwL6/ySdldgIAnNSnO2vIEc6aFuZl+7VgsSrYGRRVMQErZ9n/1gP2hRPeAYs1
         1P7stPKBHBdftBozMNEMnGlv5YFM7lE0iwIN1AtQOZTT3WRljJljqJLL2Pm+Bue5WXq4
         fzbZEyERzokm2EQRKWJ/FCvru5dvzhoQwPf3aU06O9g0e7WuBmRvYNYKwVxAWppvhV2b
         uTKA==
X-Gm-Message-State: AOJu0YzeXltAZjLurzYM8trWpAXzDJ66a1EyvKNl3j+QKKarwqwE36Nk
	748sSyVS1LxCJWdlTjKwRgbCdUCcuo5bCIfR0B9Psy86H9n1dyvNnhp5TQ8uMgLNVjL9VGp2qbU
	G44ySq29ouazb2dG3uoePGI7m7Yn3BNY2tAQCl2nfVuZCO6MkUVrMNme+6hY=
X-Google-Smtp-Source: AGHT+IGp+9Kz271pFos4x2xNMJh0Cnf5v6eyBBOHimHLODwvGDQzxHIkKu33Noh4NRuM7JeXIEP2J71rN/2gotFEcPG5feOH+HtW
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cda2:0:b0:3dd:b4b5:5c9f with SMTP id
 e9e14a558f8ab-3e13720a9b2mr6695755ab.19.1751610824010; Thu, 03 Jul 2025
 23:33:44 -0700 (PDT)
Date: Thu, 03 Jul 2025 23:33:43 -0700
In-Reply-To: <686764a5.a00a0220.c7b3.0014.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686775c7.a70a0220.29cf51.0010.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in drr_qlen_notify
From: syzbot <syzbot+15b96fc3aac35468fe77@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [net?] general protection fault in drr_qlen_notify
Author: lizhi.xu@windriver.com

#syz test

diff --git a/net/sched/sch_api.c b/net/sched/sch_api.c
index c5e3673aadbe..c4ca8f3b820b 100644
--- a/net/sched/sch_api.c
+++ b/net/sched/sch_api.c
@@ -817,7 +817,8 @@ void qdisc_tree_reduce_backlog(struct Qdisc *sch, int n, int len)
 		cops = sch->ops->cl_ops;
 		if (notify && cops->qlen_notify) {
 			cl = cops->find(sch, parentid);
-			cops->qlen_notify(sch, cl);
+			if (virt_addr_valid(cl))
+				cops->qlen_notify(sch, cl);
 		}
 		sch->q.qlen -= n;
 		sch->qstats.backlog -= len;
