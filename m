Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2AB254861
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744182692; cv=none; b=DUJJTfLmJAjlCrGwYUxEv1ESYG/MMvTEn91GA6A1DO0kTHlLTIqPSqa1nQ3pth2t1yo6GMCTpIwLSA+04i4R72vcRO6n6cQ2w7lypuIkn8kwpN6cOsrEFizNXHelS0XdKXLGKxUlmaz5p67R8rkFLNtr9eq0W+yLldqlYx+sPuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744182692; c=relaxed/simple;
	bh=DLrqeZwq2Q72CIhyW6axEdWT0PQCSAs+gF4T0faLQlg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=tENekhK+gIUDEQL0DbxQIMgAjZUvWnIjXAF4ZRgKuQypStTfRD8jyIhOtZdqeafwtrK1Kuru1yB41pGzZw5vFCjAZylKm+9woYzzMagHiJSSDSedAndCFt2eoa0BxcYM9qSduALLnjPIVAxHKmBTRtO6DUbav+jm4WPYCqGLYoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d586b968cfso141899645ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 00:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744182689; x=1744787489;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6kgzjf46M062S6l667PCVBG/AYsqvUV5BIa8evsZG/U=;
        b=OXG4GuPARDDwFKqFsu4odm4+YZjoruNABREppjIKv3KeESw9Rs/DfebO8dIdb2BhRp
         VHHQS/9dQB3Qbunm0TvDZ7YlyyE8kIQP6V7thStQ2x/MixBdpodCvEY4rnbkAN21DypY
         wVXSHWu6xHtoabdcuEAJ4phLUnO4epkl1oolaE67KBX8/3MbivzpGdipQlsCMMi+p48C
         LKYiJGs9t6js6ol5z2t1w6K1fniUHdienTBAHyq8ZokVHBSwBp2skU9p6D/oR9SSlKwu
         c8U88KoQ00OWDN+nQAKQK4XmZJkDjHKNb+Zyvn8kKzldB/BWd6NVkLts6oRpe3gYt4RJ
         a19Q==
X-Gm-Message-State: AOJu0Yx43aMIZkgiJzVumd5N9hAjtnda/wZvsk1xI+MdWZC8BO+hzs1s
	JLmWG/QRuypKE9PKhv4YqyDf8ppv+6Zjx3rxBJejgC21L+Hoe+DsH5UvL2gpyFGrLhGhfcp1D4q
	J7hUu6jnrUWJL9shOUPG8tOea5YQyT7k+i9ieDDwBiZWfG99v9/DKIEU=
X-Google-Smtp-Source: AGHT+IGLP3aM1R8DLlM5mgqmq6lR6ONhamb/Pa9CW6sSoilr1vdhPzMYtkqglTt77RDMLF10zQpF7z/PHC2Bvq1BC91sAuYjAR8b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3112:b0:3d4:35d3:87d3 with SMTP id
 e9e14a558f8ab-3d7b45fd134mr13650775ab.4.1744182689638; Wed, 09 Apr 2025
 00:11:29 -0700 (PDT)
Date: Wed, 09 Apr 2025 00:11:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f61da1.050a0220.258fea.0017.GAE@google.com>
Subject: [syzbot] Monthly mm report (Apr 2025)
From: syzbot <syzbot+list58f5016b78efa94eba11@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello mm maintainers/developers,

This is a 31-day syzbot report for the mm subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/mm

During the period, 10 new issues were detected and 2 were fixed.
In total, 138 issues are still open and 287 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  10473   Yes   KASAN: slab-out-of-bounds Read in generic_perform_write
                   https://syzkaller.appspot.com/bug?extid=4a2376bc62e59406c414
<2>  7396    Yes   WARNING in ext4_dirty_folio
                   https://syzkaller.appspot.com/bug?extid=ecab51a4a5b9f26eeaa1
<3>  3410    Yes   INFO: rcu detected stall in worker_thread (9)
                   https://syzkaller.appspot.com/bug?extid=225bfad78b079744fd5e
<4>  2585    Yes   possible deadlock in filemap_fault
                   https://syzkaller.appspot.com/bug?extid=7736960b837908f3a81d
<5>  2335    Yes   BUG: Bad rss-counter state (5)
                   https://syzkaller.appspot.com/bug?extid=f2bbbb592debc978d46d
<6>  1757    Yes   possible deadlock in gup_fast_fallback
                   https://syzkaller.appspot.com/bug?extid=63ba90b81c16b86379bd
<7>  1507    Yes   WARNING in vms_complete_munmap_vmas
                   https://syzkaller.appspot.com/bug?extid=38c3a8b50658644abaca
<8>  644     Yes   INFO: rcu detected stall in corrupted (4)
                   https://syzkaller.appspot.com/bug?extid=aa7d098bd6fa788fae8e
<9>  488     No    KCSAN: data-race in __filemap_remove_folio / folio_mapping (2)
                   https://syzkaller.appspot.com/bug?extid=606f94dfeaaa45124c90
<10> 400     Yes   INFO: rcu detected stall in sys_newfstatat (4)
                   https://syzkaller.appspot.com/bug?extid=1c02a56102605204445c

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
