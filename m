Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422122C15A6
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843565; cv=none; b=gtbqT2XESEy3E5VYohwwGEfjp1dqhZneO7TnvPBU6W2MX4ym9J6mseTkOC/8G4bWxHVBicBWULZ8yhkzqKxD3nmJ8vptRRZWCpt4XxFLdHNNE52IkXVUfi7yCVz/Q0EUiVu9iKvRgFPoq054jkHiPo0CHNdNWiCb7eFEsDfsF30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843565; c=relaxed/simple;
	bh=qUPNZnfiHXpVJGIU/x+D5DTJ1JEYjPYS78iH53c62YY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IC2c0qVGEEmOMDEXmzmmkb7HRvNBDILdu9DUvz6z38coyuNsjjuCQfwUNwFbrkYqz8NZ7pkx4Gh4+CzdGIRLt9S+FXn/izykbB2D1/3FOH50G5Jly0sjQuxu0hU2Xj07kLTrUxlQfx9u++PW4wddG/doUjSdLZzs+wbPvQEv7TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddcb80387dso6826775ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843563; x=1751448363;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EDEC+2bl2jbOP+vy2256BRfU0S2KmDjZ98enuZrGuoc=;
        b=iJpk2xW+gTv55ujd6jftQqN5BMPiw7AXlNzdbse7oPsA1bJ+UsO1R+5iEpN8Yuhsrk
         0cI4p57zsPI87XQKNFpLFY4nAxlfRwRH7CoEEr5s+11eODwdg94o+mBP6wGmMvk1aw6I
         zVDlxyjPzDnmf+LhiU+DIp74uULU7XmD4klrdFuKcbBNlHvhhyQA6ypDUuhJmtbtsSeN
         UdNEX/8PTUXKqOnwaj4OtjwgsdX6+mcjKtk8O6v7SxFi58Y/RxBm0OTK8b7NxW/E500p
         WvfeZvvudTrW0+WQqgvy6YYbHtMJb5OJ+Pr+he4j4UAUZpiTEXZjDHzZtJf88LsNgrSL
         /myQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjXq2cfVSD6tIeMlmGC/lFdd+/4a8MYYWh/25GSG89wCZkOuLkwnMK2PwZOUJkIuMjqrRdNukVdgUbvBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNvSfWnoXn5f1z2quE36CGhhTqk6ZDgviadMjstUWcGqNn6PjE
	53lFAC4cyf85dzrRIZjdhzkVffRvtq7NccuzUUjMQsN4j5oxIj4w7CQA+xVW4F/5Qqb1Or4CZnV
	S8L8NcdqhdFATNuKD+hpO8j8fxc4fhVc3ar3tRySWhsde0ekZE5GE6EH2QaU=
X-Google-Smtp-Source: AGHT+IEFNUo3zPx8PBwk3JcU7J1fDm/BHs2fK+Uz6glB15XNIr7uumAtXsVB8pHpEUIIT7lgi3ACSGnLmUciP66fSN1cXag4jed/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:178d:b0:3dd:c9e4:d46a with SMTP id
 e9e14a558f8ab-3df32c8ac64mr23277455ab.7.1750843563459; Wed, 25 Jun 2025
 02:26:03 -0700 (PDT)
Date: Wed, 25 Jun 2025 02:26:03 -0700
In-Reply-To: <20250625082730.1756-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685bc0ab.a00a0220.2e5631.00c2.GAE@google.com>
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in rose_get_neigh
From: syzbot <syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com
Tested-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com

Tested on:

commit:         7595b66a Merge tag 'selinux-pr-20250624' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14e0d182580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4ec8b4e4d31ae914
dashboard link: https://syzkaller.appspot.com/bug?extid=e04e2c007ba2c80476cb
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17775182580000

Note: testing is done by a robot and is best-effort only.
