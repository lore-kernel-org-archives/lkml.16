Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C641F30BB
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663888; cv=none; b=OWF3u6ANnArZUCV55Tt89NMEsqK+ozjEnoaeHIdU1yASLpSH7Vam4dXuXRQMD1Lfocm1KXPTwf/kjVXptUboCm1u3mC3gOL7FFhL+YrZCqXbeY2yxaFAq7D6Hk+l0loLFxnnocmRYA7ak/RN91DE0DgjtN3V4rLo0ZdIfNNJP1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663888; c=relaxed/simple;
	bh=yP74EpJuA4orpT9iEFd0R2RfcQhxdIw1Mp6c9MaOj9o=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=AS+yuw7htsXRLnwym9xuXOkKPas+RPyTq1wX8YaHXmE1yhaN+ZHQ8NixmWRwJCvJqaGluCj19VC1tsXIcC3cd6JqNnOyktsVpHHki8grn2RKDN7jz61yxcDeDnBgTnKgLIzOuPjsIFpxMct8Brjwjnc5vUM90YE0eZXULY7vpBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-875b64cccd6so711837639f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750663886; x=1751268686;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pqLQksYdsEPNV2rKPBe9UgMfKqk5BssYsyD0kAdjx5Q=;
        b=s7KZwd0zz0y8EG7DWiMrPgVZ22hWG0dRSR576F/XpfflwmwtF6ExVJssRmYz6X4P+Y
         rPRq7JXGBBwYpwNyl78S4Kbr2Az/DidW4Q0J45fyp3ike13HwHy0l39YfI03HK4/rMzo
         21bKR5DFJoPPokpJbqfJQN5vNIx5P+CLlCEQKDSM/7dP0TDQXU23IoPqoRQ2WYlm3Non
         VifT9yX2B4nY7/gEfOrwVvhf/zD4GkXFlY3+kkMSkVtlO7eR8v+FA6EdPQv+bGndZ+Hx
         lWFJLZ8hiQPIT/dYSG5dSOhMsuVhsUSF6Z3csFbsKZFAVIXq+0PS0lYe0eXETIm+jy1e
         agFw==
X-Gm-Message-State: AOJu0Ywdj5Dqe7VN6y8FX/UxzyBlDOEhQUDSKKWApTx0srrtqxJG3O/m
	cIXuGCephsjmcef5SXANtt84wEF2is4ruWaX4vL89YREdX5Jl2+4XVJOB1Rli/Eq37GNmqSNlKU
	h2fTUCZeBZFN6/90cK5NcoIOu1Wbn02JEhRUM0RSqEGR7Pi3L0SLTDuBCJxQ=
X-Google-Smtp-Source: AGHT+IGIcBLax78afmUPmZgof1DY+wNcN37l1u7UiYLKiPflmWa+va7XqzdorSNPfJRoY4BEvUA1UT2vLojw6qHpWenLtwuWFx1q
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:154e:b0:873:1c2d:18e7 with SMTP id
 ca18e2360f4ac-8762d19a846mr1140533539f.10.1750663885915; Mon, 23 Jun 2025
 00:31:25 -0700 (PDT)
Date: Mon, 23 Jun 2025 00:31:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685902cd.a00a0220.2e5631.0011.GAE@google.com>
Subject: [syzbot] Monthly usb report (Jun 2025)
From: syzbot <syzbot+listcb3a4e412ba5e3e8d7fa@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 5 new issues were detected and 2 were fixed.
In total, 91 issues are still open and 383 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  4437    Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<2>  2128    Yes   INFO: task hung in jbd2_journal_commit_transaction (5)
                   https://syzkaller.appspot.com/bug?extid=3071bdd0a9953bc0d177
<3>  1607    Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<4>  1391    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<5>  1219    Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<6>  1041    Yes   possible deadlock in input_inject_event
                   https://syzkaller.appspot.com/bug?extid=79c403850e6816dc39cf
<7>  821     Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<8>  723     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f
<9>  603     Yes   KASAN: slab-out-of-bounds Read in mcp2221_raw_event
                   https://syzkaller.appspot.com/bug?extid=52c1a7d3e5b361ccd346
<10> 522     Yes   WARNING in usb_tx_block/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=355c68b459d1d96c4d06

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
