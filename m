Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4A620370C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745526; cv=none; b=XIQkugHRZ9N4AyR/k3r99USZfRetGq+iIBf/gwp0hhEtiqU/qXsZIJXJdI4cKivY1uJ421W6WeZEX139ofO7F2mGnIu58cQcIdvw98fFjznHobuGhJ8XAYH1r37kgCjBNqI1O1hHff+ELhVj+5Bt4dD7xkhOWXUNTdxsW4YrMvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745526; c=relaxed/simple;
	bh=3rMbtXXkl6VX1pWFu09B/1FrKHNKlZlWEwEUq1fneko=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sUleAmbwC1j3noM9HHbgkIhvW5YYaDZyfT+aanz1kGYRTUpv12xa3FfOXLz3X0zSxXda3OZuOWjDcFRC1pfrUbPc47rJO27cACcWLupKjVcMtAhHA0xZwPGBECIu+VaKK2Yzsuv7PXCR8+VGRDpFx6LjS0ksAKbg0NOsyLw1gok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ce8cdf1898so47109565ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 00:52:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738745524; x=1739350324;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6fWMi8f8UFZiTnjFB+mEtuSmquoY1j2DyxbT1jBkdz0=;
        b=pYJSMgLSbHs0VI8UB9nsZDHYMwCdnOc7MwEmJqxQ53+mTDx+hjAPcePT3eTb12TNkK
         Tp/OaVXcGrRvKd5k/7ls/y8dSqTohNVttSbNPdMqkfLJrE4ci7ulMHgpLg6ELdSx2Hzo
         Chg7hQ2Gsppi+XGFhRmVMlk/c7dwE/GP8M1VgwsFqg6eaQE39TjubtIZ5svUD8Hsib3J
         yMD3590JCLrwU+bOtIP7mxkWvWxJTwX+fm115liy+t4bdmPD7H8IrwFMrkZ8Nmf7VmOe
         dqCymPDiRte1FwdN8wBn00HfLmJoWrzN2hMkyGp55sNkckY0sx+Fv/kJXlDkuKK9fY4S
         UkXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYIyHQp7SYQbcqDn9TMO7SPpZ9g5itZ2mkvvAYjQrl9LyhlotPx7z6NdqKSZC/z0UIk2bqQtq8AoxIrIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYVv4XtThrmSZJnCDN2Ye0TcZPij/ccngBfv7uTNKssvRxo3by
	/77hyoSLczIza5fgNylMUJzzqrNQ05Ll6xOx8s07a41FMJizuZkS+9KQiXO2Eu2kk1QRsRDubqq
	PQvH/4zZozFgoCleGT2QrsxwylAiVRItXUDHMMmtitI8vbPqsWQ8Qyxg=
X-Google-Smtp-Source: AGHT+IFXwvIR8Y5vDZJu1HcEo1sYAmhe4IxQ2/lHtkREqhjv+6JvENalhRxL3qxuNwTig7EwWKnTRvQ8Ovznu/iirQZC5OEkbQe4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2688:b0:3d0:2b88:116c with SMTP id
 e9e14a558f8ab-3d04f45aff3mr16373135ab.10.1738745524471; Wed, 05 Feb 2025
 00:52:04 -0800 (PST)
Date: Wed, 05 Feb 2025 00:52:04 -0800
In-Reply-To: <677b4e8d.050a0220.380ff0.0022.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a326b4.050a0220.50516.0013.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] INFO: task hung in bch2_btree_node_update_key
 (2)
From: syzbot <syzbot+5ef4c078ccd6970db1b6@syzkaller.appspotmail.com>
To: bfoster@redhat.com, kent.overstreet@linux.dev, 
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	peterz@infradead.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 66951e4860d3c688bfa550ea4a19635b57e00eca
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Mon Jan 13 12:50:11 2025 +0000

    sched/fair: Fix update_cfs_group() vs DELAY_DEQUEUE

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11336318580000
start commit:   56e6a3499e14 Merge tag 'trace-v6.13-rc5' of git://git.kern..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba7cde9482d6bb6
dashboard link: https://syzkaller.appspot.com/bug?extid=5ef4c078ccd6970db1b6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=144666c4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1244e8b0580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: sched/fair: Fix update_cfs_group() vs DELAY_DEQUEUE

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
