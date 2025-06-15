Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1750257D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 04:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749960124; cv=none; b=q7Vy6Zt5O5240LDuY7Cxi0Dd7QoIHbteEXDYRyLnF2CZ0OEiGeKNVhlM+6AVVD9sh9kH503Sfl1T3aLHvu+rlEmIojE4TqpfbeczC2d2bqk2uCmhDR/3bJprvYk565zhBmJ/Uqy52KOJmu3HaDQ/34IyghZUiPBkh30lzgMLqMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749960124; c=relaxed/simple;
	bh=ZP1bJNJcNnb7l99z5r/bJYQnfEHmhbkP5pJU++7SdJw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=o40gSVwWy7nYlY6vz3x/FEqIwVK6ExY1yNhqYL1ZUdjg0d8HEWTS48jLZpzs+06kovNN7dJFm1fk4slJM9B3I6VIWD4lrWZGBL6l6J/e3v2IdJZk90+1z5rSDkQgFPkJhDSDb4OGkj62cZRgC60RYJYQM4LIQBPiYoLuI9PhfU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86463467dddso371852539f.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 21:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749960122; x=1750564922;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=skIiczAq1NkJyTS3mmGkz1leJMCO5pTpUyZ75go4uqg=;
        b=ttukCA0MKaLqDT+Eqr9wCW8OmljTmFdbyp1ab2OlqAN92NLh/ih0/mrYq+lRu3noLs
         P4mR9nljJAHlywoUAqS/nmvE9ZZnYoZSRHvp0bloXm65Vw5XrPhzFJMM5SpR4HESsgFW
         KTuo0WWAhUvAUL5yS1reebRMl64nQXtIWE1rRf48D4T96QRFiK2q2hD7E2YXtfJKasdd
         +3wUDJ2WA7CplHKjHGEERB3vKznwgUuhQZ2n95FmEiprX03QOSHa0ssougGPZdzNFosS
         dn6+hLo1k1CtA1za7W6d9fDhgkR/ZabQZWc6EISjQGf9a1QdnJl9ApWuTNhyQ3EQe3Wm
         ZcTg==
X-Forwarded-Encrypted: i=1; AJvYcCVvSOI0oYswEKqMuzmbCK4d2+R72qmyATjvigQBjmDfDt1//BDbN1NT6xa8QwySabhtoZ6UejJY8Ur31/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR3U4F6jWnTIGKHpQqyFv16axDxpSEexG+1C13BMrVwfAhLueR
	5dMrTTJCYJAUw7Z5+F4Au4oYNuD72kvGy69MAaqrtDvbwjqdZU6V1Nv987g+QtWrNeqiyv3Vyet
	TZiP4rHkCNo/rO5+YpZMzlIm30EavPKTfFbv0fhXoLQOOLDRVRkiWslR30ZA=
X-Google-Smtp-Source: AGHT+IHBmq7qDSN75o1pZE1NEkE6/cz5aYGaMeGi99hYD7SWqxaOo4sZ+QUIeOHmNsFnFymQT22JqFZAK8X62qCXK/zfN90kFvQh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aa3:b0:3dc:8b57:b770 with SMTP id
 e9e14a558f8ab-3de07cc20a6mr47409815ab.11.1749960122027; Sat, 14 Jun 2025
 21:02:02 -0700 (PDT)
Date: Sat, 14 Jun 2025 21:02:02 -0700
In-Reply-To: <tencent_E8D075F57739678A3C9D3726965E37FA4A09@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684e45ba.050a0220.be214.02b9.GAE@google.com>
Subject: Re: [syzbot] [iomap?] [erofs?] WARNING in iomap_iter (5)
From: syzbot <syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com
Tested-by: syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com

Tested on:

commit:         8c6bc74c Merge tag 'v6.16-rc1-smb3-client-fixes' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=169cbd70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=162faeb2d1eaefb4
dashboard link: https://syzkaller.appspot.com/bug?extid=d8f000c609f05f52d9b5
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16b5f10c580000

Note: testing is done by a robot and is best-effort only.
