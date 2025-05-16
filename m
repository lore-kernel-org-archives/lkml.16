Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7B227FD47
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 22:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747436284; cv=none; b=H418CorOTUG3w3ry+4Bq4AEm2c6RUjarKa4HEjHbyetuSnf90+LXZShauRHghu9hQmdd1JxNfJI6a2ykPuRkpbNfvDc+2AqANq72oxdH+D16HjmIKCvKN1PElIRv0oUbP4Ih6zc4V/k7e5HhRt7iaViblZaY+/BunfcaEjeX8tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747436284; c=relaxed/simple;
	bh=crlD6hcYkgqUk2VnsMTk6TwuNBRLpWcxydDqwkXANwg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=USo/FXlDhidTBYCnJMeuwlWbgYeQpCjzRhuLG3jnwC5baZOteQgRO84xTh89R3/z9fg+7rvO0lGTlQK77ywvx1Ee5f+UJvBJKkYIaQ9pzKCtQ7U/NuBfwWjAmwFeN0MVFHg+JGeCfHFvPT28N8Rf3TGRYCKfu6yXTg3D8huAtZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3db6dc76193so48971275ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747436282; x=1748041082;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkCZy4oAbX25iBvlsArzBe31f3vDYggxaZVFFGZRboo=;
        b=Haf0GoAE//10+z6IhsPJjlfyLMNTo3/qetLhAy/dEahhnhpr1g2wxbRJxKbsA0Oy3y
         ntZNHo1ZFNDS/iRAvGyFkyX4JxbzTHhQc1vDeUfOyyjmlr4l6YGVwjiCi3+eG+SDSfZ7
         esRC/P0x4u0XLIzA+ATCXTZx3VKAvodXj/Wp01LzuCZQZhOKe65baMVRgB4F31alKCOW
         jHBQgxqBGBZfR5nQMapgEi4Rms3MG5qcmvl3gTBSnZNV9QhNFAT0lmjutoSPbq6ft8QN
         cc/uhJUIajG0FMibyKseMUHUb95nAh8CT60jkJcZIIbshjOU6W6RQWWxbt/7GMpB0v5J
         XRyw==
X-Forwarded-Encrypted: i=1; AJvYcCXSuTB+CLOiN+02CuH1NM60hIGEVOepKcTl+tkVKmp32bRHfGQbo92U6ePiQBSkEBkMnl9kaQ1weGq/N6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGFklTPwQM2de0aQ4BjZNwKtfhlXDqBUHjRXavvoqTj+WcID4z
	1brCDyLWcVEH6OAyn/p1w17EOj3/LE4m6G4UQJKu72VW7z39lNyXqzNlavqN5ziMcYcRH3TRsHm
	9yfZqVtCoMwLyqmzsbqtFJ2z9suug1jNjj4i+57UPM2ycshKhZeJk68hqiIc=
X-Google-Smtp-Source: AGHT+IGV5LT0uR5Nz7086K5O0wYaH1Zid4vNGxPgFcsJzGd4vSmYuvN7DSZEaJBn3/LkPva3IQ+yfOoGMSc7h1yuY3/yKzxpCgmy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f87:b0:3d1:a75e:65f6 with SMTP id
 e9e14a558f8ab-3db84324635mr82117385ab.18.1747436282520; Fri, 16 May 2025
 15:58:02 -0700 (PDT)
Date: Fri, 16 May 2025 15:58:02 -0700
In-Reply-To: <2705414.1747435079@warthog.procyon.org.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6827c2fa.a70a0220.38f255.000a.GAE@google.com>
Subject: Re: [syzbot] [netfs?] KASAN: slab-out-of-bounds Read in iov_iter_revert
From: syzbot <syzbot+25b83a6f2c702075fcbc@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netfs@lists.linux.dev, pc@manguebit.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+25b83a6f2c702075fcbc@syzkaller.appspotmail.com
Tested-by: syzbot+25b83a6f2c702075fcbc@syzkaller.appspotmail.com

Tested on:

commit:         82f2b0b9 Linux 6.15-rc6
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git v6.15-rc6
console output: https://syzkaller.appspot.com/x/log.txt?x=11960ef4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=753a0ce88f56915c
dashboard link: https://syzkaller.appspot.com/bug?extid=25b83a6f2c702075fcbc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=174022d4580000

Note: testing is done by a robot and is best-effort only.
