Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63EF17BCE
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 03:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751686925; cv=none; b=mdWAANpM0ZQXSzlvP3Hf+KLzUepN1bEyX44OCTZ3Y4eT1/L/z1m0nu0x3xm5NOnYo13jWzAclCgWs3uzttshUKGXMfr5q8dewCjmez/BsVuB8MNkVoT9WufeLG/Fa6h/nx4dlL9ts1jWcpYCZS7jFqVjD7MukmEAs3sGHY49mwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751686925; c=relaxed/simple;
	bh=k+WQV7w5OrAC1O61OXTjM3uvf0AHZ8o6RT4HDnriYsU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=AHArUoU24/KHMACLZePdZYbowIftURDSq9NiitxrI70O6bDsAHBpgb1nMysk+umfYgjuazA3MI0qkywCXbmOEIels2wPs0XlCclfwyHMXXvmFpkNf87ycTAFfvsUEoJLR2jCLepTWERNNXLT7SHWEUgo3aGCKPtxyommoLCX3kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-876a88d14baso277918339f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 20:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751686923; x=1752291723;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lrq2wI5Tpu7ax8GLpqJWdzkizU9orWkTYeytRCxcIIw=;
        b=X21J9EAgo6uGHZNKy5tzapMSazJU1wQ6SmG/wWLcq+dKx3kw1cfpb/ZeEyk4PhOpUH
         EhE077rzdA/dsXmJwkle8a4hFXlfemi+NuqSXCW/nkjHj3YrheHI4UHaHlhZS7GRsQh0
         8tmzWy9Z4WhQoMDgjeXPP7rSo+j/BKIfO0zBF7R3szvzR92gUh2Pk5Z0AT5Z/LK7P6dj
         ExK13hko2wZ0Tbzur8wvGmo/DSjhxU1xO0xyOVcOOX3+iOTlJHteWpBd/il43ujkdhfV
         tkEjh+X6ZENgpJr6exbqDJHC79INQ2zd1pCBh2FBNnNKPTPspsUwSWWMI8QH6PA/VraX
         4UtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUOwx453HvP0LB4evUpQ3RehdPo93WzUyGPjg+VfKPX7IIU+hfm1CF6sSgFiRamHhOzoiPgzEW0KIXGYc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+gXqDuPOgDzZGvVB0clMaYz/CfeKh1RPPWhO8sWyHgboxpkDp
	7Zi6KJ0zX+OlKexiHU8rIDvOG6ZsrcyKCGQwU8jeZP90XLfK04j+J/Tswb3JZFDBfS1Hydo3v6x
	UPb6UUTQsR6dSuGNN7yO/41uBro7n6h3YnVeVfERB9DotBriQqBrwX+gsRgs=
X-Google-Smtp-Source: AGHT+IEcIlvB22W0OTWuJ4TG+PuzFwzq4VPfr/uM+QW2eM/03tXRnL8yIWR6bmjd11NWdGyPrjiatHjl1xlbQ4hGhy4HhNnWdWmM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f12:b0:3df:2cb4:56cc with SMTP id
 e9e14a558f8ab-3e13ee92ebamr9867265ab.4.1751686922985; Fri, 04 Jul 2025
 20:42:02 -0700 (PDT)
Date: Fri, 04 Jul 2025 20:42:02 -0700
In-Reply-To: <srmiqb5n6iqsxric6cbkrpinsfcblpowhpijfzjjakiyhs4och@2vrutii673vc>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68689f0a.a00a0220.c7b3.002e.GAE@google.com>
Subject: Re: [syzbot] [ocfs2?] possible deadlock in __ocfs2_flush_truncate_log
From: syzbot <syzbot+6bf948e47f9bac7aacfa@syzkaller.appspotmail.com>
To: ipravdin.official@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6bf948e47f9bac7aacfa@syzkaller.appspotmail.com
Tested-by: syzbot+6bf948e47f9bac7aacfa@syzkaller.appspotmail.com

Tested on:

commit:         a79a588f Merge tag 'pm-6.16-rc5' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1492ec8c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=418cb04d9a81846c
dashboard link: https://syzkaller.appspot.com/bug?extid=6bf948e47f9bac7aacfa
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11bac582580000

Note: testing is done by a robot and is best-effort only.
