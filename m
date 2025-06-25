Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129E120C46D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 21:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750885804; cv=none; b=qydMS0W8d5JeeHuROP/LMBYYoRK1gVXfD5Z5aijs3W/m72ZOWmuQGAbiI7xK6/9opWvShmkdbY4ZHaZwU16n4W2KeSHAZAnuuVjzGgd0rI9HROn3bZM983s0w4XFUmw9qowz5S/Xji1Nl0uWhjqsZeP4OZQx+3ZJebfsYm/snHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750885804; c=relaxed/simple;
	bh=CNKw6tzEja4Qt6Nh8nMdXFeEWbdQjDHV1oVsSa0p4eQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=GUUNQTWqr1THPGHWuHxp3+4s0qQCKra9CuuWfp5GTN2+aCZ0jwPACwoG6kyNc3/gEIScu/zl+vcUJP6t5rNzRZVj5TLnq4HU+/LH+nd6zRlLaORagPlE884g/ePyzD72uUUX4GAWahBODpNiFZxzirYVZuGbiz2QJ+aKiz+v7bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86f4e2434b6so37343139f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750885802; x=1751490602;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kc426aQB/Ls8eZ2ZTizs/1SQKrFEHeSjd9qsxqSJwL4=;
        b=cixdyzG20K9e7KaJvSOBIS8GPjpnhd5m7w4v/P050CpD5QoELGAK2Vt31V0Uaxvydf
         deo7dhSJ0PrOyVNXYQm9Ve/Y2lV4j4cVagTt9s6+u8uPjzlaOnClzC3bCElUYPy2a5GR
         YubTo74Pw6qEuWPK4XS8Hq+YS47mZN4ZiDR/1/KbcnuwaazKhVLgJfT2RPeuyLf79dcr
         SIZ0mMZB6PWAkqmLqdNIcYuJA43oJ3MmfvyUndwkCBZbWatAqxb3GrKDWg7kfaEZxGYD
         9pwEtUn80afpHGXQl+bUyVxmu36HWXWSaODJFpCSCNsr7A61C8RIKhE8NrYYaRgk4Xx8
         kVkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSFaV8Cp/eyhh+gW1013kG4caMFq/hXJSBkvQDnjuGFrsAa59VZwcsugmiKu+JOQ7iQ4ShTXVLSfWDxaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVbvzYwwICcNFQgI0/Uv6dMsVtPw644Q5RJV5zYDzpBk02C2wo
	Y1HW9PSf3O/4XGxEsci+3rO0c1F4jMZ9vNwX3xXmo/dTfBE9HvqZPx9iGTEtMWsw+K4pasu8tcE
	XQ+n5qt2a3DZxYxjW9hx0WA9VsHPz9EEY9GZQQXZKLnER6TGmUvyOs7Oe+jg=
X-Google-Smtp-Source: AGHT+IFsLSGcBbmWtt1GPA7otyFNGoqQ39LiKIQmsCWWO9urExGRsP2gl2q2dUeo/rc0DVTmtRh5fh/sIrBSXo3bSUXE3QaQI689
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:a005:b0:86d:5b3:3b88 with SMTP id
 ca18e2360f4ac-8766b73e5f1mr592236639f.1.1750885802133; Wed, 25 Jun 2025
 14:10:02 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:10:02 -0700
In-Reply-To: <0000000000008905bf061fc61371@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685c65aa.050a0220.2303ee.0098.GAE@google.com>
Subject: Re: [syzbot] [xfs?] INFO: task hung in xfs_buf_item_unpin (2)
From: syzbot <syzbot+837bcd54843dd6262f2f@syzkaller.appspotmail.com>
To: axboe@kernel.dk, cem@kernel.org, chandan.babu@oracle.com, 
	david@fromorbit.com, djwong@kernel.org, hch@lst.de, john.g.garry@oracle.com, 
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit b1e09178b73adf10dc87fba9aee7787a7ad26874
Author: John Garry <john.g.garry@oracle.com>
Date:   Wed May 7 21:18:31 2025 +0000

    xfs: commit CoW-based atomic writes atomically

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1078f70c580000
start commit:   85652baa895b Merge tag 'block-6.11-20240824' of git://git...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=92c0312151c4e32e
dashboard link: https://syzkaller.appspot.com/bug?extid=837bcd54843dd6262f2f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12350ad5980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=147927c5980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: xfs: commit CoW-based atomic writes atomically

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
