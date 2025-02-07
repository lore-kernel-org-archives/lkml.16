Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FA947F4A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 04:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738903386; cv=none; b=MsjTYHlXyrd86Wg/X1BZvI+g/xl7628QGQDIEeCSsibWzReIMLiiAzSGgY+BQx3aYXK1JbvLV2d8kT1FBYXoPRkNJGL51fyYGHzsf69zlBORloLgEZ/j7/6YaUBXOpUKqNASL50chY82i1v9qP9W/KWpE5e+XMa6ZC8lq3NpS5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738903386; c=relaxed/simple;
	bh=l28bo4mDwzw88FFGvVIJ4yL27O0KXcV9kHOMit/seQ0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bTwzFXeFNnU2MqgLYV8t21fvQlSPvcvtB411eOpj0V9Fd35kd/4/1LXejH/k67kBhNiqTliC5r0vv0Xq5x4qfCfMB/9SVDCgWrg8f7iDVNiWNJ+z6sGb0k6Ln8x4r+FxHnQKxnemzdQmJqAZo/nE+gMz5CHAhRO8Poz0LkGYorE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d13d1f8420so3957005ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 20:43:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738903384; x=1739508184;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IYnmXfF+wliVnYwSsy3DeSlG0ELSSnfxMMMvRycYlvs=;
        b=sg3tACwo+fHFnTrxGeFrDQB73krins9oXaKOai8+54taSd0SGS9FmYHzdxoX0eYDzt
         MO0o2/w0Wvadz9BgvFGuoN53IoCUhet1zaqxc9ND2nAq29mNSF3yK9dHA3U6M2ERTRA2
         0H61zjFP0t1bkV9S+WUyXG6zg03DDQdYL+Hxv1UFcRlPUKq2Wvz1I/sQ0p8Vnm0xF8HA
         KEobGFCnxeTe1lS9PIST1VV+Hngpi4ZMD49PokOTjlsN4AWB7fBPm0EbbzU4K6GhF6Hj
         nhKDEmCYpAVuqfuVQ9pj0PUhumgF56ZYBBjwg27+eQBHhexlmM3kgHpf3RQ0kp7Be5CH
         b35g==
X-Gm-Message-State: AOJu0YyL2K0lZtPgUqJOAFw+hjEmH8hsvVU1nlYecNDPu0rdUGKhhb6C
	rotYJPdkDxEXlmEP46ErDRz+f3WO7auGm7H/Fk6hzJiEFgRi4S5uWZGlUFE7q6ff90uwDaCzFON
	lDl+haW58LrrSQQKyL9Cly5sUtxLjc24ezX974jxw86sQ+now0hfmCUc=
X-Google-Smtp-Source: AGHT+IGC+TurZO28Qz53UDMZRs4+0VwADErdzt/KtBWRxsdZd7qlAOvdOSp+cFcSY3K69zdHCs8ezaV5xzNWeyGyh0A6SNvD8J3B
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20c4:b0:3cf:c8ec:d390 with SMTP id
 e9e14a558f8ab-3d13dcdea07mr17478615ab.4.1738903384363; Thu, 06 Feb 2025
 20:43:04 -0800 (PST)
Date: Thu, 06 Feb 2025 20:43:04 -0800
In-Reply-To: <20250207040929.2197410-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a58f58.050a0220.2b1e6.000f.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] BUG: corrupted list in hci_chan_del (2)
From: syzbot <syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com
Tested-by: syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com

Tested on:

commit:         808eb958 Add linux-next specific files for 20250206
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1757edf8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=88b25e5d30d576e4
dashboard link: https://syzkaller.appspot.com/bug?extid=10bd8fe6741eedd2be2e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15b564a4580000

Note: testing is done by a robot and is best-effort only.
