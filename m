Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47E5294A13
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747056870; cv=none; b=KipURHn7x+xueJMX5Bd0tkZyLTru6EFIbTBhqinWvuEfh9nTQZ7FrVzbYZ82uUwf/2j8wemawSY8JIL1H6BQ2WrmcZBzGduvlbOh2RgLDO2pq3jXdcJNj1lb6WNHzuiy+F04BBjHCMIX65R8HPRLa/sI4T9OUrHSzva02mF0fq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747056870; c=relaxed/simple;
	bh=9LaT8jpMDsO0x/0Nqzjg5EOM711aSAdddO9qszVV5k8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kF8MnKHgPSwV97cjmPvnvbBWAwh+fTEwJXdsUbfvtzmqpAuahC04fBZOUAITe49N90gjlX7TSE2hAPVDuqAZyF7wDq4DID8qz0jKgSbw++V/CA9HS19rQ6p+tNf8/S87GwMvgMJ6Ef3ofwlSjRqnq84R6oyh4LBElDDUGX3JP94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3da76423b9cso51204575ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056868; x=1747661668;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N5Jsy2OEKlJIXsAudq58rYcIWaWdiHscV+wnkzGpNzo=;
        b=mDBSb6WRlkEHmwkupfndhwvm3hDYfk7dcIr64AR2wtsgcO7tRcaXrVWBKVNqo8MYK8
         qBxFvudnuY3tOsW2Qa/6f3K82+mP/Ro3CODKXkfm1LiMuT4NXSM1cqwev0/G2Dlec39A
         xwGbQgurA4ArwnGpXku2qGC38JpaSecaFOERNfbIMO9M9eoAXzWMvxueSwq+TXcQzNQT
         I214NlSVfVhXX7SpziWpRtO2BMSMVpieT7C43hQMCeWF9NnGh1zCCrwGfzDXOEIJgquc
         UgfOPy/XMKks+rEVXEI/7TKk0eaA01GDcWXXlq0EnSpU7z/YQw6G1+TilE0PqLj5QeBl
         aFtw==
X-Forwarded-Encrypted: i=1; AJvYcCWWC2WrpByqz91h+e+TXkkNlf1TClYMnVJ1TwLYlcgFIcKkSmzKsQpRl1MxRsHDp9MQ7IObw9Nm2OUMq4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaaDqz9f/WaJFz5CwSPJJIhBGzladOQ4gfIRElFk7CBXrPVfNu
	ViX5BoAA8Pw50CDIQK/H7ox10H82XF2w8RYIphh89Kfoi29SkjJ5CSefniT4NUnlzfRESLucUBo
	XslGovZQ9y0tipyBnIwEcfa7mzEiKcfkl7FjcSJ7kyaFIMRHcg7sMeeM=
X-Google-Smtp-Source: AGHT+IECV7osDVIrJ+ZByHa1VnrQa26YYhTwEGq12zIt0CegPoH35EnLWtvqfi5x5AfsOhWU4F7+jPdHKuocSKMakLBIPc327aLY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a06:b0:3d9:39ae:b23c with SMTP id
 e9e14a558f8ab-3da7e21751dmr157403935ab.20.1747056867911; Mon, 12 May 2025
 06:34:27 -0700 (PDT)
Date: Mon, 12 May 2025 06:34:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6821f8e3.050a0220.f2294.0061.GAE@google.com>
Subject: [syzbot] Monthly input report (May 2025)
From: syzbot <syzbot+listce35d07e50216cd75a3a@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 1 new issues were detected and 0 were fixed.
In total, 27 issues are still open and 58 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  24829   Yes   UBSAN: shift-out-of-bounds in __kfifo_alloc
                   https://syzkaller.appspot.com/bug?extid=d5204cbbdd921f1f7cad
<2>  1915    Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<3>  1120    No    possible deadlock in evdev_pass_values (2)
                   https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<4>  731     Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<5>  396     Yes   KASAN: slab-out-of-bounds Read in mcp2221_raw_event
                   https://syzkaller.appspot.com/bug?extid=52c1a7d3e5b361ccd346
<6>  54      Yes   WARNING in cm109_input_open/usb_submit_urb (3)
                   https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
<7>  38      Yes   possible deadlock in uinput_request_submit
                   https://syzkaller.appspot.com/bug?extid=159077b1355b8cd72757
<8>  21      Yes   WARNING in bcm5974_start_traffic/usb_submit_urb (2)
                   https://syzkaller.appspot.com/bug?extid=b064b5599f18f7ebb1e1
<9>  18      Yes   INFO: rcu detected stall in console_callback
                   https://syzkaller.appspot.com/bug?extid=32af18ae7b894a681f2d
<10> 4       Yes   INFO: rcu detected stall in call_timer_fn (5)
                   https://syzkaller.appspot.com/bug?extid=03dd0f0cbfcf5c5c24f1

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
