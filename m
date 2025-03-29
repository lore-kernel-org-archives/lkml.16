Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967AF8821
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 02:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743213739; cv=none; b=QjkcAcF5Nd06I99zaPX69W/BAq0tVFW7vAwybZy1+L07FIU05YNY1Pythp3JFLu3ZePbY2RaI+3BhTFW+2ULWel1M/z1kulsZ61y4D15iAOz22pMt8TF4aMaWZEqnq8L1cJfCiEYINoljrGjZuZ24J4xA5/8Bq2vs9IhKan5b20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743213739; c=relaxed/simple;
	bh=Qx0FzgTCX3aQ2PIcYG2ILsq37rf8Qh6B4wBb1R0balU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=JDl0oetw7LwNVhQGd3GoeuPchZMyXW1D5rKIJX73TmUUxjf6LhLolI4nA18XSnfrWjDixi/ACcTOYlUJuu3zZRzPizppdsAGxbG431N5TbO5ln/y+8JBzaYSwalx5/ETC1Ype3bo0kElceEoDjwOGBSYDjkAgGLiIYzTLDgkAHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d44a3882a0so25919105ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 19:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743213736; x=1743818536;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FguXTsE+8XhGP7o0QFnNh0+TKzAKTaLyzGQZThRy3NM=;
        b=JE5O5lfX7dupJX76H39yY8nt5OSOL0y5n25AeYcecadllqhr18jedmDOeyJ5xbShaP
         hK289nsTij98rwz1AhSUwMkpFaqo1QmS41pCmRGy9KENd26KL9VKLPHdHKDKHHruzxhD
         e7FCSGps7DUxQQ8Lwss1eRXIBs6tUoAGO8cPvGa9iZe6Jh7E+cRfR7X3EZ1AB6UG4wEq
         OJCpaLOS0X3A6Gmt0pReBxVDRQi+6Rkb2QQa26pmZdXQ2PSstOSW6i8YsioAm1AkQ925
         Rbemncuz+goyJI7cZwLn59zvu5M9w/cWYaKHczmyIeafYyeqiEpxyBg04hbw7LMd6V6o
         rtMg==
X-Forwarded-Encrypted: i=1; AJvYcCU1fKK6HAOnLLhPkKMd1nF5hO1xFVFPoe/O7Ter7V325HC9tJ/Vxq3QuSbBRNwVr6ylEhuRW6Bi5Vm5ZMo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn1ttwhWfEySQoiDNpQGfH5hEqi4957VP08CVK9euWBjMI28Sv
	/15pMbgRp1QL14v12PM78nSZSq1TbI7cG5imfdQ5lqF9eLeSMOe0TrdiFP8sZiEccYH1JC/5VrE
	vfMRTtdPmFLOzRBLYoh3Ruq8vRoqfDgQywUgoTx/BZp/mECkKUmnh/lc=
X-Google-Smtp-Source: AGHT+IGYPTYrXVhdHfZfT3ymkJ40LOxZViBHlIvGGCGh2BLckLTaIJTEI7fCi/XX1HgFnN2Py5yzsoziyrwM5gkeLXEXzIPb7M02
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4401:20b0:3d3:d344:2a1a with SMTP id
 e9e14a558f8ab-3d5e07c4822mr13365705ab.0.1743213736542; Fri, 28 Mar 2025
 19:02:16 -0700 (PDT)
Date: Fri, 28 Mar 2025 19:02:16 -0700
In-Reply-To: <Z-dUlymffoNwgHdb@fedora>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e754a8.050a0220.1547ec.0005.GAE@google.com>
Subject: Re: [syzbot] [block?] possible deadlock in elv_iosched_store
From: syzbot <syzbot+4c7e0f9b94ad65811efb@syzkaller.appspotmail.com>
To: ming.lei@redhat.com
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ming.lei@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> On Fri, Mar 28, 2025 at 07:37:25AM -0700, syzbot wrote:
>> Hello,
>> 
>> syzbot found the following issue on:
>> 
>> HEAD commit:    1a9239bb4253 Merge tag 'net-next-6.15' of git://git.kernel..
>> git tree:       upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1384b43f980000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=c7163a109ac459a8
>> dashboard link: https://syzkaller.appspot.com/bug?extid=4c7e0f9b94ad65811efb
>> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=178cfa4c580000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11a8ca4c580000
>> 
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/fc7dc9f0d9a7/disk-1a9239bb.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/f555a3ae03d3/vmlinux-1a9239bb.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/55f6ea74eaf2/bzImage-1a9239bb.xz
>> 
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+4c7e0f9b94ad65811efb@syzkaller.appspotmail.com
>> 
>
> ...
>
>> 
>> ---
>> This report is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzkaller@googlegroups.com.
>> 
>> syzbot will keep track of this issue. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>> 
>> If the report is already addressed, let syzbot know by replying with:
>> #syz fix: exact-commit-title
>> 
>> If you want syzbot to run the reproducer, reply with:
>> #syz test: git://repo/address.git branch-or-commit-hash
>> If you attach or paste a git patch, syzbot will apply it before testing.
>> 
>> If you want to overwrite report's subsystems, reply with:
>> #syz set subsystems: new-subsystem
>> (See the list of subsystem names on the web dashboard)
>> 
>> If the report is a duplicate of another one, reply with:
>> #syz dup: exact-subject-of-another-report
>
> #syz dup: [syzbot] [block?] possible deadlock in elv_iosched_store

Can't dup bug to itself.

>
> -- 
> Ming
>
