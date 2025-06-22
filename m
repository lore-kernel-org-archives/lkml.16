Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B674917BD9
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 07:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750577526; cv=none; b=NTsKdY0sXpoChxCK279evzm58q393IEGcg9ZqZk3gijg++brpq+z1jr9Z5YVJUseTDwQpBKjeITn3mOMRLHPxy0Fm5U0TsHizrVPkY4NPPraWMBey4q8iQhnjzmI13Z7dXzCoIvyCLFm4t6Z66whq6GDU5ReUY7ltJ5sA9LstrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750577526; c=relaxed/simple;
	bh=fvfo0MD641xhg043m53e50LDOf5/b2NmB8ts0wnKkTs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gSQ9CxabHXB8Pm1kJZNNRWNeaLlH+EIjYcUKkVZuz67sDhxqL3t7m63fM2FJDifxpOgjJqxcI319Sro9SF1Q9uy7BnABhaL5255Kt/uafFkgIsrBLsPJ2vGTgF7Bs/uT3VnmxB4r6KqV73dfqZzza1CYrZMTZ/+1q8BGDQK/QEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddb4dcebfaso88126335ab.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 00:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750577524; x=1751182324;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUEyU4FSGsLqIApM4+r+RvW45q/2dgR1QY4OPk/ZxjY=;
        b=G/BJDs5/MsWGSYvR6HKGiF14BETAnDMW0GHJ/Shyv6zpUGiei8fc/6zymSvyN0ItLm
         eBc/D9arn6UbdzksjI4sfp3lcK0YKFvLNVq2eRq3Ya4bNoUn/d4tV4m1vMK54w9p2E9g
         bMxJgp1XyRhjWAInXRilWu92PM17IlcCZ1a/OQPh4W0N/9kqCi/EV252i9wh/gBtI3vu
         V9RGSZ7eesyRNU/80E4PGWWIiKEq6j7yd/XhdTAz90UvQjqkjEuguHbAegxVtlzUGa0h
         jc9h6g4gk+avIjiREnRwq8xmvDy2EMQajbdf6FfCESVNFqIHKkMH0iiknx2g0i5cxIMu
         yIMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4V21ZYQFVYV/+FiepU7aD3pCnXdRbQtryawE2rQJBa6w4JPzohlKTC/WwrtsseRiEsvvHaXWv+E990Ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwqjoS+cF82YxCXu2vaeI4obAvTcshBA8/q9+EA4AKZcHQk+9F
	0EB0n3MsF84hUhcdXhpXPxBsVZ/S2wMTjnpoKYx24NlIzaszQyzKEL5fXAmldywTv+hFsVD5jpj
	NBisIhjHUFIkFcV7vupGGQxbx/K0dbYltNGlmX88JQ8Bg1Oy6434dktcqur8=
X-Google-Smtp-Source: AGHT+IHXW0AxKt81rteF80EeXXDQ6aB0zUN+i4HPSWdy4GKXkqsaLR2T3FKrXSV40AJYezlYx8Y3+2I9/87WrpOzP6aQifshh36U
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:230a:b0:3dd:b7ea:c3d9 with SMTP id
 e9e14a558f8ab-3de38c3c178mr86000935ab.7.1750577523810; Sun, 22 Jun 2025
 00:32:03 -0700 (PDT)
Date: Sun, 22 Jun 2025 00:32:03 -0700
In-Reply-To: <20250622062844.1505-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6857b173.a70a0220.62859.0003.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl
 (3)
From: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com
Tested-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com

Tested on:

commit:         739a6c93 Merge tag 'nfsd-6.16-1' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10762182580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db26f33438d76de9
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1756b30c580000

Note: testing is done by a robot and is best-effort only.
