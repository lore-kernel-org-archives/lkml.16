Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B7621504F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744191186; cv=none; b=R/JE8E8Y/XLMCfFWcDPkW9cLx3dGx8Tgo2RlXjOl6HMcNg0+W9ujbRqIxtx4bVP5q43m7fBU/I7P5sktFFlIWXnDQX8Lkzs1B7dv+2nmpQKv2ohRDu7PsMYhxxmumfRqvsoWg8zVSg+U02Pp1hwOpdWNJN+sT8cOrRkQL8MPWb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744191186; c=relaxed/simple;
	bh=qtAx7bmjyf3dJP31V2DbqHaKeVuWZilMbh3Dcako/kc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=nNQKVRmm2LIvd7fDriGCgKrePfFu7ArnUypA1Hes4DOpS080I7tain3A8TTV5GTozq2Y1QuZcSVqTTODjEqxi2Rbd6z2pJcAkl6zZTjIMMDrbuxlK4HRHk5fZoZEICxy/NjjynB45NFmzgIleNq+W6XLHBxkghNd9q1rVhrB0xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d6c613bd79so70390295ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 02:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744191184; x=1744795984;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/DYyFOvNAW0WTyw3xv5iBRRIM9ll30bKBNqGeZA2DQ=;
        b=exjonpR8CT6ouv4r1aHdMzEM1FOYrkpc34d81nn1f63sSJhCJ2mRKumVO3YuDJLm68
         pQG4NA91huOlw/ywwjjBujQvnZwSarsBIwEWw+4X+kOrDA7Qr4C0tgRfB+0ytN7yc2Tz
         c4xSk0LFEXTbvuz0mJ/1+3FhPte+oFAIGSKHDwO8wNwlNZetbtThFJvevxN5I6IupHb0
         3N3mDzKtsiHWSCopAyRhJFMWDIINxIP0bhRxBJNwRv4LDploJ0FpT75LVrOb9VKOAaPE
         X+r0mpufvPEB3Wr3QizXA8/e4tyrn6hJqf9RS3kW96vXygss/i4T6SNUlDm394lDj+N/
         5fng==
X-Forwarded-Encrypted: i=1; AJvYcCUeYypapSCPO74eCC0oqtCNPLzroQ32cTkqPOXzZMKEv4wEMQBoDgTfZzshswfIuJA35+LowItPHSNGfqI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy84ioZ5dixoOpLpckrkz6OEOm+8RzZpiRjIbprEREo4nGSlZQg
	FK8nP9lS+SWnZ7+rJ4o0LS/1De9L2D+X8YiYMnJlYpJPI95K1Ob8zSs/KPxPxmnlKcxhCf2RFf4
	36nAgJ7Cf0QfIu9YB3f1LHOQKvaRjTAp5KZxB9wd4F3+lUukgfqy5Yn4=
X-Google-Smtp-Source: AGHT+IFR1Vtw5NObdK7oRiPqq8PYA5RGmy7ZLSZnRWVqVzXwqnTcFn2p252cMGRua8zysP4jZMHGUzKAevrgVWcvfY+u31PJh620
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1564:b0:3d4:337f:121c with SMTP id
 e9e14a558f8ab-3d7b460e7c2mr15563665ab.10.1744191183850; Wed, 09 Apr 2025
 02:33:03 -0700 (PDT)
Date: Wed, 09 Apr 2025 02:33:03 -0700
In-Reply-To: <tencent_618DFA25908DA8126BDD965DF1991ACFE007@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f63ecf.050a0220.258fea.0019.GAE@google.com>
Subject: Re: [syzbot] [wireless?] general protection fault in cfg80211_mlme_deauth
From: syzbot <syzbot+00778a9a557a2a5e1a33@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         0af2f6be Linux 6.15-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15b317cf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=66996a2350ef05e0
dashboard link: https://syzkaller.appspot.com/bug?extid=00778a9a557a2a5e1a33
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17d0c070580000

