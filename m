Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5487924B26
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749044944; cv=none; b=minHhaMhAjrPDz61bcQ2+YqpOEPh3Nt2keHpjSR23l2WS04e508zrjtZb08m1AeE+hwgPbrtw2zi8liwrf1MSRT/rXkl1+2A1NTBAqvpmMAGIjkS+yRze5gM0OUyZMlcGGBw15Hl9CqyV2+u+u4twNBASmCTD9z4i/Z+EkL1QYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749044944; c=relaxed/simple;
	bh=E6AjJsZoQR7ATw1vqbUKxXWRnlc6fN/YqQrTu5Fj2JM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=B0y8mhK64KU31cu/31ZqGzvb8U+BSKg77nkqOpJuuoQ7xuyh4WQ9gx4OW1Ba/RXzxp6uX0tYoIZlb+u6ZznRH2B/lSaBWNVE9YkxHJIyFgDgRxDgQ/IWID4+5Q6cvJXljBPjrtd1TJqSBUEm5mw0bMVcRzEeLCtkWVw7oynaAuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddbfd1662cso5724315ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749044942; x=1749649742;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N11uxGJUKeG559sG4Xn+XEgkd5khL+2AZw1RyfROMGw=;
        b=mj6znGQWhc4aT4ywdEHYsPqmpE8WTh5eWq1xdxE7W5SA+dVdxUowaU/jjC7t6fKFYZ
         iKet5dx666I3aNrg1L1G4X24xIfnpdElbqxd06l9eC3cK6BcHmgmebr/CoxRxnARljB3
         eV9Ir3tPRXjTCyR5f4m+l6Y1dQy/ZgrAxawhJaAxjNJn0DZaHGg6fVw52mPsvZas9AIa
         Hdi8XM1N1wAQ4SkcRaFxfUMyTSmUXIYHrcx/rq8PHFqvEi7ujsc4ZLq8RdD3yGxAzz42
         z7CnLhTCr1IqJYyIvsH2sNCzRk8iUJsJUGNssa6YzhEJ0xQUPGbDh3r4Ji8lGo4Z/vpM
         OgQw==
X-Forwarded-Encrypted: i=1; AJvYcCXRTe/7YYwtOpg/aEhHKDCwQ1v4r0Xnc+ZvzXU8PWkf/GiTqFFcI4e6hPbnCkEqJdQWkfZXe5R08SYah/0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/1g8440pcQO6mzBrBPVA+LOC03H2PZyAx/qnHoWfslQp98+5R
	aeUqP8kGVeoGbf8ok31xOWoWsygpfYj5fM9KuNCXyX4PAm6b9GJ3Vij9EOG7au3U+UOi5L1ApJJ
	C4L8jg0IuNN5TlYbNvTeoj4H2KZs8jpF2YExZycDv3hOW+fNZjl4yj7DqaCY=
X-Google-Smtp-Source: AGHT+IHSSnUkFWqcgI/NtYmboP9G/XGenJErYrL412ddFEKsEXLA6AoH8cnZsc6pVZ4n+njQnEYpd/Nxew4+Rj19uLZbUqzVeV+R
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12cc:b0:3dd:8663:d19e with SMTP id
 e9e14a558f8ab-3ddbee3d578mr27737905ab.10.1749044942381; Wed, 04 Jun 2025
 06:49:02 -0700 (PDT)
Date: Wed, 04 Jun 2025 06:49:02 -0700
In-Reply-To: <66f7eee8.050a0220.4a974.0006.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68404ece.a00a0220.d4325.000d.GAE@google.com>
Subject: Re: [syzbot] [mm?] INFO: rcu detected stall in vhci_release
From: syzbot <syzbot+46c3d1706c2d2688baba@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, bigeasy@linutronix.de, bsegall@google.com, 
	dietmar.eggemann@arm.com, edumazet@google.com, juri.lelli@redhat.com, 
	kerneljasonxing@gmail.com, kuba@kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, luiz.dentz@gmail.com, 
	marcel@holtmann.org, mgorman@suse.de, mingo@kernel.org, mingo@redhat.com, 
	pabeni@redhat.com, peterz@infradead.org, rostedt@goodmis.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, 
	vincent.guittot@linaro.org, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6d71a9c6160479899ee744d2c6d6602a191deb1f
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Thu Jan 9 10:59:59 2025 +0000

    sched/fair: Fix EEVDF entity placement bug causing scheduling lag

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15a9780c580000
start commit:   abf2050f51fd Merge tag 'media/v6.12-1' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a8c36c5e2b56016
dashboard link: https://syzkaller.appspot.com/bug?extid=46c3d1706c2d2688baba
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10564c80580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: sched/fair: Fix EEVDF entity placement bug causing scheduling lag

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
