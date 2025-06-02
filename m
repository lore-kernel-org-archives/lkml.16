Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916E221C16D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748871185; cv=none; b=Uwu+dczRMx/paXgj6L55dneGpbLsS4jwg2HCNauJWCByMrXVtqu5lQEKLqAuTJGkP9W9i4Kq5La1Kt9PMww5vMEfWocB0JteiuCptzEbvfS3HUb5NPPoI2pwZ6I3JbVFJLf4IH2RAUnujL+2vjj0tp9lUFYOZQWCTZ7Nolbe+bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748871185; c=relaxed/simple;
	bh=zkGWh2iLKQwe7IpDttVcxoPmfiPyzaY8ayjTdbagJ1s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fTfnmG2xw/rNzFukgwsVOxJ7CCq0YqJzvW6MY05E0njRO9f1EYN6epy3ujCxmdILLLS/2sLbNy68O3HlUrRGDEJhZdR9zk3/2njkae9u7yI99cwn4w7MZOwQ40lPX/BcjdyZvtwmgVuogVmFTGCYHZZq0nDCy4Ca91r4YMtiOBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3dd74e0f5c7so30257945ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 06:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748871182; x=1749475982;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5NGL10YXbwm8vzIGZ3uTRYbMth4iRDMLM05Bo28oCU=;
        b=AQvb8TqyZv4GkOzCEtqW2uTbTUaAPzo4uVwof2yxDTeAwsMb8qhWpuMDWsIhVwnFpF
         TsQ55knEyt1Qp4eu7SFQ1UJMHUQA8LyR95gKuSfoFozY/CJZ0/t6cPDiN+2iYcyuZaAA
         LPygR78/vlp3wzSLm5IO5gS+16OMDaBk0WLTvPraeopTMF/e/3hMHKGggf7kQHaNfs5g
         1VV3djDrphpa+b01wq/T8VO/qGKe6+gDEvr8SThkYqZ2MpzA4X9CczqN0TSYTTiN1/9I
         bebAtl5F+zpScWbiMfuBduTFuf/W5l2j/e3NqMfZS5QmcQRsveb3NyUiXyonL8Ch2wM9
         O4Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWvDiHtm7sGspYac4pRGWrxUMRL+qm5LTUNONWP927IitO5vB8XE/2iRxGmdZ76DbOA54sVUQxXPm/KN80=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGbhmxx18LE8vvN7qRhWd5b1J/YoJH7h27AfWxVfYJ9Pov8sm5
	60k9JkSnsvlNPvbZedSDQNQkCIJKSjSElslndjYDlLZZu83XlZU8jhuHqaDSGCFbshX8eo8KB9H
	LK4rp0RiroiSko9QL8Y0h9N+cGfz9Ty/vFyxrjAbpQnToDJSOzhWm4Fg9yr4=
X-Google-Smtp-Source: AGHT+IEWxmQjxiXYeGxMG7frN2/B7zRinFKF3JJHzWYdtywu0VMKefhI2Ci0XMlF+WCVRYXsm3/Blmrzi0omWTEL7TYYzI6lkH49
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:188c:b0:3dc:7cc1:b74b with SMTP id
 e9e14a558f8ab-3dd9c9a232amr120193825ab.1.1748871182688; Mon, 02 Jun 2025
 06:33:02 -0700 (PDT)
Date: Mon, 02 Jun 2025 06:33:02 -0700
In-Reply-To: <6cf69815-db19-45f3-99f0-9879ed5f02c2@redhat.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683da80e.a00a0220.d8eae.0053.GAE@google.com>
Subject: Re: [syzbot] [gfs2?] KASAN: null-ptr-deref Read in gfs2_drop_inode
From: syzbot <syzbot+b12826218502df019f9d@syzkaller.appspotmail.com>
To: anprice@redhat.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b12826218502df019f9d@syzkaller.appspotmail.com
Tested-by: syzbot+b12826218502df019f9d@syzkaller.appspotmail.com

Tested on:

commit:         9126d275 gfs2: Don't clear sb->s_fs_info in gfs2_sys_f..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next
console output: https://syzkaller.appspot.com/x/log.txt?x=169bf00c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eeb82b5d1d67d535
dashboard link: https://syzkaller.appspot.com/bug?extid=b12826218502df019f9d
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
