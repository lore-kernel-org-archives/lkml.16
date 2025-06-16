Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CE2288514
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750092066; cv=none; b=MKTEke5rH9VHrjLD/vdg7Sdpk+QoBKGwIyq3u3g8vib4nDxO0bVfJ8R5K1BMAUD7jDkxsV13E2FXWJaXjysS0XKMBNzC9o2ng8jhn+0/vF8Rgtd5xfkBsg/bjTRBtipB3xobGb7D/NCHH8lSXPaz3LmAAbtM6V5aDzvK1HLDOiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750092066; c=relaxed/simple;
	bh=YQlfqHXFMjkXG+QwxQehGbP3b+0lafdP0XvMgYigkPI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MqGp3cRnsT1dw60Ze077Q7p6QsU4ADiuQUBTTnODD+PTZL8WBaV+Irrf651oy5di/AWhFXzMdv30Muku9gHDNYA8GWQ5oJ1Cv/lRFakfBDP8y0rSe6wJZ+GgS9KSn/k0sR8y65Ub0OIy5KzInoc+VBZ06gdLTUkkuymtXWvuBkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3da6fe2a552so111580465ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750092064; x=1750696864;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V3YVJ7730tGgRpjEitFjjqGZ41i1VnAPsCDq4gx19VY=;
        b=prmdKhFnG7oG3/pt78V83pxFe/xRhksGzCwz3uUg8/umD9DOu7zGa4T4IcVK3KAY89
         WVyH9E0J4rLrGV5MLJ0U740GVKXVFlMVhbW+spEcpDEhxvGd8kojHU+0hoT+kfK869w+
         z76/d9aaYFv062+8c9z1ucnEt5ITuPGfN6kp+b5VbohP/dDTHia5gvi7ikTTqJReuAaF
         3xq6CHS6hc01P5QHIC5Kn4/Rd3nEQnuO4N8fuW4JyKyD8rP2ZoQSQwwZmQnaZP31DWPG
         ZQTCiJiWKLzeMPmdMvEQn7aH0IRceWLbg+kJuwfRJDLbX7/DuJR4Fk3PXFw31/C4s0sV
         itCA==
X-Forwarded-Encrypted: i=1; AJvYcCVs7tgH/AyapR9x1piF85nfGx8TcAl2V8xA6o9v7kXW3Cbb+bdqkP5zYMldl6tk7XJrUTBh/O34GSfCpCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPyrZNKERApsLeWeediJQQNNScTfl+/IpicJ+sedCxpNPd80l3
	4iSWV3PWVtMMpB4xExUz6WBtujkUT35Hj/e97V22cqWK5r+MAqSrf/1+3Vt6o+mE9Sm3jpwdi8u
	AE0kkcsrp3hwim6eiANzfZLN512K8dcpX4AXCvPPX0hFdASFhwc+NMxrKitg=
X-Google-Smtp-Source: AGHT+IEgSLsjEk6wBL7H4inZGzjwbTa5xUkbOFhLObTZ+jgw5ICoBlR9VtYWvlUFTxMVqub0O6VG2z19ig4cP5/9tWbkMnCjdNyj
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:194d:b0:3dd:c78c:ec3e with SMTP id
 e9e14a558f8ab-3de07d01d7emr122082285ab.22.1750092063406; Mon, 16 Jun 2025
 09:41:03 -0700 (PDT)
Date: Mon, 16 Jun 2025 09:41:03 -0700
In-Reply-To: <a454ce9b-807c-4f22-98fa-80a7da98e2a9@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6850491f.050a0220.4562c.000a.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in hdm_disconnect
From: syzbot <syzbot+916742d5d24f6c254761@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+916742d5d24f6c254761@syzkaller.appspotmail.com
Tested-by: syzbot+916742d5d24f6c254761@syzkaller.appspotmail.com

Tested on:

commit:         e04c78d8 Linux 6.16-rc2
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12c915d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8f72e140c622500d
dashboard link: https://syzkaller.appspot.com/bug?extid=916742d5d24f6c254761
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12d70370580000

Note: testing is done by a robot and is best-effort only.
