Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7567307498
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750832465; cv=none; b=JtUS3Ye7d38z96t00N8u3hF4n+jk+SJeNeAf8Oj9zWaNT3rrOACr5JDU13PydQuGuxZU4sCpCBzg1hwYinGJKC6r7Rp1hC8+e+n1oGr5JOD6DZcCjfiC5srsBDrtF7GE4GVBjj2WrETS+UYAVfegoVQpYXi2LUAYIF5MnqSXUZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750832465; c=relaxed/simple;
	bh=1lTz6DqeOe8NPoTeAl41EHOZtPKHD6BUVZH0lZxc7yU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mkBWYZeQxtcDdTNyPb/L+su0T/NQ7u75XD1z1IHKxn+cARHsdMGzAAG/l8GbQ1d42aDU2feML0hn6iYpCbAprNjTcFdlJUuW565N1JczIoTyKcaNjFcB5XEBpwqF+WCmcySwUnjz5od5vKlCy52YbZoPa/kdy+QKUu/rQw2R5k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3df309d9842so21636365ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750832463; x=1751437263;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqyM0hNOcM/LlydT1TMBUQpwK8UMds3nkjKr8/fsXP0=;
        b=P9kwjb8mVIZe+azPbYoBVV60JRV9j5rqGJXVGRovkJ7G8hyWlTpijflI/z83M46OzX
         OIVHNiSlrxZyZp4LJhGWSVZJrTfV6zykw9F81Yc3QePC/ChaG36CXRkPlozuUt5Sh0rS
         1AJ/gHYuVaXSDS4RO+IxY3NexTBpg2X1wOWRWQKxRnf0/gwaoKOkEhsAlp0PurV2W8o/
         +b5BTWlw83mWknSq6jsb4HO7s5Ns/or1bNH0B9fJN3tGlqVY45AbsJP+Dk0AFOGQsWSm
         K+tVY25PEc72WwTdxrtpNs5n8/V0qKX8ZJ9haXEVLEd0KXD6cbaN2scu1AXKHYzL1YuR
         Hc/w==
X-Forwarded-Encrypted: i=1; AJvYcCWfsq++HiajdqLSKkhzYME+OLemYjzYwly406LZkveiZTrkf8YrprYCc00NYzi7G4R2nyo2GchXtr3P7l4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyK8mu+q3pe7xGc/dRhIO3uSEqTQOewBLHhQKRpTkEhB1oLBv3
	+2oRyaYTYIyvwgHGv/KUQSrMadE3UNF+xCAYfN9d1eYj612UFaHHOZYxwsFBcUmRTNIPWu+uPL5
	kZei8bb9JhKfThIv1Kc2t/k9C3ZkkIFQWONhw3/T7+DMUGpnjXGHRcwErsH0=
X-Google-Smtp-Source: AGHT+IHc8iivZd6hcCj7E9rk0RuOzYsvdSvd9Jrs0YqDjRK9dLnfn2BWapixUX0XZE4Xr8vwR2bPQ25Ia/InkJDJAVGMt6lGeReh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2181:b0:3dd:d6c2:51fb with SMTP id
 e9e14a558f8ab-3df329224b9mr21658345ab.10.1750832462766; Tue, 24 Jun 2025
 23:21:02 -0700 (PDT)
Date: Tue, 24 Jun 2025 23:21:02 -0700
In-Reply-To: <20250625054430.67623-1-enjuk@amazon.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685b954e.050a0220.2303ee.0015.GAE@google.com>
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in rose_get_neigh
From: syzbot <syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com>
To: enjuk@amazon.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com
Tested-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com

Tested on:

commit:         7595b66a Merge tag 'selinux-pr-20250624' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14204f0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4ec8b4e4d31ae914
dashboard link: https://syzkaller.appspot.com/bug?extid=e04e2c007ba2c80476cb
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1469b70c580000

Note: testing is done by a robot and is best-effort only.
