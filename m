Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F222729994E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530024; cv=none; b=tjmP6RcbT2wiQmDy0qVRaI/EogaZ2CnzCVc2YYJ2nOc6ikYwB9XY46/+8JCHoWllmFp3OpF5coHknAsMP2sBpNNPK0IOWRwNfFoa2cDCRfwpWFoLpjTt5+tKH9o9+ZEJSI8JpLLOMW59v1sL/aRRwJdUmgxSWVAvShYki6CJfQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530024; c=relaxed/simple;
	bh=6SLDQrtFq2uE49WVnxjLVqjIr3a0GuM7Y4d8VzWInIU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=YWOHz1feiFUfbHPMoK0YdKlDmsi5bG7SVeVhwpUbshoFQJs+OPY4IPEDXsjWF3YE/F98G0rFpR5aJ9qB6pfEO1O9o6wguCSziKT9sRtrFBwWlv3uQJqQ0D+nJVs+hDmdfolmgEXUwACrNo3K3wpxvSAryLMwuPwQWO5DEii1BKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-87595d00ca0so758999539f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751530022; x=1752134822;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3hKl5Ia/jKC0Yd7lUOzXfYy0UlX85jIR9h7CqoUJHPk=;
        b=op6hHcNQSr2oDNabtBBHBTYqfa8sV3xIyG+455kU0nxlI30j1dVW/3FH9yDD9Pc4B+
         +gROt+rSefRVLVXmdMjRC4rXv23F6II+EEmmFIXB5LtF6KR513GYorc/P7NnHTbJdW/K
         GRzHJmM126yGh/fztNmxtHC9oKAuqrtGym8zRcCOSey4pB3x2rNZwTVViE/O6ZmUG9sa
         K8OhrKnYfYEEnXSt44NOUZH1bpI+pbA+V4WiFoWOxYftCoeDlGZJJ3c0KGiMvwYjF+bx
         jWbIcD+Rcd7xB/mfKUzNHxEMou8+Jkvj38+GN/I1edH2NJVFXIWtwCa+r/lVXycRS7ha
         aQEg==
X-Forwarded-Encrypted: i=1; AJvYcCXnPwOjb0ANclHcbCMGOhhUEKoo7+fqwUgvpVzpLTxy1/eRLipuVFzCOo1+7isRdFk3piKKs9KQckjNEuE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/UOI+cg9TkGjXBOjV2/sEEn50nIpVPFSlewZWj+yeovftc25b
	v6ELUe1UyHd3RYAzjyaDsaB2l+NZwmZI62DeMNgf3pYY/HKSp7wmYQt8Y13h/SyrhU0VgDLCgYV
	hyZc/yCW8uT33aZQL3xtTIzWbIZ7Hk/EFTeZtlghURLZ38MHTYj/pluu3sl4=
X-Google-Smtp-Source: AGHT+IFHEHLjcWpu9j2fzi8xyd5CDP/yiePQGBUZyFCCw6WjHXkwTCzEx5NWZDpvvSAkDH1/M0eUL8oNkp1nB8pYZMSHHsHHN/Lf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1584:b0:876:c5ff:24d4 with SMTP id
 ca18e2360f4ac-876c6a09d1bmr967003139f.4.1751530022059; Thu, 03 Jul 2025
 01:07:02 -0700 (PDT)
Date: Thu, 03 Jul 2025 01:07:02 -0700
In-Reply-To: <6865e87a.a70a0220.2b31f5.000a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68663a26.a70a0220.5d25f.0856.GAE@google.com>
Subject: Re: [syzbot] [exfat?] kernel BUG in folio_set_bh
From: syzbot <syzbot+f4f84b57a01d6b8364ad@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, hare@suse.de, 
	hirofumi@mail.parknet.co.jp, linkinjeon@kernel.org, 
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mcgrof@kernel.org, sj1557.seo@samsung.com, 
	syzkaller-bugs@googlegroups.com, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 47dd67532303803a87f43195e088b3b4bcf0454d
Author: Luis Chamberlain <mcgrof@kernel.org>
Date:   Fri Feb 21 22:38:22 2025 +0000

    block/bdev: lift block size restrictions to 64k

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15ec33d4580000
start commit:   50c8770a42fa Add linux-next specific files for 20250702
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17ec33d4580000
console output: https://syzkaller.appspot.com/x/log.txt?x=13ec33d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d831c9dfe03f77ec
dashboard link: https://syzkaller.appspot.com/bug?extid=f4f84b57a01d6b8364ad
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15c93770580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1001aebc580000

Reported-by: syzbot+f4f84b57a01d6b8364ad@syzkaller.appspotmail.com
Fixes: 47dd67532303 ("block/bdev: lift block size restrictions to 64k")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
