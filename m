Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D345A20C03F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316697; cv=none; b=ifCTPsEckk3lL8ZeazloVN2wIZ1Ked8KEF6y8rnilpUK0c4zjZbFhIi+v9A17hDcvN+LPMbskZ7t5m6C2P4iOQpDOxq8TQVQqoJ65QO/fkhY0W0b3LpT0q1bAGQ8aXsVJswPQYuTJ9M2VHYmeOygb+QQML78+8NEGPHnBwo8hLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316697; c=relaxed/simple;
	bh=qFstDRd+RCWue0VZD9SQQWub8GaiBBLW25gNPTLl+3A=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=sg7pkR9eWBvNBmHHUKcL3us65ng1YRmoARWWby3hFc5kaqpZog1TFv98P857Fl+JAWGowlA4RnmgDHN0CaXR/HuIALaLulNYLgqlCYj/GmMMmD8Qi/lH9CzOneHjHQDEpOjc7dBeU3uDHkgWnwNO3PAFSAs7w0KQGiFatIQMzXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d922570570so4168225ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316694; x=1745921494;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CWsoK2gMUOgjdcG4fIk71ijoryDUCysojlG0e1XGnhI=;
        b=rZYbiCbO/3IxxXRMNKIDWCOW5VOYQFws3P8M7Yxjj+wP6xBiePyqruLBNMOyQo0Lb4
         MaSjPqJZJ1HWf6aARdUpwPIdBkgVGS5qq1BKKfJtyr8+CGREu8lziy1sXwjHojv509RX
         CjGGytWovGzXM3Ohfcgsr5m3kMGassX6IW2ZEIiDFs9kpNum0o9URBkeu2faEIa8+JeY
         vMp6OhwZfBH0iKCgE69En0KPAzhvWCN1V18WUk8JXPRdK9bPDnxSmeDik6HAfT+Jz00B
         V6QWz2xtG6u4IZWZkgC9hGV0pVrpDGH9pCYzQdSYOIosrpKrX8g7a8hZth2c65+0F1EF
         rgcw==
X-Forwarded-Encrypted: i=1; AJvYcCXlrYFNCv7kOkMyeVnGr+/8RhqcCY/H4rcGV6notq7j2rk3pWFjnWyIyvn1A9FWYnNl+5x2wCnwqEoUj28=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU9SkOkRsh6IBk8OfDJSm/RKM1DLSvyk3E4cwfE5uZ7Hoj8tP9
	2ZCtf6kmmjWJcHDMH7T1aga072KqiGL2YVamDwDsO8NTHX2KIxeJtjQNVcBwza+IN1Xr4Wktk4/
	IcG3jTVYE5APpH1B37hpaVesmrL0rqcYtxlJ7HjeYVW8w09TYTxrBKdw=
X-Google-Smtp-Source: AGHT+IEXNPomVFCnD3oPlrJpteuO5E1UL5OGys3urmpGkA5/adbiaqJkvb4l9lH7CywQzftdhkrllGzvX+GlWxucripwczBlT1JF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17cd:b0:3d8:211c:9891 with SMTP id
 e9e14a558f8ab-3d88ed7c3fcmr140733015ab.2.1745316694741; Tue, 22 Apr 2025
 03:11:34 -0700 (PDT)
Date: Tue, 22 Apr 2025 03:11:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68076b56.050a0220.8500a.0007.GAE@google.com>
Subject: [syzbot] Monthly kernfs report (Apr 2025)
From: syzbot <syzbot+list14d0e6e246807a2ecd7d@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello kernfs maintainers/developers,

This is a 31-day syzbot report for the kernfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/kernfs

During the period, 3 new issues were detected and 0 were fixed.
In total, 28 issues are still open and 23 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  4949    Yes   possible deadlock in __kernfs_remove (2)
                   https://syzkaller.appspot.com/bug?extid=aa419d82b68e6a7e96c5
<2>  640     Yes   INFO: task hung in evict (2)
                   https://syzkaller.appspot.com/bug?extid=65b1e2d8f2d618a93e96
<3>  380     Yes   WARNING in kernfs_remove_by_name_ns (3)
                   https://syzkaller.appspot.com/bug?extid=93cbdd0ab421adc5275d
<4>  327     Yes   WARNING in kernfs_get (5)
                   https://syzkaller.appspot.com/bug?extid=2f44671e54488d20f0e6
<5>  102     Yes   INFO: task hung in kernfs_dop_revalidate (4)
                   https://syzkaller.appspot.com/bug?extid=da20d108162166514db6
<6>  62      Yes   INFO: task hung in kernfs_add_one
                   https://syzkaller.appspot.com/bug?extid=e4804edf2708e8b7d2a5
<7>  38      Yes   INFO: task hung in do_rmdir (6)
                   https://syzkaller.appspot.com/bug?extid=4128a26fb0f85ec9e76c
<8>  30      No    possible deadlock in kernfs_fop_write_iter (2)
                   https://syzkaller.appspot.com/bug?extid=1cfd86253864f61b533e
<9>  14      Yes   possible deadlock in kernfs_iop_getattr
                   https://syzkaller.appspot.com/bug?extid=4bb2305559463e8f6a2a
<10> 10      Yes   INFO: task hung in pipe_write (6)
                   https://syzkaller.appspot.com/bug?extid=5984e31a805252b3b40a

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
