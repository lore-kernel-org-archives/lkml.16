Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830BD22D9ED
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748949085; cv=none; b=los2/w7Sb6WClIkZINU8TRzyOPC77rnK7S7+rDPjoNMMwLpcSVOn3kgB/CV4yjOrVEP6IiwH5t6KZ2pQSXqVkeTDPLx0XDacWw5SwRJM8yPzd3HIo0iRKlzeR8r2L7LX1orOeJr+RWN7pxGTSi2kJZ8zEXQaMkAqGxoz9VkrJ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748949085; c=relaxed/simple;
	bh=O29Et/KeE5vIc+PYEGwjNiRxZglCfQlK5lTmMBm7+UQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=B/y7ujLPCMXWm7Th1KbsOqwTigDoJW71YCsKrPSwFVwIoRMDlF6rAC2I9lBbxxsNkbV+fy9g/sLAM/XqXrYcaD+hiRdCE1ZtS6WVgPM0SvkZ/EGaAKG3ynu8d1hqbhKXKVnAzqLGsWrYAlOwi4eJ4pLe4iHvxKBIiRyQTg1a+uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddb8522720so12646865ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 04:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748949082; x=1749553882;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MPvTW/GDXyB87H7GHZi01anQCBOqwa/W7+aatqdbldE=;
        b=QYLK0BeHAgEfGTFbG3SNMciD3AYJfOGdjg9NPMF7zS+2x5ba2KqOeQKkNGG7zsSFv4
         zqdIc/ZzeNhrkeQ7O+rya7BYQ3cJBiHV4xMb9jam09rmVKYmIeGOoSXSFPnPJ0yKxfGE
         UnbvFk7WWpieEp0OW26y7I56B0Fc5mFqLjLAQL5Jo9eZX7wEqptxNw8Vq0UnsSOIjFfq
         4RBUq3vpQCeBnIrXhx3b0bag23u5TXWYhrm/AfxR8VRd+xVrWY0owxnhuXvBMUMhY6IH
         NvdNmTmYSjMB44oajY/54ilLcQX++vcSi/pffucXQnfb368ool3jI8PsuUSqOf6xdl6B
         HsLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbTwAvkDj8WQhImqU3fZO8T0AMsVKWhZ07tu68yBTHnbF/m/LiV1E3PbyGRGs3PzBTA0gDcN0lorwA6/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZGeITwNrgoFGqYwMomXN0lmi3WoHo9qJt9a0MK/PNyMXj/53k
	serWN58qKFNo7tBdNlQxSEs4FJOlf54bZRqa3uRwReNvdkJWjH0ZMDqFpHZLcl1Crn0ud39+t8u
	XTJj7uqU5r3/x7Ltltqi0uiG+kkjy02gSMBUvfWUuecVV2Lb0rKfQQSpbe70=
X-Google-Smtp-Source: AGHT+IG7Tvi3QKY5gAg4SwQGiBTh/690T41K815KYJQlCx3j/jEBGd2bwCUuW04k8bnZjuaP5T3eSsk6vIyScuGs4Ig+nocIuP8Y
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2293:b0:3dd:9164:906f with SMTP id
 e9e14a558f8ab-3dda331b28emr126586965ab.7.1748949082749; Tue, 03 Jun 2025
 04:11:22 -0700 (PDT)
Date: Tue, 03 Jun 2025 04:11:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683ed85a.050a0220.55ceb.000d.GAE@google.com>
Subject: [syzbot] Monthly f2fs report (May 2025)
From: syzbot <syzbot+list64bdbbb0bb97345969ec@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello f2fs maintainers/developers,

This is a 31-day syzbot report for the f2fs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/f2fs

During the period, 2 new issues were detected and 1 were fixed.
In total, 13 issues are still open and 60 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1270    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<2> 703     Yes   kernel BUG in f2fs_evict_inode (4)
                  https://syzkaller.appspot.com/bug?extid=5c81eb8c0a380fa578b5
<3> 80      Yes   INFO: task hung in do_truncate (3)
                  https://syzkaller.appspot.com/bug?extid=effe7da6578cd423f98f
<4> 81      No    kernel BUG in folio_end_read
                  https://syzkaller.appspot.com/bug?extid=92895fc54ccb69ca6fa9
<5> 15      Yes   kernel BUG in f2fs_write_end_io
                  https://syzkaller.appspot.com/bug?extid=803dd716c4310d16ff3a
<6> 3       Yes   kernel BUG in f2fs_invalidate_blocks (2)
                  https://syzkaller.appspot.com/bug?extid=240643026e8cd9ddfaf2

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
