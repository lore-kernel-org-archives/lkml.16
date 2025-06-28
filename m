Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40BF1372
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 06:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751092086; cv=none; b=t/vDPeriyPhwp0c1Y382wlUfvfyJO2CYyu1TZ0HY0uYJRo2wsXP0BznlrysZuDbwV4RpdLlqHd5jkevPqrUKZ7uvzSm4IDDc6wx03l90EUJUymKggD5w2cl7e8tbNwgY9CaOYkU5IbLKOyP7fjgm5syoQ7Y9mS3/kOCxyNYHdJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751092086; c=relaxed/simple;
	bh=A8GTjQ5EWkyJvctUYg23lQOkYoXlQ+FOnGF0sX390+0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WsZkfkFCsKFuVR0QoJMdUS7XOxa6kRA9EBADA/vhkUVZfSCEPqTuW8J/3tWLNm8tNYdNXgWoFoSkbLj0M0shCn7oWuDxLJ7u8ZFs0O0908NfLAidhJaAdJZjQ+4oYURDW6OVUAKx63d6QnaZOdHOs5115seJBiEJDVfTjkMKPGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddc1af1e5bso65298555ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 23:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751092084; x=1751696884;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y9uf+zzcc8gReQd+XkvEZGPMroUBa6CZYww/5UegOkc=;
        b=nH411FoRCUcEekGG7XaG+SGwCVh5mo+kwbs4jM6IZfffQhZd+6wGsHV90xBbtGR7IE
         W1BlmVDXbxwcdeJ3/H51b57hUuV9br04pttk9fHTUM8Dup64byI80iTSYmEsvfDShwgh
         qsFE4DgukIlT1kWmRP1COMrOeggDK+ZCiwjO3xnCh+ZZHYzCBCSUJRH+XK2i29tDiM53
         O+WDjNt1unP0JCH8bqtrLRa5bN2LuguX2jW/uCKTHPCyYYHyX7/LoPFUD7beHoe2nCYB
         sBeWTIqlOUYqsjpdGbRRmgk/mdaX1Cs/osw3oENnHaMfsf8biNGUu212W9kJRONK7Rxt
         VT9w==
X-Forwarded-Encrypted: i=1; AJvYcCWT4UtAQGtyZ1zVfA28U5NuLgvtEjupGv/88Tap+fBsbKqlF6Z5/hRqACgkb7qZR/G4k9g6o4fFEat5ux8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt+seaQS1JSkPF8PeqPlsadv0d3U+C0ueoHtg/YGWNA6Xgmo6H
	JtnOgDiu7EdPvE+Qb8B5nc/Rtd5kwT2oo8NMAIE7lyutnkm/bZWmenAHcQazcrNy8Rq0ZdPme7z
	HHrNiS6S3WBG0NHsyicgd5M8gnHn4DzE+gVekwIUbo2LCnTYOmDGyzP6WZNg=
X-Google-Smtp-Source: AGHT+IGRR4aVKn5HXrQ/KCN8e8xFUSXzP5BH78rAbek5EqTzP7Ol2nNsjWKor/8F70tgr3oKM8DJsPKLxw6rCnVibwh6VJBMt9vP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:318f:b0:3dc:7d57:30a8 with SMTP id
 e9e14a558f8ab-3df4aba4e14mr69389555ab.10.1751092084149; Fri, 27 Jun 2025
 23:28:04 -0700 (PDT)
Date: Fri, 27 Jun 2025 23:28:04 -0700
In-Reply-To: <20250628034941.2001-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685f8b74.a70a0220.2f4de1.0008.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING in flush_delayed_work
From: syzbot <syzbot+6f433bde86418d3f4fec@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6f433bde86418d3f4fec@syzkaller.appspotmail.com
Tested-by: syzbot+6f433bde86418d3f4fec@syzkaller.appspotmail.com

Tested on:

commit:         2aeda959 Add linux-next specific files for 20250627
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=11298982580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9e7e53eaffada5f7
dashboard link: https://syzkaller.appspot.com/bug?extid=6f433bde86418d3f4fec
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=158a8982580000

Note: testing is done by a robot and is best-effort only.
