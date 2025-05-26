Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFEE23E320
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 17:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748281324; cv=none; b=ZjkShLGHhbUk3kYalQnIiN7S2zuS6R9eKJsk1NAr3np27H7S18y7A/KFQh6W3LwHqXhTTImhRPR3VeRYwFG1RX0nEQG9GwWDUF5hD7thHoDJOntK5sg2+dKqZ5pMs6wSNd6bUG7t7FnMkhCL8u/ZLxS5zryKO0yCtm9rlJFx8eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748281324; c=relaxed/simple;
	bh=gI0BwnFol9J8RtJFYv3+39lQRrx3tS37hg+HbyBMCUU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VdPf4MYuPKDlsPDywiA89U3X4WbBM/y2d+5anM0W5Gfbpj5J0gAQCNsUXKTCQImw3xujGunG2eas1F/H7/adkTljtAeXy8n/N2a6e3n94mrcmkUkcfJs60M8ZkM5MuTWIqIM4Y0yDNKHFK05ZX0W+ov0ulO2//JONdeYLVF7FnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-861d6e340e2so201133339f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748281321; x=1748886121;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vDa4r2UIITW3CKirp15kcp5LjQTEjKXa4eV4qUzX3VU=;
        b=H+K61Od/CetthaZfozpYLTXABf5kEcLakUQ6mwQVF1uMRNdJn33WhLDIGVpOCq09B8
         rvlYmw+ARtL0UeoTbGvZSouft6Zn9M2lgxYpGlS1jnW5ftcRx2+uc32lfU0TqyPJA3Ta
         O45OCs7U/LlwSIhRRnH6OsJ9EzayJleb2JfClG9VFUIF96wUXSXcbMYC/I7liVWqIusY
         xKgAz5lT2mN7jCBHjAlLAsuy56Z0JLPDuSSuJQ7bkiWhzeh9K9kJp8Q+UtFZLgEqtgfZ
         ekmC3+H6bu+Zz5tPDE96iiFZwxRBSYOuSj8gNFkT/ij9NKCabC7/6qe9ltV26XPjIJzZ
         Lu3w==
X-Forwarded-Encrypted: i=1; AJvYcCXqt0x+mQXPxY2dagWocWVo7ZpXmnt4I2SJG5OLa2S+/KE0WmIuTHpE1gNqHcMTqswKdhyGIZs63tQxt70=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYano3zsm6WqzmVw0hkEASTP20+lha0o5wsJvV/VvQH/RtP8LF
	XxFMajk+shmIa3cBp7gaFm7lMPxTwVb/9VBPcK5WusjUwoFYkmkoTx/O4fRefrydZ24freQSaTn
	S+/R+xosGUEtmrXuqgVFKoNZHhXm5AfnzJq0GFKmXY+uO6g+J2N7CowgrhlE=
X-Google-Smtp-Source: AGHT+IEAyj1VK2Fwn3QLgOkgAammua0W4udoOnfejJRdVwp9sM1ozDO5RLocjw8jnKcSS5UeYZXHqCiLgbPj9WmCGOp1UxSqwwRT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3810:b0:86a:84f:7a45 with SMTP id
 ca18e2360f4ac-86cbb82c8b7mr1182397239f.8.1748281321730; Mon, 26 May 2025
 10:42:01 -0700 (PDT)
Date: Mon, 26 May 2025 10:42:01 -0700
In-Reply-To: <68345c8d.a70a0220.253bc2.0097.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6834a7e9.a70a0220.29d4a0.0807.GAE@google.com>
Subject: Re: [syzbot] [f2fs?] KASAN: slab-out-of-bounds Read in build_sit_entries
From: syzbot <syzbot+1fa48dc6faf1ff972d7d@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, yohan.joung@sk.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 313d10d79a82358bd8c3ee7ecda6356b1f7cde55
Author: yohan.joung <yohan.joung@sk.com>
Date:   Mon May 12 07:36:10 2025 +0000

    f2fs: add ckpt_valid_blocks to the section entry

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1300d170580000
start commit:   176e917e010c Add linux-next specific files for 20250523
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1080d170580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1700d170580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e7902c752bef748
dashboard link: https://syzkaller.appspot.com/bug?extid=1fa48dc6faf1ff972d7d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=128bead4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=100288e8580000

Reported-by: syzbot+1fa48dc6faf1ff972d7d@syzkaller.appspotmail.com
Fixes: 313d10d79a82 ("f2fs: add ckpt_valid_blocks to the section entry")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
