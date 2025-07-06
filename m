Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620EE1D6194
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 21:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751838428; cv=none; b=B3MjU+r7mk6cnamaipEyajppre60te/+05BtEsGWZzjo1SJ5CRetkh1IZcumu7A6WBFMqHUOImL1fiQP6dAem0hmVsVjiLbQCAVOCrRUa25rcZau27gwSx1dIuG0w9T5cNsguGLWr/2ZADKjKQR1AIr4e9qnQku6MIYq+36u0Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751838428; c=relaxed/simple;
	bh=wfC6pb06LVhsTYsLYsVaUHcm+Hi+5WQlNyegKa6NJXs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BviarsWmrzt+45O2LhSnZlYBZ9BMrUSZgktVlXIGvayrm7rEi5C2kwqn0m1mIUuZFfZzGYkVOBt9O4TlIaRVUBY+emAUQG4es+KGkpmyxA6eyZZV9J5r7LXZjWfCAWF1hC4jOUhwH5sfO2QgeKrsafJesfHrRdsG6k48FvOj+0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86cfe68a8bbso127662239f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 14:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751838426; x=1752443226;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ixkLOm92PB3kA5hKonBVF6NTsAkdtIPeB+mFKWDyXEc=;
        b=GIdDuWix1k31x4HBmHH93WcLNpb/Dps+/RhRWLX/sA9A57j2d3vJHQDGbLV8VQjwSh
         XKmU6A7xnfkK86B+pBQlDL9Hg6DFvksUbDdPCqDvvin+BEH4415G3i0TuC9bfQFpRV2n
         QNPXDZgAHZxzmksla0PYMNgT/vY40dkIgmz70qrYIO15D7sXrVssU2nd16U6Bdz+5641
         hQl1k8aI9rr0aHs+55B2xrVqw/bhHF0VaIXiy4CUJSiU9gKWL07TLmXmM0g5tFvRXEgJ
         mrx9jjaQRMxSBgao4i8IqaL1kg2AWmPJG2jKMSgqZRtO7Z22z0Jv0WXL6PbIFbBHQAz3
         TsxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEA/xAO21W/EhE5yMcvr1hbnDyOnk8Oc9D+AIOGfm0t9Wb3EHHGsNrU0G+I7w6THBFQvCp3akVsrI+110=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc6RSdV5+T+t8gJeulc7vMa20igWd2W3xeSydA8JxU5qGFWCUk
	S2L64qPxHWljTXwE28sE+Ome02mxbPThsmnQGFy9Ku8rb4lXiUgO9eHSJj6hSFaoLSf2PkSrHJa
	SNXOLlQOnHuKqrrUYZ/fIqk0QKu7iHjXtBSYaA/tUJKrlpXULFknfN4hjceI=
X-Google-Smtp-Source: AGHT+IGOvkaWcRRlxGfeWW9ngMLdfdp6SsnKx5xXDRjn7fDFzE0uyggFtu2AuBaGZuhI/U9YHWkMoTdeW4CSvVR5hl8Svwo0ehVr
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:32c3:b0:3df:2fda:e30b with SMTP id
 e9e14a558f8ab-3e13ef15bebmr70223205ab.21.1751838426600; Sun, 06 Jul 2025
 14:47:06 -0700 (PDT)
Date: Sun, 06 Jul 2025 14:47:06 -0700
In-Reply-To: <682dd10b.a00a0220.29bc26.028e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686aeeda.a00a0220.c7b3.0066.GAE@google.com>
Subject: Re: [syzbot] [bpf?] WARNING in bpf_check (4)
From: syzbot <syzbot+0ef84a7bdf5301d4cbec@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, haoluo@google.com, 
	john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@linux.dev, netdev@vger.kernel.org, 
	paul.chaignon@gmail.com, puranjay@kernel.org, sdf@fomichev.me, 
	song@kernel.org, syzkaller-bugs@googlegroups.com, yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 0df1a55afa832f463f9ad68ddc5de92230f1bc8a
Author: Paul Chaignon <paul.chaignon@gmail.com>
Date:   Tue Jul 1 18:36:15 2025 +0000

    bpf: Warn on internal verifier errors

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17014bd4580000
start commit:   cce3fee729ee selftests/bpf: Enable dynptr/test_probe_read_..
git tree:       bpf-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14814bd4580000
console output: https://syzkaller.appspot.com/x/log.txt?x=10814bd4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79da270cec5ffd65
dashboard link: https://syzkaller.appspot.com/bug?extid=0ef84a7bdf5301d4cbec
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=109df88c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11705770580000

Reported-by: syzbot+0ef84a7bdf5301d4cbec@syzkaller.appspotmail.com
Fixes: 0df1a55afa83 ("bpf: Warn on internal verifier errors")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
