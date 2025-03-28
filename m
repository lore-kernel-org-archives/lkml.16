Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5CE1ACEDE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 23:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743204007; cv=none; b=FX80XhHMxMCV0GP7L2n3ajjTs4g0+FJT7Qdyefv1PEBk+n6L9OUaFaLmeuXcYx2YZ3Y2jMOKk6YcMZQcDEwzkZWgkOwirCd0V6O/hp479joyTkmS9boD2WMYwPNsLA0OM0bPrC9uCwa/cQ4rYCU+vMlT8GNVBf1ta+ZrOWzhO9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743204007; c=relaxed/simple;
	bh=NPqWvakl93hhfEqcVUUcx4juAb8L5fUOcRkDqPxR8KY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rHlGT7qrBzsKlO/bTs3MrNNlf56xBRSqmMGLPKonkqaLq59mhuHLXB92bwMbPCEguPdJ9/8HFbaWaFrkrERmRtvYPB2a2RinJ9rlNDsVdTs0E8CjjzDAwWjHx/VzGpV4UsvlcFWGIas1X42dJB8QZH/Jr7wRQ32lRMe4tcuAvgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d5b3819ff9so24882295ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 16:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743204004; x=1743808804;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yCVG857K8spOJ4YsQYg/bfS5ks2fAnUWHrw003r3ztI=;
        b=fHf0TMZBI2H2PwXEOA16P4Vw+iqK2LEV/eaGbc5kemDitedN78Ugik04atMuaPDQ4K
         NITyrFASV3hvz4zeq9CcvGCeNjEMwMu/A4bQwhE8NJcn8vxCkdtgWegXPPHdMo2+M/Tq
         VEeNfDwHOSxRjVzXngXAOkBkoTPk/IhD21STbOESq1k5yF4r+DN0w2uuA3FPJqOQIkPX
         Auc2qHiyzC5x9xHLct+IWVhRlGxVaIZPJ0beyZKjAUDyXGY9ZQSiERhqI+5RBFUAZqtO
         B7dOYOo4NJh9JXcbrPw0aZ81bKApbNvI0QYueCr1lX6VNDi1SYu/GHDN3xRN2rhwgCwT
         7p5A==
X-Forwarded-Encrypted: i=1; AJvYcCUJ/XJUmsbgYdesnxTuHonqImuurdX0EJwSNSCc3wNPao3npXMcxt5yVfM4Nrtyn5hW5yqcuzCO5mnNvQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiPoCvyMlROO8lQ4OX7Vk9UE1Ve+NQlb8onCwjTy+fhzvPpIW7
	UsyX26Biz9z+yH7T9ohce87wgiFHyi91SJTm1ppOKEx8tUM86UGJRxxEjye+PTPyXuhLWid36pR
	7GkRT/K4zKrWdL9dfxhmy01zegQOKCE/ntEQnaKiFi35L5c/Jm//bs20=
X-Google-Smtp-Source: AGHT+IGBjmKtWhEv7cg6OyvtdjVUV7yXiaEddspakjNLmB55uy4vp7Q5fbPmsWneys0zmDsOBerGwJgwNvWr52PoFKTGX4KCoLBw
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2144:b0:3d4:6ff4:260a with SMTP id
 e9e14a558f8ab-3d5e08e9ecdmr15302375ab.2.1743204003938; Fri, 28 Mar 2025
 16:20:03 -0700 (PDT)
Date: Fri, 28 Mar 2025 16:20:03 -0700
In-Reply-To: <66fa2708.050a0220.aab67.0025.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e72ea3.050a0220.1547ec.0000.GAE@google.com>
Subject: Re: [syzbot] [wireguard?] INFO: task hung in wg_destruct (2)
From: syzbot <syzbot+7da6c19dc528c2ebc612@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, bsegall@google.com, davem@davemloft.net, 
	dietmar.eggemann@arm.com, dsahern@kernel.org, edumazet@google.com, 
	jason@zx2c4.com, juri.lelli@redhat.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com, 
	netdev@vger.kernel.org, pabeni@redhat.com, peterz@infradead.org, 
	rostedt@goodmis.org, syzkaller-bugs@googlegroups.com, 
	vincent.guittot@linaro.org, vschneid@redhat.com, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 66951e4860d3c688bfa550ea4a19635b57e00eca
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Mon Jan 13 12:50:11 2025 +0000

    sched/fair: Fix update_cfs_group() vs DELAY_DEQUEUE

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16f07804580000
start commit:   e32cde8d2bd7 Merge tag 'sched_ext-for-6.12-rc1-fixes-1' of..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=286b31f2cf1c36b5
dashboard link: https://syzkaller.appspot.com/bug?extid=7da6c19dc528c2ebc612
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=146ae580580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: sched/fair: Fix update_cfs_group() vs DELAY_DEQUEUE

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
