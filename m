Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EA9EC5
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 04:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749961444; cv=none; b=NaYpVe/b90eFgg3gTKrHa2eZ3Kl9Agd9JamPGG7ub5q4u8i1e5ShGS6TXJ1QyqxyzQ3TOExB0yFVHNlsS5Rp+Qm0kXecKtyxK8Fr/GER7QFsRaUYFmN31yB54Xqvgmko+WXtdSB0HlMGP8Mq+RfAtRtxmVgLAKpth9u7Z92MIwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749961444; c=relaxed/simple;
	bh=QGwLk2qFCxAtnyyWKUyOX9/PKh1xY2/XwoeWS/zPcSk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ekVhAvAm89vrqD4I5iXJy2Xvre9ekE/RqqBVe6LE1czk5Yo7SICwP4s1urGHM4mS29PpbI7q+st/KfrEq8QPy+KHPWCfkw08YT8etGvyg64inUtibVlihCbG+03GHC6FzxFibbaEnVx7E2hN9DTlr/tNKeDqsjFSEgx7whHr5Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddcf82bb53so32029625ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 21:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749961442; x=1750566242;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q07r/+ud0AYYpkaAT3iixN11balU3zUySkEsaOqU0NM=;
        b=Ojrd63fm7UiZhgRdUp0IINNQDKNWEPd8U8eHyjkJ8nu4JfJFD2sBlZRLHRerdM4Jfd
         VgcMpVpKdCD0j7reA/88XXOCo560KSfbuUpdwX+kouu4MVUPUQBkCNYsZ4y6b5SsBBkl
         0oSYDHgsCHnG/O7Fev5EOmNOVP054wLfjWc8d0sVyl4ItXwXAwq2bdj7Ncs80e7uUJGU
         jdIXXaQX8U1AxzZhYoLj3qiFPCqrVgBFyCKO5o3dSEWjmUrrSCBEkoz2sburWIn0Mt/+
         MtLBaVPnKe8uwuD0a7kWkj/R5p1A4tUYE78FWyCf5opFS+aTojO7rBt9Z3Z8wIArH5Tp
         Mi8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxyWp0UOEoah+YOvPYAO9tGQIZ46kRIly6ZJDUiUNUve2WB9/q1/JssAQk/ObBWhQ6FRo5iHKkZs4R7CQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf6cyofxjZ+fr1aaRIT1UDf7s/7946aVAjfUA+VaHR4298OXwk
	VYSNhxCI8jo4HR7ZviA95MiqwgWapNrq5QJ1LVdhcH0diwwjHMWlBkGF62qAF3lyL2NJTGvCCub
	Mr13fZCEwSiyrTNyf3fNn1FLk+F+1v1bkET5UGDg0NDcGBcQ/Kedy8xOWfO8=
X-Google-Smtp-Source: AGHT+IE838zqz6uyKUSYfG5c+yeshPdvl93S1teF25RTVuMIVX13wW+64RlCBdgW8rwNyAWd2edQR0put2GzMaRVifzaENCbPEsq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2583:b0:3dd:d18c:126f with SMTP id
 e9e14a558f8ab-3de07d50c73mr46926835ab.10.1749961442223; Sat, 14 Jun 2025
 21:24:02 -0700 (PDT)
Date: Sat, 14 Jun 2025 21:24:02 -0700
In-Reply-To: <tencent_70C092DB0661498AEEF56EC78C90E7CA0606@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684e4ae2.a00a0220.279073.0027.GAE@google.com>
Subject: Re: [syzbot] [iomap?] [erofs?] WARNING in iomap_iter (5)
From: syzbot <syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com
Tested-by: syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com

Tested on:

commit:         8c6bc74c Merge tag 'v6.16-rc1-smb3-client-fixes' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10c2bd70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=162faeb2d1eaefb4
dashboard link: https://syzkaller.appspot.com/bug?extid=d8f000c609f05f52d9b5
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1282290c580000

Note: testing is done by a robot and is best-effort only.
