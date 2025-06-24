Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BCD22D9ED
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771205; cv=none; b=EmuVEiKgK92h+fJXb0vzE/sdIG0+UVVnhHoj9Rl4In8wyN2NFl21LI1Vcb/kijKzSm5RvWuxKSI/sBhvHO/djgcqOiucRN7YpMHyrp2ndEUo8+nDyWwKRsL8uIbtIdrK1Fu2/PMKi8/U5EFJHKHYt3XTNttXzccetwDdb2oPNFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771205; c=relaxed/simple;
	bh=AOHa4ResgBNUehI6K64yTHMm3/Zz62jE04/aYUhhjeg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gzjogGcuwfYi23sl7lw5kNmvTZEg3zYIOcALw8KY9oleEkeTHx1mxerj5GyO81qa328Ek1R2Ui5qWZ+Z/KNN8qXjgezIVPZxlEYtji9fJD9tc9tWCe9GOpa7bw24NMEs9e4dukH4YAsoQk7Vvr8eBGaywivS0A7DVgUG20NHCvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddbec809acso5228365ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771202; x=1751376002;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bqd4Nkc2yPJj9J5fXP2VqvBOm7ZkxyTTb2cdD/KBJyY=;
        b=m7RX4LBcyQiRwSV34Nuw5lv5WfjNMAynBy1WAff0EGTs3k/vcm+lmV7oTzYr5aS+z5
         ddq7pOQvEUkadh23amfjW+flPYYZwpXahT2zB4GBECN8/3iTCA2IGRodu0g+d9234GrK
         E2oT7OtN7i8m6nedTh5uMRrMRZow2Ybr3JvrkLpqA6s+/Thlsg86FgdzC4QpmOrfxdHN
         w+hCo56eY73M3wbuB8Qwj23dSypjVjtRLCHwJx6FQQLIGljKRnu7tWwaPMHIn/vYrept
         W88ZWU3dByqiA96s+ebxBFOZXA/wm5sS9XYwq1zIqcD7KzchIyy4Qm5KuzF/TNvHahLM
         mSgg==
X-Forwarded-Encrypted: i=1; AJvYcCVvqU+5reiHlrksPKI6VXLptJWsXc1yVggXdhLBny3mZWu19edYgdCxtHu9OkLYFLDuFKon86lsA1aFBNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjC9SZaBnobJ9WMnZJTPHTv93/nz8one4a6qoljlDz28m/b6QV
	ZWqBuA2nW/QtsU9n9eo/Bak++NZWAMgovF7yuuDmaac+TEqsfe+gJGdT5MABd17Oh9HDwW59wtx
	skGh3yr4Ec0VX1wUIy4pgmdqRBBX8HbLY/fwejE6iGI+5iDYfKF5+tV74jA0=
X-Google-Smtp-Source: AGHT+IHmIOnqoShy371d9mjV1q/FRb0l5ztWpNzAmS4txzj4Rsv8x14nhqtM5lD40Lke9QKTWoAlhE6RJjMYDbdZt6I6PZas7MEl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c26c:0:b0:3dd:c18b:c03e with SMTP id
 e9e14a558f8ab-3de38c21fe9mr174949445ab.5.1750771202539; Tue, 24 Jun 2025
 06:20:02 -0700 (PDT)
Date: Tue, 24 Jun 2025 06:20:02 -0700
In-Reply-To: <20250624124408.28785-1-enjuk@amazon.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685aa602.050a0220.2303ee.000a.GAE@google.com>
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in rose_get_neigh
From: syzbot <syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com>
To: enjuk@amazon.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com
Tested-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com

Tested on:

commit:         78f4e737 Merge tag 'for-6.16/dm-fixes' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=157e6b70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4ec8b4e4d31ae914
dashboard link: https://syzkaller.appspot.com/bug?extid=e04e2c007ba2c80476cb
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=140b470c580000

Note: testing is done by a robot and is best-effort only.
