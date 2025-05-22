Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A863D28A73A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918710; cv=none; b=c2AYc9UXZM4hpAnjvY5fj9TWhdJAyF5u03t0ADibtjON9bRx5KNtTRXokB89v2y717KqpOwnQc28icjkE4KvGSInmi91iRqm1lYfR48bPoBzcjOLGfi4bp3/O8+ffBdVN+j7i9eLFLTWeCNYPniJoT7mXmSOGEq52L3U9rUW8v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918710; c=relaxed/simple;
	bh=UDczc3FisTkVeRDDzqDOpcVpYiRhEazsS1cFvyXtad4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=GmXNKR0cL2RvVt89jvQUZHZ2I9fkpUoPUjsa7tr5UTUxaCL/CpGzLitePCywM94lQtKI3a5n8/BVFcA/u/j3l3dS22ugj6N4RjQvvSHbJg3rAOS8Fim/yPDXvZ20EUCXs2tpZJq9GCQZdnhw/NgD8HjUOwPk9dSfBHZAlMrJUHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3db815af5d8so111877905ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918708; x=1748523508;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=evFQw6Ly28nLSPr8OHYJcRMP6jYsr4DR4nvjV9TG/KA=;
        b=WiA/ILJ+UdMauu/6Er6Gt/FfJ17LRigzuQ1iQpGJh6h9FEf4MJqTav3VSqHFVXUxgA
         NcquxHdvKqSsqq8rC/EWJqmN3yLyHNhlgcODYB9DdPI35XKC06LCUeuDelCtQYx/kIhI
         az1mamAdxaonpSBoUPEhQKw7M6BisId0eCHydFY8yORIFj77pVsIZsH8t5iYE2y37PtI
         SLWIMNpRHVJEwOZ8f5uibLEbaGDraeIF/+uxLMuz2L0rUYbhkrHc9k3cPYDRcE5qcBy6
         e28vz18GNbMzpilJ0qBZHI3HIQrGP4I/lIeFwQn2+JdyD0REYwEE0uo7/4+5Q3jjJKfs
         Ur/g==
X-Forwarded-Encrypted: i=1; AJvYcCWaATdjqQjJOaERbd6EZmo2wIplZtzBoD4btWCFV++tv97RP7iol1nOuL6zaC3wXD5RNvoaIcdF8/xaPuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFSrD6J+joWnEbHSnhk5vgjPYyCQUSaUHbB9lY+/jXsR++MuiO
	LFyIkr/6fnpr7Kp5JV6OxzmhwuJRQEpVf9928VZcugqqVHzkJnL2esVTtuXv7CwYCe9uZS2VLfU
	G0sCxngMpC787pQsXNWApwIKgqafxfzrVC0rWni9LtOE0351whqF0GcoMxpA=
X-Google-Smtp-Source: AGHT+IHJpKTNdTBFFSf8GIPQKvpRt+Fclj8eCecvR0dijP9DBJg4xB617rRg96Ja0wUShpDZuUsfdPJMisn/af7Tkn+adWMAkBqq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:184c:b0:3db:754c:63b with SMTP id
 e9e14a558f8ab-3db842de1b9mr296437205ab.12.1747918707767; Thu, 22 May 2025
 05:58:27 -0700 (PDT)
Date: Thu, 22 May 2025 05:58:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682f1f73.a00a0220.2a3337.0019.GAE@google.com>
Subject: [syzbot] Monthly bluetooth report (May 2025)
From: syzbot <syzbot+list28053b3b886a5c3dd091@syzkaller.appspotmail.com>
To: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	luiz.dentz@gmail.com, marcel@holtmann.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello bluetooth maintainers/developers,

This is a 31-day syzbot report for the bluetooth subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/bluetooth

During the period, 5 new issues were detected and 1 were fixed.
In total, 52 issues are still open and 83 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  37884   Yes   KASAN: slab-use-after-free Read in l2cap_unregister_user
                   https://syzkaller.appspot.com/bug?extid=14b6d57fb728e27ce23c
<2>  6736    Yes   WARNING in call_timer_fn
                   https://syzkaller.appspot.com/bug?extid=6fb78d577e89e69602f9
<3>  2362    Yes   general protection fault in lock_sock_nested
                   https://syzkaller.appspot.com/bug?extid=d3ccfb78a0dc16ffebe3
<4>  682     Yes   KASAN: vmalloc-out-of-bounds Read in hci_devcd_dump
                   https://syzkaller.appspot.com/bug?extid=ac3c79181f6aecc5120c
<5>  443     Yes   WARNING in hci_conn_timeout (2)
                   https://syzkaller.appspot.com/bug?extid=fc4b5b2477d4ca272907
<6>  399     Yes   general protection fault in h5_recv
                   https://syzkaller.appspot.com/bug?extid=b5691bb559396b262064
<7>  347     Yes   KASAN: slab-use-after-free Read in force_devcd_write
                   https://syzkaller.appspot.com/bug?extid=bc71245e56f06e3127b7
<8>  278     Yes   general protection fault in bcsp_recv
                   https://syzkaller.appspot.com/bug?extid=4ed6852d4da4606c93da
<9>  249     Yes   WARNING: ODEBUG bug in hci_release_dev (2)
                   https://syzkaller.appspot.com/bug?extid=b170dbf55520ebf5969a
<10> 220     No    WARNING in l2cap_chan_del
                   https://syzkaller.appspot.com/bug?extid=3272785b7a1fc9b510f6

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
