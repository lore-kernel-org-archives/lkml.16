Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9483F20B803
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316697; cv=none; b=I0/b1Gje0OZmf7yFDifFfxUqHG6RK0sVJmZHQ7eSMu+YuGIDD1QTbVwCGNkSjiocgRisG6e53Lkj8ceLLVrDeKDZy+JezIz4mf1LzaMr8T0HvoILdsOxG7Gn4iKl1pb7v9VFDjQQ1c2ZHYs8PFYV/f+J7s1R0Jl0s+pSnuzas8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316697; c=relaxed/simple;
	bh=nFlFrczH7SYbc4gLt8togwXX4y0Q9zM0fQldIlPydUA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ZqCnrGBIfO1zvdWocw5y3xwKcubheBMMfU1NvbRrjZS/fQy+fcnXL9IOKH6s7hyY6qXTOgFwzgRjhJXLpMXXaCYL45yMAVbeBbCsFTtoh3pHYJYL2VIsKRWQ0qTBqKS50nvj3jXfRCaONQV6Vd2qie/x6lWKoxceyQBrHecBtj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86186c58c41so445232339f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316694; x=1745921494;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FADM+Vy3LutHRpNz0gFtPgLujcJmoJ8oLUzcU/ytsmY=;
        b=fsJbKGs3gaE0u9qJBwRIbNtjHGrrgNY3WyIjpACaecWmrIBDZlbFqZC5F2Cd0DIDw0
         ozPISJ+qyqggcRV8dKQo8mV32KZ8IH9Mg1/uBIK3omv/4aNPen67TutwFJv+Cdod8TzF
         VY/vFIFyuEZXhO6RROQuVsFgHzLloRqCtZC+cs8hRHFmRPje7SfLGTbNeMlyKKnugmc5
         i172HuBX75irebR07kKEy3Qe7vACqESCtJ8slM7nHsEvQZ0F4KOKfxD5pc015RGbl32k
         H0jef5rlSHds/j2DKjjDe6769N68B7R9Llp1Ae7yMXH4cIigAyAw/gnKbIn/aqhq+qTj
         LlTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW87F0zmNO8ru0ztfOSbPZ0VRXja6pJGB8DXRv7grGg86XobRfV7ZGL+DM/Ms42m5P5FpxE7CMBvvrt0TE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXktL9WaGF9qtXmqvG9Ie/8TYL3PyFjdVNzp1ZYanLamJp4bhP
	1WkhHITNQCayNg0Wk91OyA7mqKCl2TiOby8CA5zd69dh1D+Wk72fzLiWCQU/DsXbQro9lBUyAFk
	AAhLu6XQwjnVIs1fe8YSsf151tLeEc850gfn3DAEBAw2kOdCWprZ9x0g=
X-Google-Smtp-Source: AGHT+IFNm9cGi4tsJsanVXLkVKg+U7t9k53jRGjSUrv2cpc+P/Ea+iEJRcRvu3Ao1HEcqHpoLcLcGYj6H/j6aFCUn6py+CHxL+v/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d8d:b0:3d8:1ed0:e167 with SMTP id
 e9e14a558f8ab-3d88fccbc02mr132124355ab.14.1745316694529; Tue, 22 Apr 2025
 03:11:34 -0700 (PDT)
Date: Tue, 22 Apr 2025 03:11:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68076b56.050a0220.8500a.0006.GAE@google.com>
Subject: [syzbot] Monthly jfs report (Apr 2025)
From: syzbot <syzbot+list1b5f7ff719cd6cb71b9f@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello jfs maintainers/developers,

This is a 31-day syzbot report for the jfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/jfs

During the period, 1 new issues were detected and 0 were fixed.
In total, 49 issues are still open and 58 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  42836   Yes   kernel BUG in jfs_evict_inode
                   https://syzkaller.appspot.com/bug?extid=9c0c58ea2e4887ab502e
<2>  22019   Yes   kernel BUG in txUnlock
                   https://syzkaller.appspot.com/bug?extid=a63afa301d1258d09267
<3>  18817   Yes   WARNING in dbAdjTree
                   https://syzkaller.appspot.com/bug?extid=ab18fa9c959320611727
<4>  6017    Yes   general protection fault in lmLogSync (2)
                   https://syzkaller.appspot.com/bug?extid=e14b1036481911ae4d77
<5>  3510    Yes   kernel BUG in dbFindLeaf
                   https://syzkaller.appspot.com/bug?extid=dcea2548c903300a400e
<6>  3155    Yes   INFO: task hung in lock_metapage
                   https://syzkaller.appspot.com/bug?extid=1d84a1682e4673d5c4fb
<7>  3134    Yes   KASAN: user-memory-access Write in __destroy_inode
                   https://syzkaller.appspot.com/bug?extid=dcc068159182a4c31ca3
<8>  2294    Yes   general protection fault in write_special_inodes
                   https://syzkaller.appspot.com/bug?extid=c732e285f8fc38d15916
<9>  1903    Yes   INFO: trying to register non-static key in txEnd (2)
                   https://syzkaller.appspot.com/bug?extid=5b27962d84feb4acb5c1
<10> 1831    Yes   general protection fault in jfs_flush_journal
                   https://syzkaller.appspot.com/bug?extid=194bfe3476f96782c0b6

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
