Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93E51EE7D5
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 05:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751087644; cv=none; b=qVSR1onYMarFQ+FJa9yKHfJO2V4wU9kVc8CrCVR2qrnDk1uV4UhVcbGpu6im2wXfTMB97qcYaFkhVO1hE9TxvoykVaN7EbLnRyERWMloWcCRoer6v5ok1Z4VP7VVTr5JcA+fGQIj64FX8Xh7tsRMackUkJQn7ZWEO80+chyV18E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751087644; c=relaxed/simple;
	bh=ImkOohW0xoy7J25xzFN6PO5huhiGY4VN5yzgFbX+u30=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=flVOGsiKo1QFP8Jo9Cb2qOAePSkG8O+evLPRvLmNKbKOAlNh3QiWoHCKaf64w1PNVStEsG9GU4MpJuMY3WBW/Tc7wbPtRg+4KfrUoEZude7uNcphCYmftwkQKjm+OZQgDuDNNN90MIix3Rb+FPNKKRDs5wASUM+EvT2v+It3l2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3df2d0b7c50so5886695ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 22:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751087642; x=1751692442;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQtYV1Gyi68LVjdcfdU/eNq3IyRRwC3uv1igzI3erFc=;
        b=ELEJip/CJQQ4AOprE9VbOQG5mwkYyBKVZjSiHKqzW/FLUSftipFOcTL6lTe+DmZYma
         nQueS1HruyxjANp+13SHR6I6Kf8t8otBrje+g18ZuX1x6ljnR2A1s8dJSxNzlBIOxsHo
         cPc4DBqKHRzhI8b+QPu3XY1ULVaUTiM3aJPFfQEdgx2CySXQM50e0nQ8AeUFIpM8j4W5
         nH/NLe8lsnWKVhyD6oJ9Nh2W35o4OLSjXMTkbifye040BS4zm+q3hvlAxf2OZ8ALhGqn
         emzTtJnbWrjC9nsTqiNcMYez8SOdH2Hr8BwQtUYF2JNUPdJquOKWA8dORwq5dt9K9DRn
         rbHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgzTW2GoksJ9bF1e2d69RslW1nzSHexW3i4uJJFQnCo9FROxtY00+4vhzQlHaLyg/fL+Hn+Zfl/H8C+GA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyrFAl6vuO3bmL68L6l6Omi6nIJgDQxR3GeVvCnxal/V8y85C1
	7AgPVn6pLVe9MpngsiRP8QIavwdP4s9WBL3LqeTuP6zutCSrhTy74t76QwMsdvYbLrLUehuOfRv
	JWEE3vXDXC7dt2ZYMC4tsiSiQJ9IdsFCmayPA7ZfwxAHFwioavETWTfC/dLg=
X-Google-Smtp-Source: AGHT+IHhgdgQNjS1nBnWLUNfiv7EE/EHoONqacRJkEf60gWH4jWoK7OhxwwDZCx0AkY52S0u7NOzrVPLBmfL6upFVifarVyjRBcy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3189:b0:3dc:7f3b:acb1 with SMTP id
 e9e14a558f8ab-3df4ab85c3dmr77735685ab.13.1751087642190; Fri, 27 Jun 2025
 22:14:02 -0700 (PDT)
Date: Fri, 27 Jun 2025 22:14:02 -0700
In-Reply-To: <685e86b3.a00a0220.129264.0003.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685f7a1a.a70a0220.2f4de1.0007.GAE@google.com>
Subject: Re: [syzbot] [net?] WARNING in ip6_mr_output
From: syzbot <syzbot+0141c834e47059395621@syzkaller.appspotmail.com>
To: bpoirier@nvidia.com, davem@davemloft.net, dsahern@kernel.org, 
	edumazet@google.com, eric.dumazet@gmail.com, horms@kernel.org, 
	idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	petrm@nvidia.com, razor@blackwall.org, roopa@nvidia.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 96e8f5a9fe2d91b9f9eb8b45cc13ce1ca6a8af82
Author: Petr Machata <petrm@nvidia.com>
Date:   Mon Jun 16 22:44:18 2025 +0000

    net: ipv6: Add ip6_mr_output()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13bcfb70580000
start commit:   5d4809e25903 Add linux-next specific files for 20250620
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=107cfb70580000
console output: https://syzkaller.appspot.com/x/log.txt?x=17bcfb70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58afc4b78b52b7e3
dashboard link: https://syzkaller.appspot.com/bug?extid=0141c834e47059395621
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=138a2dd4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=171c5b0c580000

Reported-by: syzbot+0141c834e47059395621@syzkaller.appspotmail.com
Fixes: 96e8f5a9fe2d ("net: ipv6: Add ip6_mr_output()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
