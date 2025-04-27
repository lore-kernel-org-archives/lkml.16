Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0B71898FB
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 15:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745766605; cv=none; b=qrRYK4F3YhWXPDbHQ6nsO+bTqxBIS+M6IvNwQxe0wjaEx95C2pIvQiYAaOHNOYH6HzfaaORk1c7GlbXzDEJ95IUx4xObnhfFMIUWY2i8LHzcr7WiJLBTDKZj8QeWGcKbCGznuMu8En1KxkiV8cf53GqrAUo3+c+HkxREPMo/BQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745766605; c=relaxed/simple;
	bh=mNysrkB63gyeeGOhUajqs4rPJ4E7c2LlXC0pIqCtTDg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Zve1dQLjNWIoqjy5sdZkCHy9gDDfZTUKIsg4jgSRC1Uq9Nsyk8YVzxnZmChaF2qYdiZrLD+xdJPLF/tKfwGAi09A4N2GiXTJlKKmS5erB4XwqEig94N9Y3OvTDcS/uDvEqh2MpATPQaRmJDMvuOgaxNPW2dLhse1hE4ud/kdLS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d43d3338d7so66790645ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 08:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745766603; x=1746371403;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q5sLRFDxOKvRTKH1+cL5jCRz2EAvoXeqiUjjbHr3n6Y=;
        b=t0ndd3AaCph2Hitj/S09He0m/Q81XlGVqB3ViYdsIVxDsa/+EtPHWv41gqKrHzARGP
         q45c4Ajw/FVc9j7sfOKjNzHoooCGAL3fsE+LeV+FwaigoKs9X5zJG2YYod0UvehyxvfN
         JNsS8j2RrMfwjv2p/JuY5anssOEN9lgVZjP8uWa1Rh5Mb/QTlrRekiHRP6xJDEcrRIIP
         21gcfjRyJLxuebPx0UpScSSinIyfzdraXStb3C8rnQFi2iSOM2K90VkIyyqx/kjohUOz
         QPCrdFSshe6odcTWIikQ0o8fOTJ1NlnB+KfFKYcmLSQOotZHiFHvBQMS+RozU8EJws9a
         ciLA==
X-Forwarded-Encrypted: i=1; AJvYcCUyX24ab1MmVEWjpjm3FtzasDLtZnOHThhA+24y0mVwf/LF8KswNY1/UBIj6LUmVIab9cB14zpMENABtq8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2VKK2fhT3bqj2fEs6BYKNqGtX+zsnZQOb2i3vLEsP4pT0EQnm
	bJbdc7p/Hn7SWHaKKPFrABwugAyyKoqZc4kiR6ZVys/K14SVPapaOLST5skN0wwTJzSNW4ODXs/
	+h/TAYk5FEaCGWJGxNMyaOSAqUqhExQgOHjYnD8+8D8KBTHkL3d54c6Y=
X-Google-Smtp-Source: AGHT+IEcqaCtbCXF2OXrYv12RwpFH5VYzbmQ/hwIAX4fPFkqtcNGOB0YAmEoXUvr8oz4umMxnojRaT8ZRxR2YBwZewLzZ/AlmDmx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c244:0:b0:3d5:df21:8481 with SMTP id
 e9e14a558f8ab-3d942c72d96mr61819135ab.0.1745766603215; Sun, 27 Apr 2025
 08:10:03 -0700 (PDT)
Date: Sun, 27 Apr 2025 08:10:03 -0700
In-Reply-To: <6772228e.050a0220.2f3838.04b8.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680e48cb.a70a0220.23e4d2.0024.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] kernel BUG in bch2_stripe_validate
From: syzbot <syzbot+f57d864a5d6eff90da3b@syzkaller.appspotmail.com>
To: bfoster@redhat.com, kent.overstreet@linux.dev, 
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 71f8e806a5e4edada72456ee3b2e2d7eab6fadee
Author: Kent Overstreet <kent.overstreet@linux.dev>
Date:   Fri Apr 18 16:49:00 2025 +0000

    bcachefs: Stricter checks on "key allowed in this btree"

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16b9e270580000
start commit:   ccb98ccef0e5 Merge tag 'platform-drivers-x86-v6.13-4' of g..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba7cde9482d6bb6
dashboard link: https://syzkaller.appspot.com/bug?extid=f57d864a5d6eff90da3b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=131666df980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10556ac4580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: bcachefs: Stricter checks on "key allowed in this btree"

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
