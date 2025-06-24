Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C30725D201
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750754824; cv=none; b=ZxeZLTPLRGLPfKlTimmQ3X2YeL02FJF818iFa9c8Zfz7OHYutBKh5+97Xtu5E35vE9v5VnJawcpY2gpbAtCrA+P/+tMvCpr/MCdOTlO+Yk51PwxcwXLOwUK48htNZqEzR8kJkKFDmcdnkMdI4E/9lR1Lht9uRMSuS/2Bwq8ocvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750754824; c=relaxed/simple;
	bh=ZTzM8Q7udUhE9DJc6t1DPCQpG014X2G1f7hMSSqOYZ8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fgGNkQAT1lhXFpfc0Cn7HWTebn0Y6sCOVsEASyO1fj/32acTvCT4Ljh22SFhrf4Z2iz4H0L/U72TPzsQZSfQlhJZ9ezlBYhuzW+RpOqYA4YYm0LVBGelbQCaBUQ4StLRNLMgc4WFu6XOaZ5KZr3kctFVd9LcguwVFOPwicbb+Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddba1b53e8so1955255ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750754822; x=1751359622;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTy2CkZKKcNnWbVHKSnKqAf2eweC2VZddt1ot+lLKB4=;
        b=s17rfNBDCCs8JyGXLs/MCm0duhNy1TjtchAqxpbRXX0CpTQVeLOzHmWkLG728X//3S
         wACA+r85aaDWO29oq0jMG0lcgO/19rNzuD3ER3d0ldvKKIgmz3XEpjH9tsY/G37gBsjl
         ++8+BG7m8c7Rw5g4S61JoFuTioHGUBX6QobjPy9cFUMiRQjjOk3jc52Mq0Ui7/9eFS8x
         fBcPna6mgPhqPLbn5uluV3W/1n7lqYlBv1UWPTNmpN12DJcaqvP2mCUmBrZtBvfv1ouB
         h/lpkIx/XYmSqQ1lua82Rug/16zocFB1eIsk9PWERN1RR2c8TVuo2vr8DiqADCAtM6Qf
         nBeA==
X-Forwarded-Encrypted: i=1; AJvYcCVU7ISctB6Cd2HVcaMBZFxh+MOQMyd+uCi4mSB1Ifkks+DedmzdL5HxT1Jk30sGP7MaI8jVTf7Okck/4ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFG6YksYz7za/aXN3ElMXZTFWrx1s7BzaIIgcLHB/8dQug+Hf4
	ZbcODfVuHJPuSgTK9aaYVcoWH7cZwB+ZSn+8+08tvj+ZHpE6VKxTbbkRqx/nQsIJYuVgs8gwRO3
	bRP34XX77nPitL+Iz9JJV/JC9ahPmyCYaCzG8lQPBCvo1hXQjQDfIDzs5GKM=
X-Google-Smtp-Source: AGHT+IEKay6LxW0MJy2H3xz6hpoMUwLRlYxiUcY17lfQxxiSt15Pny/0TPr8x7GwSXKRrCgQFS6wqIPLFvLW9DO863h73FWGD2ng
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:32c1:b0:3dc:8b29:30bc with SMTP id
 e9e14a558f8ab-3de38cc3076mr178273585ab.21.1750754822258; Tue, 24 Jun 2025
 01:47:02 -0700 (PDT)
Date: Tue, 24 Jun 2025 01:47:02 -0700
In-Reply-To: <20250624082559.1616-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685a6606.a00a0220.2e5631.0064.GAE@google.com>
Subject: Re: [syzbot] [trace?] KASAN: slab-use-after-free Read in __free_filter
From: syzbot <syzbot+daba72c4af9915e9c894@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+daba72c4af9915e9c894@syzkaller.appspotmail.com
Tested-by: syzbot+daba72c4af9915e9c894@syzkaller.appspotmail.com

Tested on:

commit:         78f4e737 Merge tag 'for-6.16/dm-fixes' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=149eedd4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4ad206eb0100c6a2
dashboard link: https://syzkaller.appspot.com/bug?extid=daba72c4af9915e9c894
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12ceedd4580000

Note: testing is done by a robot and is best-effort only.
