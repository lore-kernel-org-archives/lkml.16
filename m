Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634212C3759
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745930852; cv=none; b=fMWnqiyWV9u0SrBvZ+zImo6LGajO5Bz58cioSxOlQCKaLH6NOK0yHlTNhXmWPMMGw3YPf6YIqTGgrlFeqm9orlwatLGeO6o4V7RadXwsOuWoVuYq0stPnyc9GSkvc+BqgldpB8uQl/LMIjnJmTEOGVJpuJUqBcHI34NXK5GgOAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745930852; c=relaxed/simple;
	bh=cFF6VU1FyugaAJfxTA/LO9ddZ+pDnBgTgMqHrjX799U=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Bys0zeo9QF7CDyHHLzuc8EY3/YMfAaloX014a/YHoOZPSawvLYezei3vs2a6Ky/Dv+Sd/Bq8DCEXqbz497qr1eW6GoB84dDr65Pau2aWIccY3gsiG6sjui24zOM7Dn7xbXKieS2CNWaelsT3Uti4tQOdNl956N3xYr+B13sOc4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-861d6e340e2so560338139f.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745930850; x=1746535650;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lBvDxpT3qeCElgQSmEgjirhy8ts7wnaWc0xcs/cQkA=;
        b=cgIMbX3GUwYcytCxrxee9nR1RiCI1dAFlxc8Mwcg0YKIpIpfDfemwdQrTwDBgZDs0b
         AEJXkSBPI/Y09m4e198b5tFbw51AduCdkq8WncnmO8/YC6FOBkaDtXdZAq8g/7Xugwbo
         lUEH5gkGvquOjtCpnnTEgteV+NOQhENyOcqlPD15e1xrUYp+PGtJrNslSXiWLTLmp43y
         jQGnPQDZiI8dbmLnOebcWs929IrP7EcZ8j6YRJHWghD7UcqnIELEgZL6JIbOSX56fPzr
         BjRv00LfSIU7WBd3RIAEOxjTxknNnsslGCmDk/mvWGMuMWCwDA+Ty8U/eR1opnlt/eGG
         w9ng==
X-Forwarded-Encrypted: i=1; AJvYcCWXcUhc6nlEN6MfLUJUd5QkJc/DZQVSLwzHoLmEkeMaP0zMRZtFUXCwsRL2oX8klCf9Hut6WhliQAw9+lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqpX1/FVe6dlyF69pY2fHMlCFdqQrto3OmhznCnyiBFDN62RF4
	gsb+gQRkHyqPKpu5kFU6wwbyUuISb+pZMKLyNDNZwflqe8EABU7w6q+ccMVF6YQhcTB9IBBDiAe
	W1rj1tu7jyeHMZJbz1nkHyIyNrHwXquGzFoq1ORHduXjbS63iLeJcU4g=
X-Google-Smtp-Source: AGHT+IEYNvZE6kKWhT93yep1SZFjQTCGkUfGLqor7tn2UjjmQO0T/emH97LXWiNj/tKXcQbPoDaf8F8q8j+VWtoruKLl0BIEOoqp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:27c6:b0:85b:b82f:965b with SMTP id
 ca18e2360f4ac-86467fd5c6bmr1468087539f.12.1745930850563; Tue, 29 Apr 2025
 05:47:30 -0700 (PDT)
Date: Tue, 29 Apr 2025 05:47:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6810ca62.050a0220.16fb2c.0002.GAE@google.com>
Subject: [syzbot] Monthly ocfs2 report (Apr 2025)
From: syzbot <syzbot+list2798b3e8aee0b9ae07b2@syzkaller.appspotmail.com>
To: jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	linux-kernel@vger.kernel.org, mark@fasheh.com, ocfs2-devel@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ocfs2 maintainers/developers,

This is a 31-day syzbot report for the ocfs2 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ocfs2

During the period, 3 new issues were detected and 0 were fixed.
In total, 72 issues are still open and 16 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  168860  Yes   possible deadlock in ocfs2_try_remove_refcount_tree
                   https://syzkaller.appspot.com/bug?extid=1fed2de07d8e11a3ec1b
<2>  49590   Yes   possible deadlock in dqget
                   https://syzkaller.appspot.com/bug?extid=6e493c165d26d6fcbf72
<3>  37759   Yes   possible deadlock in ocfs2_acquire_dquot
                   https://syzkaller.appspot.com/bug?extid=51244a05705883616c95
<4>  17497   Yes   possible deadlock in ocfs2_reserve_suballoc_bits
                   https://syzkaller.appspot.com/bug?extid=5d516fba7bc3c966c9a9
<5>  11874   Yes   possible deadlock in ocfs2_reserve_local_alloc_bits
                   https://syzkaller.appspot.com/bug?extid=843fa26882088a9ee7e3
<6>  11560   Yes   possible deadlock in ocfs2_init_acl
                   https://syzkaller.appspot.com/bug?extid=4007ab5229e732466d9f
<7>  7792    Yes   possible deadlock in deactivate_super (2)
                   https://syzkaller.appspot.com/bug?extid=180dd013ba371eabc162
<8>  6409    Yes   possible deadlock in ocfs2_setattr
                   https://syzkaller.appspot.com/bug?extid=d78497256d53041ee229
<9>  2378    No    possible deadlock in ocfs2_xattr_set
                   https://syzkaller.appspot.com/bug?extid=ba9a789bd1f4d21fcefe
<10> 2198    No    possible deadlock in ocfs2_lock_global_qf
                   https://syzkaller.appspot.com/bug?extid=b53d753ae8fb473e2397

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
