Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADB01E5B77
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744037644; cv=none; b=R3yBZDeAxoUuZ57uqbYCc7i4Tf7yOgw+GIXy17R6peoiP+TXIAcPt54JgduAWh9nzJAvH33eQxBfRpBQjzUCyNEfbQZNSqEqe5a2RFpZUynU+XAquRgNiCAu9AGk4qYwGD1q5zEAyMGo+FdiEfo/qjTlt9TefEbc8s8OAtY4eUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744037644; c=relaxed/simple;
	bh=4w78mRBZGZNNPI600JuP+cOnyzbvyrz8F2Axik6zU38=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=E8ZEXbZW+Y4YsWeY+l9uKL1kyMAhBINNFKz2Q9DragSEM0FWw5lW8qgUot3vu4UDgV2FoJM8wfaB4hRrhvbdkVmBPXhdJHdXcteZ1Y8Ad+N7LVlEXzP26+HmcYQMONH2F/wiF6Mhud0sSVVGYan9fuN69LrnuY36KuSNkgC0KY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d443811ed2so78237905ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 07:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037642; x=1744642442;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=87eXy0/HAb1l8mSEeghgon1TgAuvqIEpPCir2UTgld0=;
        b=CDuo1+CYT/rKNRCh7iQ28Znl4alzTqve3x5QsTMjyA2urftNYdRIyZT3gO2UQGy27g
         qfR7Lm3S3psou5y/vhmWYzJl4oDfAjpO1qKx3YSoJmpVvqMNd9rQkREROwj43DFMdvIs
         zplmzhTDLblc+ADN8hDha0Y4xBa76sicTmu49I9BwsHDCLevf1qRXG+7oQDQ17rMTkMK
         VuCSkbxCDQPcfsGFZlO+1b5OcHBa4mN4e/T6oqXBj2xNpVx7TqjE/xalWj7FdSgQOCsb
         MgVdZAFkDV/0BH4nL3f7g3kFHWhyEQ7p9sFjIp7r5ArlZCT9ALZG+pVS+KQ3WkzNuagO
         4hlA==
X-Forwarded-Encrypted: i=1; AJvYcCXxONyq3OrX7I3digOn/BreT8JYzwfQ5b55kfLfuw3YB4efS8gWJ2EaCbxLlDgOeOwqt1FcFQJA7e21ntU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2drL5Gkd7N55jSa8s03BiYzclCMyrrL+CoH9EBsvwh8ZlKw5F
	xTreI1DX723X1bbbAsoMGapWVwBNFErgfpRKZnwZRRsvtU8jhUNIgtp0ypNGA44ILLLsQ3s8ieP
	aB4XARvALMBJ0jlaSznFxBq/vGjW8rvIxnjeXIXlvo4XA4hjSR+6WTAM=
X-Google-Smtp-Source: AGHT+IEApL7+tBTTM3/AYmjFUw2oyXy+24vzKRuL5QFleomUWv+TfmCZZ8M0Kz2xXcWYob1yS+NvoqfHAmDxj9IcA/hPSIfMGIXL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fe7:b0:3d5:bdee:8a8 with SMTP id
 e9e14a558f8ab-3d6ec52d113mr84753915ab.3.1744037642206; Mon, 07 Apr 2025
 07:54:02 -0700 (PDT)
Date: Mon, 07 Apr 2025 07:54:02 -0700
In-Reply-To: <20250407141747.92874-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f3e70a.050a0220.107db6.059f.GAE@google.com>
Subject: Re: [syzbot] [ppp?] KMSAN: uninit-value in ppp_sync_send (2)
From: syzbot <syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com>
To: andrew@lunn.ch, contact@arnaud-lcm.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
Tested-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com

Tested on:

commit:         0af2f6be Linux 6.15-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11f81b4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a6e21b5ffe4f6eb
dashboard link: https://syzkaller.appspot.com/bug?extid=29fc8991b0ecb186cf40
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=105b3b4c580000

Note: testing is done by a robot and is best-effort only.
