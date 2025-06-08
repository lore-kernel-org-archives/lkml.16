Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72E624DCE5
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 14:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749393546; cv=none; b=kGZw+vN/KcQQKP5HDH1kZl4mT3aGLHZqJ18kQSf9WN0G2MVV+DEKYlHybRz+e7/2dHz3YjKokFPaD+Z6GDfqT5pazuIv0pdjrAXMafgralWK5huO7Qb3v5bUX9qgY104hRRNx2BUoyVtXThYMxyn98Yhun3cWXDYt2QS5Py+bAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749393546; c=relaxed/simple;
	bh=ANm8RttGvSJuhx0wrKeTt3NL6cimr89RyDzhx2D7RZo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XHgK9HzM7kinUETZEQ8hBidwJzhqyqj71SXZIjkaIyqnUIxrrOaXmLDG8w8Z8e83gGrJsHeOTBRVdNxOlqQVcqgvSate5akNZ3J3l4B9mUdX9ojy9nbPtEhoH7kVmLVeaWIIyYion7rg91q3D4h6T39ncRmSmGyklpReeM+W2rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddc4908c4dso50222035ab.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 07:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749393544; x=1749998344;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Byyo7kC3a/3rB2EMu+T1mfO8ZATgul+9Bm2fnUNoq7A=;
        b=t9lvw1QcWM2ZxtF6MCCbAr9htEJkpXzXGOHR06EWxMTD5ljVRZp5qo+O3zkxQOU2JY
         2Z11ISAhe3Z9DEvDYerImpJVbaUhilKFOXGx0HEjgKKk9RhTgoud9tfi2Z+mb7brK0JO
         8Vp6s9zcnxrWvYcWcBMa5of4y1tWzbYmz48C/0w0TIzO4HHFxIXzERqQ4ymFTDn/w+w8
         LYbejZ4lJdjWbxjXUBV7MveSO7Iawmiqr8q4B5xpc1mtGUyCurkPwzv6WMefv66BwE0o
         VkVsI0SWqa4NccbtSXy6y8FJnWyG/dZdV+8cSA6zxFnH/cfBr5BOe8Q2CLc/LAkDLETF
         uY+w==
X-Forwarded-Encrypted: i=1; AJvYcCVrj9L1fFq/v7kXM9JwqZQX4nD97e8hkI8S2brW8Z6v/svwyZBjHC+SWMF/y6rVUvMwKNrmOSyoTyObmNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeOR0l9OpuEK1geHQHMGK/ncEeldnwmy37m5O/qUD8F+yiUqib
	Jbfa7aW0FHB3GTWCI+3SKb+0I263V8BUpPfQQDZpPS8lnX0S5dQX9plhauab2Y8ankqzvdZ5is3
	GH9/Co/50LcuAM76GclVaET54mJMDuDc/5MpkRZAW5liS28caXnGLga9SA70=
X-Google-Smtp-Source: AGHT+IE3/7VhsAobctqaGXi1Yv2kjR1bAWM4ep3qse+qKfQCsnidE0mOZE8tDfBEq57yMyQTPHpjgfC2CbxduJ0mwt1MtEZU0VYh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a8a:b0:3dd:a4f0:8339 with SMTP id
 e9e14a558f8ab-3ddce3fe9damr114184095ab.8.1749393543935; Sun, 08 Jun 2025
 07:39:03 -0700 (PDT)
Date: Sun, 08 Jun 2025 07:39:03 -0700
In-Reply-To: <87frgafi49.fsf@posteo.net>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6845a087.050a0220.daf97.0af0.GAE@google.com>
Subject: Re: [syzbot] [net?] WARNING: suspicious RCU usage in task_cls_state
From: syzbot <syzbot+b4169a1cfb945d2ed0ec@syzkaller.appspotmail.com>
To: andrii@kernel.org, charmitro@posteo.net, davem@davemloft.net, 
	edumazet@google.com, horms@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org, yangfeng@kylinos.cn
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b4169a1cfb945d2ed0ec@syzkaller.appspotmail.com
Tested-by: syzbot+b4169a1cfb945d2ed0ec@syzkaller.appspotmail.com

Tested on:

commit:         e5c42d49 net: Fix RCU warning in task_cls_state for BP..
git tree:       https://github.com/charmitro/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12750a0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c6c517d2f439239
dashboard link: https://syzkaller.appspot.com/bug?extid=b4169a1cfb945d2ed0ec
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
