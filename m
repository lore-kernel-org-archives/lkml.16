Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F350259C89
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624507; cv=none; b=qjBsRAo1soH14kyNIP+advbhtI9P+5Hr03uQYXzjAQZPCJM4KpDlfUtPHYmCnXXOGOewX+8niB7Ar3iJykTKjt6k+ySj3zDKWGiocPPCkuba4grWzydi/GVec8Nj4P9ewUoNhac/t2Ll0MjUsDkrFZUeWJ6nwaTQpUSV77GPzLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624507; c=relaxed/simple;
	bh=5pktzfACco6P1X1nWLPMVToXbg71fOyBFBvBv6ZkyeM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=nlratq7Lx4bnoB97MmOh1kyeV0LLAfRKdAZzXRxen1i3ZsdfZoBFysuMyfYKnowwL3eU7hfae6pfZPNfDIarMemUKQNM+ffE2A8ZRzgtHgjpnqWCDCs5wQklFWJjkoF4X8qCdUFtJJOMIZ4X/R09/6kFsmMX7+I6syMo0Ralp/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d5d6c997d2so40331865ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744624504; x=1745229304;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5plY09falyfZ3UOtecxeYBIulPP3Si88xJv7tSReq1U=;
        b=c1OIT0SRAnSEroHjhJE+2W2jKeN8XIiVCsSRZUw9Aqa5c7ZMh8Crk+EBHO4VuA5Iuj
         gozjmSHWqWABVvzx/Ohj7gFQklGmsWy+2T86Qea4ECsBooxRkpGEMi6jn4mDkqjhlKQC
         w3955imzgbD3Id5vztKb/kC9LqQDYPcPbGLXEq3ThdRqdWrYfF6jaAFIZgt5uaqWPpM2
         6CVP472yhmeF3hugdpt7mwOhpQO4iIZevs/AYsl6dtqVowWrYAR8sV9MzeZNAAdqz8I1
         Jo9rBKtyUGF8tP6NJ9OJaWznxiITwpjfhDD0BGu3F+Hykm3DNZfp29JJDJPJB2GXXdTj
         X1cg==
X-Forwarded-Encrypted: i=1; AJvYcCXJBaT1BmL6PcE9BMdTMHUHVjHv45y70gI8wM7+sNST4MvQcXYjnz1gX8RvVepTTcnOGN2+6vbtxMZVPMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YycZYcXeClw6eUrNm07QFjOkobxfjYcwtN+jBVa7cix+/yIMFJJ
	OMPGDI4pWSnPmbs5RjYvqtwlEeIjkDtmC1IGu1OJcinOEVSObTtvbGPerSO1EVFl76HiNYV/Swx
	mBWwRWcKNpaC5px59p2gjgFXLZRK/mRHD39ymuic4KviUFIgBq5x3a64=
X-Google-Smtp-Source: AGHT+IGoKk4VccLfGMLRsbLiLjAkKkWGzAjv2hgv/k4sroNL/cbfT58L7hp5VLyKYQiAhNc2i0PXsrXgvRUgfYNmw7SBy0WM5iEG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a47:b0:3d3:e29c:a1a5 with SMTP id
 e9e14a558f8ab-3d7ec276514mr120204525ab.18.1744624504558; Mon, 14 Apr 2025
 02:55:04 -0700 (PDT)
Date: Mon, 14 Apr 2025 02:55:04 -0700
In-Reply-To: <67c1652c.050a0220.1baf.000d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fcdb78.050a0220.3483fc.0022.GAE@google.com>
Subject: Re: [syzbot] [sound?] [mm?] kernel BUG in filemap_fault
From: syzbot <syzbot+f37372d86207b3bb2941@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, edumazet@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-sound@vger.kernel.org, 
	perex@perex.cz, sven@narfation.org, sw@simonwunderlich.de, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 00b35530811f2aa3d7ceec2dbada80861c7632a8
Author: Eric Dumazet <edumazet@google.com>
Date:   Thu Feb 6 14:04:22 2025 +0000

    batman-adv: adopt netdev_hold() / netdev_put()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11f8df4c580000
start commit:   7cdabafc0012 Merge tag 'trace-v6.15-rc1' of git://git.kern..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13f8df4c580000
console output: https://syzkaller.appspot.com/x/log.txt?x=15f8df4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fb8650d88e9fb80f
dashboard link: https://syzkaller.appspot.com/bug?extid=f37372d86207b3bb2941
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17eddc04580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11632a3f980000

Reported-by: syzbot+f37372d86207b3bb2941@syzkaller.appspotmail.com
Fixes: 00b35530811f ("batman-adv: adopt netdev_hold() / netdev_put()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
