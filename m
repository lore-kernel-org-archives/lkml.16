Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FDD222593
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 21:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749764288; cv=none; b=HSOwQeOAOncijuKFdPP8OQbAF78epj8eTdlSkAZU90r7+p3jnRloVpk4LCFkUjHnVnPwnPW5JONfYOjjbUoHH6IDr8Zr8SkvRfKLDJc9LQFPiyuQ76sqtGhLDZMYJIhqT41f2EQhkNUeIdj/0EeIYXE8sb+Va4wzvXh16KBJ22s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749764288; c=relaxed/simple;
	bh=ghXJGWovtlevUxhJ6b02bvIr70MGxHrQEahbVyzbrUc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ENeY7yh4+d8joKkcGHkfFTxpPkZgndUHpNhNq/9+oriEPVQ347+h849GvrcswkAUlLVk9PwInoWUmYj/crpHciTMWR39Yx5blkZnsSDVsBW1NodDMoKUGLoxdx0DmSUDSZz1v9rB/1N89GW4nZ3UbpR203o1dU6fjhPvWh7h2wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddcb80387dso14808285ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749764286; x=1750369086;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEPUJZD4frWaLI++xX7CIld0+KosWT7GVS1O1Tac6wg=;
        b=vh7qndQa4UWvWwZf7vjjiVCzEkAJQ9di5J8XlmQrnwViWbnV/q2rUUjw0ZyimYgpnR
         0WYVV1d4iTd+7+IVeGWcX8EdU1GTEZzTtOaaEsTgs4kahPtRZHyhzruSxj4heOwZbuwt
         pwrFfN4nstv9EpVqbTWfafH+0EKltOIY8kkve0SPR2/bpQ6K0v80DsUNunkLb3UjY/Pj
         OknHHVL9AbqLCEtZFjWv3lF4nRvhHNwKLve7/Qx1nQ2ivWsZSQkEs+MWlNMSsW8of2JA
         Tqoqzs+8K4QdOGd/3rXZzLJk8vWI8dVmdWWXEpnsfxFdf0oomEfr9ZMC/U+qx6tFxwlj
         GeHg==
X-Forwarded-Encrypted: i=1; AJvYcCVZoze0lcXzjKKwEPJ2lh+d/bgwawuVvHduJBIgOcsOlPyogiIsIJqfzGKnW60z6r0dchiVvrpQW7JiR4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOhXwJPpP6YHaP+YKu7erXXYXzS31d00XZmlDE58BNZzuezYoy
	nVmng7n+TGAMKN2mn47n7PEvgWfz42QbGDinEKOJWJhI1fUD3Ey4h0GmBxaYD/BZgOaxBgMebKO
	tmXi1zBznLiTUJJM3EQy8BUUvQLtrP7WYqQ924PIuFY1uuXDGjDaDCYcHSyU=
X-Google-Smtp-Source: AGHT+IF+g3z+jimjn66TfaQax+CXm+mlRYr8TXr4NCKN/KCdEPYOvVhC6OITFg0tBDAXeokvhpFRmFoDLM7MgO8PxvmHpu81LDA7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3605:b0:3dd:b540:b795 with SMTP id
 e9e14a558f8ab-3de0167404dmr1585665ab.3.1749764286354; Thu, 12 Jun 2025
 14:38:06 -0700 (PDT)
Date: Thu, 12 Jun 2025 14:38:06 -0700
In-Reply-To: <20250612211610.4129612-1-kuni1840@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684b48be.050a0220.be214.0292.GAE@google.com>
Subject: Re: [syzbot] [net?] [nfs?] WARNING in remove_proc_entry (8)
From: syzbot <syzbot+a4cc4ac22daa4a71b87c@syzkaller.appspotmail.com>
To: anna@kernel.org, chuck.lever@oracle.com, dai.ngo@oracle.com, 
	davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	jlayton@kernel.org, kuba@kernel.org, kuni1840@gmail.com, 
	linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, neil@brown.name, 
	netdev@vger.kernel.org, okorniev@redhat.com, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com, tom@talpey.com, trondmy@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+a4cc4ac22daa4a71b87c@syzkaller.appspotmail.com
Tested-by: syzbot+a4cc4ac22daa4a71b87c@syzkaller.appspotmail.com

Tested on:

commit:         27605c8c Merge tag 'net-6.16-rc2' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1033d9d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4c8362784bb7796
dashboard link: https://syzkaller.appspot.com/bug?extid=a4cc4ac22daa4a71b87c
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1143d9d4580000

Note: testing is done by a robot and is best-effort only.
