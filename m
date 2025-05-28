Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFCC1990A7
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419444; cv=none; b=aIf30tiwTE7vbIH0ZLYIYzLzXxEESrKGehpLKT18nhRhaWVDHFNJ9luIpjMOFQUMt33G28GT2pjh30J+VK4afXIsoSvJY0FRazLvF2aSsoVUfZFdh04h/Bxf0r1vIdR6AQyuC9jQpWo8kHdNZxdv1UK1jU5Q3B35f7FNPkSKgpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419444; c=relaxed/simple;
	bh=1oeI1j1lw8DC0A/7yt/5p9dEKr5IkC/rOemfjplVwlI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZeKg4WuF78zHSpWr9eh9uOc0P2KM95Qz8WljYSYiYv5Xyxwq6dm0mOvmIQOvV46K3IXKJmUp8lfdz6vCEWNwgSQA3L/jthYOUpHO0rdU5Rp9HMRQQwAwJqxVKBvTmL7glUgKyJMN7990+z+oDZu21X+xfPuB4XXGOmaGf0yYggo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86195b64df7so631857539f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748419442; x=1749024242;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MWDhC9r9oehNAeAGxW4ZZpblr+pALrjlJXaJu5GfEiI=;
        b=vDTouUSjtY2tYxVFWCOBnGJL3nC28PGDL/OIDp3LA/nBrVEY+Os2NwgSfuVY4DtMQe
         UWYVb6Gi00iv9/x6G6YsVuxqgu9hjikt2lIJRGA1+wmx9FFykmeAJDJU8vJGRjWazu5p
         v1eOPvjjYEnuG8jr7w2aA0Q1VABVpVGAbhpg56YrSl6grFOA5sTRikgHhiexDH072t2F
         bVbLUtL63fNSwdDfi+XsSqtnWWa9WOVrRxeT+4hUddW+ybcLux1xcxMtpuJujh+7UQ1K
         rWYTkawSAsPffl+kxS+GEdn+yhEk9FyXZBgGrohy4LqJKwjDSKR99c7jc0BUO2MRIuIv
         L8ow==
X-Forwarded-Encrypted: i=1; AJvYcCVF9enFvKqf9kAcJcsJ2vGqYv+GKoqNjxg1d2mc2WxmA0yCta6qoaq0eIXPypIYimJyN3tVXuOoiOxJlIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI7JnDzJOcsPvXyHq5cYcb1oPoBZv+gOoU4S9yWMs0hfmJBb0V
	iF4fjdkq/jlelUi7NVKmp0THJ/VQ+aEoZ7cIQOMntd897eTN0cX1XiAHJNxgFRcHpcByAhdwT0P
	sFocT+zXIBz4UZnvC5O3lIyW2b29jFstnorFiMeoMVwsWKJGYdNlXUL/2hM4=
X-Google-Smtp-Source: AGHT+IEWDo3N5Y8nJt4+xEYmCWGJ5P4xfnzlN1fx3ds89XYRyy+o3hQXbMe2tox95EQkf7Cfu+qZRRLsC7xzQomT57mTkOqhoTy7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:371a:b0:85b:3a51:2923 with SMTP id
 ca18e2360f4ac-86cbb8b7b35mr1789997039f.14.1748419441880; Wed, 28 May 2025
 01:04:01 -0700 (PDT)
Date: Wed, 28 May 2025 01:04:01 -0700
In-Reply-To: <68c2c045-c0d4-4896-b3e5-ba3d767f7110@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6836c371.a70a0220.253bc2.00c4.GAE@google.com>
Subject: Re: [syzbot] [f2fs?] KASAN: slab-out-of-bounds Read in build_sit_entries
From: syzbot <syzbot+1fa48dc6faf1ff972d7d@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         8b56d4fb f2fs: fix to do sanity check on section ckpt_..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
console output: https://syzkaller.appspot.com/x/log.txt?x=171403f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d25f4819d9920a3e
dashboard link: https://syzkaller.appspot.com/bug?extid=1fa48dc6faf1ff972d7d
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Note: no patches were applied.
