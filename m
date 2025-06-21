Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE4E6BFCE
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 21:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750542748; cv=none; b=njTLOnzpZFjTOnAoq4EjSorw7QAFjvXEIsSGx+ti4rXxpQlae+CC/qrVj8/V6W6yCAdDsTwPXYTLZ7gQ+czgWe0ZXoJ8woYOC8I77vbSNPsjkVGah38yOj5/jq4coTmjiAm/JBVf5+JSS8zOXNosFngi3su7LSwgh8FIOEwpR0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750542748; c=relaxed/simple;
	bh=sVpsPbaxMnaocft7wSsUyDNwFmrs1Mayx0yNj8VPpIM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jjeCWowqCTHOsJQQEwr/IHFFwzpiHvjYnNs2pe3PGcu1zJKKMgoWVcW+yt1AYLlsr0HMQogFAkw5yLs1wsBeIfqZSwTXTxP/B1sqCKlopf2VUFdZy0cleZlJncUxsK+UwnTmW8m+fJGGiIYWpqtYabTIAiempDF+KKxmGN3veJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3ddb4dcebfaso79695755ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 14:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750542746; x=1751147546;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RWFInJF1v+QUejmF88wO2F8wmFZ92mq/yUqQ3oY3Vmo=;
        b=MpDyiuNgcnqQ1h2bfrga78yiLuL5xbXQnj+Xi1fckey6VU9D+eLLPb2SVBwzlVT9zm
         afFXJunr85zebP29dvxGojR7PA5FWlTL4o4aziC8ZloRcTMSQ0Y6xSd8hxgyDUITDg5T
         257QsW2faaQXMr/jl95oycp5baBAy+yVZIP/q6aTb7Y8Lz6aBwI5hNgXNK4VcopNd+9a
         HnwKDfk708yzZd07ilTfspBWqn+ZHAc2f4Pyc9/Q5hOSHGRNc+c1jQgHojchhw9fHteX
         8ZuCQQbgaG8qf5mxD+O9rPWhzUX2vrRDX41rsgBDliO/60UlF/icdeEBXzgFC/OLNmBz
         lBFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHQwocC1ep7tlIrY4OSpx46bHYMTeZ71xb9taVZOcm70EehzfP6mErG2j5gXNZk8gmdtymbokFLd3icU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMKizd/o6/v7oeLuQDVzbAMeuQdEZob/rvFcSqfcZP/ihk+jxq
	AuqK9X+uduLyLdqoFnRryGk818TXFlgBDyS4ASeI+tvFq1yw7R0xr5dY02X6WRSs4j5mMrPZgFr
	cV0dKWt5ND29LDcLwIkswcIrLVlPt9aV7ZhHqverPr7OpzIvpayhAHeq/GqI=
X-Google-Smtp-Source: AGHT+IFQAqvTwK01LV23BR8bQvBJNmZjDIMCVcdgZVw1cN80/sxN/Bhk7y1esrXQvZi4c0xbNaxpLyp/f+fVlsY4khiPC1uw7iVx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2502:b0:3dc:7d57:30a8 with SMTP id
 e9e14a558f8ab-3de38caae81mr76459855ab.10.1750542746140; Sat, 21 Jun 2025
 14:52:26 -0700 (PDT)
Date: Sat, 21 Jun 2025 14:52:26 -0700
In-Reply-To: <683f1551.050a0220.55ceb.0017.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6857299a.a00a0220.137b3.0085.GAE@google.com>
Subject: Re: [syzbot] [mm?] kernel BUG in sanity_check_pinned_pages
From: syzbot <syzbot+1d335893772467199ab6@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, axboe@kernel.dk, catalin.marinas@arm.com, 
	david@redhat.com, jgg@ziepe.ca, jhubbard@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, peterx@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    9aa9b43d689e Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1525330c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=27f179c74d5c35cd
dashboard link: https://syzkaller.appspot.com/bug?extid=1d335893772467199ab6
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16d73370580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=160ef30c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/974f3ac1c6a5/disk-9aa9b43d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a5b5075d317f/vmlinux-9aa9b43d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2f0ba7fec19b/Image-9aa9b43d.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/76067befefec/mount_4.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=1549f6bc580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1d335893772467199ab6@syzkaller.appspotmail.com

head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000200
page dumped because: VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page) && !PageAnonExclusive(page))
------------[ cut here ]------------
kernel BUG at mm/gup.c:71!
Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 2171 Comm: kworker/u8:9 Not tainted 6.16.0-rc2-syzkaller-g9aa9b43d689e #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: iou_exit io_ring_exit_work
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : sanity_check_pinned_pages+0x7cc/0x7d0 mm/gup.c:70
lr : sanity_check_pinned_pages+0x7cc/0x7d0 mm/gup.c:70
sp : ffff8000a03a7640
x29: ffff8000a03a7660 x28: dfff800000000000 x27: 1fffffbff8723000
x26: 05ffc00000020178 x25: 05ffc00000020178 x24: fffffdffc3918000
x23: fffffdffc3918000 x22: ffff8000a03a76e0 x21: 05ffc00000020178
x20: 0000000000000000 x19: ffff8000a03a76e0 x18: 00000000ffffffff
x17: 703e2d6f696c6f66 x16: ffff80008aecb65c x15: 0000000000000001
x14: 1fffe000337e14e2 x13: 0000000000000000 x12: 0000000000000000
x11: ffff6000337e14e3 x10: 0000000000ff0100 x9 : cc07ffb5a919f400
x8 : cc07ffb5a919f400 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff8000a03a6d58 x4 : ffff80008f727060 x3 : ffff8000807bef2c
x2 : 0000000000000001 x1 : 0000000100000000 x0 : 0000000000000061
Call trace:
 sanity_check_pinned_pages+0x7cc/0x7d0 mm/gup.c:70 (P)
 unpin_user_page+0x80/0x10c mm/gup.c:192
 io_release_ubuf+0x84/0xf8 io_uring/rsrc.c:116
 io_buffer_unmap io_uring/rsrc.c:143 [inline]
 io_free_rsrc_node+0x250/0x57c io_uring/rsrc.c:516
 io_put_rsrc_node io_uring/rsrc.h:103 [inline]
 io_rsrc_data_free+0x148/0x298 io_uring/rsrc.c:200
 io_sqe_buffers_unregister+0x84/0xa0 io_uring/rsrc.c:610
 io_ring_ctx_free+0x48/0x480 io_uring/io_uring.c:2729
 io_ring_exit_work+0x764/0x7d8 io_uring/io_uring.c:2971
 process_one_work+0x7e8/0x155c kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x958/0xed8 kernel/workqueue.c:3402
 kthread+0x5fc/0x75c kernel/kthread.c:464
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847
Code: b0052bc1 91008021 aa1703e0 97fff8ab (d4210000) 
---[ end trace 0000000000000000 ]---


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
