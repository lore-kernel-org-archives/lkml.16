Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743921BE23F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750651204; cv=none; b=Nm3zfaWrL0jrh2+pNs0azMLpNa1G5KZwmb5AlFVCXBpt1fVL1jnROmXJsTadCvZkZVL2k1ru0970C2eoj8n2Ua90RsLkcK3vX7QdWIdUs/kLMkDCQOP0CFMG5Pi7Kv74jz7AyC6dLO4gQGBNcj2EI0p9UEz8HK8G2TZNywqVIzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750651204; c=relaxed/simple;
	bh=pPylR7SsFpH7/9lpOqaCWDfdB08fmgj3mQjIVObOh7M=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QoZFpakhm+EQSdnvFlOoBoiZWkOXT55WtKWp8BCKhNLnwXBgucjyTdUE62Jk4Wnq2nlW5Pwy/8TNFrIJ8GE21ShV6zja93KuCSlmznlx3X8OReMoTMCBi85mpWaY783ebLyxvMGFYFLeYiw5DzH1kruRc0YkRBCAl1PU8+C239k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddafe52d04so123563835ab.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 21:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750651202; x=1751256002;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tp5owW5nwFpu5Jnkrm8smrXMQm3hRvUBzgn0oCSlZLE=;
        b=LmLblT/5RP4LHl8jmjv7HucosAv7NSpI/R9mSeeEVyv5aBF74wR2mQMt255GrYKBrl
         u62/iVw5PlSz1trHNz5a+Vkn/roW2Ig+LcCCIScVYD6TvBIJXRsqbgtBRkIqtb5TqMkg
         LTRnj7SYdMenZvoQ4GbUlT5QbXyx/Dd8sovBRkMv94Bz/G3ZifQ3jm+8dgcpBzHPdRPy
         ud++h80FCxKRFStc4hzVfYlUdFHUbCx4ufwKn6wP4Y1/y6RQnR781G78cZ3Z9Y+BvJKJ
         GDi7WPkJn1QPSieS74BnaZmKuFbp30XUKB5jlx6RvFIjcugdkc7T5dVsa4ERlQ1fyGQX
         jsNg==
X-Forwarded-Encrypted: i=1; AJvYcCWqH0zpWilhQPEubmCtfJMo0o7mOhxQrKk3GIaqkZCHzDAvrrkmx7qVJa51Rm7lXd2AM8DrM98eIth6bvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp8e61QFJRvkna++GrU/VmWYTybqZXQNEAoQOIUnQ7kdhFRcm7
	CPf+yKTWao4ykMRIETamfPf21nUfc5qDhV2qyeF1Q6zt49C40H73CjfW8+A4DufncrntN5c3Fx/
	KQ32t6pBSKp96QRUqiHoL05Ky0hPeYBitgdC6k249ZXPdfaODxOKWrWmloEQ=
X-Google-Smtp-Source: AGHT+IGzI3eiBVL0NMFR35KWAlUrxUfo0LV4hyzVNWz6hxCoaIHFjj6zXT0kapv92iCI4EFb+pZdLBWvpe4EvqMzAC+zavsATS4M
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:308f:b0:3dc:8667:3426 with SMTP id
 e9e14a558f8ab-3de38cca231mr119111035ab.17.1750651202731; Sun, 22 Jun 2025
 21:00:02 -0700 (PDT)
Date: Sun, 22 Jun 2025 21:00:02 -0700
In-Reply-To: <6834671a.a70a0220.253bc2.0098.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6858d142.a00a0220.2e5631.0004.GAE@google.com>
Subject: Re: [syzbot] [block?] possible deadlock in __del_gendisk
From: syzbot <syzbot+2e9e529ac0b319316453@syzkaller.appspotmail.com>
To: axboe@kernel.dk, hch@lst.de, hdanton@sina.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ming.lei@redhat.com, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit f1be1788a32e8fa63416ad4518bbd1a85a825c9d
Author: Ming Lei <ming.lei@redhat.com>
Date:   Fri Oct 25 00:37:20 2024 +0000

    block: model freeze & enter queue as lock for supporting lockdep

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1024db0c580000
start commit:   e0fca6f2cebf net: mana: Record doorbell physical address i..
git tree:       net
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1224db0c580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1424db0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d11f52d3049c3790
dashboard link: https://syzkaller.appspot.com/bug?extid=2e9e529ac0b319316453
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=132f8dd4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14aac182580000

Reported-by: syzbot+2e9e529ac0b319316453@syzkaller.appspotmail.com
Fixes: f1be1788a32e ("block: model freeze & enter queue as lock for supporting lockdep")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
