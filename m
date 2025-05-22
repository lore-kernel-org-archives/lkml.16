Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB66528B7ED
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918710; cv=none; b=dcvlVlbpDBZOCpOeTALFZlueucHWmkPD+6MZsLcjH7akPxpnc2EZQIUVAbf6Lo76Sex4vvfIFwhBklpRExA3ZzHRhZ6aJqKeICEExz9PyyYnWFLm4M7RjzKOGW7X+owJ2D4DF3fctAMzz4BGp4e77vgVq62O52ZQdpqeUwIH5vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918710; c=relaxed/simple;
	bh=XHMYQhmFPwrsZIvyn+gTBuRPSneGzE9JD1p3xnTq4dc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IHmLRFetSZM09e2C6MGQ390zT0IbbSvPFGphE58sHvwjEYNMgah1U7AWe2NDLpMB7heDQiaQt1snVYqjHqOzhaHRBfuXHTXUaLlyOTIayGQw71vqd0mtkjIo9j4nQ5cOChTBkdMthNFPHJ2K/OSZgx5f+BcyjmXNbRmjkdNt9Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b5a7981ccso667883939f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918708; x=1748523508;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=go2xQ6C9Zw9PE9PibxwqAmR3fPSZ75zMGb5X+8GgYQY=;
        b=w7XloPbfs2cBj9740ziTlm0FQhryYGx8EADgWCusT67WIEm94YnUsGEQ/5J4VYfg74
         FhdKsi7npv1YiPSkCs9Wd6hgMBg2QbxboYlbDiaYxz4I8e7argZYur6oyhf5+EuIuWft
         QH0p5gnSCDfThZSQIqw3LxaUGg4QOffjMngGzIJ9S+jlylyi14PEHPS/GD0C+2jXUvWT
         coUxxfDKwu22c5bT/DMesr1j16rPaHBbYDlN2P33ciP/EL4lY2CF8Z64NfASHcm0N9HT
         DQPDsQaSPkhzL+7luhE1o1UxLCFxlbDm43R5Tv1Y6CIK/4L7iS/NCrND6hjJDleTWJpP
         371w==
X-Forwarded-Encrypted: i=1; AJvYcCUTdkmK4wTtkGXUNiOxMDXmcDXEhJiGJqIWiP8ITGvRtCLVXQqgoadmFCvgIj3otLu9pwiUYJjEv+qB99g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYK8G1pOnCa5Qf70a4U0HjMlstvfhAlFyk87WP6SvANmMFwdkE
	yJA1IXzCBQ0+h8M0WIqPNo2v8lRbz5ydgoyNKzJSDl8Vu3sQUrr/FF3P/hhF9ZFF4p5AdRmCkI/
	LwOAXlYWPxexnEgSJ1QgYiZ7W8JKH8e/p49hi6q6G37VYgNJL7CGUeUgKViw=
X-Google-Smtp-Source: AGHT+IHkhaU1N+yecHaXVOWPcWKI18HgYbVxp1LfpkmDs7jKuf3ucoM6mUJZnHBKbnpC80MmfUPwLD1bjERd6OcKNJ7f9srmpf8N
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a5e:881a:0:b0:86a:256e:12e1 with SMTP id
 ca18e2360f4ac-86a256e1661mr2291391739f.2.1747918707959; Thu, 22 May 2025
 05:58:27 -0700 (PDT)
Date: Thu, 22 May 2025 05:58:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682f1f73.a00a0220.2a3337.001a.GAE@google.com>
Subject: [syzbot] Monthly serial report (May 2025)
From: syzbot <syzbot+listd95e4dcbb735cffa7932@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello serial maintainers/developers,

This is a 31-day syzbot report for the serial subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/serial

During the period, 0 new issues were detected and 0 were fixed.
In total, 18 issues are still open and 44 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  1148    Yes   KMSAN: uninit-value in n_tty_receive_buf_standard
                   https://syzkaller.appspot.com/bug?extid=559c7fe4b8bac56d38c2
<2>  188     Yes   INFO: task can't die in show_free_areas
                   https://syzkaller.appspot.com/bug?extid=8f41dccfb6c03cc36fd6
<3>  160     Yes   KASAN: slab-use-after-free Read in tty_write_room (2)
                   https://syzkaller.appspot.com/bug?extid=2a81fdd5c6ddffee3894
<4>  121     Yes   KMSAN: uninit-value in n_tty_receive_buf_closing (3)
                   https://syzkaller.appspot.com/bug?extid=dd514b5f0cf048aec256
<5>  92      Yes   BUG: soft lockup in tx
                   https://syzkaller.appspot.com/bug?extid=5e87db90e68fbc4707c6
<6>  59      Yes   possible deadlock in tty_buffer_flush (3)
                   https://syzkaller.appspot.com/bug?extid=52cf91760dcb1dac6376
<7>  25      No    KMSAN: uninit-value in gsmld_receive_buf
                   https://syzkaller.appspot.com/bug?extid=2f64914d6a3a8ce91bdd
<8>  18      Yes   INFO: rcu detected stall in console_callback
                   https://syzkaller.appspot.com/bug?extid=32af18ae7b894a681f2d
<9>  16      No    general protection fault in n_tty_receive_buf_common (2)
                   https://syzkaller.appspot.com/bug?extid=2dda672e146ff12ccb02
<10> 4       No    KASAN: slab-use-after-free Read in uart_write_room
                   https://syzkaller.appspot.com/bug?extid=22c0e08c1e0f773fbfaa

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
