Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BA722257E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 21:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744060204; cv=none; b=cD9q2ix4IKm4/AYYBtJ4TxIHYIs6dD2uADxh5CI4cpwCqWrwxRfk4R4ZnyUQC0cCa7CGw3xXk4iHGU7dqJSHYYnv5SxcRGVzlH3nU+TdFxvBhLnoJegxkHNktESLSR8TWhB8/mObl/jmqzeZ3q39CT+H764UnZnXeu7w4gRuJ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744060204; c=relaxed/simple;
	bh=l33H7W/dajNswr6zoB4uEzQnZ3xV2ksVZyWMgdOsk+c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=vAtoj8s/kJS1na+1MBSBYdvPtsUajSTZYKg1Xch+nvgPqOZzr6tLxBjgUZ0PS7eCfXF419UgAqCdfbdAUBO0/cJmX7b+UoCM0f/N6ZQqdVo0texHOZsi+wRg4vSJ8gEZoZVRdau5lmLJ2lHFKUSh4aa0yuB+kfrLLM3bL5r+vjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d586b968cfso111526435ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 14:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744060201; x=1744665001;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=obSJQ5g5QULaHlCzGG1efUqikPTPRZ9Sdsw5hiAMvVs=;
        b=oDYIW0yJSgaLQ7WLXmo5TjNliFes8PjCGq4P7Gry70k/uSpDFvZI4CUTChLimoXZUS
         X+Co7ciRljAJHZbx9QDFhVFpIaBqyD+T99hMQDZq7ZRBeBlYPKDbgFNbOmqPJLyoL2jR
         0ZpcoF5LoU5mRl3w2gruKlGqXjytNsTCCNP534YkR7g8d+367pTWuNtOc9xfLQ/k4FPf
         lI7JJMHbBCAc55DkP07QAoSBC5zYdoXRWHiCG/M28E2cfAfnrBtuiki7IcbXwPBEayJa
         D5538RKGs58Tdbo5ihDoRWYFpH1n+pveRBExl5VnQNgxUeTHCsha0AdkQ08dXYDO8H+Z
         /flA==
X-Forwarded-Encrypted: i=1; AJvYcCX6QMQGAINzwJdVn8NERLE3MRFxt6aykEpxoJG6D4IEHUPL0wwgjQZga94r0CCzmaE2UKqx01aboeDB5OM=@vger.kernel.org
X-Gm-Message-State: AOJu0YztMI3qxFXcTfESYghqYbIxxGPVrEINRhxDgo//D4HMmWzqXVBy
	MTAJJ7dFeS697hmVy0A0h3tOjW3GlB3mFTq7Vq7WWFJ/2VNHcxCMgd4dBNlLyA/9fjoinOJnWbM
	q60wnl1Dryb2KRvL0yjyyVDzuC1VBCXr2sE+kHtaxeuHYYCbLaRCgNks=
X-Google-Smtp-Source: AGHT+IH3y067eDUmOjv5CFVChEZZ+wYOKbqcRDrio8C6VJxigSI3fEGx40IpkZ9McIdubTIYOFN7nscVeIXbCNAf69zlWSylOENX
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2199:b0:3d4:244b:db20 with SMTP id
 e9e14a558f8ab-3d6e3f653acmr156570565ab.16.1744060201704; Mon, 07 Apr 2025
 14:10:01 -0700 (PDT)
Date: Mon, 07 Apr 2025 14:10:01 -0700
In-Reply-To: <67f34d24.050a0220.0a13.027c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f43f29.050a0220.396535.0554.GAE@google.com>
Subject: Re: [syzbot] [ext4?] [overlayfs?] WARNING in file_seek_cur_needs_f_lock
From: syzbot <syzbot+4036165fc595a74b09b2@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, amir73il@gmail.com, dhowells@redhat.com, 
	edumazet@google.com, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, miklos@szeredi.hu, sven@narfation.org, 
	sw@simonwunderlich.de, syzkaller-bugs@googlegroups.com, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 00b35530811f2aa3d7ceec2dbada80861c7632a8
Author: Eric Dumazet <edumazet@google.com>
Date:   Thu Feb 6 14:04:22 2025 +0000

    batman-adv: adopt netdev_hold() / netdev_put()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=175f8c04580000
start commit:   16cd1c265776 Merge tag 'timers-cleanups-2025-04-06' of git..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14df8c04580000
console output: https://syzkaller.appspot.com/x/log.txt?x=10df8c04580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c79406130aa88d22
dashboard link: https://syzkaller.appspot.com/bug?extid=4036165fc595a74b09b2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14f9bd98580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1571c7e4580000

Reported-by: syzbot+4036165fc595a74b09b2@syzkaller.appspotmail.com
Fixes: 00b35530811f ("batman-adv: adopt netdev_hold() / netdev_put()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
