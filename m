Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D2929AB00
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751890205; cv=none; b=FNneugLKSa0PKQCaDGQt+iA9Tz9xLOAQHMj4k3ve0tqel+zFYC1jCflL3cwU1UeDOfdZmn7T/cCVfpi7/2Stv+NO30TFhTUK9uvu5GeFMnc5m+6z65wm1PQV/7OxLvqOeKFy6zRmBxzy3M9DU7ke+2IoTK5w3CM05fq/arlZ0J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751890205; c=relaxed/simple;
	bh=08taAm5wdRzJvzZ1AMVpIBoq9T7ah67A9asFKZwviIA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KQvNE5Xz0Bouu+eCzbDvUnPkTK1vz6mO/TCc8ar5PaJAKeN4e1dwNAaFCT2CrLb7QZSUePDCtU3FKmUyF9PnzKvJinYdvwvdNbUQlKQmIH2pNQZrRAAHAFKkZWq9iojQSaxL5rbtJ+U9YFDw5TiJN6g7LLbHe6tqF5LPDMdz6mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3df33d97436so35699325ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 05:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751890203; x=1752495003;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPP2c1LwMb3yWT4w/jL//ontQJHJPGGYwvjC1SZODwU=;
        b=OCJ5dvADumD7Dx9/XvNO+Bf1RV/8QAnf3ipH4dWiaYwULzCm6nWrjbGrLO6q+TEWBZ
         xuO6BgRNgZnDQYuFtCOM2sYIYQVoW+dg4fhEQdnoti/a6Dm1rl0Y9KQBDYX0Tu5riLj9
         5eBaIRTN2McIjRDD8G4WXGuauLFFY36d67q1fcD5RWjR2yC83Q4J1DKj7pB4paxAiaAb
         fPl35AS7Q9FbUeZ3EnIwTn1kOrQ3UnA2ztH6djiGH+UpyzvjLaX5Sk5zF8IjQGIUcSOA
         wLeTXgaF/tVFXD1zDtgUq9T8FpHzO/T37wcFcYDWgR1vyred2T1k/FtSyJ4skWW10Ohq
         2GTA==
X-Forwarded-Encrypted: i=1; AJvYcCU0QFkpzPFnqfcIItF/lZ5GYThUeIwhH8WdAxfPNHq0THYMUMgcHm+5EGSLn2THuHwxIen6SM9vQD0vU28=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdyPvLkzoBB6x+x80/gFB7TZMusQghX1cOXJZ6iLEwX77if+e9
	+uZbdTsMaHnOgPQhPnQHFSLe6PcSGA0kPM5wxgI0gVMiMnAyqjBpvKsKdxVxhxgdyaypaIT/UdX
	VTeIAhSA3PQl9elmYChZgaaUy2HhPHyLy/qnIQcvh3J5UdFaLV/28bLENG5c=
X-Google-Smtp-Source: AGHT+IHPfuuPr2g7bXzQ/IR0eDbNW3RhV9MhLxKAEJGqruOSFC1E/JO6xQ5Q30gHorRadYI+mH5lHBOzx/FO88c1JqfYl+xQmV37
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2613:b0:3dd:bb60:4600 with SMTP id
 e9e14a558f8ab-3e1347d85c7mr116006125ab.5.1751890203055; Mon, 07 Jul 2025
 05:10:03 -0700 (PDT)
Date: Mon, 07 Jul 2025 05:10:03 -0700
In-Reply-To: <20250707-tusche-umlaufen-6e96566552d6@brauner>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686bb91b.a00a0220.c7b3.0085.GAE@google.com>
Subject: Re: [syzbot] [mm?] [fs?] WARNING in path_noexec
From: syzbot <syzbot+3de83a9efcca3f0412ee@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, kees@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+3de83a9efcca3f0412ee@syzkaller.appspotmail.com
Tested-by: syzbot+3de83a9efcca3f0412ee@syzkaller.appspotmail.com

Tested on:

commit:         98f99394 secretmem: use SB_I_NOEXEC
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=13829f70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8211a357c817ddc6
dashboard link: https://syzkaller.appspot.com/bug?extid=3de83a9efcca3f0412ee
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
