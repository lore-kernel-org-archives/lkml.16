Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAD01DF75D
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739237407; cv=none; b=QixsOGN3fJO4WpVEoaPk3zzhuZyCj0rOVFIrTmMXTYyXxVZjwOu57pmZMBH4VNlbUjmaMVpvdGsk7Ox1P4omiDYuvU931GzCO/sI8ONAxlMTmTuEaBP7MuIXHLbxiH5CrA+13BPux8EXzzSguZPgZj/nJll1PMUHNgJECEKI8Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739237407; c=relaxed/simple;
	bh=v/Nh6V3Squ6zTlqOd8JqUTRgJWgw0anyNQlDu2hHeM8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IfNsx1ji0zBUxyjYF6UQHRAb2dBVvuafUdmnAFZ+RK/QkeyJfSo+i2pCtgpG12cQe06cqoeciBqyCUvk5mWnb8Xx10vVNMioOYoLizZT+kgXx+zdJmFsGUNSp2Xl/3t0aYTylOoV1LFzZlDTwrAy7v8tRDxda36QK0WaHTJu11Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d13e6da07fso68641705ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:30:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739237405; x=1739842205;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t6+FBchsBBeiNSoV+eW+VD+Rx2zp2Kr3ieu0cpfLjMM=;
        b=lGlgKiFO5fOtujw2IaYdoWOb6fj+inubdocutxCdBQrCKgmNm1xkKj/FX51XucoOye
         kcbZ2u/DmbMtMQL6T9YxCyDaU1mXL1JAnFBiR0aeaT4Du5oLcPbHim8/g5ove6N35dZN
         41ACfeIy7ZvR5iawI608hI2Wt1yePMRXWhfBg1Np6o35r13RRysbRr7PKILnZmRzmXg5
         3Cio8lw31BPdSRf0EzLWGHo/xz9Wlsxo9TMTNKyzUYOU93HTiGETSoVMWYvjzeecXxVZ
         MNLd0RQ4SthnhbqhK/Q8OQWXMlebMVhjITE6gdHMRqJ+5LEUS2/nn6pM9FqoWegKr737
         ylUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGkoK4mNW6OWXIpPmN33KZNQrk5n3S5y/mnOHqSaLKOMSTJmzp06AP14eBw62mEyVbrhQZBe/t55k4z/0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl0W8SxpCLRMOOA6tTwqEzXhhi+Rg6ASUN7wqok7P7YKn81+KO
	RiIq8qpVQq2kfaRIzj5OybB0Lljjr8iJdhmc7FLzqB4GP9y+Eqtqptz7kKTY/3JikP3zNjUKaNN
	Cs6/nm/2bx6JY8TpVI/nOdVhPV5nJoLdSrdjfiTIRyITYDAfMMwQMCa0=
X-Google-Smtp-Source: AGHT+IG7+XNeWPwTQyEuOSiBbyR17tnLyzZGxNLcT/H3Nag+ebW/Zo92Lj1QdCiNeeqakv6HPCbyQQayKdDo1wilBgT9j1TpzxFv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c546:0:b0:3cf:ce7c:b8b1 with SMTP id
 e9e14a558f8ab-3d13df2c784mr118031675ab.18.1739237404979; Mon, 10 Feb 2025
 17:30:04 -0800 (PST)
Date: Mon, 10 Feb 2025 17:30:04 -0800
In-Reply-To: <67867937.050a0220.216c54.007c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67aaa81c.050a0220.3d72c.0059.GAE@google.com>
Subject: Re: [syzbot] [net?] [virt?] general protection fault in vsock_stream_has_data
From: syzbot <syzbot+71613b464c8ef17ab718@syzkaller.appspotmail.com>
To: bobby.eshleman@bytedance.com, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, leonardi@redhat.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	sgarzare@redhat.com, syzkaller-bugs@googlegroups.com, v4bel@theori.io, 
	virtualization@lists.linux-foundation.org, virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit df137da9d6d166e87e40980e36eb8e0bc90483ef
Author: Stefano Garzarella <sgarzare@redhat.com>
Date:   Fri Jan 10 08:35:09 2025 +0000

    vsock/virtio: cancel close work in the destructor

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12bb31b0580000
start commit:   25cc469d6d34 net: phy: micrel: use helper phy_disable_eee
git tree:       net-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=d50f1d63eac02308
dashboard link: https://syzkaller.appspot.com/bug?extid=71613b464c8ef17ab718
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=125a3218580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=147f11df980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: vsock/virtio: cancel close work in the destructor

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
