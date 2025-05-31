Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7951B424E
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 23:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748733605; cv=none; b=hkjhSzV5h099TJvF3FxFDO8qYbf4vhWDbuQLCdXKOELKwxtkOOSh3plAgzzWpFhz6+mjuIZKKrCfIGZLEA8DmlQEiZqGj2DzCxqgg/RGnbK3JAWxBZOfAS1yvpsaj3lbtFqm1SsU91F33IQwVSWpgtSxGxKMCKrGVYMJ87gHsOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748733605; c=relaxed/simple;
	bh=KDGKspSNKQHNNPjKszU2Jv76s0xm+qLt2JhjIGoqvvA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rek6xPXtE0+7oz52PEH2M/BnKIaKtvnn/V2jeA4oYqFjgkLtq7S10ozM/J3byFx0BExYuc9o/DjxfPyQgepP73M/iWl+5C5S/57xQwHMCVll68wltNryqyYFW0h42shwdzqxs4TYyGTfFDOGKmmiC1qP1nNXY1ckb41U6hoNUbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3dc7f233258so39028215ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 16:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748733602; x=1749338402;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZhhLbnZ0PG4eSSt9FnuW1K8TROo5OM3uq9fTUJ0/Ws=;
        b=j40TRt60Sb+u/LvpLWEvikMqoYBXnbLJSlMR+0H3EibaXrakj5mBwyyv2u3Tnl3ojq
         B/oS4WgIT+wmqYXDkg3zcOFLRXvNOjtM6qOzblZbYYE6vrzoCOSTqR6Ldbep8wmj39Ms
         8KWDwrGm3/BNAWUtWhn7pWZv3t3qUQLyLAqx7HDxcZXNbwVYSNfKlDMJm2lmO7OJ4qXt
         YL/wQ9s3VWDWkq7BUmXffAdLoAncjUBpnrVU8k4SeoR/GFc2eJv0qfeDCpQ/mxHM0dQn
         6mGkTawCaLd8qLqURBoJLKO/JtsAis0AqWOTSYYbSdZO6SIeBLofvTivKNd2M89mLSaO
         8VrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+yV3H9nVwQBBnOlQ0uMa3cIVJJhXWf+G3wpazeVvan08uLQzi/mDR7NNMxjlmF18sI4ymhebt9r4Q4HY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Qv3CYIOAFvk5mF0t0LXsKhSw2DTm6pqa4nhFDp2F9E+Kqjsh
	k8yBtKG8zcWpZncT36GqhpR31UWGIQXzAsWP2ji+Ai5szqFFCW6ZmIbiKEUMlwrfVVdxkwObDeK
	XArGeP0dh7qVM90dBaEzN8UfLAYr+WVlRK8DOWVn/uw91caRAk7PT+q8+peo=
X-Google-Smtp-Source: AGHT+IGCxD3oAG4WtemqwxCGWKeXMSIRReB1CBwta6mTh7ppTS3JkVTjOWgbuFnoIN0s/mgfSawICbO9dqqQBziJHDaLHyOxRUdu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2287:b0:3dc:8a53:c9c4 with SMTP id
 e9e14a558f8ab-3dda3342b6cmr26765825ab.6.1748733602686; Sat, 31 May 2025
 16:20:02 -0700 (PDT)
Date: Sat, 31 May 2025 16:20:02 -0700
In-Reply-To: <67b75198.050a0220.14d86d.02e2.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683b8ea2.a00a0220.d8eae.0020.GAE@google.com>
Subject: Re: [syzbot] [netfs?] kernel BUG in folio_unlock (3)
From: syzbot <syzbot+c0dc46208750f063d0e0@syzkaller.appspotmail.com>
To: asmadeus@codewreck.org, chao@kernel.org, dhowells@redhat.com, hch@lst.de, 
	hdanton@sina.com, jaegeuk@kernel.org, jlayton@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netfs@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, v9fs@lists.linux.dev, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 80f31d2a7e5f4efa7150c951268236c670bcb068
Author: Christoph Hellwig <hch@lst.de>
Date:   Thu May 8 05:14:32 2025 +0000

    f2fs: return bool from __write_node_folio

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1129d00c580000
start commit:   0f70f5b08a47 Merge tag 'pull-automount' of git://git.kerne..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1329d00c580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1529d00c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=22765942f2e2ebcf
dashboard link: https://syzkaller.appspot.com/bug?extid=c0dc46208750f063d0e0
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15bfe970580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13bfe970580000

Reported-by: syzbot+c0dc46208750f063d0e0@syzkaller.appspotmail.com
Fixes: 80f31d2a7e5f ("f2fs: return bool from __write_node_folio")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
