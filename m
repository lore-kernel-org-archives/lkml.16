Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD571FAA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 05:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743053406; cv=none; b=ZL9A0eAhwiH03YYA/ivsRENX0pV8IEj9/O1CMniHkVu0kPpMnhPO1vEjchBaesnokzFT4dQLr7TSp/IcQPVflxhCR3yoOqrlA3RFSwKQ24O2cDkcKgMmdS0H3Xy64DvMKHXkp3i0zHS5VIzCBRjys6dLgw9x6ZtDR28xzZ00GWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743053406; c=relaxed/simple;
	bh=AqsjoyQO459ahleRB66FQWtF+iiRanNyBVdc7GjkcZg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ouj5PCbubv6M7k4GTQDegAveNM4wFHsRKPi9/I/3EDnVdz9kBAmiBtem64288qN2KDW34FAIJE5qyJA3nTQKOswU4Q9okUzsC00N6P9AhL8xS8uPMJ7gHaodo1mCvhMOGYV3jLarme3pe0RS0ega5CyQfRuS2+6sSc3PtW7uu+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d43b460970so11356325ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 22:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743053404; x=1743658204;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ooqxJTlURcomA8Y7Qx2zL38/G+/NCRs+HW2FdYnqFqQ=;
        b=Fvlvf0a4vh53MbumEXymIxQ8N32aQ0J9QsgGup36Mh8WRZBaEwfP2ErNVPEEHtjnY2
         0+JL1YwVlAA/0nvWI4SQ7MPw1XozD+cKAEaPmh9mpwmghYAZSMnp5Uppdq+VABGDnaUS
         AqtNiA8C0ouImp7PPgbZx+jQ3r1pCcNLhezrskELaaU7VpICG8XJul/3yBVK6aQ8SiU5
         cnhT2xVSdKkClo8mDrj8tqpwH4Adt/j6xn6iZPgv5p8yy+9AoO3iRE8jjFIidN1QVJNP
         u3ywlrAV5qN//5aGjSuCmLFCzka8vtnkhjrMGCf1XBfccylzVswP8Dfctkg4rE4rwRSe
         +JIA==
X-Gm-Message-State: AOJu0YzdPCcxLs2c3Uu+LxCv+4iva4yAZXmNWcs9jTxYJB01y/bGPPzu
	L9Uk2figu1Jh6MhsGWu9M1s7dErRtvhR1LpEKAxBEXpchs029LvisDU2cEj1U5s4Y/u5ni+lqkT
	oAwRShyrGzHca8CqVMLlRNMOlc5j1TiITq2H4TpX+DcmZQV+sH7e/vLE=
X-Google-Smtp-Source: AGHT+IHyp80fDkB+M2fZW/X+8hhAW7+Gxejdl3WtKeGSsmI/FeHTaDikaXTTquu2bshTkB10F2+tU1YB1DNic3Lld57CzcB17i/x
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:188a:b0:3d5:8908:92d0 with SMTP id
 e9e14a558f8ab-3d5ccdc7440mr28103215ab.3.1743053403930; Wed, 26 Mar 2025
 22:30:03 -0700 (PDT)
Date: Wed, 26 Mar 2025 22:30:03 -0700
In-Reply-To: <20250327012816.3901896-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e4e25b.050a0220.2f068f.0020.GAE@google.com>
Subject: Re: [syzbot] [can?] [usb?] KASAN: slab-out-of-bounds Read in ucan_probe
From: syzbot <syzbot+79340d79a8ed013a2313@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+79340d79a8ed013a2313@syzkaller.appspotmail.com
Tested-by: syzbot+79340d79a8ed013a2313@syzkaller.appspotmail.com

Tested on:

commit:         245aece3 MAINTAINERS: Add myself as a riscv reviewer
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=17456198580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ef948fab17fe83a5
dashboard link: https://syzkaller.appspot.com/bug?extid=79340d79a8ed013a2313
compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: riscv64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1152abb0580000

Note: testing is done by a robot and is best-effort only.
