Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFE91F542B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743676223; cv=none; b=GEDC+z97Em6J8VXiYE8Vmm/UFHc939ETOQI07O9PbgZg1sRy0YLzpMQG1hr6k8Uv3ElEz51un0hld6mBHRv3sUj4Su1ihmvGTtAhfX0cv2ia0125Srqq6LxwTOUiECQdl5d9XYn4DFBUoqROjXGxFNBHit3hoszVHj6hiZ0Grhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743676223; c=relaxed/simple;
	bh=37M2rtxTJbXQJ2B0Gql/IcfbdrVx1TbGQ/36ZH/uwlc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ldb5HasWKuRs2VDM1hZrXQPCbT3JI3/P9ZK0t9Qgp5QTlKXWttY7rV9PGSS7hDK6BkU8u+jWryn9byn1ySFH9EITEbRHuRqMNeJCeX/m8u1yAXgzkA71e+3XHhT28vMTWImOPyvU5Q46gwqS6Rv9nji46L6ORGvmPiE0BOQj0mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3ce8dadfb67so10331975ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 03:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743676220; x=1744281020;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bRpi09zYZnS9uCZV++cTM/cY/TkS5sKFguLqV0olHPA=;
        b=QEH6HyQhh7r9B6NF21Fnf897BDXyKkWJgyjnEBeSZoUBsGOF0ZxA3fImTB1m6XzG+4
         4+882A6YsNWHGgk2lilVok9yiJSVDpBKhL5SA0XYL8Xwin7MOjcjJGlEvBnHW3mxOMez
         yCafrRPB25cYagKVQlO8rRtGeptxSZ1WRoEqiofnJ/8W1DDNnDbLdTvD+aCG0roCdnNo
         6fBQrxXX4kH/LALYWDLK17w6g4haV/930ar/RX7bg4dAzV+T3fc2ZteVr9Mfopm8RqzU
         1i24iLzjnzKrWBjDF2L4poDI1pb3Y+acC6Knt4qXX5P7OpDA8S3dU6x3C/dlC/GSh+UU
         tFog==
X-Forwarded-Encrypted: i=1; AJvYcCXx+ifh0LMW0qqVQKv0Q8S1FZCMWHFoyQ5Sr0SMgFLgGEkvi6ZiIjQFj2+SoD6fpD5Tl6po4mx6ow/xRk4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1azT+0wRLCKSlm+kNhM2ACzCb0tOU09LTGv/p+PFo3oyEUoPl
	0OFmZhhaYeZHwjPEmm7Tf1+QdhlvNXlkqjluHl1u9rUdO9Udvu/SFRrDg73QrbXdDf7EoCo/Q85
	f74sVj7ur7Mnz7gEox3XQnrIoEQAEJLr8L7By0+PbVD7qwyK3D7Rt3dA=
X-Google-Smtp-Source: AGHT+IGRAaPPeq9C0XWc+HHe3N/4vwB2yQpoJvQs3Lf1Larfk1oiZXmMsWt3a43q2mE5JKLefQK97UKC6SFb44uoCX1sg4l+vmIw
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:152d:b0:3d3:f64a:38b9 with SMTP id
 e9e14a558f8ab-3d5e09e4828mr219022275ab.15.1743676220563; Thu, 03 Apr 2025
 03:30:20 -0700 (PDT)
Date: Thu, 03 Apr 2025 03:30:20 -0700
In-Reply-To: <67eaa688.050a0220.1547ec.014a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ee633c.050a0220.9040b.0187.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: vmalloc-out-of-bounds Read in hci_devcd_dump
From: syzbot <syzbot+ac3c79181f6aecc5120c@syzkaller.appspotmail.com>
To: johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, marcel@holtmann.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    a1b5bd45d4ee Merge tag 'usb-6.15-rc1' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1709494c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=44bfe55da7676adc
dashboard link: https://syzkaller.appspot.com/bug?extid=ac3c79181f6aecc5120c
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13e60be4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10c5cfb0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9096ac93f836/disk-a1b5bd45.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/83a88633dd9d/vmlinux-a1b5bd45.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7353859863a8/bzImage-a1b5bd45.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ac3c79181f6aecc5120c@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in skb_put_data include/linux/skbuff.h:2752 [inline]
BUG: KASAN: vmalloc-out-of-bounds in hci_devcd_dump+0x142/0x240 net/bluetooth/coredump.c:258
Read of size 140 at addr ffffc90000ace000 by task kworker/u9:1/5151

CPU: 0 UID: 0 PID: 5151 Comm: kworker/u9:1 Not tainted 6.14.0-syzkaller-12886-ga1b5bd45d4ee #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: hci0 hci_devcd_timeout
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xc3/0x670 mm/kasan/report.c:521
 kasan_report+0xe0/0x110 mm/kasan/report.c:634
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0xef/0x1a0 mm/kasan/generic.c:189
 __asan_memcpy+0x23/0x60 mm/kasan/shadow.c:105
 skb_put_data include/linux/skbuff.h:2752 [inline]
 hci_devcd_dump+0x142/0x240 net/bluetooth/coredump.c:258
 hci_devcd_timeout+0xb5/0x2e0 net/bluetooth/coredump.c:413
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

The buggy address ffffc90000ace000 belongs to a vmalloc virtual mapping
Memory state around the buggy address:
 ffffc90000acdf00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc90000acdf80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>ffffc90000ace000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                   ^
 ffffc90000ace080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc90000ace100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
