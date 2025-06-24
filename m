Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1C0253950
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750407; cv=none; b=ls3F0Gey5EalBZXEoirBy2QnIDJxZrySwr2FNY6Ab8YjlswqvtF7m+SmpgacGqFB9voskzAVZ1KseOOKRjcUMTsI1fdYTUKB/dW0FQiIiRk+4STqR8ldpJD4jv0RgbxhLUDGM/bdQ0yw3r0B8Icdy4Zgqvu2vcs0oyCTjudoZLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750407; c=relaxed/simple;
	bh=MeqGFNohGS/UtYjbbo1m1v78LUNtCclwggCbgSPV57g=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BNk12fgVKh3Qv3bG5cq93+P9UJNQxGt63mdGqbkaH3BGF5rh7I3fuWOowF6Q3+oIt2aK6ZFgkG0GtyFCqUOcQyLBhaFeMvoNpEVWNjCtpXdbyk1jAIGSGVJt/Tg7UfMLqTAe4RIXBRbf/AdcLoLoofzVCdN4VwxZCevebmWJBd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3df2d0b7c50so1595675ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750404; x=1751355204;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lwAeDL4uXrRxotGYDd6+WSH1XlQXeR92VyGqeuNWUPw=;
        b=dA1J+q96sUKP0PHn1aqri2FK8kHWtTm4Jx4ZWVL8qHSFJGCA3oScMej5y1YaLtw1kv
         Lesnt2x/JCVHfLdeDaeAccqU7FNfMC5/Os9MpLwMS3MLpHjV/3ui+unZo1biDBApll6k
         3x5diuPufWsZ0Fir2Ac3US3ZdROROjbc7SttbVM3JhZdP3767I01sz8aAfidskSLhxdy
         Bs5oXIN35l0U11PchDblOjlYZV7xWrUHRmeBOiMbbcIM1IfcDVoWJiSS+41FhGf2NqKp
         5P3iT/Vw4IkN4zmbEPHzUwEYURIJEi8s8tjqvNIEb0yOyUyF9FlS8p0SVw2WbQw8myuX
         ETOA==
X-Forwarded-Encrypted: i=1; AJvYcCUnvjw5prKOxhbjKHRe6JxrSayddckNuc7qMpXEqJJZ2bEnAhalf/ue5+cjDZHgY58BTD40+yn9ktZ2pQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3IdX3IATALqB6uFCS7eG6Vs4ZC2VDLy1eZnjOyLf3IY6UCS6Y
	LDbpDo1xlfuyfBwUWViQ96UlcLgZGMZzPMDGsrN1Cp+MYSqdgKO1x2+rPP9vU+4aXZ2uxZv27Y3
	lJH3VrqwxVJp+t4O5KBg/47CqvLXPh+tKJb21v+k2pjSq+ZIdwRE5MyfDOHY=
X-Google-Smtp-Source: AGHT+IHu6murt6u/PZyZTSIcUyKz2pY0qGxTZPtECK46mjpD9QQFcB4AQfBUeY1tG/ABYktrXd1DAQqgr39+BdQev1/MD6UlG3BA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3d88:b0:3dd:b808:be59 with SMTP id
 e9e14a558f8ab-3de38ce17a4mr184303075ab.21.1750750404673; Tue, 24 Jun 2025
 00:33:24 -0700 (PDT)
Date: Tue, 24 Jun 2025 00:33:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685a54c4.050a0220.2303ee.0004.GAE@google.com>
Subject: [syzbot] Monthly btrfs report (Jun 2025)
From: syzbot <syzbot+list02d191bb80c00a2f200e@syzkaller.appspotmail.com>
To: clm@fb.com, dsterba@suse.com, josef@toxicpanda.com, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello btrfs maintainers/developers,

This is a 31-day syzbot report for the btrfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/btrfs

During the period, 0 new issues were detected and 1 were fixed.
In total, 39 issues are still open and 100 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  4190    Yes   WARNING in btrfs_space_info_update_bytes_may_use
                   https://syzkaller.appspot.com/bug?extid=8edfa01e46fd9fe3fbfb
<2>  1382    Yes   BUG: MAX_LOCKDEP_CHAIN_HLOCKS too low! (7)
                   https://syzkaller.appspot.com/bug?extid=74f79df25c37437e4d5a
<3>  880     Yes   WARNING in btrfs_commit_transaction (2)
                   https://syzkaller.appspot.com/bug?extid=dafbca0e20fbc5946925
<4>  752     Yes   WARNING in btrfs_create_pending_block_groups (2)
                   https://syzkaller.appspot.com/bug?extid=b0643a1387dac0572b27
<5>  495     Yes   general protection fault in btrfs_root_node
                   https://syzkaller.appspot.com/bug?extid=9c3e0cdfbfe351b0bc0e
<6>  454     Yes   WARNING in btrfs_chunk_alloc
                   https://syzkaller.appspot.com/bug?extid=e8e56d5d31d38b5b47e7
<7>  439     Yes   WARNING in cleanup_transaction
                   https://syzkaller.appspot.com/bug?extid=021d10c4d4edc87daa03
<8>  324     Yes   WARNING in btrfs_remove_chunk
                   https://syzkaller.appspot.com/bug?extid=e8582cc16881ec70a430
<9>  304     Yes   WARNING in lookup_inline_extent_backref
                   https://syzkaller.appspot.com/bug?extid=d6f9ff86c1d804ba2bc6
<10> 241     Yes   WARNING in btrfs_release_global_block_rsv (2)
                   https://syzkaller.appspot.com/bug?extid=48ed002119c0f19daf63

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
