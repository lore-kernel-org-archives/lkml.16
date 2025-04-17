Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F145222590
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879108; cv=none; b=WDA3QxmtPDOql7voEDjGJn77Y3rz3J+gErkI0z+BbFS2mzO2JUhyI0Bgme+OjIZzhd1VucR2bRuKIzl2rpSgAnsRF6CeTMwNc8jMVRDUnvyVWF5JeC0tkb0ibzXfyKrdrlqV5LjXrILpksQl1kecfrWUrepxQvB+UK4SqAiZJJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879108; c=relaxed/simple;
	bh=Le2DQb6d26PT3nBcXc5FkBee0F9+eT3oXTZcWo3Cixg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Vb7e2Yzk75sQ4HNnIAkRuLpdtgwiOXXcHNdolsnPX9zFaNA1smixmwm1gE0MVWh6pixry9MnTKy47zO8wajhBkF++N7vqmbK/yawTf5tz5HLwmSJQZT9rodxgZfj9HvH3LlBQ+paTD//rks/+5J0d2QutZC6xaHwkUUFMbLBtXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85dad58e80fso136222239f.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744879106; x=1745483906;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aj6J3dmz489BCCitLkNNhLteQXiScv4rJV+t3X5Vrqc=;
        b=IlU4fSL3yOfIMYPAYId7oyHdRmaDTrQeHkMIMCVwxiQciXko/GFR+T4DAk63VT//CM
         5RD3DHdS8TKeduWifGvmFLohPFT+wrJzZeb6yXmRbNZ1H52y5Hb/li+6JX28We8qiyML
         CD4tzufzxC0dvBQVUGuOTuH4LG+KTonhhOKxGyaBwkcf2RNsJd4/aiowKuFqOaB8GhPD
         HqhE9J3lrA6JvTQygtiJofbFaQ6eNSQEoXf3/QMeFrFsyMKeXzj3S2oY9NVaCR7TXDdc
         bXKI88UBmm8Nd9fYXwZ4ENq43PD5Bg4pYIljUSRGVHbYDm5WQAR2dkVE6BXviVjzR/mR
         Cu1A==
X-Gm-Message-State: AOJu0YwX+QwzSJ0DJp5M5gEtZxxmDLXcyb4EcGEaeKz45cbgg99IvvvS
	zUznCJOUvobdp5fdU5l4HM9FD/9nxoXsHVwnBPq1IRz0/TXv2nHpD1bN3ndzLAP7rSi/XznzpFI
	f00Kbfk9mF99G6t71J2k7xpuRM+3MHMw1vWkyHpL7tIRKyqfHRz05r0c=
X-Google-Smtp-Source: AGHT+IFNFKv7FndE/TSGAVUIQjg41XQS7KTGt166sJjk+WHLdvZ0xwSqjyI/3rBvekK3W4KmP/VjFiey0+pfiJsE4ioTHYdQXLNf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f0a:b0:3d8:1e96:1f0 with SMTP id
 e9e14a558f8ab-3d81e960583mr4482845ab.20.1744879106378; Thu, 17 Apr 2025
 01:38:26 -0700 (PDT)
Date: Thu, 17 Apr 2025 01:38:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6800be02.050a0220.243d89.0010.GAE@google.com>
Subject: [syzbot] Monthly trace report (Apr 2025)
From: syzbot <syzbot+list1cad94e5112980df097c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	mhiramat@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello trace maintainers/developers,

This is a 31-day syzbot report for the trace subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/trace

During the period, 2 new issues were detected and 0 were fixed.
In total, 13 issues are still open and 43 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1675    Yes   WARNING in format_decode (3)
                  https://syzkaller.appspot.com/bug?extid=e2c932aec5c8a6e1d31c
<2> 176     Yes   WARNING in bpf_get_stack_raw_tp
                  https://syzkaller.appspot.com/bug?extid=ce35de20ed6652f60652
<3> 51      Yes   WARNING in blk_register_tracepoints
                  https://syzkaller.appspot.com/bug?extid=c54ded83396afee31eb1
<4> 39      Yes   INFO: task hung in blk_trace_ioctl (4)
                  https://syzkaller.appspot.com/bug?extid=ed812ed461471ab17a0c
<5> 23      Yes   WARNING in tracing_buffers_mmap_close
                  https://syzkaller.appspot.com/bug?extid=ddc001b92c083dbf2b97
<6> 21      Yes   WARNING in tracepoint_probe_unregister (3)
                  https://syzkaller.appspot.com/bug?extid=a1d25e53cd4a10f7f2d3
<7> 16      Yes   WARNING in get_probe_ref
                  https://syzkaller.appspot.com/bug?extid=8672dcb9d10011c0a160
<8> 9       Yes   INFO: task hung in blk_trace_remove (2)
                  https://syzkaller.appspot.com/bug?extid=2373f6be3e6de4f92562

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
