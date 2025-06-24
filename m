Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3808C1EFFA6
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750762325; cv=none; b=q96u6mAh2fyFIGvoK69AIeF9zgcMniUjSuQaJnovvhiz2x3RmwMDiJJ+44V3RmnW8iG5MufN+2uQrZ/0wkmgwPfvBSY41sXbgZisW7zPeRzvYa7Lhx9kwrgUQxWq1Kgfn5rxksIxst+I0yj4Z4RBYwJjqUdYXumCU3cR7FIR8d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750762325; c=relaxed/simple;
	bh=xz2FcCbqKQpb4wRLyUb3vG/DM8KMx1BRzJ5zE06uJUY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DQWRRAxI0jM4BWn/mdiFiILKtWZuG7Y6e03fWoytS5QrCTa+iqveuYu1n/9WO2bo97bonHH8BWEWMVqq3zDEPm9HFx6bI/c1CxHP8bX4Y2yjPXPvAIgOLiK+4ZJwshBEVpK42jFK0outarK7CaoMiMz0tdCyHYwtpcXukLotpLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddbfe1fc8fso5357035ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750762323; x=1751367123;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlaYw6XY5Li8iYKoNYzrCYXZhCg3kq4FGwbRLUVSAvc=;
        b=we8wWG/dDaAeAUoytVOKRD5ZCx0i/Dsqp0YKf37XV7LABx1MCdYV4l+1FPRHiS7ZKL
         V2kyN/xl8wuIFi5l6lqJCCSdmZ1HLCRMW/P+dVOcBF+8hyi7I9qBfJnrfJZlkAxthP3K
         R0YL2D6vizdYuyDdC3fnfkciX3a+HLFcim2s2X1coEfpI7+eOZaCkQ87fXZLAyHJL8qy
         N1hKrwXUxrM6mAt5pX/v2MXADDnWwl0KIvNka16s0cPr/QmqZ1K+8OJ0KB9wOJPxOo/t
         verDuNvfd6jgZ5muWqN7QIJvwss8LmOl6M0VHFJ87jlg6+qsSrYy9blkuocP1hFdZo7o
         rIag==
X-Forwarded-Encrypted: i=1; AJvYcCUzmSvCx0F5JMmn6EXlb7OsM7lZ1yc6WNEmNmu+L8DrdMMBgsNbt44dPDKvcEBG/TK6jCYoRSuIBxvq6fE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXC9NcCfGwbTkhEY1UMEP4v0o0dTPTiqJRybic/Mc4saPwOyM9
	MuETVxWV7ktBnFj9k+msk8shhUq9W5Pux3WkgLaDj+Tbayxtp4xlq8M5mNtIRqdCUC5UpK9n4Ud
	yXZyfnk9QHrgnHIrhUch/l8vdfDEIMqnjsxB9sHrMGJg6fgBt9EiG2BR6xdY=
X-Google-Smtp-Source: AGHT+IGmPi4FO3SB03l8RAQeWG+/Aha+MmcwtsxA0LQVqy06ZqxdYVjs8V3H58euhuDVIIMecMwE7RamCReQeleCzAwVoN9jG+YA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:174d:b0:3db:754c:63b with SMTP id
 e9e14a558f8ab-3de38ca55cbmr169552035ab.12.1750762322711; Tue, 24 Jun 2025
 03:52:02 -0700 (PDT)
Date: Tue, 24 Jun 2025 03:52:02 -0700
In-Reply-To: <20250624-serienweise-bezeugen-0f2a5ecd5d76@brauner>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685a8352.a00a0220.34b642.0016.GAE@google.com>
Subject: Re: [syzbot] [fs?] general protection fault in pidfs_free_pid
From: syzbot <syzbot+25317a459958aec47bfa@syzkaller.appspotmail.com>
To: brauner@kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+25317a459958aec47bfa@syzkaller.appspotmail.com
Tested-by: syzbot+25317a459958aec47bfa@syzkaller.appspotmail.com

Tested on:

commit:         f077638b pidfs: fix pidfs_free_pid()
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.17.pidfs
console output: https://syzkaller.appspot.com/x/log.txt?x=103efb0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3a936e3316f9e2dc
dashboard link: https://syzkaller.appspot.com/bug?extid=25317a459958aec47bfa
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
