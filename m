Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841E22C3268
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773148; cv=none; b=oSU1wuOci+g2fCoYXNttHouTk3BQsVCWIWHvW1bldCpB+/sUM0rB55JzbKqFucWN+5gsdfzc44eM5PO5UVQsKvrt++2qFtWeJ10m+F1H7lL8ZdZWR8IZvTxgBH3M+MA1vtn/ib4/ohspmLIqeyPFrm2DQbrRrl31gWQfbYv6CWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773148; c=relaxed/simple;
	bh=oXZ8co1e8mmwl9zX6KlK8xWZmne+5OdHNz2El37jtVM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=OwDM4mkuqXRjnGWGCYiqUKhW0ZNljhDEvS0JZ6QsK5vKLii9o6cQ49vNQ9oSg2Y3j8DEFQ/V1eFiuH5z7QW9z0RqzbQgsntw34qboZAvrAt7iB8HxxjndiM6g4tA6DdJaRwd8YDqpvnf4FGX6nEwVmPbdepB3V9okexwDjB1AZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddafe52d04so166681715ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773145; x=1751377945;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uin6lLcwohm4lv9WyITuwcyVt/c+X4e6jvHm3Unx2MU=;
        b=aSIJINfltCYvxxIymawoKgbGlzgSBRVxG0uFMlR6hLMZcJ/ZpjhLOCXWMGvnKIAjJR
         NTI0MhnS/8LbgQtanl47fKzmOaQ6G+RxzAPLi26p5+06vZ1tvLgviOYmPJGuhAhSRPjG
         5B9DVbf1/NuTiE/AT7VtvykAFLFTLJD+kfID/7uJwpXopq5esF9khA6vZcO6h+vaVssG
         ROqeyb42PGyXXWHqCvitzXtRJS13KbNhKOCYtRHaNz0duimuWh4o/ppHiX4XBLqlJT2q
         Zjygb0UBa8v1WHeA2jmDMI3OgRsqcTFNNDWADOwuyeAZdWHZ+pfujCpKB0mZEyxF0Xd9
         KBag==
X-Forwarded-Encrypted: i=1; AJvYcCVvs3vYmnaVJds8iH8dF3RLT+fIdL6VzJvQcjICmuG4xaxTDBoPzcPv/1CBKOaa+wb4TklPfU9OdRYdhAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA3/adV2p2GCmO9uW2Aq+/DmOWa8OkYh7TinOPVCcNaQrUd6cw
	mf22uDKBLNFVWaju/U6Uq5iKinmauMi1urTXqSPGFPsKqkx3xOGseD+/jZ21JSZl0hyc/SCw77q
	9c5p843GWORjFMIHOmzpATTLN6+tw3pAQIY/cxSZNTrgGXXOwHkxNLSIrXjo=
X-Google-Smtp-Source: AGHT+IHvKvf/vVCdxwI030nwml5wrDQ6tlpXgTpPK6b9n0FXCh1L+iUC7/Lp70pNFIbf6gAfOug2uCJ+XPGVXDcG1bXFt78OzyPB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a2b:b0:3dd:c1ed:d901 with SMTP id
 e9e14a558f8ab-3de38cd92b9mr212604135ab.21.1750773145639; Tue, 24 Jun 2025
 06:52:25 -0700 (PDT)
Date: Tue, 24 Jun 2025 06:52:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685aad99.a00a0220.2e5631.007a.GAE@google.com>
Subject: [syzbot] Monthly hfs report (Jun 2025)
From: syzbot <syzbot+list8132deb081c630ffb070@syzkaller.appspotmail.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hfs maintainers/developers,

This is a 31-day syzbot report for the hfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hfs

During the period, 1 new issues were detected and 0 were fixed.
In total, 46 issues are still open and 23 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  90790   Yes   kernel BUG in hfs_write_inode
                   https://syzkaller.appspot.com/bug?extid=97e301b4b82ae803d21b
<2>  17637   Yes   kernel BUG in __hfsplus_setxattr
                   https://syzkaller.appspot.com/bug?extid=1107451c16b9eb9d29e6
<3>  13270   Yes   possible deadlock in hfsplus_get_block
                   https://syzkaller.appspot.com/bug?extid=b7ef7c0c8d8098686ae2
<4>  8079    Yes   KMSAN: uninit-value in hfsplus_cat_case_cmp_key
                   https://syzkaller.appspot.com/bug?extid=50d8672fea106e5387bb
<5>  4225    Yes   KMSAN: uninit-value in hfsplus_delete_cat
                   https://syzkaller.appspot.com/bug?extid=fdedff847a0e5e84c39f
<6>  4084    Yes   possible deadlock in hfs_find_init (2)
                   https://syzkaller.appspot.com/bug?extid=e390d66dda462b51fde1
<7>  4039    Yes   KMSAN: uninit-value in hfsplus_attr_bin_cmp_key
                   https://syzkaller.appspot.com/bug?extid=c6d8e1bffb0970780d5c
<8>  3875    Yes   KMSAN: uninit-value in hfs_find_set_zero_bits
                   https://syzkaller.appspot.com/bug?extid=773fa9d79b29bd8b6831
<9>  3134    Yes   KASAN: slab-out-of-bounds Read in hfsplus_uni2asc
                   https://syzkaller.appspot.com/bug?extid=076d963e115823c4b9be
<10> 2893    Yes   KMSAN: uninit-value in hfsplus_lookup
                   https://syzkaller.appspot.com/bug?extid=91db973302e7b18c7653

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
