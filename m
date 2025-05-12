Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63F5293B72
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747056871; cv=none; b=nDF8Hg5+u02C44GrcLEZ96kCq+wrkkNH+zIEWH70j45gXtboK7IRTIJ2kmK6AdJq2gI/k9nTUHR60gPMgbPnqcopulyMwO0Ac5BkxeID/yrWQCXDrYwzF6DNRo21Eq7r/+fPvheoTJlSRfoSuhGtVZY8mnr6yr9G4PaQm1ldWvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747056871; c=relaxed/simple;
	bh=LeK0pqtWTfPbeDSRIKeralA5yitOGiFvYo989fGZ+Wk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bpp2bKeGsuF7LCrb0zbETP0hnztzul30x42NutIlH7GpfqU/VC8jTOpXuNalOd+KVJQZogM5IldsRWM/yDKNBG1NcdPAnRp2q570N8O4JeBKdTnbnmSg6Fr47IHoRjj0iduCz3+mEZyrJgkYgG3LhHMtDKd2Jvl3XMnoDJIrVwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d83124c000so70540945ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056869; x=1747661669;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xXi61Tb2kTR7x8pVdJxEKl7nqH5RQeBF4q2aX3gp3sk=;
        b=ML36NXCyCYIFMioBEDnMFncrZlj9O5JOcRXLVs3lsyPXw6w2LKNKdXm830865+Vowq
         2p19/CnVgX694fHKd4Le8x/8nr3jSJQyYbIE9iyY6Tczb3Ap/NsvapPGIoEI4E38NY0o
         zWF7a/yPSydt+Ek4ill5vD6HgmcuFnqlLyoQGeHv6PeCjXwV/af5LSYF0qlNv5BBPIB+
         m+ZWmcsu5j/szW4BAXn5YHvYIuox4glsUZ51xt79gNPspob0wr1Ke0QpsDesFDfMRoP9
         8ox7WAoTQVssnqZS2v60IiwF3GeG0GuuQyHT8QjevKvyrlG+EV4lzeCwhPfKt+CbLxd3
         FUWw==
X-Gm-Message-State: AOJu0Yz4xQH+xEu8kfKFevwXDlSP2YSTu3UOLsCeypu1GBqQDm5ydyvR
	ad6dtu16cD+E7P9bySERcvXxP8sE+MjWHnax8qQlCsRB6DrIq2TBOtYjiKeNB8BIGq2zRFrAzOh
	P/x++Qp0Mcyp9LXUKSi8mh0lVmRVFRdzjCjvLLXH7mlNlQnbWMpp6hOQ=
X-Google-Smtp-Source: AGHT+IFYDtxLSv08L7Cfws2fANrsU0cnAAd4LueqPNNNQZyYT/8xBmySqvil66TqjAlFHI2/zwB+tJcu4OTnVLZOsr9tQQTof6Td
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12cb:b0:3d9:39f3:f250 with SMTP id
 e9e14a558f8ab-3da7e1e26d9mr166055545ab.3.1747056868453; Mon, 12 May 2025
 06:34:28 -0700 (PDT)
Date: Mon, 12 May 2025 06:34:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6821f8e4.050a0220.f2294.0063.GAE@google.com>
Subject: [syzbot] Monthly mm report (May 2025)
From: syzbot <syzbot+list63a48a121dd18348094a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello mm maintainers/developers,

This is a 31-day syzbot report for the mm subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/mm

During the period, 4 new issues were detected and 3 were fixed.
In total, 130 issues are still open and 291 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  7398    Yes   WARNING in ext4_dirty_folio
                   https://syzkaller.appspot.com/bug?extid=ecab51a4a5b9f26eeaa1
<2>  3537    Yes   INFO: rcu detected stall in worker_thread (9)
                   https://syzkaller.appspot.com/bug?extid=225bfad78b079744fd5e
<3>  2775    Yes   possible deadlock in filemap_fault
                   https://syzkaller.appspot.com/bug?extid=7736960b837908f3a81d
<4>  2357    Yes   BUG: Bad rss-counter state (5)
                   https://syzkaller.appspot.com/bug?extid=f2bbbb592debc978d46d
<5>  1997    Yes   possible deadlock in gup_fast_fallback
                   https://syzkaller.appspot.com/bug?extid=63ba90b81c16b86379bd
<6>  1861    Yes   WARNING in vms_complete_munmap_vmas
                   https://syzkaller.appspot.com/bug?extid=38c3a8b50658644abaca
<7>  1469    Yes   WARNING in kunmap_local_indexed
                   https://syzkaller.appspot.com/bug?extid=691cb37358791bebebe6
<8>  651     Yes   INFO: rcu detected stall in corrupted (4)
                   https://syzkaller.appspot.com/bug?extid=aa7d098bd6fa788fae8e
<9>  531     No    KCSAN: data-race in __filemap_remove_folio / folio_mapping (2)
                   https://syzkaller.appspot.com/bug?extid=606f94dfeaaa45124c90
<10> 516     Yes   INFO: task hung in _vm_unmap_aliases (3)
                   https://syzkaller.appspot.com/bug?extid=fe8f8efd070d727de971

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
