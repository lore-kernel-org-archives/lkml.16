Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C88A1C3F30
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 19:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744916704; cv=none; b=Y7Lt2LjfW88maunehQMJbqpl14HebF4jAO/olgG0MNthwm8LbzXLFmexdWXFRnm7ZXJ+wDzX7d4gMtq4N9fwv5HNLXwjNGhH7EVaFRtTY0nc5Pv+udN4aspxHsrFHfJrlmKmfLo2/Wh7ICBl+G/f/71Qel79z2ZfLtPs/6qzNwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744916704; c=relaxed/simple;
	bh=Lp/x4hsyjk1lrQeZ1Kgo1pqlXATJ3hoYx3Qb6KavKlg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=p3E1xrf5RWT19sWePqlM4RSB1XCw9Ug89RvJ7XPu2iWwu/OZ7FREFac9I/azrVb+z9x3RwjkCYB+oq/SJlCdlj02uNKgkt+bqFbp29MTylFCiUQBnaOxgBZDnABqRejWiCyWS2VM9pDVMw5NV/vwAAvDjkh//ojudev2O8RxECA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d6c613bd79so12617285ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744916702; x=1745521502;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KDqIhlkWTqThWDXFkLVbvNGoVB1KtUo6BHvjxJ84as0=;
        b=H/T4fed/SeM/5PSHiKXV5WgPorXiCGrnd8i4hmOlj34CPVn8l5m7OnU2s2lQH4OvVL
         kTzZDC66+0L95yJo/klQherQm3dItSE5Iid/k935WoSc+4DCOHCS8Q5rfe/2WxRwphrE
         /71EnvP7xrqW0iCv/w7EQ38cP/NKlSkdHqzk6/3NT/HcamrzpTUgDjvju2uJ0rnXkets
         FnkZRB73XkyzrvtUeR7N/AUH9IBE+HlZQ23b2LwuJ+vwc+mOLPCGD1MQES+X5/2kcODt
         r/U3LG9kJJ4tEjXcH2UTDXGxw6NOcJ2qgAXEy80vo5XQz25fbFvpW+ips8C66MTH9hK7
         RlAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp25UICe3bOxuvPPV7J2+RidpMp6Xs1fkM2YOSe6z1U+iIuEHIHpl00VGfE/ybN6V40TxixKbY0asSW8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvNMf62gp9QCy+hmB0s8wQbhxKKpEzEifJD+JldzgOUBzMr9Yb
	hKPCpRh/BG7RdTfuA2b1kdKflXjRdTWhvtGXb9bF65S6UJd7/q6Nm9y/doO9gwrKR2+k2dH1G02
	xLmEcKhNpRqZNZyWQFQOpJUH6Z+9nZtS8Tj7sFxsyqrmMGUQprI7ObF0=
X-Google-Smtp-Source: AGHT+IGMy3JS/eMvnnBxJwZNSXj4+Ok3tvc14TB9u694TsHVxHKohoNEk0XUuZ8ts04fZXTAk2+3+VT6CLq/z8y1+ILRfSTHA3Ub
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c0b:b0:3d8:2178:5c79 with SMTP id
 e9e14a558f8ab-3d88ed9561bmr3343255ab.7.1744916702351; Thu, 17 Apr 2025
 12:05:02 -0700 (PDT)
Date: Thu, 17 Apr 2025 12:05:02 -0700
In-Reply-To: <679ff200.050a0220.163cdc.0032.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680150de.050a0220.297747.0000.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] kernel BUG in bch2_btree_node_iter_init
From: syzbot <syzbot+7b8a2c442d5a4859b680@syzkaller.appspotmail.com>
To: brauner@kernel.org, jack@suse.cz, kent.overstreet@linux.dev, 
	linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mmpgouride@gmail.com, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 3a04334d6282d08fbdd6201e374db17d31927ba3
Author: Alan Huang <mmpgouride@gmail.com>
Date:   Fri Mar 7 16:58:27 2025 +0000

    bcachefs: Fix b->written overflow

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=125aba3f980000
start commit:   6537cfb395f3 Merge tag 'sound-6.14-rc4' of git://git.kerne..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=6cc40dfe827ffb85
dashboard link: https://syzkaller.appspot.com/bug?extid=7b8a2c442d5a4859b680
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1055c7f8580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: bcachefs: Fix b->written overflow

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
