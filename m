Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6519F129A78
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 23:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743896224; cv=none; b=PW2Bcv0emIJ7/e/H2gKfdbgBPlrTs5ELYjM5dpK9NG9tIJT+RmXqDk3CoCw+anFeN4uXidEBzRPSOy9hcWsThVgsQS2+1t+3L1XUUmGdj2SBd7CyjoZhjBXSVjbeXEoPvxSx4A5/4oMLIEO37vlnlS1NXSpd2Ae68o6loQsXxto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743896224; c=relaxed/simple;
	bh=nCYAq0ZDvufZfTS2oD16vx81uZAqoK4WUlcrfAfina8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TwJ8+OnfclCivydMFMkg3BPOzdGcz2LvUYm8mtPmh3lcJhDZEMXSf9G445sNpHAcY2NKM7xUKCorflC86EguY5TxP8+qihnk56mHdwFbq4l7t419rukkwl9Puv9rd8UFGYuLdOJ/HUzM/NzgkqcUdQMjDH7dNm0GgnZuVSgMtMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d44b221f0dso62485225ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 16:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743896222; x=1744501022;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FdiqTmfTbcuYdmanneShSSI8jEpS5AfWepru38ZMqnc=;
        b=XyJRDIiFurX8gMYegeVNJ+wtmo+Ys5wf/LT0lcMKmtUOp96I7AO2Y8rA/JudLQcAG4
         k99cCD9AkRbQ09pXKoyckZORW2s23vaO5iYmSarjR0ppGyIIZKWsCx1KA23DNvsx/idu
         chsmEYhBcqBixUP6ayiQ4zzlmqZqlDVd7rvt+1b19tBEmr3rArMDu5NFRVZNAie/qjV4
         otLyUpgWIV7qJx4T/BSA+kQVJS8fdZSTlva6uaXzBuPcvPywWou8koxEoFF7CLLe5VlW
         llkdGdMOU7DcioC071pVBcyYtEkDbFMk3Hw8REqXzl+MVdKfFo3g5KJbxKZaJIDyxKSQ
         LgKg==
X-Forwarded-Encrypted: i=1; AJvYcCWhpvxr4HNKlqcXaK+vv9O30JMFbqwDsxbQmFHmU+OzD+2PcMWa2KzLqX+1KwzRdFedSbAGtfhexay0D68=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuD2aboZCRrdT2wqy671ZSWwE4lmOmdqAebNNJPbpMRo1mxoHi
	+0Eb7dYfRDiL5l5ZCPP7K91/SQof7Owr31qi4BoNiBzTJIH0Kh2k3YGY1fS9LC5rS3Kr+JD33BX
	rVetZh7sagJECYMONJKngehHn64qcTFvj//CgA3KQjEplK7qI3UqDhCA=
X-Google-Smtp-Source: AGHT+IH4jxWwCKxjGjU0MUHED5sESnOGdWbHJiYDkmYZD/GEB5BXAG8w8/gMtFEkD2HbAoDuuVuMKEBAFTIk6DHKu9PycBOW2x8o
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3186:b0:3d4:3ef4:d4d9 with SMTP id
 e9e14a558f8ab-3d6e58722dfmr74044705ab.14.1743896222580; Sat, 05 Apr 2025
 16:37:02 -0700 (PDT)
Date: Sat, 05 Apr 2025 16:37:02 -0700
In-Reply-To: <20250405225252.588123-1-gshahrouzi@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f1be9e.050a0220.0a13.0252.GAE@google.com>
Subject: Re: [syzbot] [perf?] WARNING in __free_event
From: syzbot <syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com>
To: gshahrouzi@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         4a1d8aba Merge tag 'riscv-for-linus-6.15-mw1' of git:/..
git tree:       git://git.kernel.dk/linux.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=147c8d78580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f2054704dd53fb80
dashboard link: https://syzkaller.appspot.com/bug?extid=ff3aa851d46ab82953a3
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=124587e4580000

