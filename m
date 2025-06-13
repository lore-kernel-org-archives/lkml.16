Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA9B2E0B69
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749817536; cv=none; b=CQd76UjEAlswqr+9lLMtyKNiWOd+scjZ0t8WuoAvcUnhHOuwyShz+FuoJx9A+dYL4uEjt8fwIFugYGeb3n+8XjvmY49wtp1oW27oo2AawuA/uhHY1DtnCGYQsloa6elW1btoIEf4Yne2QrWw16k430SGKPb8BkrW2C5We2GNNWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749817536; c=relaxed/simple;
	bh=xXLvO83QobKio38NPgAX9zYiOhFmSYOmZ+tz5SjUUzs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=OYrGyEDfuNbhz3RGsa8F/tOvPtYw1GxmqMkFLyoaVBHpEdKOQkwRfnRT3IHNIM7VvW02z7mDGIprsWDmOomsqy0dTuB0/AYNJiNBXNSYBWNxwhH6IJZC8gFzYYkfPKVB5FYFg67OF1eIzC/cfyWovwFggJY9N9U/pZpt8XgOlzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddce94383bso11539915ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749817534; x=1750422334;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wBuRxU9RaRv46Od8ITWxIaO6XUtduORTSyHPfXj8twg=;
        b=IXSA8xCiCV9TUDhW2W3PPhya+Rml5yA1/9DvFtUS9tqyboPmnCAzXOZj8cERkL6HVz
         h0nljNhTuGHx9zhUDMjcSRRwMcPjUrUdyZAUqsDjLXKdCWBk+qJG5dnLcxKGFzXX7hEk
         B+BQ624gGdg/SZpoYI6dvVZVbjmF05XoKgbf/OqraNmcgnXEaXbOPgZh/yNQwLXQkBZp
         nY5ozFTO35ut9GKSAjn1WyJMQoBzkDF4cE8u/WBR5661mtxfS8po8i1DCuuszshOS0oj
         SjYznwRswpcPSLmJHyUC4r9qP65Fyqyq38N0QqIC7P/mS5+GAzJZRf/dGDRSrXCidpx/
         iiGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTyBshrYEcRy2togGwXrJ/qlXa8qOge7kTKzGcS0wmu9dvgK+cCALuywrrsfCIVVrld2mM1uip4z9Pcz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcHfJuD14jYzPjaeBThvR5RuPOtBiqAyI8dBbfolwE5AemUJsC
	hwiroVx7AV1E+CKXyYsveEY55vWFmo3hLxAgwUpdtU+h1y1sCmLqFvZl9VcEGBLwnWfEoznrHq1
	S3TDL3N6p/SGnOzBmeh/9MpTrBwnn2jYj/+riTtlaZxbiO0uSnVRkruFv3gg=
X-Google-Smtp-Source: AGHT+IGZwjYdmn4xZHZ9IU+4i+TEAmMKlsvcAJkjOT+L2IKk8ehVyiyPDgZGIXV/tLyOZZdebz3Q3FKsbQ2kkk7cDcGEAGurI18z
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3e02:b0:3dd:892d:b25e with SMTP id
 e9e14a558f8ab-3de00c28f17mr29053555ab.22.1749817534084; Fri, 13 Jun 2025
 05:25:34 -0700 (PDT)
Date: Fri, 13 Jun 2025 05:25:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684c18be.a00a0220.279073.000c.GAE@google.com>
Subject: [syzbot] Monthly gfs2 report (Jun 2025)
From: syzbot <syzbot+list34ab25ce4f800e605e47@syzkaller.appspotmail.com>
To: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello gfs2 maintainers/developers,

This is a 31-day syzbot report for the gfs2 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/gfs2

During the period, 4 new issues were detected and 1 were fixed.
In total, 18 issues are still open and 37 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  2244    Yes   kernel BUG in gfs2_withdraw
                   https://syzkaller.appspot.com/bug?extid=ed42f17ebcb58526788c
<2>  1385    Yes   kernel BUG in gfs2_glock_nq (2)
                   https://syzkaller.appspot.com/bug?extid=70f4e455dee59ab40c80
<3>  235     Yes   INFO: task hung in __gfs2_lookup
                   https://syzkaller.appspot.com/bug?extid=8a86bdd8c524e46ff97a
<4>  30      Yes   WARNING in gfs2_ri_update (2)
                   https://syzkaller.appspot.com/bug?extid=7567dc5c8aa8f68bde74
<5>  29      Yes   INFO: task hung in gfs2_glock_nq
                   https://syzkaller.appspot.com/bug?extid=dbb72d38131e90dc1f66
<6>  18      No    WARNING in gfs2_put_super
                   https://syzkaller.appspot.com/bug?extid=56182be23469e01affbc
<7>  8       Yes   kernel BUG in qd_put (3)
                   https://syzkaller.appspot.com/bug?extid=0423714c06c369318794
<8>  6       Yes   stack segment fault in gfs2_glock_dq
                   https://syzkaller.appspot.com/bug?extid=e0dbe53de58ffe4a5f31
<9>  5       No    kernel BUG in do_qc
                   https://syzkaller.appspot.com/bug?extid=bad65435361712796381
<10> 3       No    KASAN: slab-use-after-free Write in gfs2_qd_dealloc (3)
                   https://syzkaller.appspot.com/bug?extid=42a37bf8045847d8f9d2

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
