Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2970F29AAF5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889608; cv=none; b=QpK+jDerewfx5N8bsJzEEVZVUTD2pdu5jewCg7oSFYSbeVD+s3+tzkhJSX+79k+YUY143DzejRkyU8RU4gRMyd3eCihxmUCPBJam25vvz5JSW2OJXvUHdfOvJMVDDdwXbr4baPy5ELgPFd550XgiujvQKBd2ZDP1mi+vIr2GzcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889608; c=relaxed/simple;
	bh=sR5NzZd6gB92D+YYUhDZHN28rfytV6FGqZQRcztfPFQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=db/UYqdQU89utUV996YypoGizSWbDUtHX68iLNOBluYLCWZPHmerj4gKbF3h9EtHKBfx5uuG7afpp+aIxSElo+hU7W3/OeF0fm6lMzxBifaxntqZDQPyzKDVZ04qDkZ6EUFeBTruYj/kBzK9TBPjRWWncyRdPjr4fS+f30bt29o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86d07ccc9ecso215194439f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 05:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751889606; x=1752494406;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MG/BFrGeNu2zrolHFTcPIfc6coVJaiqjc4KfS7f00Z4=;
        b=S6Gy6NXJzKroCsimZxdsMvnzy0yxXKDrIYRnD1SX7Iz+yHMRmka2vhOgZywJuboUOL
         XeBlFWhyeVma7psH1bKHE26VuzTLaWjmOsyrKLBJMALqiChEwF7q26M9ykhlvOwnWLFe
         2e++ckEkhr1QmdvxA+5L2D5lXrh8XEh4z12tJnUjIzU11R3syJ1AhUHaA3FRaA107eOt
         GDZuNI0pV6Ga6LMlkbv4KlCXSPTcvxbKEhVFOxikcrmSvhWN4xt1G8gLaHPqx9NGUfWg
         tavcGaHp1oLSD2n9LlPnQgRwelIG3Xfr42VQlDBe8aMwr+NZzb1/2r9dVx7VaVkcXRFn
         WH8g==
X-Forwarded-Encrypted: i=1; AJvYcCXyp1wiH22j93x4bslPyWCrqZmEQT055gi+sjnHSGdxpJZBpssJcPccYORWHC2RXhaPWYAa1RkOYXnVyBI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4jDxIPmal+lWbi+pGIEtXlWPhifQQ1YHzSFzs0Sa5bBosGUuY
	BhLIrWXFnv/7gdxkU0rNUNPRh0/IDGQCk2Qq654nydB5SIqJ0yug3buscdk3XIuLt71V4156Wr8
	Wy+PFSlA8wCTdVJYJPie6vBcmCQJXuNEwHjsBKyIOkmHswBPeRWxW+FziuHE=
X-Google-Smtp-Source: AGHT+IEuiO6NN4/MHaaUcmlU6EEXItxKrtn2LFDJXr1h+3rZWUE7rs1UVj+Y/EJQ7GuyDWCSIoQ135BiVSZvIOe7v2H+OWivZaSO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f12:b0:3df:3ab2:cc7c with SMTP id
 e9e14a558f8ab-3e1355658bemr96154485ab.13.1751889606077; Mon, 07 Jul 2025
 05:00:06 -0700 (PDT)
Date: Mon, 07 Jul 2025 05:00:06 -0700
In-Reply-To: <6853f202.a00a0220.137b3.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686bb6c6.a00a0220.c7b3.0084.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] kernel BUG in bch2_trans_update_by_path
From: syzbot <syzbot+210dfbddd64294066983@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit d21262d4e35d448cbc80092c91f04cc0a5f2b0b4
Author: Kent Overstreet <kent.overstreet@linux.dev>
Date:   Wed May 28 18:26:33 2025 +0000

    bcachefs: bch2_dev_journal_bucket_delete()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=100a928c580000
start commit:   d7b8f8e20813 Linux 6.16-rc5
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=120a928c580000
console output: https://syzkaller.appspot.com/x/log.txt?x=140a928c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=72aa0474e3c3b9ac
dashboard link: https://syzkaller.appspot.com/bug?extid=210dfbddd64294066983
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=141a1f70580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=121a1f70580000

Reported-by: syzbot+210dfbddd64294066983@syzkaller.appspotmail.com
Fixes: d21262d4e35d ("bcachefs: bch2_dev_journal_bucket_delete()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
