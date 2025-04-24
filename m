Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08E918FDA5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499998; cv=none; b=Ek/zEGk58m2NZ1PQCWiwsDsL9PMV+IZ9Kbv5LB7xH/469/J8CxtoK/BtO1iFQ2VdtL4ZdDcnMTHOzM1m5HAgurY+MazOiF+BGUm87qdg7t6AYoM7Qfj3xe9gB1dvV35lyEW428KOY9/tGBbEhJO5K0Pc6k2LaXevU4xot0C6V4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499998; c=relaxed/simple;
	bh=7VL9LiXP1QjnMSDEGVK4cAk83076PlWPAU4NQ9KCkSs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=gdIyS2ZW3Y5SqHEgYow3wZlEQ/KMPGubiJafJjwPIfyv3boIyaYQWjcsbQh7/cLZOZ5xymdxZMqrirhe3CelAqk8pJVz7Bah4iUC1HYExVXgUeLWtripyMJ2FMnUIOMgSfX8S7fw9K4Xg4X/nRSih8vFrNeV19YesfhCv4Sn7os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d438be189bso11433935ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499996; x=1746104796;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x+nl8Emi7VbtHDYLJ2yQ20exakEQsVh/t4kfvAlXQQQ=;
        b=dA73IRUQ6RmxH658ydhTmd6XRT9sV7TWl69YCrEVPshyyYbzxbawPOyL/Rib+RIZDj
         +t8RmqiPdVoZ9HWIQhZ8W0B7lb7ygOJ7+jp5PhAIm5FJ3Gn2URFtOS9j5PtdJXIe6aX+
         o+aOWGS+Tk05Qa6VXRjRlAtk4NU2t9mR9zSiyse1pm0VCQLldMu/aCTYTVm/+oHJ+VL5
         B6IWKmCIjba+g15WDBSsdXdh0LR7tmj91FNgzy3uVG5txJw9DbOV9CgRZblwxK2NcUH/
         F9uXL+WVeIl8ABLEOlxny0c9I0Hw9XITPBrR7yN4AC4w2IqBkk3vkvSfi/j91kR0A/30
         vS+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPYucP4dnLiAY12/C8NUCdXfWxQBjr/IVp3RxuWpyqS5BkTQkrMXz6RMqFMgx6+GeXJybUzUbmGpV6D3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFPXoOr8PXAtd6Oh27PlfS5AYnpKTv6cpUr+qWeDLp8Ln0Y4NP
	b4FGizBWzdOFKrg0JOKO4uJfC6f6VHFhBOoIUaJd3PfuVvuKOJop+UxYKx+HpvRPaVLiqReGFhl
	V1voGSAvq0xBIETlAOlK0BUWWJBsR3udF8hGt14d8EU1sLgzL38H4geg=
X-Google-Smtp-Source: AGHT+IHwrQ15VoiMCXG3EA2MlCv9tCPaplQJ11oIQkga7gS5vwHlMdNpnmddGPiIVw+fw3swdW/85S0mSCgjTV+3WvCAuU1Z0Cz/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1569:b0:3d8:975:b808 with SMTP id
 e9e14a558f8ab-3d93038630cmr25022615ab.5.1745499996022; Thu, 24 Apr 2025
 06:06:36 -0700 (PDT)
Date: Thu, 24 Apr 2025 06:06:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680a375c.050a0220.10d98e.0007.GAE@google.com>
Subject: [syzbot] Monthly block report (Apr 2025)
From: syzbot <syzbot+list14b5741b0fc59d7d464f@syzkaller.appspotmail.com>
To: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello block maintainers/developers,

This is a 31-day syzbot report for the block subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/block

During the period, 3 new issues were detected and 1 were fixed.
In total, 34 issues are still open and 96 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  10734   Yes   possible deadlock in loop_set_status
                   https://syzkaller.appspot.com/bug?extid=9b145229d11aa73e4571
<2>  5418    Yes   KMSAN: kernel-infoleak in filemap_read
                   https://syzkaller.appspot.com/bug?extid=905d785c4923bea2c1db
<3>  3359    Yes   possible deadlock in blk_mq_freeze_queue_nomemsave
                   https://syzkaller.appspot.com/bug?extid=9dd7dbb1a4b915dee638
<4>  2520    Yes   INFO: task hung in bdev_release
                   https://syzkaller.appspot.com/bug?extid=4da851837827326a7cd4
<5>  648     Yes   INFO: task hung in bdev_open
                   https://syzkaller.appspot.com/bug?extid=5c6179f2c4f1e111df11
<6>  363     No    INFO: task hung in read_part_sector (2)
                   https://syzkaller.appspot.com/bug?extid=82de77d3f217960f087d
<7>  312     Yes   possible deadlock in blk_mq_update_nr_hw_queues
                   https://syzkaller.appspot.com/bug?extid=6279b273d888c2017726
<8>  81      No    KCSAN: data-race in block_uevent / inc_diskseq (2)
                   https://syzkaller.appspot.com/bug?extid=c147f9175ec6cc7bd73b
<9>  63      Yes   possible deadlock in queue_requests_store
                   https://syzkaller.appspot.com/bug?extid=48928935f5008dde0a41
<10> 51      Yes   WARNING in blk_register_tracepoints
                   https://syzkaller.appspot.com/bug?extid=c54ded83396afee31eb1

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
