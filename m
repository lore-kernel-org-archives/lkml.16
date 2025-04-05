Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2651993BD
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 20:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743885424; cv=none; b=aTM3/N8QJFc5ytpFO0Nc1SIZKt72iD7iOXu1XGNI3+QqaEBfxGmmkLGJPOcHAravEWYkpiKdXpwnDfiE+PE3c7h8EHZ3ylZpXO84YHvoz0isMraC84VGarEsqJPKspFTHTELQjSu/f8C3MXbEOdUdvpGUBWHLyVKvmoczKPVPf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743885424; c=relaxed/simple;
	bh=zMlGhzgFbrY+JgytX4DSew8HdhGgXgAXG3V2s6Em6EM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WpE3X8l5aQL7qsbkkwek+SlFsptFPX4sRpjxqSxkONjxRSy+R6kh79J2ajTtqTxFvphllskDvzPcqJUpNTY8H/8CTp+yE5g+dfGzJpjll+jn6PNizpYJpgm9XeSMei2rjsn3mzQVNGBvdI3Xl4dL68eP3W38OWr5f3mOX1Bjlzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85dad58e80fso693030939f.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 13:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743885422; x=1744490222;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lq0z+umsMa3af9r59F6XIYQZFJYrSAW7N+r8MIuKdAA=;
        b=nW+iOVV0NwPBwIqoDvFn8H7kG+lrOpXHdJdnArqKSW/mSdLywUiHHjbhocZw0SxUnC
         zVGqklbT14N+I+XN2fRj1fJtF5mzjCFxaJDoSPd1L/6U0Sn6phH2gAfbULkoUnwP76+i
         rfn5EbsoNX/3o9G3kUGOPZMTOgRWTdoZW2+/3G89mjE76w7FN2yW3Nbromwbm31032Ik
         tRHUY2IdxZXX180rii6t4pvil3Y5kOzfmW7XjQfr00pwAqzQeYNt26yZD2lMZ2iQy8O4
         Dt7uTG2pqXSzAWg6FK/vhGKrd4twBpV5ctqJN3czcI5wOwM7Vn7MJKdKTKinx+tgzDhm
         zo+g==
X-Forwarded-Encrypted: i=1; AJvYcCUNVPgPYogxsdhV2PULsCFKWlk4GhqcxdcI62klbETSILQZjqh/is7+JACrRFdf/L3BR5oM9GPCXShTNl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhxkudgE/0KLmL5sA7d6vDqFWDYGAlyDZBacBcbY3KTW74qGwx
	NspFbh0Sd7spUPtLOB8w57oJl4A5QwOYQGfF5uXie3YoMZbrK7T5OL+aMF6lf1zp5SwINxG5wxm
	8wNiF6hMRY27e2ws4AwjIx5X24WVswjkI+qAWy4oN0f4mcv/USKhhxmY=
X-Google-Smtp-Source: AGHT+IFvSmJDsxHAwQYwXiAQnd+JyWMem4t0sD8xvT9TVS+OdfxxwESWuFt2rpSClIIsw4UVMiYD2fBoy9yBKty1smk2JpYpCtcw
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4401:20b0:3d4:38a4:388e with SMTP id
 e9e14a558f8ab-3d6e52ee9c1mr58296805ab.1.1743885422287; Sat, 05 Apr 2025
 13:37:02 -0700 (PDT)
Date: Sat, 05 Apr 2025 13:37:02 -0700
In-Reply-To: <ic4vadw4umsgdkx7mopnq2gxf33eoglf3ln6kfs4n7kihr6jz3@zmq2iyakast4>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f1946e.050a0220.0a13.024a.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] KASAN: slab-use-after-free Read in bchfs_read
From: syzbot <syzbot+2deb10b8dc9aae6fab67@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         56f94452 Merge tag 'input-for-v6.15-rc0' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1299e23f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=695196aa2bd08d99
dashboard link: https://syzkaller.appspot.com/bug?extid=2deb10b8dc9aae6fab67
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16d32b4c580000

