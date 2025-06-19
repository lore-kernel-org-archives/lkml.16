Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B74030E820
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356665; cv=none; b=jEmtW3qe9jwfcQ2zbjh0KTiJ9FbKzIiig71UCIQLr+x1lgM2jdpbySHNcLvbWMamN5VY8vfe9W3KeKHrSeISnTbo2e2/94TcPdrvCgKwslvMKxs9naepd5kFG//Xooj6I9bmPnZ4XpjwtUpep8LhfPQi+yrFCPBI4m2Lk441pLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356665; c=relaxed/simple;
	bh=keMVWl3tlYdykGYVcqReAyMwGJJijPC2GIjPDK1YdeU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=m/CZvjXmOwux4/fWNgYWep/CnQ7doFgr4/8u0a4+gMoe/mPhKSlCta7BRy4aaqoE8af9scQ9TWCxyPUSxxA4yScTDYRPH+zhIJyLl70hEyU204nAuXXiMsX4qdHb55kVvGyhzKSYHZc5LuWakBYgGIfC0DsjAJhnFoDnfkaVRDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86f4e2434b6so86772339f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750356663; x=1750961463;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NR3mvQFhXoFMaL/CivSgE+Y2oira8fbZ2+vTXnKv1fU=;
        b=qA3pH8nSqGM5TjJ+JWFbQvBIocp3xUhfAYTDGYPTe8eTMs8/KqNqRiYDmQ8NK/9KDE
         hcdqnEBx4VVZ/zAS2I/ogqczBZRya0IzsJe2g2MqtN9sgphoNhoHpJpLsnSAxdId1GA+
         RZpEAhI3eNzUTDJ/31ko4U0hCgDqiXpyjsYsd98TiAXaDOrfrUboS+7F27x6tR/0JBIe
         qKeKj/OTiKQyIUddMUoLq3xVe+xhRGpsNXgu1pIPeorG0fMq7vUKS75Xdqal3VUhK4tF
         xEsHRiJcMCXRM7ZY0PeRBSbhJU6yjOebaqPsQNe3izYlkX/Drg43rKb8zkcyODdlql1J
         530Q==
X-Forwarded-Encrypted: i=1; AJvYcCWATKFEzmZ+8NLtNDty/1oVyM3O2to8n/VeOLJJWznhSNez+pDgnbIHgFOMuVPFh5FkTTbToL74by8EFds=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFNsH7UuAgbhoX4m9j/r/tV/TZ+CT/TioX23Jxq8vf6hYOVhxn
	J4Hnjht1LKe0crm900e10fuYnGDElUDvITBz5s0XUc45FU3yxE7Hgm7mpZaAh1Tx/F/8shYoy/e
	7Ukz1aB5WIRwn5gBKsgIblKiHfa2kdudNHFLtzQnNv1hjbsriK5g/qkCv0dc=
X-Google-Smtp-Source: AGHT+IHKsN+5EOrcnJLw0wAyYzOh5MMo46S+ZrIXZQ79V0uX7SSwP7HQzJmo3TVRbL/P+6pGCJMRhqoVVZHp//GHmyh8liW3XoRR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca0e:0:b0:3dd:d6d5:2d03 with SMTP id
 e9e14a558f8ab-3de07d50c0bmr219466345ab.11.1750356663317; Thu, 19 Jun 2025
 11:11:03 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:11:03 -0700
In-Reply-To: <67b2eaf7.050a0220.173698.001f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685452b7.a00a0220.137b3.0014.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] kernel BUG in bch2_reconstruct_snapshots
From: syzbot <syzbot+b4cb4a6988aced0cec4b@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 757601ef853359fe2d57d75c00b5045f62efc608
Author: Kent Overstreet <kent.overstreet@linux.dev>
Date:   Sun Jun 8 15:40:00 2025 +0000

    bcachefs: Don't put rhashtable on stack

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13b01d0c580000
start commit:   128c8f96eb86 Merge tag 'drm-fixes-2025-02-14' of https://g..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=e55cabe422b4fcaf
dashboard link: https://syzkaller.appspot.com/bug?extid=b4cb4a6988aced0cec4b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16d5d9b0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=112099a4580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: bcachefs: Don't put rhashtable on stack

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
