Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4B81FDE00
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035904; cv=none; b=rjhbSrrrCOHD6ryliwDlMg04lGwXOK/5Q4Q+LDoBX36YTODC+6f8BkJbOJ6CIrAnVRtkyWRBpC93zRIZRjlFGYcpwqz6LnlQ/10vFQuDRNJbogONMWHtWmb5V17EicSt78+uo4TsKMYyoo09tM1tPtYftq6rohXyuRQVGg+Uh7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035904; c=relaxed/simple;
	bh=Bzr+yAT5FWXC67pNcy4DdnOEcNRHfP3unZIeNg0Lls8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gxj7cWZtd59IOof01VOE8AuXf4WMX+XipVeHzBZDm9wfjWyap7mcJY4Bs8DTyejDRQpCu+wZ8KRNaabSBSHXAwtQSJtSCBhCrQw8o2fcZqOXL+o4aET+ibxVujNdfVJ+IoYExZtdeV6IH9Lu7POLvSS/XTjoQI51tneXpVxPwSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d44b221f0dso90499595ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 07:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744035902; x=1744640702;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqylPtsJUGhPnDo877vCDGCeTK9eTWpi2VA5wUt1hxk=;
        b=R+ZIAdgaFlB4kTPNF9YopIHBpuLGOahkcU2Ie7+RnuY/GfKqSvdwN4xaBynDBUn48c
         Dvfpw8OCUhcSrDaKV3Se4fREAdmpQqECD58iKfIGdsc0lDDb3F2FbqkkMD8yj300Ga3C
         EYZOvaEnzv72Y1sddBC0o5nnsAZ6jCvBVtHxeBYF8KdPGaJy40FAxqvbwgJVwRxCJDTV
         DZ7/Ftq868yC+dD5BgmZM6OawBDne5PTD2ytlvJDtHDEsaS1lsH02q47gOncGPyFCAVU
         veigIgq/lHHOWOqUZ4c0KQssE4abcgGx1E6d0Pw6F8nhHY0lVZgAV9UC1DhDzXFEegWl
         k4qw==
X-Forwarded-Encrypted: i=1; AJvYcCWI27RkjZsSl6mWT9abN0Q/hUlC6BRGpmn6y6xrUXUTI6rE2ZwYM0b+Ys3Kz2juZxwlJB3GoM3aSVFFRGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq5beXHdNnHSz6Zm5GBRKHQNE/bfF0DMlP5GuwC8FrhcrblH4J
	1xEBSIFej1obt/UGEKPuBWmX84jRV6IBoT30KPUeOMSKoidUZAeds21iofeUPshnX7RsnzFZ2fJ
	IYF81Bd6ko0EdHV/8aaaWVteFnuOOEJtAid2+OXyvYHd7TXW4QOalFMw=
X-Google-Smtp-Source: AGHT+IE+CDycwgO/6G3EPIE0hT1ZFJznfTWuSqkY0aiAwqTMSDuWhisnHSKLp+mYWuCkfjfMTgBml3N7diPwWBcZZhI+/n83hKbl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cd87:0:b0:3d3:d07d:20a3 with SMTP id
 e9e14a558f8ab-3d6e533d0aemr118537635ab.10.1744035902466; Mon, 07 Apr 2025
 07:25:02 -0700 (PDT)
Date: Mon, 07 Apr 2025 07:25:02 -0700
In-Reply-To: <7bcb21c4-4ce1-43fd-8adc-c22684cbf0e7@kernel.dk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f3e03e.050a0220.107db6.059e.GAE@google.com>
Subject: Re: [syzbot] [io-uring?] INFO: task hung in io_wq_put_and_exit (4)
From: syzbot <syzbot+58928048fd1416f1457c@syzkaller.appspotmail.com>
To: asml.silence@gmail.com, axboe@kernel.dk, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+58928048fd1416f1457c@syzkaller.appspotmail.com
Tested-by: syzbot+58928048fd1416f1457c@syzkaller.appspotmail.com

Tested on:

commit:         881bc75c io_uring/kbuf: reject zero sized provided buf..
git tree:       git://git.kernel.dk/linux.git syztest
console output: https://syzkaller.appspot.com/x/log.txt?x=17420070580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a3f7ddbc4e0c74f1
dashboard link: https://syzkaller.appspot.com/bug?extid=58928048fd1416f1457c
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
