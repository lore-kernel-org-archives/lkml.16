Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988B51F4C96
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750664010; cv=none; b=ltmt9202yVrceX2jIcBXHQ+yqKTATlUWsSOnTSs3g9agz2MHpMZ3Z1Bw2QZbXsWND9flRjJfL8ikoMrqZk4cMznknSyDG59lxqZYlGqgBbdQihjpTuxeC8R63hSdKz2YI+06G5j+8p/sRY0cfaPxQHFRIOjhJLF6PWAQKVAVHPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750664010; c=relaxed/simple;
	bh=C182m/rz1UPG0iEbuQXqOKb8RATmTTbJJWsx8hEEoYE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=OGmEKD2ZbO6VkUJ0lcbHcThYMNn0NImOi9EfpXsQjKQBGDgp4eHYmCpoE3uapYyCDqyZF9E7fvxPoG1TY/tV3jMpsPxHr1ibD/8gAgK9UOFx6deYHxKXpg5z2qiK70PNzya60/vI5DqbWVKh9pkQgLoGH8jsrZtVq+EjbjORfSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddcfea00afso53704055ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664008; x=1751268808;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MkMtL8g74a4Ffmhl6B5oXdv1PjxK6Sl/F2gvamq9vEg=;
        b=ZA72ffMh6CCRe1Zn29U2NboiQ0GTInqBPQPWWajBiEWM5ma4aBhdmNUN6TdWxvZw1P
         4rbDVCVNB56v+pGxLKdhpkwmoTG45JT8VqIKYNlrBZMrZLuwDPp8Dm6jEQVt4hEaqUAI
         XiLb9CfWSTe9pYF68YRro5utv/aMiVXhYDXtzwZJcZykMMekedvLgDQFCkWja08J88fn
         cuj4B3/T381voRayZLaVCNr06IQx1DiuanGO7uamCsxTtK4whlMA35rWMFLO4BwtdsdD
         YX1gq/iimMaSYhIQUIj3j/xUNboRz6khe3I8/tb/o9uN+eBgMPHJ6WllSn++0GXih3XS
         PKTA==
X-Forwarded-Encrypted: i=1; AJvYcCVqa3PfSXeZvBz9tt7q/khmtVuUzRdpiVwTMr7LtKDAlfkijjBoXvQaBgdjObXKNgK7HhdKprGcd4H9z5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxokiKVUYZaEIjxd4wvq+KvReucCcc9eqD2srl8mqycba5FJfnr
	I6NKMH6JlzzTTbtWcHaHGPm/Zb+wat+LvYGhCoziZcoZK3Mk6xGaRhvTw82C/t+LwIaZF6+NPk8
	DOhQSi3q1DkDKQ9r27+d7SVVWVT4LypRTvIkGKVUcqHyp68xbAT0BQVyUMFE=
X-Google-Smtp-Source: AGHT+IGipjIMu2zGQY/dXl184ZjlYL/NTmVFjjQurXDO4+Cjbp8YEaSAClEOfMM09VkC4i7+TBYhCnS6kVgWJ0Ry7yqtXpOuaA72
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:228e:b0:3dd:b5fd:aafd with SMTP id
 e9e14a558f8ab-3de38c1d5b1mr143371705ab.2.1750664007722; Mon, 23 Jun 2025
 00:33:27 -0700 (PDT)
Date: Mon, 23 Jun 2025 00:33:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68590347.a00a0220.2e5631.0013.GAE@google.com>
Subject: [syzbot] Monthly kernfs report (Jun 2025)
From: syzbot <syzbot+list5b38c06be0691d28aa6c@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello kernfs maintainers/developers,

This is a 31-day syzbot report for the kernfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/kernfs

During the period, 3 new issues were detected and 0 were fixed.
In total, 22 issues are still open and 23 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  406     Yes   WARNING in kernfs_remove_by_name_ns (3)
                   https://syzkaller.appspot.com/bug?extid=93cbdd0ab421adc5275d
<2>  383     Yes   WARNING in kernfs_get (5)
                   https://syzkaller.appspot.com/bug?extid=2f44671e54488d20f0e6
<3>  347     No    possible deadlock in lookup_slow (3)
                   https://syzkaller.appspot.com/bug?extid=65459fd3b61877d717a3
<4>  108     Yes   INFO: task hung in kernfs_dop_revalidate (4)
                   https://syzkaller.appspot.com/bug?extid=da20d108162166514db6
<5>  66      Yes   INFO: task hung in kernfs_add_one
                   https://syzkaller.appspot.com/bug?extid=e4804edf2708e8b7d2a5
<6>  47      Yes   possible deadlock in kernfs_iop_getattr
                   https://syzkaller.appspot.com/bug?extid=4bb2305559463e8f6a2a
<7>  29      Yes   WARNING in kernfs_new_node (3)
                   https://syzkaller.appspot.com/bug?extid=306212936b13e520679d
<8>  26      No    possible deadlock in kernfs_fop_readdir
                   https://syzkaller.appspot.com/bug?extid=8fd10d8928ed1f715290
<9>  26      Yes   possible deadlock in walk_component (4)
                   https://syzkaller.appspot.com/bug?extid=b4567a8b2d2ad5f9dd06
<10> 22      Yes   INFO: task hung in kernfs_remove_by_name_ns (2)
                   https://syzkaller.appspot.com/bug?extid=6d5664213a6db9a5a72c

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
