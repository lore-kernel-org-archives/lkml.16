Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4F9126C17
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 23:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749252125; cv=none; b=mYgSAmzsFCGgTCv3TsEMPO/zKaNnwIKa3Ww6lRI3ZZK6O4dXP74zzFTNwtzteniSePJUCpSdiDUDm/U+opsQ55cqRzForA1lTWwfaMXHfKNDgFseF9JBTmahogCorw1RI+zSKN2HJWyWj3FHyNF2xD20R241P2i19GtnKUHOcdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749252125; c=relaxed/simple;
	bh=e7Mjz4/dF6IV2gYWXaT2mH3ihU5Rf+MmCbpG7WvUaJo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PVM/SwRzgt1QTsb8IYb80gQ8/uafWssLSvNHyfSGZsi2DQYh2J/K6MJUDIOa08XCfDWd0D25TV9UCr0899rhlrchwWpigoEn/Dznu15mVLj2Jmf1/TF+TlA4BiA1Xt6dcKTARV7Wp/caJmGknaR4QOn9PY8lpOCh1tgww3Zja1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddcf82bb53so11622885ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 16:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749252123; x=1749856923;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UV12SH53FFat8KXW36S7b18ucHPmUgE30qWWkJqq3oU=;
        b=bZ6e/kA0pAXmqhUDsc37bC+T5VKiqQnYLKC4HdE9Y3fpjsf9oE2WncVXxE6CCGRK5i
         s4OUuJBt54LQzK3Y2gQ8W3wq1gOj08sSmNvVE41/r6llfV2oYhYGttg2II/wb1aJpDzu
         YLeYeDcs7CiR825ll4WkkRVUoDYQ0qkLL0PWOodmTZJ3xD+cP/Fz60OeNvqUtVt+ogFB
         qig2Yw/dZOxmBevfUPIHWTA37N2UprVhyKQwb5sCrw2f23dLlBW2usdTAKvAeOvU7tla
         weXmHjqAOODugLR1oqgRN4kU9vz653r9WGLhLo9V2JxvwTou/ATCTLwZSexwFVfxtkK5
         v9Uw==
X-Forwarded-Encrypted: i=1; AJvYcCU2hXjvp/+9pEc373P5THzCUhoA8OUt7Ulz8uoI44CTrH25utl6kJAxiux5LreYNujZJdfwSTddBjCoBa0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn844RBklMDX1kORapa0LZW8H/mXpO6VSqR2cLMyqmSEMe4UPe
	QBnIvuK/2UOGAz/XZoi/Tbt7HKr0aWLDrqzv+5k76Lt33DwgD/8W9dkEDv41S8T8UazvBQy67Q/
	7obxKgnSIB0s/cBtD1Dni5X3xN9+iDPA80h2usz37+gO+J1SftlhP7isKA1E=
X-Google-Smtp-Source: AGHT+IF9ZoqDrTeqXz/DblHDLfZkEo8FNl8vZLPmykS4F205OfXxQFIyU7Nn/64RqsIb/KWDjH61UU1Jc+Ebhd2Rau9Cm29QcMge
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:156f:b0:3dc:804b:2e74 with SMTP id
 e9e14a558f8ab-3ddce440f9amr60464245ab.19.1749252123302; Fri, 06 Jun 2025
 16:22:03 -0700 (PDT)
Date: Fri, 06 Jun 2025 16:22:03 -0700
In-Reply-To: <20250606223641.1856-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6843781b.a00a0220.29ac89.004d.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in vma_modify
From: syzbot <syzbot+d16409ea9ecc16ed261a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d16409ea9ecc16ed261a@syzkaller.appspotmail.com
Tested-by: syzbot+d16409ea9ecc16ed261a@syzkaller.appspotmail.com

Tested on:

commit:         7a912d04 Merge tag 'spi-v6.16-merge-window' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14307c0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fd0cea6d0f67318f
dashboard link: https://syzkaller.appspot.com/bug?extid=d16409ea9ecc16ed261a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14ebb282580000

Note: testing is done by a robot and is best-effort only.
