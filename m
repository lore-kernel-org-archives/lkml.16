Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BB218A95A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 05:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745557984; cv=none; b=nS1B+miR2l/kQQk/pWFUWMAISLf05FyLxb/qYWPdRKkmXTGSIkcmwX6fLUGvkllfr/Q2gJZCV2ZuQtb75l420GUIMIqKKeT3456LJDVXmzwmNv55c4QiROXjvkKo/8NFobnyXx/e5+HaDT7Pxd1M1EOGH0m48eeL0nxC67JdApY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745557984; c=relaxed/simple;
	bh=69OzJkGJKWsVc1y0YHrHuquz1jLsKI0xb+VB2681OpE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fufygzsvFl8oYpBOE1dQc39n2aayMjH6GmXj4QeONTBNyf0e7byyT095rDkkNOjaIEIbwkmoGEzjDUF18p6/hkbDfpvXsFFWVpCx/Jh13Ka3x7j+F7Byex4Z2YhujDLiEu/LabLchOQxWqlgJMqAkP1cHQ4J3Loe8SYKXyuL7T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b4ee2e69bso219490339f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 22:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745557982; x=1746162782;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZixRZVyAJDTAFf81ZSnZJf+/3+hHUuaO5bOP99tWZdA=;
        b=tN9U6eZpVsRp/IkMpx/0wXPgiXKqUICXKJaiA/R4OMlIRjVQWasovQVowT6yrAT4IV
         D84pYpHl49HjmufOXAitGDh4XKl1MP9mQSp0DNJkZ3ed5RobtWR63Rbi5R9kbsnqya9V
         Y6NXkA1hV85vrRPLwxHY871uzCNvSun4SQVS2Y3K1ZuNeU9pqaepbwO1W9vQUikle/O9
         P5gt8PUsdeVUlS2FeeG2EuU2lpdshYlBZLOSGKPz7fGQiz3YVQhXPfOo3+T3J15UVqKs
         rs7mt3gupIZVF9uD5wkyFkIjPxNPnjZ5/Jy18tHVBxHOxWQjcZrH9MKZIXubWNDvdi3C
         sYPg==
X-Gm-Message-State: AOJu0YyXAO+J4ApiuzCfnWleLgg355KveN7F+U0g4JDaqF2BjrGafQEl
	KdBht32pzLcxo2WGvB7GckxvSoL3NXzGLwiIzqj3E3qUxLrEGnsUhYCExfKJlMxMgLZObGoYyvC
	i4k+5Wrn7AfZinzK+1dG02zn8ALd1kj7FaoWe0qwfibQyhcqwwRp0wd8=
X-Google-Smtp-Source: AGHT+IEJbXZOSutHFZxrrbyp+GPDqeHb2iB+ZzfIF8BWYmgQataAuUjnKpCz3LnTS2YGZX1Q7nwneryfA20dXwOwt7/WxRtdFft3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:608b:b0:85b:4ad2:16ef with SMTP id
 ca18e2360f4ac-8645cd5b2c8mr111462239f.9.1745557982250; Thu, 24 Apr 2025
 22:13:02 -0700 (PDT)
Date: Thu, 24 Apr 2025 22:13:02 -0700
In-Reply-To: <20250425045419.3440264-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680b19de.050a0220.2c0118.0c74.GAE@google.com>
Subject: Re: [syzbot] [block?] BUG: unable to handle kernel NULL pointer
 dereference in lo_rw_aio
From: syzbot <syzbot+6af973a3b8dfd2faefdc@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6af973a3b8dfd2faefdc@syzkaller.appspotmail.com
Tested-by: syzbot+6af973a3b8dfd2faefdc@syzkaller.appspotmail.com

Tested on:

commit:         02ddfb98 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15b3fd9b980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=efa83f9a6dd67d67
dashboard link: https://syzkaller.appspot.com/bug?extid=6af973a3b8dfd2faefdc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13467fcf980000

Note: testing is done by a robot and is best-effort only.
