Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788871EF391
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663888; cv=none; b=dGkRkubWsQdDOoCCbrcjDymw3VrbnWCYAgN4g0+Mo4pIHFO0f7Yy7T8Age+hMhoWMh5SZi6L+IK/8bPXvrT8PlQbblTMcIzLFh9wt2JiPOc6kxPdU9k/ajTR+s42Mud4sbBq3IpZwkP9W5HxGw0cs/aeJI0tnsGcQCRobSzZkxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663888; c=relaxed/simple;
	bh=JcZcdC8M3f+hDauk5T2G7SH7h8DPKqfY17ksUY+Mk7w=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=UbFMt74fVtRBLqRhVVHabIbfbuWyaguo5AVfjSFPouHKmqLRI5BPA6KFNrRvS34CTAZHxt06o/KDpFtM/HITI9hTm6iMhMO8LwCswXOkjmrHYaFyZhSUYa0fecxsqzyIY4R5A8rGpPJzRly9JbW/CEvXkoiUHb9bVfUR8T/g+MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-87595d00ca0so308938039f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750663885; x=1751268685;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMrG7D0IFeHrM2AqL8rEB+iEl8IrcIBlu1rsb+uQF6w=;
        b=YSaAxZ+0O1Gk+fnCs95vXNgGJhWtJsRVpM88jATonV3ida637GIT9oGBKZGG9GQDjj
         AxxG5LgNV+RxBsDien1kKCdgSlAAxYabq/07T8GKSYiPSsIhwqwnaEPzN76siDSSU6dG
         fxXIZGNE1vMPdq4McgMMyyPVEy+ldpD0G90g83ry6/EVDQtv6fp3kOP7VRhssWFP66L9
         WCXqmYJEs9w41J5B0ov+iMl364U8Xijcf7sGfeacmpxyjpLC/cgV5lRltlkYmhXoRs/5
         1eUtFTdRm0yahhlGYNX5z42dWZdxRHrctqCbd1qt9omI+Yr3e6y6HNPY9BjCBMhPwMGZ
         bZIg==
X-Forwarded-Encrypted: i=1; AJvYcCWPSX/Jp0p6g0tJvKwmeGyaKdXlYHB5C46ISoW4+Rvox5ncyJfo6lngptrbHfjpUGCEsHG1aSE7axlnV44=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuiV9rk5SngDWY2GEZ5xEwk4eTEMhxZJOxArfBr4LFGJ5WbGot
	ACTAP6m/Rn/73P3KJUbnU9/IDHJ72VNf9qfiNnDiWurehBbEiWp+3H/XkpgdrgNbX7ndvpfLfFV
	CDf55b3o3YEk3ri7KXgEHQlLn82E3jzOsRdfFwimWciv8b3UqEzRzBe6cLIc=
X-Google-Smtp-Source: AGHT+IEmeDmP++QWX1ZXO/Pgou/1/mlIusLtFx3LZxR7jT/rIgMNOX7js7tZNVrhPZ0dQUnoGszkqAjM6C6wShyBgZZJalGJeEWf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3f03:b0:86c:ee8b:c088 with SMTP id
 ca18e2360f4ac-8762d2250aemr1117834139f.11.1750663885731; Mon, 23 Jun 2025
 00:31:25 -0700 (PDT)
Date: Mon, 23 Jun 2025 00:31:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685902cd.a00a0220.2e5631.0010.GAE@google.com>
Subject: [syzbot] Monthly jfs report (Jun 2025)
From: syzbot <syzbot+listcc392c3218f8e5980dac@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello jfs maintainers/developers,

This is a 31-day syzbot report for the jfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/jfs

During the period, 2 new issues were detected and 0 were fixed.
In total, 57 issues are still open and 60 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  53069   Yes   kernel BUG in jfs_evict_inode
                   https://syzkaller.appspot.com/bug?extid=9c0c58ea2e4887ab502e
<2>  27793   Yes   WARNING in dbAdjTree
                   https://syzkaller.appspot.com/bug?extid=ab18fa9c959320611727
<3>  26283   Yes   kernel BUG in txUnlock
                   https://syzkaller.appspot.com/bug?extid=a63afa301d1258d09267
<4>  6508    Yes   general protection fault in lmLogSync (2)
                   https://syzkaller.appspot.com/bug?extid=e14b1036481911ae4d77
<5>  3778    Yes   kernel BUG in dbFindLeaf
                   https://syzkaller.appspot.com/bug?extid=dcea2548c903300a400e
<6>  3324    Yes   INFO: task hung in lock_metapage
                   https://syzkaller.appspot.com/bug?extid=1d84a1682e4673d5c4fb
<7>  3223    Yes   KASAN: user-memory-access Write in __destroy_inode
                   https://syzkaller.appspot.com/bug?extid=dcc068159182a4c31ca3
<8>  2728    Yes   INFO: trying to register non-static key in txEnd (2)
                   https://syzkaller.appspot.com/bug?extid=5b27962d84feb4acb5c1
<9>  2337    Yes   general protection fault in write_special_inodes
                   https://syzkaller.appspot.com/bug?extid=c732e285f8fc38d15916
<10> 2336    Yes   general protection fault in jfs_flush_journal
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
