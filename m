Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F4811CA0
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743243486; cv=none; b=hrR1TL4IMduv8b8ueQhaNdVxunWWb4PbgdXWh8AhAbmZRm/CH8BRfPxRvJMoEtiwibHLIhYHLb1kOULY//0JnstsTqRa2d+EeY13aqRzMFIjmvzVZVz+MwWLGA/5OKm38hduZmBWbTEcC6xySnmx3kjQpp9LKUyQxQ1iLo6EYtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743243486; c=relaxed/simple;
	bh=3Gg7UeqF7f9AB1QGyc3BnQhd98dYwoGSjAYpiv3farM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mIb0rhShQm2CgO57O9bj4d9/8U5CfSN40BpuPGfIL7rs/23jBzuI+mM/j43etf06ZkPXnrQFYoErReoYoF+vccL2KWi6Q8uIxmFcDKd8zmtLUktsAz1/bcXUI3Uo/lGCwSxxRB4wqCgzxN97ooXyuVkBa0EWNWFGK2THLkKRIB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ce843b51c3so64191795ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 03:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743243484; x=1743848284;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LNmH2fctHcSs6lKNCKxud8Sdh627ZlyooO6WffSUEEE=;
        b=Tb99CeButQ7o+i0L9+3WDdU4jk64NF7S6dh9qsF6cuR5yZNfzYKs0/A4x3iAcM2PAV
         gAV4vcuvYnhDabp14KI11BTTQV1i6nZWxaxNimgMdTBGi3Mjy7G9GCqB6jq1Yx5owPkl
         K7dzQQxgbojuJYZOZxJD1h4TyWKg/hB09agFzLtnUfTq6DMHfkZ4JJaHYiZ5RepglMzu
         /e+0nszV0un8JYvaGkFE/jhR79EnqEBKNeUnmxbwtL2COM4dxtukY5oltKnlHkyhmpQg
         u6a0ekDPMRDEmqjSYlQ5I+a46NXFhLjM3F1HvJxyUiYis41cS7cym3WENMcy8qjUZ6AY
         rvyg==
X-Forwarded-Encrypted: i=1; AJvYcCU2+5oGEh9KoEG/SohADzNUIlqlx5VgJhriK2rUfsUOQ9UOZ/bmkySzhcWIcakwWMmWU93GQPygJgTmxi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjE5CleeQVl3Ihs72DPpO5F6rWaQ8lmksgWqzB7Qw1wwXBQgGq
	fusIgjAHD/MB1MPtfIV3h0f2ivsgvOMwUjyN+Gmsa/Ltb9CTUvB/r03oeOdghUKd8Ted4T5llMt
	YA/uuK+c0a0eU0nHp0qOv5Ix/ElExl/J5iGeIBYEK/oUX5AKyv83YZyo=
X-Google-Smtp-Source: AGHT+IH8QWFBLxMzkRzdp06BwZKC2WUTjO3TO5Zmahv8Sn8/rBZvv5sdAIBcjOScEPpk1w8msitkUFdHaohA4k/ts+891qTKSl0K
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:152e:b0:3d4:3c21:ba71 with SMTP id
 e9e14a558f8ab-3d5e09f7bbdmr30950125ab.18.1743243484235; Sat, 29 Mar 2025
 03:18:04 -0700 (PDT)
Date: Sat, 29 Mar 2025 03:18:04 -0700
In-Reply-To: <103746.1743241743@warthog.procyon.org.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e7c8dc.050a0220.1547ec.002b.GAE@google.com>
Subject: Re: [syzbot] [afs?] BUG: sleeping function called from invalid
 context in __alloc_frozen_pages_noprof
From: syzbot <syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         7d06015d Merge tag 'pci-v6.15-changes' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14c77804580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6f5a67fe881fabe4
dashboard link: https://syzkaller.appspot.com/bug?extid=3b6c5c6a1d0119b687a1
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1259f43f980000

