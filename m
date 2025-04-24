Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ED5221FCC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499998; cv=none; b=MaGT0Vy+WYy3czM3gssQxGJDhPMdEFWdaiAFiUl8CBIGga1mlDLYAXoAIdl6om5IoKKgvGM6MPzTh+6sNbhpAc6yUI7UiNr8/IK/vnsTOUQyPeX/cuEiMRxLi0F4CIE3Hl/6nk5ZlkcqoIBesJrT4U7FuqGzd4IDmzYN486uL1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499998; c=relaxed/simple;
	bh=US4hBOQ35qMSKZcHqZraOmKz9wazcO6gntjfFKwNdIc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ELQ21b3UE5gOXF2PYzDm1ryOTQd3lojs0bxH4xUtDSmlXiswFAGkCAl1nO8JF/d0qPTzWNlAvoWRCNZ4YOSBJuQc3dkA97XA8YqSGCoNHxBdHyofeuGaGHHcfxNJAtdzauxBZgzOBqONeAMSpbdQHD2PmaO7muQkYZqfl4/Xe88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d44dc8a9b4so9966305ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499996; x=1746104796;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P0t1Ey4JsPfq8z6YpUtvbqa00dNXHUUr6PETGwji+oM=;
        b=Layv7JF5JTVQUEvdtZvuam8NUtuDlVg4KVYb/KtHDS/0xYDLDIS9jCnnZOC8zKb3SL
         n9ihl9MXpJeslLDvao+gN7StXf+NGWihUm7dD1PVefSFNVoifOJzClz7xlinzTlvjlog
         X+0CNcZzGDw1GHp/OEv5SeTSeUtZXhZKb5q5Y610bN/WQiqlsoHIKsWIzs94IwNiodo8
         wkimtIHxgqQ7lrIcJ349vQRsuFSYwZR8NMf59iQF4IOPtcZub+bc6DWztalUhCcpbvp1
         Cf8LUeHarRiMuuhiQt4d4T/0A4TgVWYqmsi+txGi68mEKX5XF7pAZ4PlOB6SybyfZZqa
         K7TA==
X-Forwarded-Encrypted: i=1; AJvYcCXYIbv8tIF4mhIdPal8E3ehcG9B1n5H4Fg3g/g+gFPLQqfA3Z44IMNIKnDJDEFZPqBB7bbcCAzyyHcaGnM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybk7mBPkptrav3r5GMZy7YvXDaq1JxjRdwRrEogpH/aPe9LmWF
	mJcWzV4nQ4Im+m3ai6xnWX0UZQzDmM+AL24e3/4XKUrCNQx2HTzsKf5zRMcleRAkDbi1GIy6Yne
	Gf72aG6vTSBeJpOjGRkYLlYZwtbAP/8Lorkm4thzYVYXJkczNOEK4sHM=
X-Google-Smtp-Source: AGHT+IGIt/wLrAS2ZdJEDOJhSQuZSDIqL4oY0O4Gdka0LnscUSu+FeIxSHLo6Q0CXKrz7KRO22jbCTgDftow9mbmpc3ck+snqwMO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fe6:b0:3d8:1ea5:26e0 with SMTP id
 e9e14a558f8ab-3d930412d02mr28773105ab.18.1745499996280; Thu, 24 Apr 2025
 06:06:36 -0700 (PDT)
Date: Thu, 24 Apr 2025 06:06:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680a375c.050a0220.10d98e.0008.GAE@google.com>
Subject: [syzbot] Monthly ext4 report (Apr 2025)
From: syzbot <syzbot+liste648da94c5214db8d247@syzkaller.appspotmail.com>
To: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ext4 maintainers/developers,

This is a 31-day syzbot report for the ext4 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ext4

During the period, 2 new issues were detected and 2 were fixed.
In total, 50 issues are still open and 151 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  48268   Yes   possible deadlock in dqget
                   https://syzkaller.appspot.com/bug?extid=6e493c165d26d6fcbf72
<2>  2372    Yes   INFO: task hung in sync_inodes_sb (5)
                   https://syzkaller.appspot.com/bug?extid=30476ec1b6dc84471133
<3>  2085    Yes   kernel BUG in ext4_do_writepages
                   https://syzkaller.appspot.com/bug?extid=d1da16f03614058fdc48
<4>  2062    Yes   INFO: task hung in jbd2_journal_commit_transaction (5)
                   https://syzkaller.appspot.com/bug?extid=3071bdd0a9953bc0d177
<5>  1515    Yes   KASAN: out-of-bounds Read in ext4_xattr_set_entry
                   https://syzkaller.appspot.com/bug?extid=f792df426ff0f5ceb8d1
<6>  383     Yes   INFO: task hung in do_get_write_access (3)
                   https://syzkaller.appspot.com/bug?extid=e7c786ece54bad9d1e43
<7>  283     No    KCSAN: data-race in generic_buffers_fsync_noflush / writeback_single_inode (3)
                   https://syzkaller.appspot.com/bug?extid=35257a2200785ea628f5
<8>  186     Yes   KMSAN: uninit-value in aes_encrypt (5)
                   https://syzkaller.appspot.com/bug?extid=aeb14e2539ffb6d21130
<9>  100     Yes   WARNING: locking bug in find_lock_lowest_rq
                   https://syzkaller.appspot.com/bug?extid=9a3a26ce3bf119f0190b
<10> 79      Yes   KASAN: slab-out-of-bounds Read in ext4_read_inline_dir
                   https://syzkaller.appspot.com/bug?extid=ee5f6a9c86b42ed64fec

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
