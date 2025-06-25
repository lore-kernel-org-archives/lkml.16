Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB4E2F948D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893784; cv=none; b=ll2X/yXZJFfsMRJcf3kzt11K4p2g/drNKaUZbYjvUYF9oOCgqGXkrBwuQlkPbB2KmsVKd0rMx3Nr7h4Kw7Y80G7L9NaeqEOYlbbdEt4DGWvL41J26ZbJLvUgJrkK4I4yFq63GoXXJS6OyjGxiYLdl5K2WHp9ipZx5G4nWuWs4rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893784; c=relaxed/simple;
	bh=AwSXZSs3OTn4VtXJxJMFI56c6JYnA3ogAPeB7PgCICc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PvoA/aDJ0wg0plPyRiij+ILv8fnnn5FUHexEoJR4Bcx1e6DhY93hd5yqigzMdjFH5ib334gB6RfUREaLw6XDG9rxYLG7dM5FBWkXo/MpYbimdnMFinzUvKUO34y8f0p2TYpq9ubvaRWDBkTW7ZunwAJxy40ydGKOxxlm0ipj9Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddc147611fso9249025ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750893782; x=1751498582;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNt304X6mHuKIoSlL5NWbJdzWVgNAFv9scHJfNI0F4o=;
        b=ewWnuzIrobGBrfSrSmTpdh/z3jUq5O5Mu59xq6Bm65nUZqwzmMh/JntrnaRiFWc831
         MZFYMx9BcNdXDnbPlyjYZuy4i/L3Gg5V5BbrlAR3ZDYx4B5WFBVXIYEc2t7SGxSzkVDh
         mpzwcJy3Njg+1/ZxytDm4fyvDTw9avzO2KaouqvOO9woSLrACCSqOM+sFwE70jtQ/khZ
         4hkhVUJXyyUBvUd3aGDrwMG2qA5nmp4SrShDvkWAxLFU6UGht91C8A5UDsjhYoSvaVXl
         hL8vR7yYYvuvM1MXE7cLxev93wEP+CsWbK9UWjIwv5tlw6B2nBgQ1XuRtvQcGWDtu4yd
         2gKw==
X-Forwarded-Encrypted: i=1; AJvYcCWC0DrBVkcvuySjWv7m1z1Bzqu2BxVSu8/+u4KRP+PghGeeGoe2WptrtEr0kOQNJvK0MZat5KPwILGFq2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJtVwHUi2+pSxqMDV6zgE5ioOvb/RNGo58rKwT8MPdq80Ms9iY
	LvrOKNr/bjkbXO5hW07XijKgMNlV9L806Z4YEyI83CR6BheiCjiYaemd2cwbuXDyo5gyj1Zwtkj
	3ogw/LQHJvPCX/DQhoX+UhyMLulsTQ3XYH709LFRvcu5IgvqRwfc3M1TNEqs=
X-Google-Smtp-Source: AGHT+IG/FDfu+tGy6Kqy/u19VrFF0UTelg6OsuSSpjgYDtNvDx/8bwx/GlwpT1MqUfMa7jLpR5+Hj3NSem3j5jnP5I78sw0FJnIk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a2f:b0:3de:2924:e244 with SMTP id
 e9e14a558f8ab-3df329e2ce8mr61963575ab.16.1750893781834; Wed, 25 Jun 2025
 16:23:01 -0700 (PDT)
Date: Wed, 25 Jun 2025 16:23:01 -0700
In-Reply-To: <0000000000001bc4a00612d9a7f4@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685c84d5.a00a0220.2e5631.01a8.GAE@google.com>
Subject: Re: [syzbot] [fs?] KASAN: null-ptr-deref Write in do_pagemap_cmd
From: syzbot <syzbot+02e64be5307d72e9c309@syzkaller.appspotmail.com>
To: adrian.ratiu@collabora.com, akpm@linux-foundation.org, andrii@kernel.org, 
	brauner@kernel.org, david@redhat.com, eadavis@qq.com, 
	felix.moessbauer@siemens.com, jlayton@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lorenzo.stoakes@oracle.com, mjguzik@gmail.com, superman.xpt@gmail.com, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, viro@zeniv.linux.org.uk, 
	xu.xin16@zte.com.cn
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 65c66047259fad1b868d4454bc5af95b46a5f954
Author: Penglei Jiang <superman.xpt@gmail.com>
Date:   Fri Apr 4 06:33:57 2025 +0000

    proc: fix the issue of proc_mem_open returning NULL

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1604cf0c580000
start commit:   80e54e84911a Linux 6.14-rc6
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=77b023e9ae0dbb6a
dashboard link: https://syzkaller.appspot.com/bug?extid=02e64be5307d72e9c309
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=101e3b8c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11ec67a8580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: proc: fix the issue of proc_mem_open returning NULL

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
