Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F199A3AC17
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744600028; cv=none; b=B2EhLaDNENA48GXzSgsVnO4dUNu5TczMiZK5liPmXadiMVJ/1MZad1RHJt1kvJWLdcwDQzg1nJjcijf9VygLI5Xv3wCOgL78nrIQ4iouLq5AWZeYwk1kvq/jNFUwJqhOJxPnD9U5fZyvQMqQpSpapWRPQQaksKOqkS+aUBtYnUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744600028; c=relaxed/simple;
	bh=HREMeGF/s1vxz9xQppW1nMjEKJB+3m17uYCtJYdfzu4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QpynbE7f3mcMIilqUD9RRWRoVE4IMxiyuvWfN6doxvIP5/No6bQz8XVR+c0iiupCa24Pe7xLOz6gL3MJg9OIH88XYoMmCuJ3r96OLsEYaSCv9c8zQ4lXNElceKTi+PG1TdOhZV+pyZlyIIFByGCXEVWrsrwkW11Al0VmoZcy0xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d7f24a7582so34963585ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 20:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744600026; x=1745204826;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54cVqukjapjwptJMc2lk98ZulqxlRdx+F8Y1epDzm8c=;
        b=nUn66XTm1BDGWiKUCi3MEKmdoWZ+ytSTaKfFLnHtlJ9XJa2Qn65mgPi9UfnTe9iaT3
         /H0Ta1eTZ+ZUSd4hX++CdXBqRdC5Xp1qYFbbT9XlkKREEh8Cii6CQKtTeVLaKRSvsHJ7
         wv2fR165stAgMZjwKtdVQBNEnbLQlANY9/Hmq+PN+7mT+Oz83Gcc9r37dE3SxCsjav8n
         d57SmwYP21Dc+H08Bbxlnlz+nZsimGEQQNZm/PFV5EnEV0HhI2BCFJFiezujoRlSm0I4
         DAEqyFym+vJszMgKGx2CrZfvUD1URyAo6WEgbQmYN+9NaacZqGxh4swhU+X13IiZsmi3
         aa5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUN5PGo+VtWnzYF405h4YHvAcE39vQJPDHndle8l2LyEhrik7bADyrbEkit6obQ0woHqOwHjpS26FVmrUU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx989O9zZTyjr1+znmy84lfGIT2A4Caa5o1y3fRoFUXM0G+a1AW
	rJs2SDCC9b8pjITPaR2xTYh83xZ4rdJyoV5cR79afAQprgPhduMu9uofkQTu/at8nRkkYRL1r3Q
	m86MqPIsqdbgnGT1Rhsu+FsnjV8VCbxfKfLtpjlG2WfJG93pebzBacfQ=
X-Google-Smtp-Source: AGHT+IG6ptXUR1q+CNVldhfTl6PmBCG9MDPErXOqHVCulcsPtHLN8UAgqnQ90cRV+qYAQxEPYQTq98Cfzh9frDE2/dGfl9EuleZZ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3092:b0:3d3:d074:b0d2 with SMTP id
 e9e14a558f8ab-3d7ec1ca153mr114566085ab.2.1744600026026; Sun, 13 Apr 2025
 20:07:06 -0700 (PDT)
Date: Sun, 13 Apr 2025 20:07:06 -0700
In-Reply-To: <20250414023048.44721-1-kuniyu@amazon.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fc7bda.050a0220.2970f9.03b2.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in rtnl_create_link
From: syzbot <syzbot+de1c7d68a10e3f123bdd@syzkaller.appspotmail.com>
To: cratiu@nvidia.com, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, kuniyu@amazon.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	sdf@fomichev.me, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         8c941f14 Merge branch 'there-are-some-bugfix-for-hibmc..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=15bab398580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eecd7902e39d7933
dashboard link: https://syzkaller.appspot.com/bug?extid=de1c7d68a10e3f123bdd
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1661c0cc580000

