Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC1C146D6A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750731785; cv=none; b=ngVBtzYLRgc2rWz/plXpOzXUORpfp3+Dc5uHkugVPYrWLwFNpTbtV6lZje8XWq9x0GryvzkhDiHqOL9clo7tEkKW22MEsL54jfapVcICKx9XThHWHX6zdKfc+L1bHBDN/HkMOo/Eah8BIrvRH30lVWpEqh7cRvFuuJtpz29PIjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750731785; c=relaxed/simple;
	bh=IYxQq+j85mlxBOt1SAkWII2rvYvwUkmZX/IJyNdDycE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kUd7Qv+1ikenAcRwv3o9QEfRII74Q09OUPPV76WpiWZDz4iCPruKSaQke4rmIpCdn6UfW5f4DBDoBpBovyQHTOsMuV67oR7ycecaEQZhLIC+MIJU+OGCvSQdtkWQFr+uUiNySUMCMEskOuv8BuRdoccF2aGXlALBRF7ujyzubuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-8760733a107so396501239f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750731783; x=1751336583;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmtv9PbyyeDc5et0avduxAVIo7zKxMEFE5NvMKYIppM=;
        b=r0d8Vm5aPz78+3dU2Xo9xXFKMNZqTzsDLGRsTitmbtYMOs58FTKJNisO7TCmIqSmTG
         QjW5erkuXcvY07Snhrhkx6WNrqkiCT1nBha5cdjgqyUWA3YbsWw+1GRYe5if6ILJIkC1
         jAGZJek60y70kQVpkCSq5EdDTN48nHjG8JB+APvBHrGqQldH1G5rUMYJQqDObocX/T60
         IPWrysbK8BWGL/YFjsBgXYbRRanBAveTC1FnyFU5KFsLi+UcfhTaGODoKWMqpPzfqRG2
         WlUDhQR6hjZg9Z6VrxT1v+x78yCnxPOqJBmKmPDFftG5kj75+GxKXjexe2y1hd0aQKvC
         C3CA==
X-Forwarded-Encrypted: i=1; AJvYcCX08sYXJP80chb9oKs0wGn0H8J7UdnxOxqauXzrtnch/DwzybivEgpKcRuGurzLgmN4rpgVGkD2kuCvgqE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6EjCGQl98qxTD6JdhBeW0V9piMc9UTJDAi8rCFTeB2QQod0qj
	nqzmZeBqxKgloL+AHVWwnsVo9yyP0RPBtoKrLlEQtZWMRdvRw+raYeWdKH6nSqldmGvFyibUQ8V
	abbZwzcd7+9X4mZEXH/z8ZvNXB1HFypjbaZ8Wuh/6yZi1ZhEng+PzVSy8o7Y=
X-Google-Smtp-Source: AGHT+IG1xINOyNIDaG5EFRPg3IGnQtlxhz+uYrM8Ycq4ZwV244sqXBLLwh+Bo1A72scUa3eJl+CnbJgEv8OimH3M582yPtNaPQPH
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4419:20b0:3df:29a6:ffbc with SMTP id
 e9e14a558f8ab-3df29a7066fmr8305625ab.17.1750731783384; Mon, 23 Jun 2025
 19:23:03 -0700 (PDT)
Date: Mon, 23 Jun 2025 19:23:03 -0700
In-Reply-To: <20250624005552.1589-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685a0c07.a00a0220.2e5631.0048.GAE@google.com>
Subject: Re: [syzbot] [fs?] general protection fault in pidfs_free_pid
From: syzbot <syzbot+25317a459958aec47bfa@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+25317a459958aec47bfa@syzkaller.appspotmail.com
Tested-by: syzbot+25317a459958aec47bfa@syzkaller.appspotmail.com

Tested on:

commit:         f817b6dd Add linux-next specific files for 20250623
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=100f6dd4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f7617ed010d11464
dashboard link: https://syzkaller.appspot.com/bug?extid=25317a459958aec47bfa
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1453eb0c580000

Note: testing is done by a robot and is best-effort only.
