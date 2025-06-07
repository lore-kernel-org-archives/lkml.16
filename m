Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8295121ABB4
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 22:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749336307; cv=none; b=BQ67v+93F+BJfzRg9OW0cjWhV6ZNzX+fZOFiFxnYkX4bOgrz2rYzEmwxgdWu1ahWjbK3+Kl5HEsD96SE0eMB5FFTaeYKAjwqzOR1xxJTgdjB9shRmKKVa1fonitCcskvuBbLz/20xpN5qttUv0snNmbFu4EkCjufo+LiEvp0MdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749336307; c=relaxed/simple;
	bh=2nFVAreXuqLwwKkRObJmMGc7oED4qcCGsM4bQdEk0Rw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PkEYwVPhwZ/E6JAb08zQ6okPAWmlLVYMsHR7hExJLz39aX4qw8TqdSvVlPNwybSX3m4emBPL4MwfqxM/8OdiIBvh1GTKtk/1Ef5grQdJBDUNCM/lVbpYhjw5JZgqB97LPuJ7rCN0EZVuHQlg4VRR+SH1oQTZC9otBseQb980xYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddd01c6f9bso16364745ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 15:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749336304; x=1749941104;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWR4+o8ZgHbs3+333/x7gVwXkswXV2+dP8yFaRmzbys=;
        b=IyzU52Y8s2NQHMhJJV+KxG2mshv47S+luW6i83At3P4L+5fauH084wB0eUAg/6lbgE
         661IPfLEPXudb/LSH5byG2Q++hnJ5IGnIno2NBQm+fpSgeOiWo80wwXDzRXBikaCL/Bw
         uISGrCqkH0NHpFMtPjPfdu48f4sySPM4ub1RAWW4jSHZ/rv2ym/YNPBEW+n2GWslNJzU
         6FZQG/q6j2E4hae0ogpCbT5wIAGfVWB2A6SXnDp745ViQeYCRXOZLb3ZHch0Q7H8Dkfu
         p0ZEziTE+1grrqqQgFAc6fNDySzkzcULSeWgq7bGBlhjGRiiXuAzbryoL7NW+QD9OAkN
         JGgQ==
X-Forwarded-Encrypted: i=1; AJvYcCURkQI1mXMqbyHjO5FNBwWukR183TfOHkQfgZYN/laYUVJZps5LJnVC+qvhdOl2tE79dn97dRVss3w+T6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfUI/xF+R2Jbu7H8goknRWiU5whWeCQJIY1+ojsBwDWUv2C2ZY
	nvlZLnKIpl66TkzSct/QKLU964UNNolc4iH5UsszWzeyRurHYGTnjxSOZGohyPXOmUujLMUgMea
	VMdwuwbrJACwWSk2iXvKgocKgg/vo3DvAnGjuz473GwuPnh2Cbhdb+9bM1mk=
X-Google-Smtp-Source: AGHT+IFZ2j5MM2MyWcdVy5QleTpuMr9FKX5hgKYj61dG8v5nPwYUJ7bwS47mWx2enC9emV94HbaHYXLXtuIotWR//LZ2HUoXEUoJ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3186:b0:3dd:b602:88 with SMTP id
 e9e14a558f8ab-3ddce66f1ccmr83240485ab.9.1749336304558; Sat, 07 Jun 2025
 15:45:04 -0700 (PDT)
Date: Sat, 07 Jun 2025 15:45:04 -0700
In-Reply-To: <68185b7b.a70a0220.254cdc.0046.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6844c0f0.a70a0220.27c366.004a.GAE@google.com>
Subject: Re: [syzbot] [afs?] INFO: task hung in afs_cell_purge (2)
From: syzbot <syzbot+750f21d691e244b473b1@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 1d0b929fc070b4115403a0a6206a0c6a62dd61f5
Author: David Howells <dhowells@redhat.com>
Date:   Mon Feb 24 09:52:58 2025 +0000

    afs: Change dynroot to create contents on demand

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1522020c580000
start commit:   7a13c14ee59d Merge tag 'for-6.15-rc4-tag' of git://git.ker..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1722020c580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1322020c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a42a9d552788177b
dashboard link: https://syzkaller.appspot.com/bug?extid=750f21d691e244b473b1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13a101cc580000

Reported-by: syzbot+750f21d691e244b473b1@syzkaller.appspotmail.com
Fixes: 1d0b929fc070 ("afs: Change dynroot to create contents on demand")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
