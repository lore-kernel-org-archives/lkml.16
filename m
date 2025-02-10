Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F751F3D20
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188029; cv=none; b=kJ7n0EQnJhy8BnRmswQLSeL8OUyxq4G46EzcW9rJPuOBUk9Z/tO+ObUErd2e0tZqRpFq4BWd93isitrWf/inBrgyxuBvNkAj4LzuOulY0eiIzbxmLcZ8MNSpb7J5UpmkG6OHA1npXLT4AAfcL6YAsYuDOBqbm1hJWQvDrG0Y+Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188029; c=relaxed/simple;
	bh=fDDNGm/SCzfV6XYo66DotUVoki6C2i/1naFSUGMQchk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OkYFY9VfMH3S3I6mkFmBZXL9k0uX0F8ItiLTFeRNio3Qh+/N9i7SAVGHrzzJJxbNh8L5NGB+vJy7Bp7E4aAC/b2J3uiCsuTB3NzBa+4dunBSFSshXz+xjt16LDNflCSd2hKD0kOPPI9iK/jkW99x98V3uljwsxhjcXHCTuYEQs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d16acfdddaso1409265ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 03:47:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739188026; x=1739792826;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6+hiG3HsJUBLiVW9LNRn3dMbwNWLww3HlPxeJDoxixQ=;
        b=Uzy/lPz4l8S7IAInxB9z3w7t6CJ8QBqJXH22LFn+c2LZEftzHOb08Vd4P/BkVQlLPX
         piVvkeQRWdxWwpLI6dnOlV7LD4hypK0pt0EPhgkS7bDhN+LU3OUi9dIl2p9vxij49diq
         FnhGkk0Iw2Qa0WM6wTZRwNsphtDldetfKK1uQS1zzeUujqFHVmAbJv6e8KWEzEstdoEv
         GrJd7T024wcKNIzausWD6WK5KdW5yXUtapevgua87RxOk0pGESTb5sXKZRt5UVQij1Mk
         zdoJX2YxZJDZU10bqg76kbSvl2U9N4wl10FnThD7V+yWAYIawF+NHK4MqwEP9uOcMNbh
         n8ng==
X-Forwarded-Encrypted: i=1; AJvYcCUp0QZfDAQgmyxEMGrj+tEZwFkvgd/XWZvgtWD1WHDbkFLfkiJlourlTSTElPlbzWxQ53EeKW1IOb4NYYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqxjyC+WQ7xbTU9afEwYHALCDiecilfLsRUL4hnaVknnXcsQGj
	EsnYOH3YtyABblECazucfSlW390yAP4nhS4gF+96vo0mMoUGG6Gh/KN8zSAWSAzNsyk41Ok3hiq
	H+FVzeQBxHFSvKcQWSk6I+F7elWjKZsZwe1z2G2HDS3OX51Z9sN1YopQ=
X-Google-Smtp-Source: AGHT+IF0QDxfQZSlF45gzdwxC2VNims7gDsFdtgLaMKwKj7/lS/Vqyj4snvMZGCzOZ7eGEgjy6iGWPVfAG0iHJhVKSwuItU2c6zw
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c0e:b0:3d0:28d3:e4ba with SMTP id
 e9e14a558f8ab-3d13dfa700amr125457465ab.18.1739188026701; Mon, 10 Feb 2025
 03:47:06 -0800 (PST)
Date: Mon, 10 Feb 2025 03:47:06 -0800
In-Reply-To: <20250210110322.2157-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a9e73a.050a0220.3d72c.0051.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] general protection fault in h5_recv
From: syzbot <syzbot+b5691bb559396b262064@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b5691bb559396b262064@syzkaller.appspotmail.com
Tested-by: syzbot+b5691bb559396b262064@syzkaller.appspotmail.com

Tested on:

commit:         df5d6180 Add linux-next specific files for 20250210
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=12b3c2a4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2cd616b6e736ca7
dashboard link: https://syzkaller.appspot.com/bug?extid=b5691bb559396b262064
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=117dc2a4580000

Note: testing is done by a robot and is best-effort only.
