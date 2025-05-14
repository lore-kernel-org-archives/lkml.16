Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921D627A929
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747231086; cv=none; b=XGmdN1CbTvZ5c3NY1Vg0L13UzEw84Ymuxd1wVqGLQZIoWon428287sXC1NQjXpirdzPLVFQuy9g6ZFmAlDvtYgUS3oFDCXSU10kCDFMG4FYJmZMwErRnPRqcYlBnA25UJvJhyjia/AYL84Hvac1M7b/986KM8pOrEHPVZLKt6zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747231086; c=relaxed/simple;
	bh=LWyAOvzRnXuIZA8cLevaGutmbqIQDsqlc4rNxMh6jXc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CcuZNRLPReyrmJffc6momqIyGGAvByOTHvOSDSyAMEemXAqa2FTFN58gEir26IoXgvhlqNC78tXWIbJxpFwqPoU3h148ol1IRX+MgFF1msSNG6QnI6SvZsSlSTDMHx551nCsSMNo/B1YIbzuluRPGv8fr7aUSioa4BLXM3LFOjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3da8e79f6c6so40190485ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747231083; x=1747835883;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D0+yF4RILSxJaNDLV//8NLYN3xc4izbjtIG3syz7JXc=;
        b=X4CYS1xVmYeQxfMPEBxpyGAd6UuDmVIme+FS+8W67GFmJZawlhWp3Q0N7HjA41S6G0
         9ITyu1158cYlOEIMcduTpJ2FG3sJJAjjzMevtOfvBb+NpFEd6lvj8ljjPAXD6crHJJs/
         zUoNo9jrzRaVTQTfQwry9i78DUWZimKf/wNtcLZP4wiFDBeFDWaRf0jJLS4q7Q2DxC67
         wTDziqUXpfccKw+tFu+F7w5yyAPHs3ibVfXHe0Rjnb7+qwG8dJtlG5W3fDxONCAaZJ50
         cjpEAWtTKAW2ElAVOSbHqyaKva4v2coJFkKEnvrzPebfsnsl86omhZT29KhoFmi73wjP
         WKQw==
X-Forwarded-Encrypted: i=1; AJvYcCXopMH5TFJFTQKr5SLw3WGs659DvbJS+9DVHS++Islr//YBK8iGy7ajt5DDJvlLU7o5hKjZFrBLhl1/C4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBTRDuMfR77DTiVMK3m5m1EUhgqrKxDZgZ+qW7ZYc+PFFwvQT2
	5Ncw4KIh42Py86PGTfeB1XuzOTO12wVNh3xZI5oDizrp4ZrlMTqdhayUmJ1+00yiAyZIJNJebxR
	lkw5eD9mNWuzCAp+SKJIoosHT8h+wMGsR5AapFTsHOiPKyQnkJX0OXuA=
X-Google-Smtp-Source: AGHT+IG7nK7DACC9FvxEeV9+wB2/wCISw0/U2axZ45Q+rzSrmJ5n0M5GBgXa4if78wtL/2uUoiiQbLrwRmJIqknQFKiKHVqvdU08
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b4c:b0:3d9:6c9a:f35d with SMTP id
 e9e14a558f8ab-3db6f7ad066mr33144265ab.10.1747231083625; Wed, 14 May 2025
 06:58:03 -0700 (PDT)
Date: Wed, 14 May 2025 06:58:03 -0700
In-Reply-To: <67f1c7df.050a0220.0a13.0256.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6824a16b.a70a0220.3e9d8.0015.GAE@google.com>
Subject: Re: [syzbot] [mm?] general protection fault in mremap
From: syzbot <syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org, eadavis@qq.com, 
	jannh@google.com, liam.howlett@oracle.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, lorenzo.stoakes@oracle.com, nogikh@google.com, 
	pfalcato@suse.de, syzkaller-bugs@googlegroups.com, syzkaller@googlegroups.com, 
	vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 36eed5400805b294f1df39b0e3ebc5b7971b3c16
Author: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date:   Sun Mar 30 16:20:48 2025 +0000

    mm/mremap: do not set vrm->vma NULL immediately prior to checking it

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=118356f4580000
start commit:   a2cc6ff5ec8f Merge tag 'firewire-updates-6.15' of git://gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=adffebefc9feb9d6
dashboard link: https://syzkaller.appspot.com/bug?extid=5250c4727db03e3436cc
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1693d404580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=178ac94c580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: mm/mremap: do not set vrm->vma NULL immediately prior to checking it

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
