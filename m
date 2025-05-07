Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ADE2066DE
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599046; cv=none; b=Dlbabn6dUv5tFGGhAQJkKBypBtP448skW4XuS32++ZswhpATSHT5a2B3G+5TFx1JJj/EaIhRAzw8vxQOErHM3L1O2So44bz9EVZGsD91ingjJ8sHSJEhsADMsphP3QGUMIrovz9QZaxx2d1F85vhNxHeykjDjHBzwAlY9CRR3DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599046; c=relaxed/simple;
	bh=oyCvuky+r2xL2kZIKlFkpcswpMFHOx7p3u7WFmeqaSc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=W+mcKSyoQibriEwG1NFWbMsdDY0H+EetTcq9JGCPut5qg9JFu+Un8mbvC2+nwwxXweG1+aXiX37AuYtXXaNKJzcVOtGCCXOSUZGrf9uaimjbl+mTdVAi71L+yDyQNwzGaikDwlJSIeYeFJeHt+iyF1PgeRr+STuUqckRhad+Chw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3da73725047so13133665ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 23:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746599043; x=1747203843;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NK8qPEVq+SJ+nE0zdTDhD44WlF3kwPX01l2uHDuGNo0=;
        b=V1rS/obfjBP2+TdJ789dmzdaN3xgzbD4M8OMuHlzEpTqAiBmADeWMCTl4Ujm00njHP
         XeRG5je+u5DDMkR5mAzpHrj4fNahM3g9o/dmHZbmVwYIjJIzIFZoo6QqJUlInb0kX5dI
         XwO8hsTsdud9lq5mlfDXiJzgbGbynrDhsr0wHC3Uo9JjawTulu1xt+sKuc9ycjPmLk4s
         t7GnWjjd5+e8nDhXoffWsxIqd5bv0CcoPU4EYUeEbuEt98/Sa6vWFZNJuWx82NZ3hLvo
         AXNi8zRhnw87s4CXmY1vJbotM0B8/GnlYlJ8n+fSz9CNcRQEkFQkXiyYdcVd/wJWqtGd
         M2nQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4iZqr3/QLmeQ7wtPZPr8QW/TfiIMD4SukkSlEvjet2c7zERjCW1zckgo8utDYFtUfOiQpEll9KBPf47k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmQ5OVsS1xXsoNUHgiuaI/+kiQVOiop4nz47OtOWLnjOwneob5
	Ed4ve5L4j2ytavJnRvlzoHDrOxsfHZAh3v/9G5h6vfHXjObpd63PhvKXmEN3LNdKFa+0L41ODQ4
	Eyn2S91/TabHfvD2CB9eENddkCH6U5+HXs/8o9eu0+Gou/W2jMa551aA=
X-Google-Smtp-Source: AGHT+IHuekFkINO8Sw22v5F4QPngFodJ6vgySU2PvJn4kkhYIIBqgIMCBOq04p5ZqanyP8fy7KL+6sCXA9nnM7i3rVvB2BFRC7u8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b2f:b0:3d6:cbc5:a102 with SMTP id
 e9e14a558f8ab-3da7390d6ebmr17940035ab.13.1746599043619; Tue, 06 May 2025
 23:24:03 -0700 (PDT)
Date: Tue, 06 May 2025 23:24:03 -0700
In-Reply-To: <f935da4d-3cb5-4cfd-a01b-c0abafb824ad@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681afc83.050a0220.37980e.03fe.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] [usb?] general protection fault in lookup_or_create_module_kobject
From: syzbot <syzbot+7fb8a372e1f6add936dd@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+7fb8a372e1f6add936dd@syzkaller.appspotmail.com
Tested-by: syzbot+7fb8a372e1f6add936dd@syzkaller.appspotmail.com

Tested on:

commit:         0d8d44db Merge tag 'for-6.15-rc5-tag' of git://git.ker..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=144638f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=91c351a0f6229e67
dashboard link: https://syzkaller.appspot.com/bug?extid=7fb8a372e1f6add936dd
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1638a8f4580000

Note: testing is done by a robot and is best-effort only.
