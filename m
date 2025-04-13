Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D79AD58
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 01:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744506488; cv=none; b=q7fkUpAoVtmZ5vaE1czjX3r0iO24Fi4UhJDggjUcoRalUhFiIYM0xfiIqGc5/MXVpmuI1D5CPQ/P2v5RM6VtSLQKStjMhV9UI5ZfBIOLfMfSOv0ZaWm05AaUJwIU8oYrp/xUI2faCFPp6nGHE5UCJcDeHY4S7hoxlNNiizjSBME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744506488; c=relaxed/simple;
	bh=nW/7oOXCkdahYMAKjxfYrdJZmavvEz4wd4QSveg9lVg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uzO4zs5h5M3LnDoTopDIZHh4bY38ahXBUMe0b3aa1FHCc4Omd1pGxGEsLkZSkd8Gpdwvdm+4+7MDAV5NrKGUtTt2IiMMLvlgIoAMaisaV8qs9JwztCyBK0I/R6tOR74JE0V0G9COgFhJx9kNtBsXEMdwhakbu2t/cpAUpTSapO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d586b968cfso27897635ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 18:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744506486; x=1745111286;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+dk7Gzu8+LwjcWpBxuLapWkABnm0wRCyVK7vl3Dvxi4=;
        b=omIaecWuE3JYyD8gURPJn8m8TsQMQrplyUiowYkh4wZmQ+xZsIcBo7hfLpw5fglFup
         rb/d/acO3A1ENUp4OPhJf8jVw47TiUZhvRnTTMp7NKabOK/68ECiY9YG18yH1oLOPRuc
         85jrzoPXnMqsGrdN3dzcvYHoJF9S5g6zAOrXru6gKrK3hQLo7QtUoP9ukzWfPM39OstD
         W2tut71C6GsUjbdZfTSus5iGrn8xHLjL7RvVl1LtFK3Zcstym37F9m4DH+NGuP31KLxJ
         IpknRNNlDXwFqIPz/ApgWNwQy+zsJG4LAwMFXxVy+xJqhvKXbq2zHVFFpg3nHzfRlwS5
         d4xQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+nRPRDZl0HrptWQ+b6RIGkic4vCtqX6o9y6bWxtsamddwP/v0qebdMxjABhUn/H8ENqflujqd0kV6HEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGKGbBIgjcypTiMFFBQkAQzkwxl85e6ANoIc5RnuVvXhWaFi9V
	RR0tk576yhzxkorsli5vJTuwn9yqAE0Al72H6AqGf67lBHydFHewymBx5j+gSOQd2k+6nG+lWkd
	ky1fEtk2mFTczA1GadHDgRoK8N+ZsSxU8TCVMyn1BkghWlhVPrSpgVH4=
X-Google-Smtp-Source: AGHT+IFkv4xfABylcvNKDZI45sqvgHacviJhIvdkoy8b0aCrQptBuNJRamxG+NdQI0+OhYk98KQ7revj9PXcRAOglKUbouG7MIQ9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:338f:b0:3d4:3fbf:966e with SMTP id
 e9e14a558f8ab-3d7ec265c39mr79513085ab.14.1744506485793; Sat, 12 Apr 2025
 18:08:05 -0700 (PDT)
Date: Sat, 12 Apr 2025 18:08:05 -0700
In-Reply-To: <67777f13.050a0220.11076.0003.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fb0e75.050a0220.378c5e.0007.GAE@google.com>
Subject: Re: [syzbot] [kernfs?] INFO: task hung in __generic_file_fsync (5)
From: syzbot <syzbot+d11add3a08fc150ce457@syzkaller.appspotmail.com>
To: brauner@kernel.org, gregkh@linuxfoundation.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sandeen@redhat.com, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 00dac020ca2a2d82c3e4057a930794cca593ea77
Author: Eric Sandeen <sandeen@redhat.com>
Date:   Wed Feb 5 22:30:09 2025 +0000

    sysv: convert sysv to use the new mount api

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11b380cc580000
start commit:   ab75170520d4 Merge tag 'linux-watchdog-6.13-rc6' of git://..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba7cde9482d6bb6
dashboard link: https://syzkaller.appspot.com/bug?extid=d11add3a08fc150ce457
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1558f8b0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16612edf980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: sysv: convert sysv to use the new mount api

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
