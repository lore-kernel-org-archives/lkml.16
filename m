Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9511022E3F4
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 12:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759472; cv=none; b=R78exnuzEc0tJE0DL/57/iXm+TN1QN+RBDft3kw+KiCuVImdeRibCsROZpgu9xWikAVBnBUUPHmfMpQXprrdLl7M1Z8hnedJWvzmi52+H6HZ9Hf7TnE5i/PXR/tkwWEwiXzekvKy9GDZ5RvqjqbNyYe+Nmb12s65zcpUZoB4RgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759472; c=relaxed/simple;
	bh=E+Chp3s8bUKJbJTwjy0HsljKNa1akEZPbSJwFVSx0U4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=OUQ1rusLGqpj/EMMFGC8pKIxcxOWUSaEPm+g+n3iW2Zyy2xlojYBAOff0xCSn53Cc2DpFe9TH7qV+AWhyy1ryFoLowwXsDWhMDbqjcKTlIGTdBsfnFCDiTcYd1u3Azb4E1tAoNMgKW0Ct6aMflY6BELeUzSm3Us6IFWj5Nf8m+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d04f20f2baso15133195ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 04:44:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759469; x=1739364269;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ge22AivEZoY/4Tv/E+lBQ1CqAf41hkW39t6YWMYZZRk=;
        b=RNV8BIW0ACyDdvzQYHz9R2gFfWUqxsrp73RIcY5YBpTL4ifEbPanHovdat3YuKQNQk
         1op2/80ibaAWeIqfZt55htpURq6MXwUMaNFmOQDM6mWjNdF2cnN0LGtXRxQte8dDocYA
         a09easpBEe3W543M9rL4rr5FJqMeSkE0546unS/TS7CmnlbPvemhu6/iOEDfCJ0ibRRn
         bS1u+qEZAtvK/ec0hU7D/VHGpaAtcgkGxatDCixwfcDQNFJ90HRZ6e8k3nJ1FgdNrsTp
         MUp5eX9plXGBDyzLCuleiXrbawGZIwsPb9ZgrvZepOxsyOIFXOd/bT2R7q5OWlicLWXT
         v+nw==
X-Gm-Message-State: AOJu0YxrK2jPlg1NMcRFfQIceTR7wIy+i+LJxsojKTAj/nY1Vn3WLZPI
	ki8cvJ9ZSOJ2MGmKscxeJGwc4TgcBOcVBiGkOwY/jX2M1XYBE+HGuLtH9k9/ZneaEU4CzVAAlNk
	ZbdsDxi7XwMI4pcII5NW+dOZaCdWJUO8syfCmuuJSjo53ixPr4YUuouY=
X-Google-Smtp-Source: AGHT+IEpRMR4/QWV3lJbVI70WEuPYeZmtAsmp7udihbvd3N1hnfw2jaJ5AE9gCojOSkyOYWw4yvLtYr1nPYogFm6xoFJIHtIvvJ+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1b0c:b0:3cf:c8bf:3b8a with SMTP id
 e9e14a558f8ab-3d04f419163mr27575035ab.7.1738759469649; Wed, 05 Feb 2025
 04:44:29 -0800 (PST)
Date: Wed, 05 Feb 2025 04:44:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a35d2d.050a0220.50516.0054.GAE@google.com>
Subject: [syzbot] Monthly net report (Feb 2025)
From: syzbot <syzbot+list0b88770b4dd3d4e4c89e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello net maintainers/developers,

This is a 31-day syzbot report for the net subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/net

During the period, 10 new issues were detected and 7 were fixed.
In total, 138 issues are still open and 1579 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  257940  Yes   possible deadlock in team_del_slave (3)
                   https://syzkaller.appspot.com/bug?extid=705c61d60b091ef42c04
<2>  46041   Yes   unregister_netdevice: waiting for DEV to become free (8)
                   https://syzkaller.appspot.com/bug?extid=881d65229ca4f9ae8c84
<3>  20019   Yes   possible deadlock in smc_switch_to_fallback (2)
                   https://syzkaller.appspot.com/bug?extid=bef85a6996d1737c1a2f
<4>  10645   Yes   possible deadlock in do_ip_setsockopt (4)
                   https://syzkaller.appspot.com/bug?extid=e4c27043b9315839452d
<5>  7383    Yes   WARNING: suspicious RCU usage in dev_deactivate_queue
                   https://syzkaller.appspot.com/bug?extid=ca9ad1d31885c81155b6
<6>  6432    Yes   KMSAN: uninit-value in eth_type_trans (2)
                   https://syzkaller.appspot.com/bug?extid=0901d0cc75c3d716a3a3
<7>  6150    Yes   WARNING in inet_sock_destruct (4)
                   https://syzkaller.appspot.com/bug?extid=de6565462ab540f50e47
<8>  4524    Yes   KASAN: slab-use-after-free Read in __ethtool_get_link_ksettings
                   https://syzkaller.appspot.com/bug?extid=5fe14f2ff4ccbace9a26
<9>  3096    Yes   INFO: task hung in linkwatch_event (4)
                   https://syzkaller.appspot.com/bug?extid=2ba2d70f288cf61174e4
<10> 2826    Yes   possible deadlock in sockopt_lock_sock
                   https://syzkaller.appspot.com/bug?extid=819a360379cf16b5f0d3

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
