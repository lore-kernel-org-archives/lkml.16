Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13AC2F1FD0
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751033828; cv=none; b=jm6+80qjggVSHFuRzr/5MkdAO6Y07fpV/+6FwXOYKbFBDu6+uavArzrePCDOJw5XxbWpjMAyEFayswoKCnwXc0oJmfN+vwfNQWZvW/oqvl/g33VGC1uZo6JMKwB9DXNL5M+kW8VJQ4aVSFDJ/1MQDcV++/NKCAqFgG+H9LqvOEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751033828; c=relaxed/simple;
	bh=xPwsVyexVDseD2IT1tZXS22jYy3h4kMgwhDONvuB4+A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BrUHQngPew0y4n7GsY5vuib6R3J/jjigV3WbQMNdZ1GCdSXrcsFDC1YuhE9pH7OADLzqasqy7QoqtMDA0R9mcqMirAdULvNaJ5xOGmmHnk7Ylvbe1ZoX6BRr0gtzORzUT3dKyl3gAqPGuSL+cYC3pmNP2KcRwhrfnwNb4D9OL7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddc0a6d4bdso25253665ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751033826; x=1751638626;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/twUQzG38wLJmcYzIGmO9pQOGEEODnWK0Ty6MAw9Hl0=;
        b=jdU0rMc0oy2HGXewLjTwvm4BMWIxFl9yCoOeS6xhcsLSOIaKmBj+ZPlq16YeKGyT3+
         k9cCidRyWVQQiQbqBmFJW/THtS8NDcVSIHIrYHyeW3lSjduWfMs+KRDtjADls+SJP2zC
         pLd7YVscNFVOPa+doN/tvBS7Yfi2zfqMmu7eqwrwE6MNH7mOfb7YaN0f4+OBywQmMEHQ
         0yYlW3anont8uvf4EQEl/6t+vwR9ISVhr80/BZM+wu1k3tRjv+juQWXrTlzNKrPL8CFK
         LzTCW0GY8ke2N6FnOfDY4FsIR0NzyeEweKNDrw9yOK8x0Mb9cqGJpt0EaIXjkpRpco5n
         z7/Q==
X-Gm-Message-State: AOJu0YzVe2hSfKw3iy3PqIWWhaO4CNMV5Lkv/ywHkuuLfHKFLkIg0sXb
	CJWCdP2lUFaTcEFPtm0vvTvNe7k2RyM5L/NYi/aml5t+NloIIqKuz85jyFH13fCLbfZdIX5y1b7
	49aH2BJnyE24kUkGi+PkipENgswEqsSUq2RqcptHdJMsWXcZtau244qtN+is=
X-Google-Smtp-Source: AGHT+IGAqQ7A1f5OnzxEkv9s8qIYPOuyxirXjuB2awjtMPCuBREhm75vbrr9YSs0FFt1/sjNQStZCSkxsrbwGS64lB0BETV9zUl/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:378b:b0:3dd:d6d5:2d03 with SMTP id
 e9e14a558f8ab-3df4abae94fmr35252455ab.11.1751033821893; Fri, 27 Jun 2025
 07:17:01 -0700 (PDT)
Date: Fri, 27 Jun 2025 07:17:01 -0700
In-Reply-To: <8bd7960a-540c-426f-8c47-620d66fbdfb4@I-love.SAKURA.ne.jp>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685ea7dd.a00a0220.129264.000a.GAE@google.com>
Subject: Re: [syzbot] [btrfs?] VFS: Busy inodes after unmount (use-after-free) (2)
From: syzbot <syzbot+1134d3a5b062e9665a7a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1134d3a5b062e9665a7a@syzkaller.appspotmail.com
Tested-by: syzbot+1134d3a5b062e9665a7a@syzkaller.appspotmail.com

Tested on:

commit:         67a99386 Merge tag 'v6.16-p6' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17e4708c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=28cc6f051378bb16
dashboard link: https://syzkaller.appspot.com/bug?extid=1134d3a5b062e9665a7a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1317f182580000

Note: testing is done by a robot and is best-effort only.
