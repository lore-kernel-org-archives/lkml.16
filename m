Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E2F25FA0B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325692; cv=none; b=brlCCYZPkH3zQ4wau87Dy5GQpAfIK7lHl0Bcy4xEn5YtwaWoDIGmyLhGwsVowMK2Rt1PAJoilY3vkJRKkvROoQHL5UqZlTjuTUptGsSnx5sczu/SYra8riv24OuX8M3PdjpNpOeNRSRUg0QWH4X6bRjcZi9V/ph3NXGRY0XQ3n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325692; c=relaxed/simple;
	bh=Kfr7yoo/gwlOIW5psf5E0iPQL0tj4oTNfTbsvyiD7KU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=pV2hKmJ1axXIGnn0FLvEr7TsZE4aO+CfVH+sm5y8aVaQO+LxCQVvr6qBL7eUdNdQ6TNUITdaNNyZy9Af4xAOOaiXP4SM6+pyXpJC+UcIcavxw+P4zBZfOtmxEypbZRklF43R2mrcmw62CEZxUZ0U56xHmjVLDV75j6NUyWPhSUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d6e10f4b85so98630665ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 05:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745325689; x=1745930489;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VofB/6an6VhnaTLehxLmKxnWDf7GjkjvEj6LIuQEf+s=;
        b=abTUFNjRKfGFyrtp/TmkalI0QLzBKGDSXV7++pNMX3+7g1o18FzmjzHZ1JOeHiPhfZ
         jvwgzwwZ3n1PdBZCkjyWRwLNN5X8AhlUj8kzRG59pLXd2Y8Nr7Q8YMBZMN5tcggviP/p
         Fyg7wf/Gvglo9Rku4zLxVVq25txLw4NymheZCkIqSyTOdlAD1zGYZM954u7NKNFm66rh
         OYw0uzFuBOuq5FlBAXwOzSkvt8dxl/j3+McDo4QWtqfGRElK6xzugDgHwMXgLyqn3LPR
         mbrQMubxBBzh8FeHv5T6JQ3AHK4iydvhGh3M8MWtEn+o9bYMc7IeiLIIqmpA5WLg6JS4
         D8tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNJSW4AwooN2YRggfqfWjss/rAG5qw3DO9dBgzrL/VXfwW7r/9kmDxgMS8ilfkXLsmQpmw9eBGUJ69424=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5dPL8L0sCdWUok6aeRwql+NcyNN3hwOi4qbQlBAo3TbIdWtge
	Sbnl+O8Z84+a42j+byy+8CscK0iFhwDwlqDVUzMua0zdAYdMTvZTZKDJHHkuCCJgIMm6dq5U/vU
	8DTDIScfcpnSnms/bblIlEYH+xebX5RvQbShSo17hlr5aBJg7ELZwys8=
X-Google-Smtp-Source: AGHT+IEjd82KzbL/35HJApVw5wh/zmnYQbBq88QjJBsj8E4M00AKomtHN5MQdn6EG9Z96FG4gsrvkEp1MvDSUdq068aia98Tr3PS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b25:b0:3d3:dcfd:2768 with SMTP id
 e9e14a558f8ab-3d88eda86e9mr138019815ab.4.1745325689346; Tue, 22 Apr 2025
 05:41:29 -0700 (PDT)
Date: Tue, 22 Apr 2025 05:41:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68078e79.050a0220.8500a.0015.GAE@google.com>
Subject: [syzbot] Monthly bcachefs report (Apr 2025)
From: syzbot <syzbot+list73b2921034e46fc2b5c8@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello bcachefs maintainers/developers,

This is a 31-day syzbot report for the bcachefs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/bcachefs

During the period, 8 new issues were detected and 6 were fixed.
In total, 123 issues are still open and 175 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  30320   Yes   INFO: task hung in bch2_copygc_stop
                   https://syzkaller.appspot.com/bug?extid=c6fd966ebbdea1e8ff08
<2>  7504    Yes   INFO: task hung in __closure_sync
                   https://syzkaller.appspot.com/bug?extid=7bf808f7fe4a6549f36e
<3>  3678    Yes   WARNING in bch2_trans_srcu_unlock
                   https://syzkaller.appspot.com/bug?extid=1e515cab343dbe5aa38a
<4>  1495    Yes   kernel BUG in __journal_res_get (2)
                   https://syzkaller.appspot.com/bug?extid=53bb24d476ef8368a7f0
<5>  1301    Yes   INFO: task hung in __bch2_fs_stop
                   https://syzkaller.appspot.com/bug?extid=6d3e28b33490b3085412
<6>  1211    Yes   INFO: task hung in bch2_journal_reclaim_thread (2)
                   https://syzkaller.appspot.com/bug?extid=820dc3b465c69f766a57
<7>  1073    Yes   possible deadlock in bch2_symlink
                   https://syzkaller.appspot.com/bug?extid=7836a68852a10ec3d790
<8>  573     Yes   kernel BUG in bch2_quota_check_limit
                   https://syzkaller.appspot.com/bug?extid=8364d1e040a88ed5657d
<9>  387     Yes   WARNING in bch2_trans_put
                   https://syzkaller.appspot.com/bug?extid=291aef749c5cbb9ca2fd
<10> 319     Yes   WARNING in __bch2_truncate_folio
                   https://syzkaller.appspot.com/bug?extid=3d11e35eeafe176a6c5b

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
