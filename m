Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5983FB1B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 03:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744171148; cv=none; b=GLCrTsDDrF79TySNSevcXVcwOkIz3tg5n1YR9/+SzJT2Z9kIipgd3bTnyLExPvSevc2PtR+md9/6A/IIAK41oZRY/QUZ1UXb2zFCrLIb/4uViKganGb/yWBIsnP9hZX2dOo2HOSqdK3k9mGFa820bLW/Cod5aRRWTQJRhTq8h6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744171148; c=relaxed/simple;
	bh=/hs4mz57QkzD+POEBZdYWPhm87ASHpd3wXi171AOTVE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Dp/oZ3EOM2Wuo8b9azDolkk8EEfbNjkHiMlC2KpCca7cZmve2hbuJFvNYMopjDIhxVJbW9mz2foqEsfQSKi4oqWR4OuE/2pc9L16L9AQci/Nb+6fy7lB9lLRrExH6LTXKiX4xcwzsZkEEGRy6sr0RYNJATODaQX4sjlJnDq3ZyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d443811f04so60128035ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 20:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744171145; x=1744775945;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Xmbh9ETjMYYnIqDT5ZMvjmgmJyKPg1AP50uzLWCg0M=;
        b=UKydxtY3JyLXzS4bD/fuom3mnCdbYx3RzYLLPFV9/VB1bLiMU7aegmZTm0dMnV/jI9
         hluF/GTye16NfTNwUXdH0q11B2pUZ8slK0iRsDl4cULB/XFFjOQdvZj9RRyYotuV4b3i
         IJcglh6qoTJF70ksuGLoU/XLNwKBAoI1m8oO0/va7dSTDxKX76cJq3isDf+vI7fCIuj+
         qJ5LOdozvHdU+nOwqkU6ITRIylhnIy0MoYjLVbs32giGF7+ijxl3QGPwCCwujDcJZbdX
         K6u0u7BG7bNLLf/xqyzh8VUoJbe2LZnQIctgiqgmaZSaOlvSNd8h/iIei/DjZOEezZKB
         rOEw==
X-Forwarded-Encrypted: i=1; AJvYcCXBdvzFyy6zOp/lfga7RB9kARJz7RyKsj1LQQBqglBxNeUxHoxzdz2PqDE2oMN1yNmkiRLHx1qNvlNBLho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6qm4AmcomX79IjNrsRcr2Pt3tyHB4DhNIip+bKz3OibUvVmqT
	WEpxnEGPg+SehdlMnavBy/XnZlSZYqhUmxWseJ9Mfu4ya/nTW0pwu9bIYS47U6fgYmPc3TZzrQa
	cQp9L5hsNW5WbHhqz8tR50BtzrSfLukMvq6gj8cVPIWwxlWK8bLh/QGA=
X-Google-Smtp-Source: AGHT+IFjLjZ26x0YTu6iNlhJUnYo5KtlBBw/Aia86NjqsznbuOsPBWlCVziPfDJ8T26S/BmRFOyIO3aIpkN0zXTLzeAKegTiXgZq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1582:b0:3d4:4134:5213 with SMTP id
 e9e14a558f8ab-3d7b462136cmr8112525ab.11.1744171145539; Tue, 08 Apr 2025
 20:59:05 -0700 (PDT)
Date: Tue, 08 Apr 2025 20:59:05 -0700
In-Reply-To: <67f4d325.050a0220.396535.0558.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f5f089.050a0220.258fea.0009.GAE@google.com>
Subject: Re: [syzbot] [net?] WARNING in __linkwatch_sync_dev
From: syzbot <syzbot+48c14f61594bdfadb086@syzkaller.appspotmail.com>
To: andrew@lunn.ch, davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	jv@jvosburgh.net, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	liuhangbin@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com, 
	sdf@fomichev.me, stfomichev@gmail.com, sven@narfation.org, 
	sw@simonwunderlich.de, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 00b35530811f2aa3d7ceec2dbada80861c7632a8
Author: Eric Dumazet <edumazet@google.com>
Date:   Thu Feb 6 14:04:22 2025 +0000

    batman-adv: adopt netdev_hold() / netdev_put()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=175db74c580000
start commit:   7702d0130dc0 Add linux-next specific files for 20250408
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14ddb74c580000
console output: https://syzkaller.appspot.com/x/log.txt?x=10ddb74c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=91edf513888f57d7
dashboard link: https://syzkaller.appspot.com/bug?extid=48c14f61594bdfadb086
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11520398580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16b1323f980000

Reported-by: syzbot+48c14f61594bdfadb086@syzkaller.appspotmail.com
Fixes: 00b35530811f ("batman-adv: adopt netdev_hold() / netdev_put()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
