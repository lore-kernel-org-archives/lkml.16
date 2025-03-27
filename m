Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE801AA1E0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743119046; cv=none; b=U+oGKe/9f5hGE7BEHthW65Cz/VlUM0dSPBF2Jwfop4JuH5YXbJ8E9qMA6yw5bAbahYarNv4BLBITi10A65sjM9aBhyDqyPwVIvuOvhip1zcWPeF2D/TTM1owC1Rn5u8SrcN5IjomPfHuBw9T1R087KPiyBy6mpHi7FbnQZj2dAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743119046; c=relaxed/simple;
	bh=zJfe+ntDz0a5gqUOPpRgPJsQIkqcEFey64SoptgS/Iw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=do0tXDAkNOVSD/djUJ39itc866pcnZZapDFo1hjHdz5TK29g3hCD0ZwWYzrA+GyrdILicBZCTYF3ySMRBh5QInsxLUk0vyPpvT3g0L0nOXLJiocSHk3SJxZfIGmeF/nIGIYuk0ardpejU3bxfDD7v6OzlBKGyee/pjDz+k6OIlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d43b460962so27770825ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743119044; x=1743723844;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9HyMx14slmZO48hXwKrnjOU7rwzYOFJJ2XuwciiG24c=;
        b=RGFy+zanuU0NwmQq/Z8DlDe8iVWKCYpUO7bWQdYvHb9xmjogx1annhqtoFCDbgVnhu
         VQo3XxzM6Z1xCbwQi/XSXpTZAz4uvSuHR+8a4cXCBtIGvQL52YU+k+2NnaDK59DX0n3g
         KQL+SbKV/DGwatEjT/CIPvN78S8PKkWKZINIp5+1cmyqmC4bNn41AOzIjj+3Rnq05dTC
         mJVIVDRH1KoH4v/720I2OcCVLfNkVVI9e0El5CVsWhW3GEiGBu+s4NgkMp1PCPYKmlZY
         dSkYuwuI13xjUNN4JTqKuIdRaOwAgQKQjWRQFBqJEMVQAAJ/XBPmuk7mvy/fam6cQ39y
         0o6g==
X-Forwarded-Encrypted: i=1; AJvYcCVCUAE6D4fVpRSj60ZY+N4BhFuwasWCKX4tMqvCsjfC64b5FUdfms+T9e6CMwM4AmEL2nJTcrFVwWylZyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGloTiV++2woSoHx9QA8ceZCPRcbl8xehKCLNBDA6+jRJ58rrj
	n9TyHZvQOnfZLH89tq3Nneppy7Mj/4KTUlljrZSAnIKXdbiPVNK3a5vvoIIw8/xdkOaXwmxlCOR
	V+1SsYeXjLNrtLPUX+3QPObq/yggmvtxQoh06ffZOqj+ODVwl58ltVw0=
X-Google-Smtp-Source: AGHT+IGP0KfS302a6JahnEaFSrCURrW/iARLg9wT0HWhuDbr6UaQ3NEOiHKp2eCied/LzPpIPMg8HST/OAGgBXsb5bJEocyXgbCb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fed:b0:3d3:f6ee:cc4c with SMTP id
 e9e14a558f8ab-3d5ccce76c2mr58974305ab.0.1743119043917; Thu, 27 Mar 2025
 16:44:03 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:44:03 -0700
In-Reply-To: <6772fd43.050a0220.2f3838.04cd.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e5e2c3.050a0220.2f068f.0050.GAE@google.com>
Subject: Re: [syzbot] [ext4?] KASAN: use-after-free Read in ext4_find_extent (4)
From: syzbot <syzbot+ee60e584b5c6bb229126@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, jack@suse.cz, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ojaswin@linux.ibm.com, ritesh.list@gmail.com, 
	syzkaller-bugs@googlegroups.com, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 93cdf49f6eca5e23f6546b8f28457b2e6a6961d9
Author: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Date:   Sat Mar 25 08:13:39 2023 +0000

    ext4: Fix best extent lstart adjustment logic in ext4_mb_new_inode_pa()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1566b43f980000
start commit:   1e1ba8d23dae Merge tag 'timers-clocksource-2025-03-26' of ..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1766b43f980000
console output: https://syzkaller.appspot.com/x/log.txt?x=1366b43f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2edddb53537e0320
dashboard link: https://syzkaller.appspot.com/bug?extid=ee60e584b5c6bb229126
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1623343f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1123343f980000

Reported-by: syzbot+ee60e584b5c6bb229126@syzkaller.appspotmail.com
Fixes: 93cdf49f6eca ("ext4: Fix best extent lstart adjustment logic in ext4_mb_new_inode_pa()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
