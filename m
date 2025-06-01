Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5F8233701
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 18:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748801225; cv=none; b=tp7HYZntxp6bAputAa2pPtJfGmNgTb8kPPpLevMKIBM0jPlhsZZluHPvbRaJuHEXVvbrDSrYkCJnCWojFzSOpAn+cwyWBqhpny+Wv0JNzUMHlnSOGVi8DwTgLOVbrpNDzQGptCXkSkifRMOiTRRErwz2SgP6/8QOnt0JQqqNZmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748801225; c=relaxed/simple;
	bh=4wULl+5RvIxm65tgsYk25Tb3WtkIkAmkkUbhv3DxiIg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=egDrunYEza6Lu9FlanS10qmcv7xVJV8iLEHqm9B0FMMRhCRSTu0hXQoBU7uNkg30hr8tx6A4S1PFOq+GPR+6Q5AFjC81p7MzUegQsDxokOvGouA2+kQ0GLPKriQlpZ79Ll6NkIZ9mIsK322knZhK0DV83XZmtJvwoaGPWzq7NMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-8649be94fa1so601060739f.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 11:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748801223; x=1749406023;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MNH+e2wBF7Xg3jnLnbLmzq10vNKY3b0x8+Cx5vnhySs=;
        b=hONcHkxdmJJ1p+B2zGWM4vVrtQ6r3MCMBUFpbfAAqAJYabKg6ZfaL96ZM0YA41lFft
         JJo7ROdr3cxRwPVF6o5b66fA1s1hshygC+fw8hNOCsliIZvtQxXeR7VC+mhCaMne+9Jw
         nA/JYG1hGEQkalf86fVjsIu3TUiLx1AUhkoRPECq+UvBEx+Xjgi6or9LVfa4SvCRjMCJ
         xPlN+0X9i6/wPMQ72NQlCX05Dm82lDT9BwQPuJBnhZx/8Cs015qtz6o4CeJwSRCMJ2ns
         fex72Y+B/iFaoxXtXlR8d+ohlijuQ6fIdV9CpcrGW+sEHKLGtFm33ScYxSkREPl+amf/
         admw==
X-Forwarded-Encrypted: i=1; AJvYcCXYJTy98DvrJydhe7+loGb33QCJCSaCPMweySbSAB81QVW1PiEpVYS5AczTFw+VNCLDQts+7XvsABHMeDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH+Mbc6oCNpaxKLX7EtkO3BqQ+Ms5aUoTZtpJTzR8Ht4JMDpw/
	WPwYTd2QMnIL4tkBcQrkj8CybZ1p8qeZYrKs1KScMFYuVxt8VXW9I03MYpu17NNoBblBdNRreMa
	roRXssGS9Nv4MB30+gO9aGU0WIydA82250oJRc+CoZodCVR4eTuiwDEwv09c=
X-Google-Smtp-Source: AGHT+IEMWdDsR32/1HHtiM30II6+NDaNfaUq6pMIFs8bj1cefae93/pi9JC4HZPpn87MXCCPym1NDyWJ7SYtMnsq4bAnkbxdG0lU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1488:b0:3dc:7a9a:44d5 with SMTP id
 e9e14a558f8ab-3dd99c8bb62mr137174545ab.22.1748801223138; Sun, 01 Jun 2025
 11:07:03 -0700 (PDT)
Date: Sun, 01 Jun 2025 11:07:03 -0700
In-Reply-To: <683bede4.a00a0220.d8eae.002a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683c96c7.a00a0220.d8eae.0033.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] BUG: unable to handle kernel NULL pointer
 dereference in mempool_alloc_noprof (2)
From: syzbot <syzbot+56edda805363e0a093b8@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit d4d71b58e5139afc5f9bda0139b99404eb216d8a
Author: Kent Overstreet <kent.overstreet@linux.dev>
Date:   Sat Apr 5 21:36:04 2025 +0000

    bcachefs: RO mounts now use less memory

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10914c82580000
start commit:   4cb6c8af8591 selftests/filesystems: Fix build of anon_inod..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=12914c82580000
console output: https://syzkaller.appspot.com/x/log.txt?x=14914c82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e413b6de2bc0230
dashboard link: https://syzkaller.appspot.com/bug?extid=56edda805363e0a093b8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11dd7ed4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=113f9970580000

Reported-by: syzbot+56edda805363e0a093b8@syzkaller.appspotmail.com
Fixes: d4d71b58e513 ("bcachefs: RO mounts now use less memory")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
