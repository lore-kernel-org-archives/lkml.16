Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F9019DF4C
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839337; cv=none; b=MAtHX0ESDHZsZGiCsvJOd9Eqtd117uK1wzaPpP4R7MWA7Ts0S283jk5lrrpRpBl1b2pN/6xL4e8mf+CR/BL8I+4bSkWIfdpyo0SPdrADIsCEHTQjDWPE1VN6zXzVXTEOuFw9oPgWy5BKGKxJv9waRjaI3sEGBKf3O62Z0mLvc1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839337; c=relaxed/simple;
	bh=9AEiv1p+JnCpiMVQaOtvwKh1gqZikLJzllz0fnjn9MI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=V7ArKqyoc8jmA6r6glBpnfYYdXQzo3u4CzzOil5h8IIUSb/xOUq2t01U1QKYJwjN9uBBYvOQNJ0/rTytgBdB8n8h0islJO7I3MnZzFPqD3o9PrrgcGPcf4KTmHiO8GdnKQx9iMuRljx9TLiD7LQe/S948zfJsh0x2X/8ilIjUoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86184fa3d00so558652839f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839333; x=1748444133;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sCZgjW/j9aAWJx3erWl58ieO4bI+d7BltCXalbr0GH0=;
        b=OuVb2jMyx+VFIUoGJX2fVCYI480lzqMywlEcd760RFkWZk83SXo97S31IIZFo3nnLU
         yQlzGLKDSng2AIQCgOWwBToDp91lF+FiNHJUGP/kYvFAyuGg86G1/h0zRkWyJNoGfAVD
         rQBx1yvMFU0zvSc27wdzDLgxWl6H9/C3pUY76Bcprz45WsLQHAigS2SUM1DlvvnztiMH
         /98/JIDKlP2QYmKBqhRGGZpA135K+7wxoJscm825cDoUeDMDWwOBDwuoPiiPZe5PuDh9
         KQb4oRPgsnWNkDGWn9J1QVB0aH4RpgkuHdoYw7nZAF5S9hcF8FvnF2kIAQ9BM9xznP6U
         1JdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPc3i83rmIYVNIjR4mM0RhYEjUga2vn8JC7nxtYll6XSbcQwRxLUQKhGmEam62E1TIG0PX406CpCGmIqk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz49G9dGkuxDArpHYrSWAOKKRdFoSJQXczEaubeUsykaqlj1JGQ
	pfk6+HeYUthIriJikPER3aoHKRbkH6Ba+VgGGi7TbmYiAbDevTzX35qsSZzIuz8CgYz7P7xvJcA
	wdOcTfv+9F38mRIY8rMNAMgoWdUNRq8FnLHVDYKJP8jnmJKOJPhaxeGM5nNE=
X-Google-Smtp-Source: AGHT+IHJpSduBq3ks0nOe6I3AMuP5rRmrtNRZTzHWLuDKTdP9J49/R51NWCFqYydwmoKHZwhTOixaMKxTOKNhCAF0Mn9NhExXv3r
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3887:b0:861:c744:5a4a with SMTP id
 ca18e2360f4ac-86a231983c6mr2556518139f.5.1747839333555; Wed, 21 May 2025
 07:55:33 -0700 (PDT)
Date: Wed, 21 May 2025 07:55:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682de965.a00a0220.29bc26.0291.GAE@google.com>
Subject: [syzbot] Monthly kernfs report (May 2025)
From: syzbot <syzbot+list4ae572b679a79e7a5c6b@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello kernfs maintainers/developers,

This is a 31-day syzbot report for the kernfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/kernfs

During the period, 1 new issues were detected and 0 were fixed.
In total, 24 issues are still open and 23 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  391     Yes   WARNING in kernfs_remove_by_name_ns (3)
                   https://syzkaller.appspot.com/bug?extid=93cbdd0ab421adc5275d
<2>  344     No    possible deadlock in lookup_slow (3)
                   https://syzkaller.appspot.com/bug?extid=65459fd3b61877d717a3
<3>  342     Yes   WARNING in kernfs_get (5)
                   https://syzkaller.appspot.com/bug?extid=2f44671e54488d20f0e6
<4>  103     Yes   INFO: task hung in kernfs_dop_revalidate (4)
                   https://syzkaller.appspot.com/bug?extid=da20d108162166514db6
<5>  65      Yes   INFO: task hung in kernfs_add_one
                   https://syzkaller.appspot.com/bug?extid=e4804edf2708e8b7d2a5
<6>  50      No    possible deadlock in kernfs_fop_write_iter (2)
                   https://syzkaller.appspot.com/bug?extid=1cfd86253864f61b533e
<7>  38      Yes   possible deadlock in kernfs_iop_getattr
                   https://syzkaller.appspot.com/bug?extid=4bb2305559463e8f6a2a
<8>  22      Yes   possible deadlock in walk_component (4)
                   https://syzkaller.appspot.com/bug?extid=b4567a8b2d2ad5f9dd06
<9>  19      Yes   INFO: task hung in kernfs_remove_by_name_ns (2)
                   https://syzkaller.appspot.com/bug?extid=6d5664213a6db9a5a72c
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
