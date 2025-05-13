Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DFB13959D
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747170427; cv=none; b=sriggW39uO5+B/JtTA7Ty/T9hNDzExDDKnhC81iyQR2uY/WZ9/ZsGVLNQw48kgakmGS+1HL8X9Smx/jXwjKpoS/EH+2Mf2CFkE/4TKGfsHVygAevKYZqMhcYd/LoklOxdLrlnwXvRFWXYjnTngS9KHX539SgM92gR0qMoBuMMCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747170427; c=relaxed/simple;
	bh=sGaN9H2ohZ88mAQIQVWjpKshggAaXxS0lcalRTsOtHc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=afUkI9qf4XfgmCf13FgT+H4b7kxVSHydbWQJD110tRS6orvuJE1jnTPZidFIwD1UDpFBSQLfsHAO0Y3b7C3oDlmAQzYv86oXYFh+MGSJ++4vmw2SLwP7O93Kv5gJgOyEdXIBSHoWkx5GBfZa85+5wec/Ixlzpf8QfM17a2CpBKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3da7455cb93so3113765ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747170425; x=1747775225;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6v0sPg7FLtQ0+WLZuplB/m07+UpbozEmRG/sG202he4=;
        b=cLoOEa3Iuz9XSqjv477T46yAPBmuC3qzcmLmXqHerAHShZAbEs3DyLH8y8v5CMUmNS
         dNFaGRC0M2EQqQB8DCAoaVzoIo9hXo3SlIpKKd8wPdMIso91G5vtpO5ToJxqeHNX5/hU
         RrMUmaj7EYDtmODZmpFkhTs5GSgfLucbM+s5qf8VeBNO7Mci2j8b2gEfT/PoGHoNlvLJ
         pCv1dvsPQ5bVDzUj20Xslcy7Wvctv2oPqdEBTy5BZXKY3oGkU6xTFRgvSrJrR1I6G+Xm
         ykM1PbK87ZucLs7WkpbQCwVijbor35ALM7BGmTyXdU5ClcGba/9b+R/aaq8Z+L01EfcH
         7/gA==
X-Forwarded-Encrypted: i=1; AJvYcCXMq/PXb86I1WC+RBTbUsXRfaol6JwBaO1hSsns2bcZujGKXh45W8yFYmVF8+oxDNJ84FtkoozJXK5wM+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpDxKuKMy4Oj1JwQWn2BNnfJHvLh3oB5FHlm6OP5HdkWoFXwRV
	hpNuR2/LsiyWs+tkId353QImb1wlePtstJ1x0KM+QmT2JclmAmf+QfwlSCUc2MbqnFKTowt5VrX
	Ojx9fKsulbkDCngb5EmX1/emu11N2LEdtGzb4UXKKFDYhKntjx4cFWJ4=
X-Google-Smtp-Source: AGHT+IGyVvDThfw3sSYtBVY2adUQUGEijvwjF7PeMsRuGPDOBpcHAJDm1yMJaifUaKRRhUt3Duh8fTWTGvpIIB0dsedEOkLFkx6f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3f0b:b0:3d0:26a5:b2c with SMTP id
 e9e14a558f8ab-3db6f5ba6ccmr14300005ab.8.1747170424069; Tue, 13 May 2025
 14:07:04 -0700 (PDT)
Date: Tue, 13 May 2025 14:07:04 -0700
In-Reply-To: <20250513201811.1956-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6823b478.a00a0220.104b28.0001.GAE@google.com>
Subject: Re: [syzbot] [nbd?] KASAN: slab-use-after-free Write in recv_work (2)
From: syzbot <syzbot+48240bab47e705c53126@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+48240bab47e705c53126@syzkaller.appspotmail.com
Tested-by: syzbot+48240bab47e705c53126@syzkaller.appspotmail.com

Tested on:

commit:         405e6c37 Merge tag 'probes-fixes-v6.15-rc6' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=174aeaf4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c9b33a466dfee330
dashboard link: https://syzkaller.appspot.com/bug?extid=48240bab47e705c53126
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16d34af4580000

Note: testing is done by a robot and is best-effort only.
