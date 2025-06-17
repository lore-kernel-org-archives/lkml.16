Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663208460
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750147747; cv=none; b=tyaQGOVGwF7EHCEhapS7owgWQvIarylT7Q3N1Gqsh+3PgH0/gnX6HnSo6DoziwIlmp9tQ2gUY8Ca/Ofp+/1BtcvIiegReSCYK66VsJjpxd4zOGIlX1EGYsYqPvbahZyg9Fofh3VqKw1Ds5DAWlzD7QgoanoWzCUfUHHXSgElIpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750147747; c=relaxed/simple;
	bh=H/52YTvujAF9qhviVY4o69BYKqm7KCOTQFPnfOaiHt0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RclFCdk1dtnFCN94FlYTkOzRo+quZ2B0A1rvHfgn0e3jFxHs5TwmdIVvaFQQ+9L+3YPNqb+sTCcyFW3JrOnJyC1Txxv2q+NMqY27/lgmpYfRehv8VnywURlhOrN7QhsUYnBhqw87o9DeQQ+VAiUYPfh/AcPsn/mFBaXe/o1u6Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddc65f95b8so116261275ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750147744; x=1750752544;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=harcUdMCnYS6rwoDnFxQ0g79WZ8KXCvFNZZZWOLaejs=;
        b=JXRXzkZXisLO0O0bfIL0bcCWaxq00TG1w9dpXjoHybSr6kXhk+pPTTP5Q+j1pvTz8A
         CjlK8UjFtY35Ehp9xxizCAZ4205/RgUKXNwCrtaDwBDvD0dqUtYBml3Zut5G6hdUmytb
         4R+pzNaFildiFPpq6jKqm72EMmmSGKFMI0fYGh4VrhrFcxrXY0c9JFuS267v48V+3RgK
         nbqdrwDO99fD0XCvxOpxf0katUByy5/NUiCBGpicHMUKRB+ZAt6YZCqejs71YgJB6crg
         OdM2bBKxv9qK/GEybEsRLU0L0m9crXw/oDiAZmM4hpGafsIx7l5RtSiHyz5CtJ2fTZbW
         tEKw==
X-Forwarded-Encrypted: i=1; AJvYcCW9pF+1Mqpxm/UDqQXixF0AwmQtXiUCCz5JXFNLwDcehulmRS9yrQIa06aFDW+zoVWf5ecOg4iG5ueo2d4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr8E6bJm5/PgVkXSr7y3goG4wpeLCL1tMJ5tcECdM4kIGvwFBl
	WJWoO2EYNI6SJWLc/hS34DA6xhy7nZVwSQ6JZ9ErZR3rQXbB7Mw7LmVbwKXM2bg3RoLRl5ODVq9
	nsAMVmS5ta6Aj+a2pwUztgLaBHzWP7aadFeZqOhvJ23K+tnvBFZLVdPBUhX0=
X-Google-Smtp-Source: AGHT+IHEZAWIDDQHGmsmQLU5xrO09nysXPQBqd8PtglshhoEB/nUm7ccAFud5cuxPGTUiOVDu4PDF3ap4Yo+atSjDpFMGe7CelK/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1445:b0:3dc:87c7:a5b5 with SMTP id
 e9e14a558f8ab-3de07c2710fmr144218225ab.3.1750147744469; Tue, 17 Jun 2025
 01:09:04 -0700 (PDT)
Date: Tue, 17 Jun 2025 01:09:04 -0700
In-Reply-To: <tencent_78F762B76A86D9D36003690962E3BE844205@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685122a0.050a0220.2608ac.0011.GAE@google.com>
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_rx_mgmt_beacon
From: syzbot <syzbot+6554b492c7008bcd3385@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6554b492c7008bcd3385@syzkaller.appspotmail.com
Tested-by: syzbot+6554b492c7008bcd3385@syzkaller.appspotmail.com

Tested on:

commit:         9afe6529 Merge tag 'x86_urgent_for_6.16-rc3' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14a19e82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d11f52d3049c3790
dashboard link: https://syzkaller.appspot.com/bug?extid=6554b492c7008bcd3385
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17b94370580000

Note: testing is done by a robot and is best-effort only.
