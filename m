Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4868718CBFC
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915924; cv=none; b=ITVoaz2ZNX1h5gSuhyM4TQtBImdo3VB4pLJnRkW1saq1qZJjlaZtCpvgFCiZbO+tqlfFB0GJJmS22Jq1kJpGVF3mi3Y/uTEIqAyjvkn7YbYBnn3x9qre0hhPLeadMaxkM0bnPWohrkIyyw8rHseXTfgUeWw4Ycqjvgk3w5Tyhtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915924; c=relaxed/simple;
	bh=K5Bt1voFP3ehvfH/dthTfyX0UCBGf0JqzzHzyUcZGNE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LWQTlMJNkxMZlsIhtd3vWSHgei/3EUN4AZDImBbjCaC5nr7kX8epTndzIJbZCt+P1XK/6pGqVOAYj5WXBbqiIhSex0SoTEnWngSStLINRtJrt3cW0XVCGp6wLjSgetuJBT7O7OSymxAykU6bD4IcmnteqNKFdX8c74EUzqLk8u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d057805941so13965695ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:12:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915922; x=1739520722;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uoI/9yMJWIyk49af8hAeTtawxbkMylTYcGxUYYTScXQ=;
        b=HHR51W6lr+0nQ/U40EkJXr3yKufPvcNNHnOtRUt83c19/cH6uA3V28Rnd9Fu5j6VJ6
         sOx5fK+UaWDNuZH1B722yE4mjGijFOEpW+o6abGpraGyYx8+OfGbWVHVeJNrAndP+i1N
         Fs64QT7bx2E9VYrRRi8+al7ZI93dNwSctP+OAFbK14iTUhVkKxjAaPjmLW7bMECnlbm+
         49gqavYHru/4t8ZH7riKmI/UaK15CAvC3ja4M6rvmTeFfhViT7v0wxYizjHjx0/5n//D
         dAqj1nIc2xrySTNTrnRB9vGBxHgsRz8BVzTGVfi3kZERIV7zKPme0mimfLRUeNGCF9/Y
         jN6g==
X-Gm-Message-State: AOJu0YzUH+xEx5ecLkWe4zZb5tHJ0bjePmC4jEyg2VB9WfTqich3sZJa
	ynRhNsA8F+/tvn4i8vulA5MA9rZ17YTM0Cb7aAPhSBpQrg8wbg3t7QYKnOTZHMNQgdSlP+f7jOv
	te35F55xiiW0AaTt/jiDJ9UZc6fdZqmehKhui6W9P9twElwZ+TPDkkwc=
X-Google-Smtp-Source: AGHT+IFdU13OFI/EucJOty5HH+f1nwKzaaiSvMLu7rU7noQ8CeoA2cYVxDubkciYS5B24S0LOZA2jVDAyjIvywmJYhHYfreWFXoG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3d85:b0:3cf:b2ca:39b7 with SMTP id
 e9e14a558f8ab-3d13e1852f8mr18756485ab.3.1738915922372; Fri, 07 Feb 2025
 00:12:02 -0800 (PST)
Date: Fri, 07 Feb 2025 00:12:02 -0800
In-Reply-To: <20250207070223.431660-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a5c052.050a0220.2b1e6.001a.GAE@google.com>
Subject: Re: [syzbot] [overlayfs?] general protection fault in clone_private_mount
From: syzbot <syzbot+62dfea789a2cedac1298@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+62dfea789a2cedac1298@syzkaller.appspotmail.com
Tested-by: syzbot+62dfea789a2cedac1298@syzkaller.appspotmail.com

Tested on:

commit:         ed58d103 Add linux-next specific files for 20250207
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=123a21b0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=244a34ec1429746
dashboard link: https://syzkaller.appspot.com/bug?extid=62dfea789a2cedac1298
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10a41df8580000

Note: testing is done by a robot and is best-effort only.
