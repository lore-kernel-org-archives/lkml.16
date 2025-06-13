Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDDE1FDA89
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749791471; cv=none; b=HAWfHmaVTg4gbX5e8WHLT4iLrMPWvwmiy0GuHoVxCV/uIcGvNklem4in43JOrY0DW53VH9wE/0NDziekj+qeeDGmTsA0EkVKG0/pnid8CfbqmJ9HBnNOKdKzdaKkvHVXYxVmuw+aZ2k7dwDeXxVr9U6yhQWu5KfN+iUJrxbJ/UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749791471; c=relaxed/simple;
	bh=cUvwOLl3mEuX6bXFhiRV8ofP3klCN+cY8uC/h346d/U=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Twtt/zJUjsWF2Rqar7zHiXLfXCb4SwkbiBDkHfF9GSzZgUJEsXkOD0LmraCw1o757v7/ACyGb6nskVbLqMnUoWmP/X1DWkz2NesHr0gOX4bnEzps8+s9vNQ+n7bzvaa8e6cCzdIY0ZcVKnSFFnPMmYT26/iLrx5gJhogBQuHdqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddd051e8e5so16140055ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 22:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749791468; x=1750396268;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nw77KWnxaR6xG40zkWU1KSH5QZlyIGcQ1pTP4BctBbA=;
        b=NClQhnr6HQXCtM7PGoUcViOMa9pGSusdTeQhVoypT0i9y5I+Hy5B1hKaxevxVSKXpL
         6e4Pj+WTbGKCqpkCH8Nr1huvwn3lYauYUXebW0A+bTyFGifC12NzQrB1/xVxt9wTRtC8
         v8do77j5LjN6OCH8p6Z2LbFzOQbaIJp3TzQDCDEm1sL+HKaf59GW7pjIPUM2SS3MFe/S
         tpPgMjwuuw93J7dMssV5kDNBNKhz1An7GJwvEqHBlDojzKtogICQ9UgNjMXwAPB5IG3Q
         bWhke2D3fDnp604LdSf4H8ubMSXXJ+XNeUNGn+hYWrqS2jaN9BI7qqcb5ddk0V5tIJf9
         hXJg==
X-Forwarded-Encrypted: i=1; AJvYcCXNIsdfMZOGwfL6eAPDvf2Tu5aPU4/tC4w60v/sAni3+H1tV7t1LPBjpEHgRVhTh4Xe1MXex0ODcLQpGvc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlvfa0vb7csnn220ds41dGEDvK4fcfT4UQiWpR9M/Hxd0+Noxg
	anbMHtQjAi9jPeJYahDpZ8BW1poXc0NEOBKAQrznPV5B5SnIIzn00WThwZYa8P+O1mdmnAaSH4G
	auG6i6xV6ZbYv32eZ6gSBuyQT7EUJNv6WaeDVvlwA5vs5nYfEUCz5VwM304s=
X-Google-Smtp-Source: AGHT+IHWVnmkvnP7OgPlPOI+KaqLRcddj988eaBzrh6EYBlD2YrWLZz76gr7ACyFRtgGWaQChipknEfOkKvAlLNMuQktm8BzzHvh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2593:b0:3dd:d995:5a97 with SMTP id
 e9e14a558f8ab-3de00bea30dmr16390805ab.12.1749791467999; Thu, 12 Jun 2025
 22:11:07 -0700 (PDT)
Date: Thu, 12 Jun 2025 22:11:07 -0700
In-Reply-To: <20250613042412.328342-1-kuni1840@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684bb2eb.050a0220.be214.029a.GAE@google.com>
Subject: Re: [syzbot] [atm?] KMSAN: uninit-value in atmtcp_c_send
From: syzbot <syzbot+1d3c235276f62963e93a@syzkaller.appspotmail.com>
To: 3chas3@gmail.com, kuni1840@gmail.com, kuniyu@google.com, 
	linux-atm-general@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1d3c235276f62963e93a@syzkaller.appspotmail.com
Tested-by: syzbot+1d3c235276f62963e93a@syzkaller.appspotmail.com

Tested on:

commit:         27605c8c Merge tag 'net-6.16-rc2' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15c21e0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=42d51b7b9f9e61d
dashboard link: https://syzkaller.appspot.com/bug?extid=1d3c235276f62963e93a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10c0d10c580000

Note: testing is done by a robot and is best-effort only.
