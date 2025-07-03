Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700472D5423
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534501; cv=none; b=SvxDTCXeMTQOWw6yILj8A9IlJZrkVHWy+mQRF0zJee3NSwK+kw97V8nJLBgdEJjH/wvgIaOTU3zqeJe9D2Iyqxpv3i2ZFhviCl1FDCGJaO7DrN3sbcVz/gfEBkwdjg6QYqno8/bUeuO6YI/QBD8tfSz6LLjv7h3XHGJyetCjl5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534501; c=relaxed/simple;
	bh=ex47TnNCrq8WIbo31uzHQOF5bCf321ncTpleFAh1mMc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HtbSwljEv27D0Rvd/YHV+pywGFSawSZlqP91hM7b4yT8w9AlgjwMnSeAGr4rSGGPxvMp8o3ADlz9qvJnyVAnGmPPIY9loEVgiEvVJnG08XQq4O7e7RK/UpqslolleK9cE/nYl3eNEjyj4+1aJbPpsc1Yw0Ahm43huVxliPi4hdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86cfccca327so1576851539f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751534498; x=1752139298;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Bdx33vSlG4V60qvphNaYKwiXkFvAW8NqgQHyPgkPNM=;
        b=MtZ5InBdKFojEPw+fPnOuilQw74nna0ibQNDSxWvdy0ClishWdEWHdvQgR2sZXf18w
         O2FRhvQFOP8xs6GiTboLu0aB/pQhiOEBxORJSQxBH1/ulCKT7xAXQ5Y+yp4VY8HjOl3R
         LbYNawxtpqwnPOBAviOGDRrO4WH030F0+oaZzDcPxsC5ZlAkeN9ypHfop9uiNiNpa7uX
         aG8a81kjaLfFBmcE2d5GE8SJaPXUiG6KXYNsC+u2/MtsjtykYVhHBgiE5Uzlo7ICiAVO
         V3PZLwzeQB0d/yhLFVCQNlJE6/oF0hMsgfwm49S5raMOq/VqokjFUIaXBiaQt1Uv9Y/5
         O4iw==
X-Gm-Message-State: AOJu0Yz2vc0hTCZ4AW4a1l1L+n/MxTBV+RQ4EZ5YHSBYMVTY8B3jh/um
	MI+++vhonc+cLokdwSSO2ynOPLjVKyhJI8BiwHqigMJO4qvpxtbQfn8wkBIAf84bAzCIsO5B0gP
	3oxJc2SbbhOrDn5FwnGl7xxCwQjswNfC+LwlhUYg/xD7r9NTPZe22h2kH1BY=
X-Google-Smtp-Source: AGHT+IFrLclciRX+Ev6KxcWWKba3OToGqTNclDX0sH4dLiCuAhxg7GKbzF6c/IyKjpaQWa/F+VabBZ6JVsRPcdE0IRXIdENux3vd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3cd:b0:86d:f35:a100 with SMTP id
 ca18e2360f4ac-876c6a05e77mr833559439f.5.1751534498532; Thu, 03 Jul 2025
 02:21:38 -0700 (PDT)
Date: Thu, 03 Jul 2025 02:21:38 -0700
In-Reply-To: <686574b1.a70a0220.2b31f5.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68664ba2.a70a0220.2b31f5.0017.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [fs?] possible deadlock in __simple_recursive_removal
From: syzbot <syzbot+6d7771315ecb9233f395@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [fs?] possible deadlock in __simple_recursive_removal
Author: lizhi.xu@windriver.com

#syz test

diff --git a/net/sunrpc/rpc_pipe.c b/net/sunrpc/rpc_pipe.c
index 0bd1df2ebb47..e30270e5883a 100644
--- a/net/sunrpc/rpc_pipe.c
+++ b/net/sunrpc/rpc_pipe.c
@@ -175,7 +175,7 @@ rpc_close_pipes(struct dentry *dentry)
 	int need_release;
 	LIST_HEAD(free_list);
 
-	inode_lock(inode);
+	inode_lock_nested(inode, I_MUTEX_CHILD);
 	spin_lock(&pipe->lock);
 	need_release = pipe->nreaders != 0 || pipe->nwriters != 0;
 	pipe->nreaders = 0;
