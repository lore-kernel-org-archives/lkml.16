Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC70F9EC
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749214085; cv=none; b=Gcm+hhtNrK8ltE3/+5Lpzq5Yhm2NEw10j4drVZkdfyBLvL/WnqfDFfxKseJkBVhrfyXMPV3uShw/X09Rznf2va14XVdjwkAkWR4JKrbSwxfxGkMzUPj6s4vAIV3+7h0huUGmLIwqlsqI2Ia6rzmDvIHxIqkpNQrSkdQbDAyVIyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749214085; c=relaxed/simple;
	bh=sGrwunzjdWlLIYw4Qq81mVH2LOQvVb2mMFndOBL5hKs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KUasFlkVbaOxY52TcSqaBeXi+Vw8KnoECHbCsF6zouOR0fP/6x66mAqZp4vYc0PkqgzEytrtbWzDI/SxcfzbgVNydgUQgibIG4NjNGXw/2eXQg+ih9fwrPgWoVIAOjOq8PrIhgz7jRuBfizivhsTRCFKpbdB3Ojfp7+wQH/fzPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddbd339f3dso23655005ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 05:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749214083; x=1749818883;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+aTWNiQth7+7nAa5NbV0wnb9HYSEyA0QplGINNE/8RU=;
        b=dAIsUNyv37hUC62EVY+leuPZTjGK1OtBWDIrSvWcb7QxUZBAyOcB9Rn2SgB7RVYUJt
         Bb/qWGGfnFZSDotkuzOmADNh5zZm8tFE63ahy/s5qDX0B5i8Hz/oob0Ms/pH9TvDrsJr
         /pWOgXOCbq0eWNUEjuKgl7uw4AbEa1X9xl5WgnUxUw3YqwmTdCBt+JXhF8FWm+Z/53pV
         7eJKYmq7Lxmfz5FjGBqFOZrG2j3/zyB5eXb5x6Hstk7Le5Q/xJ+wDXCNAB2R5+NPehWs
         rlUXy7hKG5wly6VCBUew/PkF8hOVi5GFiwAe3mVEdeyB6xJZMmNlfr13Z4o5OYM73ERC
         rDCA==
X-Forwarded-Encrypted: i=1; AJvYcCU5eXML0dG78aBL6kQCQfw8TCiPtoOMpfbEEAZ2iw0iKc8e5BLwLLyLj/OjVdt6wK78js6mlMOHhNG4sYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqblbarLd6/ZKUOlvexcPBLOo0lLDGBgVO0PtgRNQcuQxrRify
	4hWl9qmlAAAevqg7eWhq64mI9McFM/hggHOQlyp6ATp9rLgqeyzEXIv/KWon7r+D3cgmxcja6EB
	XaIoV0hkv+eckbfEW4LSqy7DHvkkbhXEu0SwFuWQmGXY5c0V1m1FXq9Keb44=
X-Google-Smtp-Source: AGHT+IEo3uXes0q+Eiifcpkg3n5CPdDj0zfoGCdnOfM8crZiUzREzYHl+X9HsKeW++ECHWiImSRrCrwLxnhq72WieASSAjzBwDu6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a01:b0:3dd:8663:d182 with SMTP id
 e9e14a558f8ab-3ddce4165c5mr26184585ab.13.1749214083100; Fri, 06 Jun 2025
 05:48:03 -0700 (PDT)
Date: Fri, 06 Jun 2025 05:48:03 -0700
In-Reply-To: <20250606122355.824-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6842e383.a00a0220.29ac89.0040.GAE@google.com>
Subject: Re: [syzbot] [trace?] BUG: corrupted list in ring_buffer_subbuf_order_set
From: syzbot <syzbot+05d673e83ec640f0ced9@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+05d673e83ec640f0ced9@syzkaller.appspotmail.com
Tested-by: syzbot+05d673e83ec640f0ced9@syzkaller.appspotmail.com

Tested on:

commit:         e271ed52 Merge tag 'pm-6.16-rc1-3' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14499570580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ede24871858ac52
dashboard link: https://syzkaller.appspot.com/bug?extid=05d673e83ec640f0ced9
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15e19570580000

Note: testing is done by a robot and is best-effort only.
