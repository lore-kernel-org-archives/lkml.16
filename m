Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF36347B4
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 08:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748508848; cv=none; b=dir0mszJXCE7ygWJ6+dXSoxDDUBxQ7I+w+d71G6rrcfVIH4Qq5N6kMEhFLu4GFrJ9X463ZAknKo0kpXhKwHhxtV/25zq18nNSL5ImuCkcC3b5T99V8wMqIg7w/zGF9+rus5do0p4Btx0cqEqQfV9xJCTWeDpPlI5oRmGN3WZbvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748508848; c=relaxed/simple;
	bh=q91nuQGRRRhb1KNojdFH+w+wL21SpNT90+AHMNekIzU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mQGWzU5DRFvbmE1hKakZH56saiEfO6gYi9q01LGMUTc8rd/iCNgu9uT2AcSOqweRVUjXOQOPbbcZwZNL+1cq0CcLGzsKTvIez01GzSbAN5J4kyfoN0dyZ2ajUkHTV7uhJwIl72EYwEWmF3UsR6+tygUJKiCXFfep0d6kRdaWaZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86a50b5f5bdso46061339f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 01:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748508846; x=1749113646;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tBlyRIybHBaIqmeBc0FbsfGe2HQBjnmO3lAWrSbPihA=;
        b=ML03lK0JY5v8ZEmQSoe0EsEoMbF6xYArK4Zhrcfj5ng51Q/IJtsOo/KDHZkzYiHah1
         bENLFWRWACpzH4vmuhNyAQFErQufyMB/AvdhsK/Wie/CInU5qpeudkh/bMffyXw28RS7
         zIN1sRnq13H0tWbWD7TRU73Avn+PpC8gEGhoM51jDj4MOB2GUuTBpSLLQ8w1/Ar/Rm1R
         vqHIX/H+3OGuiL1/R00JlJXLDzgkpuDY7jiZOqd8TlaoMpfGxH6p7gjNlZRnIW1bp3W4
         pwm49QuGUWdYHdqma43HBg+smO5dZAKVNlGhhgQbRpwrwmqH8Y/xYGXLEYjva8YyLB0C
         UKDg==
X-Forwarded-Encrypted: i=1; AJvYcCUiinTq3mWO+gr3R3/DPKD2CoUYTRgxbk0m3GZD2Ov1+K0lnIVCTY390zisRWkhu04pAXABU9RD2vbFavg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuv04DceSo05lqN9n2zfNI8JIm5pjbwYmZBsCLrsegH89OmYTL
	MuV5AdxBNbUxHUPncwShVBGhOCFzUicl1IEGF4aQvNkSpGHAkg/bHnUyHx7rd/Io2gwi74REG2p
	hytS9rQfxbqOVHabqh7Dt1s1QZGubhfjbINpWnN5TxthXcu29/FHmNQwPqD0=
X-Google-Smtp-Source: AGHT+IGTRXy7d/IwzDy1o86z0H8LJAGn0XcP6VlbyJf2BmWogsfJeseORsf9jwaJIDjRT/Nj1zLMsKYeHBkliNHOwaksJ1d653QC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1488:b0:3dc:89e3:b882 with SMTP id
 e9e14a558f8ab-3dc9b6d4de6mr200720745ab.8.1748508845817; Thu, 29 May 2025
 01:54:05 -0700 (PDT)
Date: Thu, 29 May 2025 01:54:05 -0700
In-Reply-To: <6746eaef.050a0220.21d33d.0020.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683820ad.a70a0220.1765ec.0184.GAE@google.com>
Subject: Re: [syzbot] [hfs?] KASAN: slab-out-of-bounds Write in hfs_bnode_read
From: syzbot <syzbot+c6811fc2262cec1e6266@syzkaller.appspotmail.com>
To: brauner@kernel.org, cengiz.can@canonical.com, eadavis@qq.com, 
	kovalev@altlinux.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit bb5e07cb927724e0b47be371fa081141cfb14414
Author: Vasiliy Kovalev <kovalev@altlinux.org>
Date:   Sat Oct 19 19:13:03 2024 +0000

    hfs/hfsplus: fix slab-out-of-bounds in hfs_bnode_read_key

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12794970580000
start commit:   06afb0f36106 Merge tag 'trace-v6.13' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=461a3713d88227a7
dashboard link: https://syzkaller.appspot.com/bug?extid=c6811fc2262cec1e6266
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=140e7b78580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=129181c0580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: hfs/hfsplus: fix slab-out-of-bounds in hfs_bnode_read_key

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
