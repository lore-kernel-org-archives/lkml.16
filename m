Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05BA23ED75
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750340345; cv=none; b=Sl3YB9Ja358uIxJoxf0jOUcgexF553buosS2h3XRIEovJEmMgOFbT5q1vH3J2OY9RSM/3B4P1GnWzttLzLvgrc4VxvgX5XJcUtFFt6+HoUBdH3mB/J+/Xf7fTzTOXXvI1282GqhxodAI9fB0Fxzj4MiQkF6iQtLvLLuukoQVFzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750340345; c=relaxed/simple;
	bh=DqfOqEMuanba3jKzp2TsYhVq4131fDyHD5JlW+Fvu08=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=etn3oHE3p0uPe8oJaP60MQE6YndNmdQubUQQu8kcjKRrHz33rWptjZzFw/1QLXgXyTJx4ZoSvOESScfaGM8LlgPYq7Uzr2Pc5TUDqc7t3Nhl0N+qrb/w0GhWZ6/KD43P9jWINUzfm8MyFDS95g2PaxG0OaVYqBRRi83Ll4v7DeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddc4908c4dso10148675ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750340342; x=1750945142;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zHBjuRFu7B/O4Zi/00MnQ6LJlotmIhksVHDoW3blbTM=;
        b=AC21+VGK0Pw2UNkvtQrV2CuQ16A9xKTWUE9pNhu5TMR9uCat4HQ7Nj1a8pTOL5DH4z
         nANcWeKG8cVQ+LBHFaMvrVqb4v0WJ+i6bjOgrMRvtGYEa9cOSxDdN/+Rt4NzWKfhMHjb
         c4lMeVc3Q5MhKv6hpOjvnNbtOq3RrMyME6qTMIOJlp+GRGloJ2BSnIlNzem4v0mTxqeE
         nMTpWU9qAzArt7pO3WaAlgr1/ikZ5FdqBMNSG1mj4ogCPj8lguYYdze/xPpKUDyEqO8W
         EdEpG1KrnYQ0QuBKNp1dPRZQbRFYT+8fEBh/nYPg6HA8K5e3qeiW+L99jSS0ANytnPr/
         TPBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO/AAtMtZHKLiMVoHcnsCeP7wbrD1cAwNVxOJhF0mVcDOvFtilIUO87eaCs9gcWCcATyAdMOtpUc8PF8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrC0hXHzjntDLYgXA1DaJiws1TWfYdec2dlAjeatm/rjLxOmtq
	ob0pQUen6fv3ARdqwm2ta2Pr85w9SBgYtRRHRS+4dkWrOn/KrqSql1d1DVm55fs8+tCrSnFBDph
	WbBMXb0s3uovkT5rvAIhf55UaBO9wh8W/7VnncjWAgwVo4isMkduwNtgoq+I=
X-Google-Smtp-Source: AGHT+IEsfeh12lDZcBGwlRcPpBeCc6WNJ8vd7YeKonwpwggwkz4FxUiu7TVoPA9Sik87D6Ud7eei9xOKyROT0OIg//ovjCpY83uG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a2b:b0:3dd:ce95:7f36 with SMTP id
 e9e14a558f8ab-3de07c4c2cemr250218865ab.4.1750340342662; Thu, 19 Jun 2025
 06:39:02 -0700 (PDT)
Date: Thu, 19 Jun 2025 06:39:02 -0700
In-Reply-To: <20250619133753.1203-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685412f6.a00a0220.137b3.000f.GAE@google.com>
Subject: Re: [syzbot] [mm?] KASAN: slab-use-after-free Read in do_sync_mmap_readahead
From: syzbot <syzbot+8e4be574cb8c40140a2a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/master: failed to run ["git" "fetch" "--force" "6e274abda436d30078c0e5fb9703cc1905bba23f" "master"]: exit status 128
fatal: unable to connect to git.kernel.org:
git.kernel.org[0: 172.105.4.254]: errno=Connection refused
git.kernel.org[1: 2600:3c04:e001:324:0:1991:8:25]: errno=Network is unreachable




Tested on:

commit:         [unknown 
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=2f7a2e4d17ed458f
dashboard link: https://syzkaller.appspot.com/bug?extid=8e4be574cb8c40140a2a
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=127dfe82580000

