Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4121C2153D8
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 16:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485886; cv=none; b=e/hw6maj3j1/nohqseU20QEpni0RThG0fZfeQq0Psq2kgTjtWBwuV/7gukLP6m33PSVsfsSaaiV0fUIiyycr6RJFp5GLhpSOhCrerNwNWjMsSdmhaoEdz+OFK1jZFxstXJkRJuFnz6ylzx1+TcjUU4GUYxhAaWTpvqXDBJQsdyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485886; c=relaxed/simple;
	bh=uA2HfoVRXZsRCzuRL1GTLf6YRcpWxPDNSBK5q5G1S/E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Orxhm9xCaqLjgi21bb7iIs81h3w07a3EP/iX2NKJ0WPOhmnoy0kCr/QR4fVVZbwWe7z0Fydrp1qVt+XsYCogOzKkPdCeAdSzoXEzf3cq/AJ4xH90zRwSNY8dO4myS1hiOvQwsYoFNG7oN1Do2bZZ9rRr/VAMoIyc89d07BjD628=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddc65f95b8so99411425ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 09:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749485884; x=1750090684;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qno6GnY1jHPNUuMqvvV96he6+TJNmiu6bOzCDFCRxzk=;
        b=qxqLhZ5I8cp3L1WmtVSr6cE8oeqW/yIaIpCC87jVG/goc3nL7gDi+DIDpPdFA8Kkf4
         gHt4Z4+n3/lN6CiNP1Lswy8g0C5LLJAl0i6QzysQZmTsEdHr5sFD5sfqgvQjger79Fh6
         gofJAEytVZf5kvDfGDNfJzVRFoizZruIM8+ojOoPiEngJZ7pZmTKijaA9A3Go1mcObmM
         N2b/S71bYTH7J++99EYI0PXKu6jR3pa2vZbIXUhUqDtmzwSPwz9QVEFSQQ4NmwHuxHf6
         6P+/pOCOSQHPkidkeOKhue9VUd58NrAwVX5MNKWMjks9XYiCO+kLMOGb5NM6WIWCOX6J
         Jowg==
X-Forwarded-Encrypted: i=1; AJvYcCWRmFzLoXpZxz6bALGDQLMKUqDQna5xQ8npdUla7NyI5BBNjx1S4nrWbYFC3AL9YdZYeQsrsWkG4N4/4xs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH9gYM85y2aus3t1+gm4bLLX+Zh797iYfrU5XF8CLMlfEsUqHH
	9J/TgDMUq04YDJZOvcAQAhol9qmcORhGQ81w7dh2+TvQfUz1dMPgNC9QmVVD5OXxEZF+OVeHhcp
	BySr3kn+D8UeiuXkV7wRSB1LBkFxxIeZB2oHqHHltnGnrCz0W+BXw7sKPRCE=
X-Google-Smtp-Source: AGHT+IG3IBShKKO4XmMeyk8CtSwOTscW9xbFRr3qpLa7bbDLJ2LW6Z0XrXf6SDFvV67Wz/j4YCU2pEOoxTTQjnC21y14zM1nhpJx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca0d:0:b0:3dd:79e6:3ba4 with SMTP id
 e9e14a558f8ab-3ddce40ebe6mr124398035ab.9.1749485884425; Mon, 09 Jun 2025
 09:18:04 -0700 (PDT)
Date: Mon, 09 Jun 2025 09:18:04 -0700
In-Reply-To: <CAGR7w80YXbHHLoSt+CMGAroarTFe2jMXqvJRddpgmbV9=GLK1Q@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6847093c.a70a0220.27c366.0057.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] KASAN: slab-out-of-bounds Read in bch2_sb_members_v2_to_text
From: syzbot <syzbot+5138f00559ffb3cb3610@syzkaller.appspotmail.com>
To: abhinav.ogl@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+5138f00559ffb3cb3610@syzkaller.appspotmail.com
Tested-by: syzbot+5138f00559ffb3cb3610@syzkaller.appspotmail.com

Tested on:

commit:         475c850a Add linux-next specific files for 20250606
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1318f20c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=28859360c84ac63d
dashboard link: https://syzkaller.appspot.com/bug?extid=5138f00559ffb3cb3610
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14f02a0c580000

Note: testing is done by a robot and is best-effort only.
