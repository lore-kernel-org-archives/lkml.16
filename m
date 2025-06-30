Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9935224678B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272747; cv=none; b=YdR6+lm00xZhzDUBm2IJ4hKxELyGvhedfNrPFTmI3EXQ1mUHWwJMtadCfFXWBcuFMlIbgw2oT8ZUDWRSZmktdkREpMgAo76sOouG6ddC8bzXZ4s3zMiqe7xUp/it1h0nHQ3jb5j5znO6shxK5h7g1+n2Gga0KMeV1OUuA0KRnKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272747; c=relaxed/simple;
	bh=uk6sPpMl5wW1pF8ne4JPA3eItNMdRSNf4wJbyejjfdY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pi+sy892KvZTSMWt5HbSvMrdR58EvT72f7r+JMxZslX2/cueGqhZO8s+DOkFcRfKYavVFBaaCtsBaeoJLavZfDu7QXBhrisO/cPg/9oU55pNd7QLrJR+kQfVSToveRq+uK2z07HO42ATA2oJWG+QluWM3YDhZBzWWYZquU2qzhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddcc7e8266so46383965ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272744; x=1751877544;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h/ucP2G1eP8CquREeoo4mUIBHEX06tgQwtkrtTmxDak=;
        b=CQE6PtLUT7IwZ88DoXGjCEW8kI2GF087gsc0u3SesQ7IHaR/zll9JtIkze3LNmit0k
         BBR16ogB+OpyfAegNJbp5vRQ0RbDD3SF55dWrmW9r6onrUwgH4prjqiIU7GoUEux1HSK
         x3zM8+Mln6FfK2pvweFtnnMyui+I0F+tb3QKoLIn9InAmMMVdzvFf3UtzsWs02cQAsRe
         AmxYU7A5DAvdjm55VWFU+8Ig3T3RF3lEzxpsow2Ca4P7WeQwPjWSUyD2UKEcmY9PXeJ4
         ddJYbYBZrtfUmaC2GhpN+ZK8C4WAHVgwpqXcY5FfWTy26ZovO9VvN+ghs0MVH+AjEZON
         rqXw==
X-Forwarded-Encrypted: i=1; AJvYcCUE3IS5MuqvCyxNUPO+45a2UKa5riRG5uNxQP3kN+kAkAj5jfXehpzNZo+2rD/i7AU9d5HbpU8zi8/moxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpn0lp6ubrhFCU+q2Lu3bz+Zo8MBHrbKvilVLmr8XJnA2Z24Wn
	yt91ZmpgkVJ+3bILcBeu3sf4tBrdCczD+/NZD+p3k+db4y5zbdoRa7d2neWaLrejA6/TAT48b68
	l1W20BoVLKJVJyB9DsfyyUzUvGVfv+z4CRyCkdBHELzlbgGDGEecU87nSePs=
X-Google-Smtp-Source: AGHT+IHwiyqv8BKzi+dR+PpIl7jBzB6L5CZCo1SyOa32R4jh8RvMJJJNOLTJyzsz5roaHDlwHyf+Nn0J9Lp4bZ1ZoBS0ef4VUQAh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1527:b0:3dd:b602:88 with SMTP id
 e9e14a558f8ab-3df4b48cdfcmr122378155ab.9.1751272744663; Mon, 30 Jun 2025
 01:39:04 -0700 (PDT)
Date: Mon, 30 Jun 2025 01:39:04 -0700
In-Reply-To: <20250630080413.2136-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68624d28.a70a0220.2f4de1.0028.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] general protection fault in bcsp_recv
From: syzbot <syzbot+4ed6852d4da4606c93da@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+4ed6852d4da4606c93da@syzkaller.appspotmail.com
Tested-by: syzbot+4ed6852d4da4606c93da@syzkaller.appspotmail.com

Tested on:

commit:         d0b3b7b2 Linux 6.16-rc4
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15c9a770580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2653dda68f72de50
dashboard link: https://syzkaller.appspot.com/bug?extid=4ed6852d4da4606c93da
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=119ce3d4580000

Note: testing is done by a robot and is best-effort only.
