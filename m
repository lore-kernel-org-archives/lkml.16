Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E94CDF59
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 03:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743736684; cv=none; b=ckbw5ztXdPN3SeThUWh8LdIITimaSyaQuxpt5SA/pcE86prqbOFwNgpsm6PnT/zHjlVZAHlDAvc7xp8bRUxTmViShPG+FBfa9bVTRhZrlgL2VdvvcnjEIysE6G/J/nEA4lN6iZ3YCW4Jo1Qi9QP31d3OXRFLddBk2wfJqkz7HSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743736684; c=relaxed/simple;
	bh=Qxgro5oF22O8IrPnTha4/pEP42PMMbVux5sHKA5POK0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SANQwok/pwjV24rtveONO7rBUAvndRTTwWinjO3DjIeOADEFC9yJ+vnx6gltuJoJwVQjU1aBJhwiBxFOmfFMygofH3Z2JcUeNYRbcdNp59+++NDcussiy9xGRgji8hj2Xy6vCYP8KaUUv9FC8Bj9rqPRNs3kZJCxzukBNlIIiog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d44b221f0dso31316385ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 20:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743736682; x=1744341482;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qNHCWNtIlckVIlEBFgaE8yVGQ+y7Bn6IfVLAuL99NE4=;
        b=WB2wBZlzl/60kr7A67aPOdfjrAU3DyzRol/nsZVuEq6CwD4f9EAykmgOII/LUuELH+
         JwPlkrcAV3MJR2Rs0Q9LWW9Y0Z7hkaN8woz4jS1B2GJ/MOh18XWFnjbcXTTVwfdwJEmf
         M4v2nAdz4x/srbyMcBe1d0tbFI6fuWME0++1tSPpCyaTDX6o0wxJnDC2uVwJsfJTvDQV
         xOr7Zn9ynodjxHhplrKRq2rUYRHzd1zVmLjb5rtFELPyZTMeLXvyjW5Qp4Vt0ifsm+si
         k1hW5r00Ff1uWeFUYOVSjjXHj/eLQ1UnWN0co2qIpBM0n0tC8v8NBNJv+BT0MeIzUS5P
         HdkA==
X-Forwarded-Encrypted: i=1; AJvYcCWH76g5T5a18QLOyxV7Y/r3IyKa+99c0YjkwYzt/K4NS8RuKMFrq86Mqf9EovkJPEQgggPGjynHab6vp5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNod4BW05CYJJkliYyn9ZnhlVASZy0Ak5c5Ab61wg0TMeCQeYx
	VujLjmYtrWY64j1mkhew2rngDZIMqTqPfUlvRnjC1fkvYMGL+wy7KB8qnHgt6lt6laNjULiCkfQ
	rP4REt7U3YFF2UpyHslGl48vcMa0aDDuf5/19KXDaiscMxtsOq6cuifA=
X-Google-Smtp-Source: AGHT+IGN5d1M5TSa+K3LKuBkoXF+OqySRjYxf+SLt7WcnzxPYCUvyo2jJaA2VHjOa0dkaJ9Nco1l2R/8AZkLKNB8YbL2ZRmAKAhO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4401:20b0:3d0:10a6:99aa with SMTP id
 e9e14a558f8ab-3d6e52eef27mr9570685ab.4.1743736682408; Thu, 03 Apr 2025
 20:18:02 -0700 (PDT)
Date: Thu, 03 Apr 2025 20:18:02 -0700
In-Reply-To: <tencent_0AEAEC8ECFCC7A2E6CC02DC16FBC9410E80A@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ef4f6a.050a0220.9040b.02f6.GAE@google.com>
Subject: Re: [syzbot] [isofs?] KASAN: slab-out-of-bounds Read in isofs_fh_to_parent
From: syzbot <syzbot+4d7cd7dd0ce1aa8d5c65@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+4d7cd7dd0ce1aa8d5c65@syzkaller.appspotmail.com
Tested-by: syzbot+4d7cd7dd0ce1aa8d5c65@syzkaller.appspotmail.com

Tested on:

commit:         d6b13dbd Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=148de178580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=114db1c77c985e53
dashboard link: https://syzkaller.appspot.com/bug?extid=4d7cd7dd0ce1aa8d5c65
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=120a2fb0580000

Note: testing is done by a robot and is best-effort only.
