Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1542E4C91
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 04:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743915244; cv=none; b=XmvXr3fZEqjTDSS2R5vWlA/YEAFs62bguggUU0RISypqHVbzaCyWEYS+pmLmMjkUj3wysMOT6JCqat+TXm8Lx2PgzwXHljhclYAocFhmLnaDJnifyKC/V8qeG4+dw1Gre5N5eYr4dVlk9odJUzeEzFI2654vN8J629uHfmUludI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743915244; c=relaxed/simple;
	bh=9shYWMX5Ytp9BXENmbPc8hwPW9/mHMaBBb0I4HAS5vs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=q7NFQJtkSjYJgKMw8qhgQs1/Vk9iJqg2rap+yb0cufTYBD9sF8HV69o780tPdUUIB53zglZvtGFNxPNRiIGeyjhUkBtG0zytUNiIcR+J9ssGYZIVL7F1Z4Rj0X6VjHKjnm7ypVYfDn0Cgmopnyl9UrXSQ9Hc9pl3+lv1S7TXv5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-84cdae60616so410995339f.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 21:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743915242; x=1744520042;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aGPPyVggy8u1+rNTXf5zY9ekKgRQk29SLeCmXq4Rf9w=;
        b=mLpuZvDYbTOxuRbDOCTKQjJTm8ZRaApAyQCebHeOYqk+RPR7Huyjj+AzL6tNyAIf/F
         eLDOdRBi4/yolocCDBS87LE41YyWBG8t1+DkDI9NIqtz0DGik1d0ZsJHDa0v7C/Ty3qL
         W+ZROLI0SnsYbMaL50uAmUzEDOT1+gjYxvf601kVHHxYkoNtTdqMP3je3foGnJTGJMBm
         5UKr1EBGAnHru7F82Pxfi4K7hQ8waNYnkWQkXm6q8ZdiOAtFj3huKqvmnOx6LaXDwTiA
         IkNt7nYKwJM+to3ABGBNyXKwkpjGoQX6q0L/Flghzefv+27S5iPNnbswur9ORHB/HouN
         NivA==
X-Forwarded-Encrypted: i=1; AJvYcCUAT++ZGCHcO+BAZfpC5D4c3V6K9baf4mW51eIiQuO3pWndoLK+Oqthk9bZN1O5Iakjc7hbXwalJogrvTE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws69f1IPIq/MeqO9jzTWFAqRLHgQHNm6WKqIsSq/QAcXGfQYVn
	3SOb4vtQX68xyzTtg2/pdYhAJDSpiu1ve6qtsGLy/euwsrdslAdmOTs65Z6fi8y1Hq7SzoAmjIZ
	gFF/naSQ4gtPLMlGIBYmv7Gr10LFNY4w10wd1Cky3z84J9a0DQRqkNcI=
X-Google-Smtp-Source: AGHT+IH6L7RSs6IYC/h5tiecLQbSE7pdcCXCcDTsgcUTGyIjASb1IO1tc0crEJIGEIkrP5NU1utEu2Eat6BZFQwbqJEb3MJt1ZlT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:219a:b0:3d3:db70:b585 with SMTP id
 e9e14a558f8ab-3d6ec59053bmr49280745ab.21.1743915242240; Sat, 05 Apr 2025
 21:54:02 -0700 (PDT)
Date: Sat, 05 Apr 2025 21:54:02 -0700
In-Reply-To: <20250406042646.72721-1-kuniyu@amazon.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f208ea.050a0220.0a13.025b.GAE@google.com>
Subject: Re: [syzbot] [net?] possible deadlock in ipv6_sock_ac_close (4)
From: syzbot <syzbot+be6f4b383534d88989f7@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, kuniyu@amazon.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         f4d2ef48 Merge tag 'kbuild-v6.15' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10325b4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f2054704dd53fb80
dashboard link: https://syzkaller.appspot.com/bug?extid=be6f4b383534d88989f7
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=145f87e4580000

