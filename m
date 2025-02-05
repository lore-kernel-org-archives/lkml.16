Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3430422E3EA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 12:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759475; cv=none; b=O6Tk6y6EFe9ZYELmWsrNaz3rMBq1LJ5lfbbQn7yZ7g5pj5p6jKx+9cEUdibDRCZ8eOp2fdLRBPKApZOjR4GnF2i27f9ewka3xXHSZXrYHi3/EAOQJ3dKkDXhAPROaZfsX38T4Ka3/reWM/LtSBdswev9KHXU1wM+0g48zimC794=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759475; c=relaxed/simple;
	bh=ht/zvSQM9/vRfZtYjpXWm6tjMHQusBfdmimWrKZiQ7U=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=F00H5MXEYbCQbx14pV6Q3A0e0vAPosi9+LcIj4/0itCR5pcEZpbCAajS4XLa6ty8kvE40wFBueq/u74MIIwt4fzGnQgcjGI+aizHFX2XZVjJ8eAQUaAaHghuHVeiUpsaL2+jl3jBn+RudzVJGbOaNoAuYXfsnZ9HTSE9z35AfQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d04f20f2baso15133135ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 04:44:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759469; x=1739364269;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DInoo6sTiqlWzioJC80HumUykAkTe3rtHyl6dMYxnBU=;
        b=Ai4CZAgB39F5q1JvFQS3lE/z3DsQ2uZYFWYACebydKURn8hRzWhSbOPoCFblHDAHza
         dvMRhN+YlTCRdNlqKYz5BdMpMmJo3a0or6/SmxTUVXonZKdDCbNGFPVRxEIcA0zw4y9Y
         Ls4kqtMrpUC2/Aq9CVYUQ3XF1+LwF5BlNiILGCtfUz4WBC2TAetp6hZYfGO+UShVmZuG
         JAneCll2jQELvtDlMa/9Y8nx8oP+vr5tbOhVaQB/hbs4E27/2HpbHM26fqaCl3UhSSRx
         A4HQYBKtywiNikWtZxQ862DBvxbCRRybSryEm8M5PuWV0n8Wtv8bh76P8iVHM2dmm61Y
         Bn2Q==
X-Gm-Message-State: AOJu0YyKKAxOs8dZ9DYLDp+4DdvgvrVkVe8FAmrbWPhsRluaFZ92RiON
	jYbVSaggAD0FH3NqyF1YGIw8j6NY4Ytub8HOSSr46RC/d4ZkhsHEoA2Mur1Ao1tcx+c7j0In0Ra
	gYkVPY3tH1poK33tyT0k6tufX7Bw0JbBxb+SPVT8jbQ5V4RPx33Z2Lmk=
X-Google-Smtp-Source: AGHT+IEzJBdqHIJ3FehnNAGdH6vsBlPEOwvXpIIC1WTFRN+bkTIJAHYDV18YoAylQiGlbjKOQbIYPFGa67yPHlVsA9fHOEFty4PG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18cc:b0:3ce:78ab:dcd1 with SMTP id
 e9e14a558f8ab-3d04f936d66mr24665975ab.19.1738759469411; Wed, 05 Feb 2025
 04:44:29 -0800 (PST)
Date: Wed, 05 Feb 2025 04:44:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a35d2d.050a0220.50516.0053.GAE@google.com>
Subject: [syzbot] Monthly mm report (Feb 2025)
From: syzbot <syzbot+listf3ab4bba2c1ad0a87272@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello mm maintainers/developers,

This is a 31-day syzbot report for the mm subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/mm

During the period, 10 new issues were detected and 3 were fixed.
In total, 130 issues are still open and 281 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  179425  Yes   WARNING: locking bug in __set_page_owner
                   https://syzkaller.appspot.com/bug?extid=56dc65adbd1d2ae1f844
<2>  10430   Yes   KASAN: slab-out-of-bounds Read in generic_perform_write
                   https://syzkaller.appspot.com/bug?extid=4a2376bc62e59406c414
<3>  7389    Yes   WARNING in ext4_dirty_folio
                   https://syzkaller.appspot.com/bug?extid=ecab51a4a5b9f26eeaa1
<4>  3624    Yes   INFO: task hung in page_cache_ra_unbounded (2)
                   https://syzkaller.appspot.com/bug?extid=265e1cae90f8fa08f14d
<5>  3191    Yes   INFO: rcu detected stall in worker_thread (9)
                   https://syzkaller.appspot.com/bug?extid=225bfad78b079744fd5e
<6>  2529    Yes   possible deadlock in filemap_fault
                   https://syzkaller.appspot.com/bug?extid=7736960b837908f3a81d
<7>  1518    No    WARNING: locking bug in __schedule
                   https://syzkaller.appspot.com/bug?extid=46b40e354b532433eeef
<8>  1496    Yes   BUG: Bad rss-counter state (5)
                   https://syzkaller.appspot.com/bug?extid=f2bbbb592debc978d46d
<9>  1465    Yes   possible deadlock in gup_fast_fallback
                   https://syzkaller.appspot.com/bug?extid=63ba90b81c16b86379bd
<10> 971     Yes   WARNING in vms_complete_munmap_vmas
                   https://syzkaller.appspot.com/bug?extid=38c3a8b50658644abaca

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
