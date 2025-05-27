Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5929BBA38
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748315945; cv=none; b=Q0Y+Z6PQWNiWSsEfyJvyyv4jzV0CFP8egOi9NegnIHO5gjQFdX38/LFzruKkxyFTEn6g+Rh66WnI7SZNY2i0BUhHdQ4851Ep6+lKW7lKivb1GQRQ/QKBuAxlwDB/ulfUZz/jvuKAOvVAvSknE50KiR2JmhniiFcJO/FW+5JTmrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748315945; c=relaxed/simple;
	bh=NcowtDrjo/ZWpwUUom/pF1B5fkcdM48WWh1WZOS7MKA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JRtFeBX08/MnL1RCrrVkJHbq/MsRx+RUzCpc8T2fQnSAuCTtKjlBekPcDOrRFhnxjWnrgpMuUYcdmBJvi7s053f7XJOG2uoLylkUvFJkB/RHUIjasVAtsUA1PpNGZ4pFW2j4ImEa4nqBUH7K+pGBeiQV7G86N5Xbbo+RG0kZOeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3dc88ab5cd6so56545035ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 20:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748315943; x=1748920743;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d3VWM+l99VWhmlvxmS2qwm2iGiY7UVcWGnyHjtXle+g=;
        b=W2BSbp53FWgJHaO0X481OfoHSQ0eof/HpQ95hJjCrMhfiiSIInN/lJt8XZqqj4whjt
         gCWk9WbiME0hnoEKykTgvHsLgd0Pp703mqNFpIYZyOQLr7t9EybuH0yrti94FpvwIon5
         AoPbXIAAlAK6vJtLx7OOjsKtdC1qdUw10VhgCLFq0dc2hgtJ1WYP24EaazMeFD05YINS
         pIqKbdXIFISo96d9n9V0SJl1o1Y1/9LCoJbDmuO2ag9FpNvSxzyTRXN5z2cS0zQmg72Y
         UERZnXzH2arJyzevt6usGVjnkvTDZk3zCXc/7gDdsVecXqgoPGOY4MNL7xXAuMVu1Hzu
         xRdw==
X-Forwarded-Encrypted: i=1; AJvYcCVHKoQ2xqY72bDrV5PwoXF3qiMTG6rsW6oy1xTpAH8k76/GFvR40bArps/XC/EieJY6V4Lphs/47wNbRXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YytYukl3PX0jWyxgstmpkkkhuC0gALUJZk5Dlw+02UOTrtQSzN7
	ASzot1fKqUFQ84dxStB3A3ICSAM90Svh3d6TDBzuiFRURt0qZkE0O9+Lsyc5HB+ycr7Jhnp6q3T
	sZ3cLMfGLCnk77a/UPjyg88I+JCLqfodSDY4ToCgv90k7Pt9izsHncg4LA5U=
X-Google-Smtp-Source: AGHT+IEPWmUjqbSTuVpfE0JkF4dnU42M3CfRXRvGzbsfMXNByWL1rCRcW5yqmJAsrF5DuFcPQdLlcmg6OUGGLY3tqCuKQ9hnCSuK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3803:b0:3db:877a:dff4 with SMTP id
 e9e14a558f8ab-3dc9b734485mr93019485ab.14.1748315943392; Mon, 26 May 2025
 20:19:03 -0700 (PDT)
Date: Mon, 26 May 2025 20:19:03 -0700
In-Reply-To: <68344a84.a70a0220.1765ec.0166.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68352f27.a70a0220.253bc2.009f.GAE@google.com>
Subject: Re: [syzbot] [gfs2?] KASAN: null-ptr-deref Read in gfs2_drop_inode
From: syzbot <syzbot+b12826218502df019f9d@syzkaller.appspotmail.com>
To: agruenba@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit ae9f3bd8259a0a8f67be2420e66bb05fbb95af48
Author: Andreas Gruenbacher <agruenba@redhat.com>
Date:   Sat Apr 5 22:31:37 2025 +0000

    gfs2: replace sd_aspace with sd_inode

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1042cdf4580000
start commit:   176e917e010c Add linux-next specific files for 20250523
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1242cdf4580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1442cdf4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e7902c752bef748
dashboard link: https://syzkaller.appspot.com/bug?extid=b12826218502df019f9d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=151759f4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16b9c5f4580000

Reported-by: syzbot+b12826218502df019f9d@syzkaller.appspotmail.com
Fixes: ae9f3bd8259a ("gfs2: replace sd_aspace with sd_inode")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
