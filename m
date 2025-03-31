Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6713C211283
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743426503; cv=none; b=m81qZSbXS1KGoboXvQUGyXPdD46Mcd0kYXhMr7gAxsq/8B1Cqoxaj92xhVd8cBxF/D4fO8n+WoVh5Ocztg1CkJMXBl/IWNeFvxZVXQgdKaXP/z7fpmlaRa+eweUQlE32EaX7bh4BQ3UvZ1TSna50pvv34r5kHSidDM0WdUGDvdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743426503; c=relaxed/simple;
	bh=rQOhOxCeXpud3m5iVUI722VfHj3ccanf8lV7ulNXxHQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=H+HfBijNHE160nMP1HSd5a7tCNAfLd0YPqe6w+SLepzz5TxXpbtrSqDxc9bkL+mJTU9XuO53kgiRVdbPdWyYTM55xLBroIeJnbtKwX8O/MNmUMBCul3SiTJUCngJ2rc5qKTt4yMEX0iDaFxeaxxpQNvwlTyo4ea4YFNwwaNSDMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d5b3819ff9so39147365ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743426501; x=1744031301;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zbm7YxpkiWUEYakqF/l2hEzPdOv29cwCLbKsQd8Pxlc=;
        b=BBrraITJE0zzLRLwwcLQFaM+M7e/hFnaHxgNj1JKTYeJvLfVQ3PC+6p5MhmfaDD4VB
         ewq7K095tEQKKaSkoGrK5A2SEzy5Ni+DUgJstBjTNNVccEzfLrocydufG6KygHEFKxvg
         j14BPzlTD9m3LZliz7BDNSqraMc0QFCPGlHxBY2myK8By5GgeklURwT2OafK3mu9O7z5
         OBDtVaeg4n9auW5QrZw1h4MZdkQPv/4PELDxToxBQFnJE+kcd867q2S/spCSXrMp/RMJ
         V3pkAcEjl/TyaRpvxodiU2ThBCAJKWJ0Ps3MEywiHegaN0uN26BdX6gwf9fjG4HaJf0z
         I82w==
X-Forwarded-Encrypted: i=1; AJvYcCXC5AMOAYB8rAXbUiatVYZE6p6rcNOimooHG/rWF8bs12Xhshf/47Gm6i8GwD8SLoPkTFd7xEXDEqignFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ+VCyWiNNC0kf8TJ/1j1z06h3upDbAScAd8BWkA8e17Ajmdct
	+OwAbOjUbVImkV4C8JD3KPs39wNMYoIA/oceoFX+d03A0M044s3KrzIkHZBZKXYPGfjkxsqbUki
	WLSLysryiFfC/3pM978hV/imPjIeq90MGPRpzWef6ETh5Bxipg5RRcHo=
X-Google-Smtp-Source: AGHT+IE6ZyQphv/9VcMGurb/ClAhzOMXBXjCpRW/LTu7Xme2g0kHWZ7CMOIu3sFP2LtcaRePEYPC2jlS1Ehx78SGZYD2RxUxGvK2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1989:b0:3d0:bd5:b863 with SMTP id
 e9e14a558f8ab-3d5e0a004bbmr79287575ab.20.1743426501461; Mon, 31 Mar 2025
 06:08:21 -0700 (PDT)
Date: Mon, 31 Mar 2025 06:08:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ea93c5.050a0220.1547ec.0143.GAE@google.com>
Subject: [syzbot] Monthly ocfs2 report (Mar 2025)
From: syzbot <syzbot+list9c9e80ed7b87cb3956a3@syzkaller.appspotmail.com>
To: jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	linux-kernel@vger.kernel.org, mark@fasheh.com, ocfs2-devel@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ocfs2 maintainers/developers,

This is a 31-day syzbot report for the ocfs2 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ocfs2

During the period, 4 new issues were detected and 0 were fixed.
In total, 73 issues are still open and 15 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  146425  Yes   possible deadlock in ocfs2_try_remove_refcount_tree
                   https://syzkaller.appspot.com/bug?extid=1fed2de07d8e11a3ec1b
<2>  42712   Yes   possible deadlock in dqget
                   https://syzkaller.appspot.com/bug?extid=6e493c165d26d6fcbf72
<3>  32565   Yes   possible deadlock in ocfs2_acquire_dquot
                   https://syzkaller.appspot.com/bug?extid=51244a05705883616c95
<4>  15089   Yes   possible deadlock in ocfs2_reserve_suballoc_bits
                   https://syzkaller.appspot.com/bug?extid=5d516fba7bc3c966c9a9
<5>  10599   Yes   possible deadlock in ocfs2_reserve_local_alloc_bits
                   https://syzkaller.appspot.com/bug?extid=843fa26882088a9ee7e3
<6>  10568   Yes   possible deadlock in ocfs2_init_acl
                   https://syzkaller.appspot.com/bug?extid=4007ab5229e732466d9f
<7>  6346    Yes   possible deadlock in deactivate_super (2)
                   https://syzkaller.appspot.com/bug?extid=180dd013ba371eabc162
<8>  5249    Yes   possible deadlock in ocfs2_setattr
                   https://syzkaller.appspot.com/bug?extid=d78497256d53041ee229
<9>  2125    No    possible deadlock in ocfs2_xattr_set
                   https://syzkaller.appspot.com/bug?extid=ba9a789bd1f4d21fcefe
<10> 1957    No    possible deadlock in ocfs2_lock_global_qf
                   https://syzkaller.appspot.com/bug?extid=b53d753ae8fb473e2397

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
