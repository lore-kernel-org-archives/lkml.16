Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68FB17BD3
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 01:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750470604; cv=none; b=HwI88ZmyKJnvjU1v8HvFysXIDuGMLeOrcR8/uSZ3f8bs/lRdMdaHRwbKh/rrajzT0uMbsz4XTWcXUZO+hVMXtLzwgeBvugVVxC5+bXB18Fg6AU11Zz843CddfOU+zVtSKLrNHCqQWzPmZ5xU7NhjuyJ41b12N4mAo7cht5eAICI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750470604; c=relaxed/simple;
	bh=/sxYexQ+58dkjFennMReNmcOGzMTMGYGFx6L+JikHA8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hZBgw6PlA6GKQz6oso/qj/LgJVsDh4+x0mAng5dUmiSaw1iIcZUulLcgpmcyFaSUcnD26keqHMQm1DPD1jWwN7jxzJSfso8oP9aAHAeFF/G2bGGNi+D9Nf866Otu/gm37jJ00WHLXDThdNR41angBs9uvg9FoLCYPan7Zx8/d+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddcf82bb53so20805385ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750470602; x=1751075402;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRMMmdlDx1Nx9RYKLwiUmguyu2r/kk1t9Vx+YhjJB+M=;
        b=kLfGIglG/eFrANPOPCWXwc2kgkWw9urTu+X4MgGloFZB+blOkMcx9vIdHneQ6+u3Pu
         yfGKEVajyJ+SCt+ESroC20AD8xaUTl5a2BolnT7VbXpuToemt3AOCY7uKNuGHqKm3wN8
         t31mMbz8nW8lrzoLBootgsPeZaJuJTwoB5sQiTyaAhdEmsX7qdnpo4HzVOTE9Yrpmqrd
         T3Gq0vsIEQ8f6CLMstziaf3MfPbmy92eYTD8RZN4eAk/Cn8HiPJBF9hL+CpfclKdrxPa
         AJijQ+uR3H3rDaU9A5LVVZDHnbUrs55qu12+0Ppdynn/TXPTLHussLp50cwoIKJOiBo1
         WwsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+miwyIVuochaTwtlc7hDQ7Iqb6p4cZ9fJfO9KlBkGpJdK0RUMrNgf5X3osfBW5wRRcdsJYxYZHq90KXE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/+R33CdBnPD7+34hkAa97sDvhNkdDtzcNWprmy1JKe7h8aIC+
	n7vYHzeJGET/r2PCs5HyM2z2rroO5Z6Wj1ySxZobAUnHTYG12/35YvoDbGnDdRespEVYFp9yQs7
	n+PqnCvpMEZEk2gF3VLJbgHyJM7Tptyab/Jkx7odndAi619c1HEOrVPD7Ljc=
X-Google-Smtp-Source: AGHT+IExPTz/TzN6V5eviaV1lQBhH7Own0NZuZKCXjy5BaTddYMoA6CTovIN3EB34VgXECbEagv9d7pAY+IIwZ1r77ZGiUVH9TkR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1749:b0:3dc:90fc:282d with SMTP id
 e9e14a558f8ab-3de38cb1f1amr54420815ab.16.1750470601859; Fri, 20 Jun 2025
 18:50:01 -0700 (PDT)
Date: Fri, 20 Jun 2025 18:50:01 -0700
In-Reply-To: <675cb812.050a0220.37aaf.00b6.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68560fc9.a00a0220.137b3.005c.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] INFO: task hung in bch2_page_fault
From: syzbot <syzbot+32415e0466b02533303c@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 8b1f46bff38f075b8d4071e7ac1edecb441fd53c
Author: Kent Overstreet <kent.overstreet@linux.dev>
Date:   Sun Dec 29 00:57:04 2024 +0000

    bcachefs: Dropped superblock write is no longer a fatal error

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=140d530c580000
start commit:   9afe652958c3 Merge tag 'x86_urgent_for_6.16-rc3' of git://..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=160d530c580000
console output: https://syzkaller.appspot.com/x/log.txt?x=120d530c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6a237c32900fc479
dashboard link: https://syzkaller.appspot.com/bug?extid=32415e0466b02533303c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=130d790c580000

Reported-by: syzbot+32415e0466b02533303c@syzkaller.appspotmail.com
Fixes: 8b1f46bff38f ("bcachefs: Dropped superblock write is no longer a fatal error")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
