Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4D22C2AC2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745930852; cv=none; b=ScgW3LuxF2EkGUYYFLXCXLRu5icVKckFvsKNY62fWC+QtcJfjVXu9e0a+no16U2b8SmDOQPX7WEDJ5ilrSPg7oVZMRR7gOZVCY3eXFq5E59uQsIu9nFtUrDU0UbwcHtMpIT5M4WR4i0kaoj5bl5UXTFYPiXO7lxGwIM9qVZAkyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745930852; c=relaxed/simple;
	bh=1XNP89J/Tqy4Sanc4mx5XgSj5XkVC/D5s4Q8Rnmx4LU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Ollf3NWw4SaQKb1V1k56Zyv6sO8zFLefy2zmi1StCmyyhDXRs7u+/O8UxQ8YD19G3Ior/tIIuji45X3zfWhRRY3hGh5X1zQsmTR8jz11EVVl4ax0iXE7WJkX72QdHMrEnjQ+RiFPa4hfBUCVNqmU7eQori3BQADbFpVH1prHi8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85e15e32379so501969939f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745930850; x=1746535650;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p5AG1F/C08qNE+HenMzsOFVcY2WX3zpkUBhTT5RfdXo=;
        b=qeKrKxdQFlKfQoXHHq8vfh3r/4YZQsKFNPf21dc1SHsnQnbwZQ4RGBFaUo5DUzeOxy
         dzQBPYoRQFg47mmmjItwlFS9aMngwYnXfWbWj9WYZTvermSJNw66j8IQpNAYo2P5n9UB
         RVcHFO06rcywFbgPr3jds1AcBAWoMy6+gFq2rg7b5A+4BLJQfrU84RTlDVxVZJBiEAe2
         rEmTpbxJ7eSuu7cZKLkNNFkkfLiWWSV41jn8r8Yf50gafjOimy3KERRagAIeP3gP2zIq
         FgdKgVws4ELtrOMaFzRmVlW9P31hymToS7b0sV8bR6JuBOCx9HxzXJE8Ocaktn6B/0kd
         FDLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq0Nv66IniKqWmoMiFSbYqNfmmlY+ZxA8eR5ZPdjkLyqOa1tN9CtaJfTN21LvoXdR9FQV6aSJTqJdpl5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFTcZnTxIHMaKEoH1RsQrqn8XddBRLyzA0pRD8hjHmWei+MIas
	JyBnHI/vhg3JZ3a8DxY0er+MnhZ0omZAi868Jno91Mm80BB3vHk8tXdNzg+++LK/X1C61PNvJQ/
	X+rcpgSilStuknOT97WudEskOgLDiYRrXswMNcSgFgDtRjRaAHdOw09Y=
X-Google-Smtp-Source: AGHT+IG0r/SNe4yPRPAB55ldyDMg+W+0ZNs1beU1qITLOCtfpKtKwVBAUoYjMoKwnMMaLxeJ87cZazC9rk1vWd1KnozqVAunaQ78
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1548:b0:862:fc1e:43c4 with SMTP id
 ca18e2360f4ac-86467d128e5mr1587812839f.7.1745930850367; Tue, 29 Apr 2025
 05:47:30 -0700 (PDT)
Date: Tue, 29 Apr 2025 05:47:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6810ca62.050a0220.16fb2c.0001.GAE@google.com>
Subject: [syzbot] Monthly f2fs report (Apr 2025)
From: syzbot <syzbot+listdf8772072a412c2cbcd4@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello f2fs maintainers/developers,

This is a 31-day syzbot report for the f2fs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/f2fs

During the period, 3 new issues were detected and 0 were fixed.
In total, 11 issues are still open and 57 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1248    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<2> 696     Yes   INFO: task hung in evict (2)
                  https://syzkaller.appspot.com/bug?extid=65b1e2d8f2d618a93e96
<3> 372     Yes   kernel BUG in f2fs_evict_inode (4)
                  https://syzkaller.appspot.com/bug?extid=5c81eb8c0a380fa578b5
<4> 48      No    kernel BUG in folio_end_read
                  https://syzkaller.appspot.com/bug?extid=92895fc54ccb69ca6fa9
<5> 8       Yes   kernel BUG in f2fs_write_end_io
                  https://syzkaller.appspot.com/bug?extid=803dd716c4310d16ff3a
<6> 2       Yes   INFO: task hung in f2fs_fallocate (5)
                  https://syzkaller.appspot.com/bug?extid=d05837bec7673c4a18fe

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
