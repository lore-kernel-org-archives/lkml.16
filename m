Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2511F5823
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750664010; cv=none; b=ST0+4KPFbTCwLMKxLUlaSj2zyUO9eyzmvV9/PDEcX2WwWGCqCkcBwRu41hxIPMSW39M6ooTNoulGOWs+p0uB3TmDyHWOnoCaiLM/a7yS+f+lsVJGlETknXWdAgzFMgnMxxsca3jyEfN2T2d9x2FEWpd/wfzzaqAyEmMHqoj5vjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750664010; c=relaxed/simple;
	bh=bt/3C0b0amet+2A5NEHoB0EUIulylANkb0Bmm/+YNTk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=AJKex8a1FmvJ3ZQ0Dh4vviYchjIDKBot2lG8D5VFLeS/LKzkBmEEXG51tG2t0KDVSqXLterGy2ZbPHUjqTI9WxxS4qqcbgA9LS0TIL4K0b/Aa08Oc63VbUapaDMT2RLn/ZmrZMXIXr+hPXIcmTPcL2jYEnUKzy+HgPNcschum54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddafe52d04so127565905ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664008; x=1751268808;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZE0QMr4VbSBYs6MwQrT8Msy+4D9+369d7XenWZh3mx0=;
        b=DqZxUnDEdHn+rxyIg1lQWAofjVAdoUk7zRI1DjxzYNJ8SbhSeRrbqs3FsDG9eEMvOc
         SdSMcR2XMwR9lGQiYCD26Cpk9HywXI6v9uRzHdAmQvZYZw5LgSz9fcMbCzptb38DHX47
         HTqvD2v47DVxuJj5XC2CrYZ56cRG+8Vy4pIAz64yA2emp7urFIDopaEe9YFSNhD1WnxU
         H0IwZM1mFUVO4uCrDniqRqRxyaN1c7zp88AJrrFu6h6u2qup3wzDN672oh247pY9Y19t
         Eq+vu5DHxJ9CknJFyb3KnEGq7aaKvZgWkYtLriQkDMidlck1dlitEcK1KQlfzIg34h9q
         +LQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFavF6bEAkiKQx+Sam2L5CBwg+9VEfqQ58G22DO5YZc378F5G5stl/O0rqk/nlfpSVRXIGGv8HPiK4JoU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt64Xgtkgqj4yoKkRPdQrH1PBdXXvEZzphuFbtW+ZmjjqnDJys
	yS1DlHENegUYjtT5j/sMMfRZqCGC1NBm32pRvRQQUI/TeLbqPthjffofxxvmNOTEzibirG6BQkg
	sqt8j7QTcokiECv+Q2acPUh4zAPbEGhzLa4unuRUMT0rUje8gIBWubXkkC+E=
X-Google-Smtp-Source: AGHT+IFTe1KASF9G8qWQgTKV/EGf01I84heDGCqbAO794LWCVpo6yvgkP/4QPFZC+BPlwtbnbiUV1PO/IcZzWcNPAxVemYET4m0r
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2488:b0:3dd:c40d:787e with SMTP id
 e9e14a558f8ab-3de38c1b8f3mr148063635ab.2.1750664007934; Mon, 23 Jun 2025
 00:33:27 -0700 (PDT)
Date: Mon, 23 Jun 2025 00:33:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68590347.a00a0220.2e5631.0014.GAE@google.com>
Subject: [syzbot] Monthly serial report (Jun 2025)
From: syzbot <syzbot+list124304fea1b5c7cd66e5@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello serial maintainers/developers,

This is a 31-day syzbot report for the serial subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/serial

During the period, 0 new issues were detected and 0 were fixed.
In total, 17 issues are still open and 44 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1235    Yes   KMSAN: uninit-value in n_tty_receive_buf_standard
                  https://syzkaller.appspot.com/bug?extid=559c7fe4b8bac56d38c2
<2> 176     Yes   KASAN: slab-use-after-free Read in tty_write_room (2)
                  https://syzkaller.appspot.com/bug?extid=2a81fdd5c6ddffee3894
<3> 128     Yes   KMSAN: uninit-value in n_tty_receive_buf_closing (3)
                  https://syzkaller.appspot.com/bug?extid=dd514b5f0cf048aec256
<4> 60      Yes   possible deadlock in tty_buffer_flush (3)
                  https://syzkaller.appspot.com/bug?extid=52cf91760dcb1dac6376
<5> 23      No    KMSAN: uninit-value in n_tty_lookahead_flow_ctrl (2)
                  https://syzkaller.appspot.com/bug?extid=290abdcd4f509377a0eb
<6> 11      No    possible deadlock in debug_check_no_obj_freed (2)
                  https://syzkaller.appspot.com/bug?extid=84186930788ce222de35

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
