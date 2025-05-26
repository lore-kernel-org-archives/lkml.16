Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4A51DFDBB
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748248778; cv=none; b=Dsdu3mHELcTRNvIkKKUz2nskMSGwVOtppzbeNVoRnUlKcmGskNx8qdKyb0uXO1cWGRsEFE6TDNmTiKJrAEkw3zxYnLgtQIR+dcIkGdf8F/i4+VPjn88U5Tj5WhrxYmPsmB8Iemq3jdiTbCSqhFWaAGNoJvuO6PR+pDuXvgJRUIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748248778; c=relaxed/simple;
	bh=T6EcdFt9EQoYm+ND/Y+L0/crWpwXmV8HdZ88ZeGml2o=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=oTiYuUtGhsC0JxNeVgKvZ4r+gtoQIhq9hNnCOQX44knmECdx36wtEnOGzNrzEdj8vpb32URug8NUCEyBPKByejXeHoP/07mZTxjDL6Lp8jCiWNxIYC6v2fEyA3xhmVJmmywmD+KYegUMqg7ujsbAA23egXP3MDC3F6vHiwq9cR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-85be9e7bf32so369368039f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748248776; x=1748853576;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G5FcvDE+udpPkGHELacvWCRGrl5RbwtApvi/hcxuHUs=;
        b=XULRvAGkARY0MEHyPTsFONpJ1Ayz2LjaXUOH05X433TcTj980mRduFx42nWjN6b5hD
         Fkrnqpq3M14uA+M3yLKfYeSp1Y71MM9m12Ce16W1Gjp8FjoeEHOp7LELqM6zhHbXcZ9N
         vXGLOLgjBWP/B4kI+8gQBsklSa3/ooQrR53RRRCy9hDVwSJLfJ439xqM2YMbGZRZexA5
         2+saBe7a+MwfbnLY5tiTaaXiBMGqUSuZg1cheJ8laORmEZXvvVm0WdNTq2pXs5V2eRUr
         gTLbN1NSeN6p+tdnuV0OEguNNZ+Avk0s6cQpLi/7foghJtlCpsImFfHM1Nwv+nuplxLK
         NP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrmD9QgPugwFLtxKJZPY1SGBpAyQRG6Vjlh6IVxZB6toNQw1pOcUYJ1vUdMg1rCiux2j5gp8Dq7nBG3ak=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKe37qMiIG0OIgILrjfo1laxK7Q0LE1grDsD9Pt0mDsDQ6iRKs
	Ot2lLDa/JTlY5A8JImSyyTmbQcasU3GZ40OOD/5UQuYq9Mh8MeX8H+oogDyDKhKp3ZZPLukEqNu
	A6QFfYZY3vh+ixTlQw5VA1kh59Yh+Hdhn1Jmiqgyv2aObDF2I7PxVAyDRrBI=
X-Google-Smtp-Source: AGHT+IGiP7MeprmT16+8/bxD1UkNvTCK/Diu9aByFO7a4/aom4j66ry/aE1tsyNFMck9dQ1g1xqNDDURzY0F+g5Cf+lQhNRmdcMh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:389a:b0:867:d48:342b with SMTP id
 ca18e2360f4ac-86cbb8f2afcmr669066539f.11.1748248776293; Mon, 26 May 2025
 01:39:36 -0700 (PDT)
Date: Mon, 26 May 2025 01:39:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683428c8.a70a0220.29d4a0.0802.GAE@google.com>
Subject: [syzbot] [net?] WARNING: suspicious RCU usage in corrupted (3)
From: syzbot <syzbot+9767c7ed68b95cfa69e6@syzkaller.appspotmail.com>
To: andrii@kernel.org, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com, 
	tj@kernel.org, yangfeng@kylinos.cn
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    079e5c56a5c4 bpf: Fix error return value in bpf_copy_from_..
git tree:       bpf-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12739ad4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c6c517d2f439239
dashboard link: https://syzkaller.appspot.com/bug?extid=9767c7ed68b95cfa69e6
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=114915f4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15566170580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8d7d35d067bc/disk-079e5c56.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/74d2648ea7f4/vmlinux-079e5c56.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e751e253ee4f/bzImage-079e5c56.xz

The issue was bisected to:

commit ee971630f20fd421fffcdc4543731ebcb54ed6d0
Author: Feng Yang <yangfeng@kylinos.cn>
Date:   Tue May 6 06:14:33 2025 +0000

    bpf: Allow some trace helpers for all prog types

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=130ddad4580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=108ddad4580000
console output: https://syzkaller.appspot.com/x/log.txt?x=170ddad4580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9767c7ed68b95cfa69e6@syzkaller.appspotmail.com
Fixes: ee971630f20f ("bpf: Allow some trace helpers for all prog types")

=============================
WARNING: suspicious RCU usage
6.15.0-rc4-syzkaller-g079e5c56a5c4 #0 Not tainted
-----------------------------
net/core/netclassid_cgroup.c:24 suspicious rcu_dereference_check() usage!

other info that might help us debug this:


rcu_scheduler_active = 2, 


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
