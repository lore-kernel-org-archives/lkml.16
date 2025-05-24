Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB6919CCFA
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081136; cv=none; b=fBnZ9eaO3OtKfbCcUxyIxkyPXqBXS4tZ2iKyAPkCNzNeUJ4XZDFJX9QhkShJsLgaJEd30QXxQU/983I8adroqXXUjaPLVCylCKNe9nIHc8TgiIymywvmU1mMXzwvM2NCq19s/xJO8wTqCfcCaTw8Hpnjyt/55NElSu2LaMtgRKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081136; c=relaxed/simple;
	bh=/a1duV79b3Wj3gyN0tib5/S4hsA/fgATf5ZCTG3993k=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Y0aPuY0/7s33JeBpna3qI6q4OqTXhqpVl5oSV15zNPpqzC7aiYM69zrqJooieGb2CC6sH5hNt877gCGp7Zfvi/EKcyDyx9ZJ5gP8eZU82/yPMjq4ky6TARtd9rCBKoNvg5vq2gSfS17OfBzuYZiaseGtPP2Xci/F29ixZ6Xr4S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85b4ee2e69bso81946139f.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 03:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748081134; x=1748685934;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HOUPLOp/mgaEeHOsdVwjiQHNiJzpzM5WYGVIL4kghHg=;
        b=bCqLlkBL30mcX83cH4J3/FCy+Nu8xjGrgwDb0PLITae8lWZziZ6eHJWnupq3hRlpnY
         IlbI4tVSlL5yajghhMEzIHI9qnGswhUVu0W090YFdPy+ZUZnwOn6kLPCPhhsr8WBlQpg
         GOFQ5+oxR0jSrYnd1SYpW9ux4OIZvI7rT/rTywcyknzGsaRzcExtySXdBmZmVZZ0FGl3
         FOyIo8Okz9EKdTp08Rf7H5jaiWhEh//6Hm8mvCMtcG258GoyHH8K2YQqxUR4hRcYgkY+
         p9IgvhlCKO8TRpb6jAdM0T1Q40Af+1RiTLKcSzV9LmTvewgQL9GY5c/5Vn3DDJj8atF+
         UeyA==
X-Forwarded-Encrypted: i=1; AJvYcCXfSIvbDfiJtclG0N/RhnYBlF8xQbcnPGbkSCr0IPs0ZIchLK/aGSjP8qNA9/KwEuOczkoffEx/qZQ+rWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTL0JgwwKtnH4w9KycyeW8IVqYZWrfrxr/SheVIlExV3+tveXj
	tb2SyXP90MMoeau8upCfkWluBw9/bt3goJc43M7ABf+zYYPgt2l6WrJdWFyBUe/AoE2MhGrewqh
	I5xkBJCDYpRC87cobfcU6Z7YYU1yGqA0tP/TktCoZnTvzf5TYV/OUjwIBNW8=
X-Google-Smtp-Source: AGHT+IEjyol7pGrZK7T1hqfMrIh1rBdVrWIUERLaHrL0Abnvq+u8aU0br1N+Ngd7Dqnt1r/yZ9425iZeZ6W5oWI+pGLcgYCNQ9DJ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:b8b:b0:85b:476e:ede2 with SMTP id
 ca18e2360f4ac-86cbb8c2689mr225095939f.13.1748081134195; Sat, 24 May 2025
 03:05:34 -0700 (PDT)
Date: Sat, 24 May 2025 03:05:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683199ee.a70a0220.29d4a0.07f8.GAE@google.com>
Subject: [syzbot] Monthly dri report (May 2025)
From: syzbot <syzbot+list79ff4d7714e12d11809b@syzkaller.appspotmail.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello dri maintainers/developers,

This is a 31-day syzbot report for the dri subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/dri

During the period, 3 new issues were detected and 0 were fixed.
In total, 18 issues are still open and 32 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  4961    Yes   WARNING in __alloc_frozen_pages_noprof
                   https://syzkaller.appspot.com/bug?extid=03fb58296859d8dbab4d
<2>  431     Yes   WARNING in vkms_get_vblank_timestamp (2)
                   https://syzkaller.appspot.com/bug?extid=93bd128a383695391534
<3>  79      Yes   WARNING in drm_wait_one_vblank (2)
                   https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
<4>  72      Yes   WARNING in drm_mode_create_lease_ioctl
                   https://syzkaller.appspot.com/bug?extid=6754751ad05524dae739
<5>  35      Yes   KASAN: slab-use-after-free Read in drm_atomic_helper_wait_for_vblanks (2)
                   https://syzkaller.appspot.com/bug?extid=0f999d26a4fd79c3a23b
<6>  21      Yes   WARNING in drm_gem_prime_fd_to_handle
                   https://syzkaller.appspot.com/bug?extid=268d319a7bfd92f4ae01
<7>  4       Yes   WARNING in drm_gem_object_handle_put_unlocked
                   https://syzkaller.appspot.com/bug?extid=ef3256a360c02207a4cb
<8>  1       No    possible deadlock in drm_getunique
                   https://syzkaller.appspot.com/bug?extid=2e9aa2a09550887c9d40
<9>  1       No    possible deadlock in drm_mode_atomic_ioctl (2)
                   https://syzkaller.appspot.com/bug?extid=8c517b890398864b52ef
<10> 1       No    possible deadlock in drm_modeset_lock (3)
                   https://syzkaller.appspot.com/bug?extid=d1451ae6745bd92ed771

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
