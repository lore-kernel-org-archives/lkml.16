Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015AC1DFED
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 14:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744467005; cv=none; b=SGGcwIBJrdsa0tY+YvA240Ctr5CGQR4w8zLqWbM6MSXfE9CijGVw61cTirUdiSEVPXsVtzdfKfUFgxkFG2eYLWO1e3WQE8UUNTC7f6jgwbx9J1mWo5SYLbsbvkWHHl84bqTZbBK+cGggnUpJlxa8oI5Ao4yOxeAvUNF+aRHqWro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744467005; c=relaxed/simple;
	bh=ycMbpoGMq+4nbCnFG44LAl4B00cI3qko5aFkg3B3EvI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MI6hq59yB8hYtGBmxnmYnRUlaTnnz5DfTyPYFaewx5Mf45iJ/o5XzVPKYBLedSF1FCy28N4fknrtrurhxfxZD0xBZOlA5Ny/XxL/wgcDeKId+m2s66RK4Z6Kb+ZwoDURuAR854CdG4M2qJ8hV21upUVO6fVLhQDu4dbvfJ+pRBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d5da4fb5e0so28103695ab.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 07:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744467003; x=1745071803;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oR9DwQMzPhcT5GOrtJhWRF3TqpUHqDHl264Js6rlVSE=;
        b=WRG55CIDDb/6Y/zpgTc69xr0qOatJTNF604sny2BnNNAyDevVJeTuCl4jc2urxx4hB
         EVlfznnSxRfhXE6tD2ypAhWW8KEZtzHL0WHukY2/rwzxOhtsSHUhO7r8JUKLoIqebzom
         z21XQnIwKZSyFeNMFlmQjWj+Z4K4u5ro6/vTpmflgYiTLS/hDSvqD7T99gLFavKCFddL
         U4EH1nk88oqGw2g9J3nGyYfI3jZUzMA7kl+gP/NoR7YD/z1PzZRL8lbxZMHcEvhBIMev
         e2DXTUPthw0qiuHvIoqE0l0KsRTwSR70Ds7v34h4gNr8GUaR/lHjGNp2NXBpHh9Yc9Ep
         EC5g==
X-Gm-Message-State: AOJu0YzgqWGjHCNB8uKT+1IRAq+Ic6fXrMCtO3nCJLx6n+JM6CeLE3a3
	XvC+Z96jGvowbRCWVxpatUWbznAlMYBfyUOepnDB6GBH6iEvQtpTlOyoRnlvD1vDNoa/LNus3Ob
	sk2uFmwWx/NAccC1cu1P9NcaSs66W1DIXw/IopFq/hYKAEeHci6KeDOY=
X-Google-Smtp-Source: AGHT+IHzh3TWa7YGilVjkAyB/FSwecQSl2xQnnFg2j90FRlFbryWY4SReEAsd8evvMFOhYWjpOc5LO5Gl8gm7/fRCvtfuWcGNPS5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1706:b0:3d4:36c3:7fe3 with SMTP id
 e9e14a558f8ab-3d7ec20250bmr56585555ab.9.1744467002920; Sat, 12 Apr 2025
 07:10:02 -0700 (PDT)
Date: Sat, 12 Apr 2025 07:10:02 -0700
In-Reply-To: <0274083c-4cd0-4aaf-a72b-dec71aff4225@I-love.SAKURA.ne.jp>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fa743a.050a0220.379d84.000d.GAE@google.com>
Subject: Re: [syzbot] [gfs2?] WARNING in __folio_mark_dirty (2)
From: syzbot <syzbot+e14d6cd6ec241f507ba7@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         3bde70a2 Merge tag 'v6.15-rc1-smb3-client-fixes' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11fb9c04580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=de00ab2345293816
dashboard link: https://syzkaller.appspot.com/bug?extid=e14d6cd6ec241f507ba7
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=135b5398580000

