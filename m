Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48D42236E0
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839386; cv=none; b=GMBGJePGgNIA3mu3q4HzRAUOjJTitKYeQKjZyv3mg8UM74ObiFCSlEDcq/bMc/np59UUPQ8l0f20q3mejsyyPqqicx0IaAKRjtbjWhCnXwnhOn0xLEI9uA9093b3S5qZCWouNBQzR2Jgd/gEVDVoIwMYoVBLbE01ORnVN/RHUQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839386; c=relaxed/simple;
	bh=evkJPFS0CFmqU+FK/UuWJQK1jBcGggNKbf2P3w2KlEE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=t3dnBMlmRvWkRvjzDGagINrHvSyxd55MDzW1XUJyZM7gbdrpNvmAY6EmCiWxJ1nUQCalmnG7P58jnXWWKqkSOSJwKredTHJeWIi72aS0mWMadJhOydWHqakcL0oVlm5yEqT11bFUpCsPjdiyloveXdfgHFn0MtnAiBLzxD0sNSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3dc8ab29f1eso1642345ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839384; x=1748444184;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0olR8O5HiA8HNUIc6t8hwoBdi9YUjVcD7dob8mUdSJc=;
        b=lC4BgYDBgl8ofI7369nB0H671ObiIc42i53J0f3USWkHK58D8vmkBZnihlivUk5xve
         E2BYu82chx36zEkiAdNTvy5rewyq90rU2gxdVi75iZlQYVjexSVvV3fH3NkVSTdp4czG
         HAYQ0o/sp6hWZIM8+z18geJgm1Ys2pBlMIfxjoRikUvwKMkRlloa7jx3gede0WPojfMu
         ielhHU8MJisyKZbqVidDlIz8l9ggWZ1WTJqLJjPIfKkXrtKinohAjt38RdFpSj/D1DJv
         PsZs3ulDzJGuPMFoRlwokCXXe6P+LUXP34e4b+QPRlWFFM4agCv/O9jekwz1oT8mZudd
         gCNw==
X-Forwarded-Encrypted: i=1; AJvYcCUe8y7l0gcdeYL4LQ+q8MvGNUUEc3xxYFYvf9fc2nnxZywDOd02+FMWq8fKTLcnTEoCvaMJeTSxFGXrIQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTwyyAmOoYvvKnSnQIQC5nDJtSKvi6vmoxpjKmsLUnQ0/axzb7
	Ee6TEfwrEXypucIXo+dYQddu1+41yZskUqtKc+2EYVt3GHM4t5GHeqyrOijTit/kJa71Q6YnsIn
	RDhM7rakqJmoVRnnoNjar+mZOQMcZQ5iwv782vXdhf58Bk9UzSKrEC2yUnhg=
X-Google-Smtp-Source: AGHT+IHFilunlwHcwb0PkB0yDlSFdRbTj//8BkuCJ/F+lEEbP4rj7Dnkh2cZoV2gSElNyhVrxWISv1VMVtmSsxlrnnWri6VazGxD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4506:20b0:3dc:7240:94a6 with SMTP id
 e9e14a558f8ab-3dc72409e86mr72031465ab.3.1747839383860; Wed, 21 May 2025
 07:56:23 -0700 (PDT)
Date: Wed, 21 May 2025 07:56:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682de997.050a0220.ade60.09ce.GAE@google.com>
Subject: [syzbot] Monthly jfs report (May 2025)
From: syzbot <syzbot+listb820ab440d2c475644a6@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello jfs maintainers/developers,

This is a 31-day syzbot report for the jfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/jfs

During the period, 4 new issues were detected and 0 were fixed.
In total, 52 issues are still open and 58 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  47298   Yes   kernel BUG in jfs_evict_inode
                   https://syzkaller.appspot.com/bug?extid=9c0c58ea2e4887ab502e
<2>  23836   Yes   kernel BUG in txUnlock
                   https://syzkaller.appspot.com/bug?extid=a63afa301d1258d09267
<3>  21946   Yes   WARNING in dbAdjTree
                   https://syzkaller.appspot.com/bug?extid=ab18fa9c959320611727
<4>  6265    Yes   general protection fault in lmLogSync (2)
                   https://syzkaller.appspot.com/bug?extid=e14b1036481911ae4d77
<5>  3646    Yes   kernel BUG in dbFindLeaf
                   https://syzkaller.appspot.com/bug?extid=dcea2548c903300a400e
<6>  3260    Yes   INFO: task hung in lock_metapage
                   https://syzkaller.appspot.com/bug?extid=1d84a1682e4673d5c4fb
<7>  3173    Yes   KASAN: user-memory-access Write in __destroy_inode
                   https://syzkaller.appspot.com/bug?extid=dcc068159182a4c31ca3
<8>  2411    Yes   INFO: trying to register non-static key in txEnd (2)
                   https://syzkaller.appspot.com/bug?extid=5b27962d84feb4acb5c1
<9>  2325    Yes   general protection fault in write_special_inodes
                   https://syzkaller.appspot.com/bug?extid=c732e285f8fc38d15916
<10> 2253    Yes   general protection fault in jfs_flush_journal
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
