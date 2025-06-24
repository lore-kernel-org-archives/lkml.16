Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85CC228CB0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750769; cv=none; b=ciCDcjuxQ3K+087I5jSUZZqR+rB9RwSs1geAAtqRIXHPB5HCQFzc/fqMuzX5C1WafQBVFVtTo1g/hGhmB+wMIf4ekWkL66og5xEaEaV849phAxBGFUdV3JtSn7y3Q353BIg3zqFrTzgITies+sjuSPEu1sZLkqkcwxF0WxY09BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750769; c=relaxed/simple;
	bh=a6oobmMbbLmXxDodUwUDAwLX8SKoHjCZKCLEg90QAvw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bpnnSOZh91I9h0oH+5DuQP5GqZIiJY+7rBP1l9/YKx7SxjQhS//cin+GPmhzcyX5aBduO5OLRRsYGokm+0UW5bUjZgYryVzhdiwDpA2QhBSv0NsAuM928R6GwwRW3hObIsQAeTW6p7Nh/4ADAh+O/mrXJstq2q29vSBzedUVSUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddd051e8e5so43882375ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750767; x=1751355567;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bNZSwviUAqdlVKcJU3jTW73z109ojP3I9ScGRGhRgNo=;
        b=kQYyE7gpFIEPNRjhIRVphIyVRprBIXjz0+rzHeg1qhfavDzDdr99sMrw6of0m/pzOj
         fv6bv873gKdoIxF9uVFPDm8b7JOf//0L+Ou+ROCS3RPH0SYRtduqLy3+UHIWCZ4tYzA7
         4qkyoDHcgnxLkFUdSMXD+RJBri0tsErQzlR0U58v11OAVMj2zuzuTurSxGufncZCZLNI
         4XDpO/LFyNu3EexMKnuW5M9qGlzznDpeqjHtpqW5cy/df/6ewZzT8srv7rzc8b2Hv8Wj
         pd+F1/rBeW0bvd2xpj8M+e/gKd7HcVvRxst9XIqsKGNPnSSaGLhDpCB6dDv/bWQAXRR5
         I1ew==
X-Forwarded-Encrypted: i=1; AJvYcCXeV5wLzymtUHsMsL9FL63dcqcfWatm+A+8IIYHCB/hjfKTAGQx9iVnUY5cOii35TeewSUI/5bClJ8F55s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3WENdit9wafSrZpjuahMebuk8KbGZcPqkecPJfY7obqEIR3vi
	v4NsFWa0RTv/Uz+1oz3O/Q7y/j4iCP57gBzBX4gWLfiHHHiggRXh0Eqwxj1T0z1GdDHROV7H8Y5
	ePaQKNDSrjklvdiraQfJF9A7/06KsjN93RcC6YolyuLVcHTE+1jNkysAbDck=
X-Google-Smtp-Source: AGHT+IFyInFWEBbVw2N5MQTm9By6qznwzejgcs6L/Llgsb+r+EW4WxRX5fTN/oHNarQoPm8zzEubK4fCCZJlqSsyt4DpyO8F3Dtj
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c02:b0:3df:2e87:7190 with SMTP id
 e9e14a558f8ab-3df2e87757dmr226155ab.20.1750750767042; Tue, 24 Jun 2025
 00:39:27 -0700 (PDT)
Date: Tue, 24 Jun 2025 00:39:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685a562f.a00a0220.2e5631.005e.GAE@google.com>
Subject: [syzbot] Monthly bcachefs report (Jun 2025)
From: syzbot <syzbot+listdc301befec0a5cb43b3e@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello bcachefs maintainers/developers,

This is a 31-day syzbot report for the bcachefs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/bcachefs

During the period, 15 new issues were detected and 8 were fixed.
In total, 102 issues are still open and 190 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  30829   Yes   INFO: task hung in bch2_copygc_stop
                   https://syzkaller.appspot.com/bug?extid=c6fd966ebbdea1e8ff08
<2>  7874    Yes   INFO: task hung in __closure_sync
                   https://syzkaller.appspot.com/bug?extid=7bf808f7fe4a6549f36e
<3>  3875    Yes   WARNING in bch2_trans_srcu_unlock
                   https://syzkaller.appspot.com/bug?extid=1e515cab343dbe5aa38a
<4>  1497    Yes   INFO: task hung in __bch2_fs_stop
                   https://syzkaller.appspot.com/bug?extid=6d3e28b33490b3085412
<5>  1236    Yes   INFO: task hung in bch2_journal_reclaim_thread (2)
                   https://syzkaller.appspot.com/bug?extid=820dc3b465c69f766a57
<6>  442     Yes   WARNING in bch2_trans_put
                   https://syzkaller.appspot.com/bug?extid=291aef749c5cbb9ca2fd
<7>  361     Yes   kernel panic: trans should be locked, unlocked by bch2_btree_update_start
                   https://syzkaller.appspot.com/bug?extid=d540192e763531d307ff
<8>  343     Yes   UBSAN: shift-out-of-bounds in __bch2_btree_node_hash_insert
                   https://syzkaller.appspot.com/bug?extid=029d1989099aa5ae3e89
<9>  326     Yes   WARNING in __bch2_truncate_folio
                   https://syzkaller.appspot.com/bug?extid=3d11e35eeafe176a6c5b
<10> 324     Yes   INFO: task hung in bch2_readahead
                   https://syzkaller.appspot.com/bug?extid=a6060114362257e9798a

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
