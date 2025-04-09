Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EF82512D6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744182691; cv=none; b=TQwJFoFwhIj5WbRCiBPQPqW2sdCKImreaHEGhX5aK5b9BB0FHEGhtQseamT0TzHw4lzOcTmEUEGVXfD6BVEayFiQP3OmpLiQYwwtmmyFvJ/wu+im4obTg2EfuTwczIDd/QFEm+x9NWOFwEgK05GtNwaT8FoWtgaCZppxVkjQpqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744182691; c=relaxed/simple;
	bh=UTABSJgI/mjfBjdImq89ZN9QRtexK/VsD3sDKuVX/LA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ZMutiqOaGCmBbNtr2lKS1XPmrfynUcohD9AaBB1YhYW/1VvPR3TowzsjOsGGXifyEKRHE7av1MqarmccOGRGBIlyZbzYMC47GxHsuJEq5+iKfudG+Bfbx4iFvjCKgq3b4tHP8iUNFrYoD03G4Vv7bukMMpVHWemM92u3GNulRng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85d9a52717aso982787639f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 00:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744182689; x=1744787489;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FkTg065HiyjbCbK62p4YAcZCLi7YP3Obycu4jnTeIK0=;
        b=RdGPfF1ybBxnBtlG6hpxKBZ+S5MHUcDbV0XmBp5E8pQhoNNzRADAtz+dsQo3Y5jIvh
         LMgJKQMSGTlmCU15z0ZBNiRppRlcN9ug03lOVI4QwpdZfxt639IOsn0Tp/DQQogYDKv7
         nPVqRgglGQ+ILYhhdyKO9Bi05r6J0XRlSl+Gw+CuCjeubaTi1SP+jwK4B+k0942EGdCx
         /33VF7zHigZnPt7yc6Xms5vU9kbaLu9eOvr26hvCzTZVxXUrR9VzjxXKTmHjznLxNeho
         AjwoGoLhrMGwM6wLDM3UNqLe89eZ7npt01CcYcDIk503srYv6VCwLULid2YBT91j3nBW
         oyPg==
X-Forwarded-Encrypted: i=1; AJvYcCVcUxr2AEzNFWXZV2a3ft+KqQM/qhlX54rBgk1jSvKnIIK6qz0tssDK/ohcID93NuZGu406BD52eEUOG7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiXTih32PrtwQ2QRfb8wUaFxYhvKcD6GZtusqqIkZhMVa4J06i
	tNacM97kn5yVr64Lmgf9emJGHr7JIpH6GQTW0FEVX62SqpltLhoPNT+Z1fINXxqworPxV09QAnV
	RBrY0PZ64E0w8sDNc7kUTq0qjGr9yr7A/ePgnKNczNd1oPzFAeur5Bts=
X-Google-Smtp-Source: AGHT+IHCI+Z2RCeNHpMEjvUQpmZ6Z0+B6oB+UFhIZMqNBuEN0C16EI2M45feZP+hv+vSk5MHCdNw5saZO5wWWppcsWTkvKGZ8dQR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fcd:b0:3d0:21aa:a752 with SMTP id
 e9e14a558f8ab-3d776c8284emr18791865ab.2.1744182689390; Wed, 09 Apr 2025
 00:11:29 -0700 (PDT)
Date: Wed, 09 Apr 2025 00:11:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f61da1.050a0220.258fea.0016.GAE@google.com>
Subject: [syzbot] Monthly input report (Apr 2025)
From: syzbot <syzbot+list5470fc8756c444c65f8e@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 3 new issues were detected and 0 were fixed.
In total, 30 issues are still open and 58 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  1684    Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<2>  1043    No    possible deadlock in evdev_pass_values (2)
                   https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<3>  679     Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<4>  229     Yes   KASAN: slab-out-of-bounds Read in mcp2221_raw_event
                   https://syzkaller.appspot.com/bug?extid=52c1a7d3e5b361ccd346
<5>  166     Yes   KASAN: stack-out-of-bounds Read in sched_show_task
                   https://syzkaller.appspot.com/bug?extid=8d2757d62d403b2d9275
<6>  51      Yes   WARNING in cm109_input_open/usb_submit_urb (3)
                   https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
<7>  36      Yes   possible deadlock in uinput_request_submit
                   https://syzkaller.appspot.com/bug?extid=159077b1355b8cd72757
<8>  22      Yes   INFO: rcu detected stall in do_syscall_64
                   https://syzkaller.appspot.com/bug?extid=a3bc6ce74afdd295fe4b
<9>  19      Yes   WARNING in bcm5974_start_traffic/usb_submit_urb (2)
                   https://syzkaller.appspot.com/bug?extid=b064b5599f18f7ebb1e1
<10> 4       Yes   WARNING in hanwang_open/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=9fe8f6caeb5661802ca2

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
