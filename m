Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C770B264A65
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750088705; cv=none; b=GJxslvby6ChaVlNRIztKHM1oSU1I8B8L5meL+KJW/yxmKHVy+cDvAGr1sVavmUHxl82hlT1MEesJy2DOPdxh8g0XE68ezoqjW2qe0O/HrzPaot9VVMyC4oZPOxbOALCD3ZHAuXGL8JMOwChfiCa1MF6YoG+C+UAQaLrjOnjK6N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750088705; c=relaxed/simple;
	bh=9nMPTz5bGSvEG/i14uqwmCghT1xa4I+arwdr3+h7liY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LT5L+8DZWSRDR+bwPn5sZRzZqUFJ7lZirJa1SNGvgWeXaVC52xWJH2LpUA8Rf4NXJoCkHfA6d43uEyHq/KM5yri0SJnWhgD34PyaCmQDA/23Jh4oZ4yZPoTAqnCFeQl0g1D+0FBDtWWgdkZ+LisFjIKaWcs/9GZ23G0KQPoXEtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddce213201so47827205ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750088703; x=1750693503;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7D//4398RMDH1nIHk/V9PjnlZFD7Aah0HXh4rxQDfP8=;
        b=YBfuKe+lLoV3mtryI9jvFC9kv29W1ZCUeSinlJVBh44UDoTm7dM/rwtZcFnp4P+6Rl
         wCHcNeIetosaw+8Nkl2p+jIwsFOTLb0uEnGPByjFR7+qaLpJCluIwDe0BmJnV+67GYxl
         QlzqyyprHXZi1pu/clNZHelOHVf4pvaAX66L3AHmkTH1uCVkv7J2Up61BgFTxOhbkWac
         eS3bjrj16wuaqA4b5jh7BsKJ5SDE3GEOiRooHl55OOwHZ/E9WGcUirVqOMlNXn5NHvgt
         Q8l4a7LlYtpOh1+bpPFFCk/5wAtiOQbU5MzJ00xhmRd4MnNh0GrBoBWh/RLsz1VjTO0j
         n+WA==
X-Forwarded-Encrypted: i=1; AJvYcCX9GXw/oJr4GJEylhPhkN8Y8roHaFrN7wBfwnKfmQzovAT0HBc/+BD7caIZxLtT+7jduHzE5x9sO/wu2xY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe9D17tfh9p7jXXWcGfwrTI3o5eUdupV0fAMhFCYdvq6vGAS1T
	rBbGRiI9Jiik2owvLJU5W8my/35MYTEwre+n8kVQkV6sAr59piJrrUdkBuSktLqnWdd5tR2P+tF
	zxpZTSGGJNwsomenDMq1KjX9GQ59fbVy+ikRQl1h8cb7CYAGccBPYc0icfBc=
X-Google-Smtp-Source: AGHT+IHng+hQD9vqG0pg0/vbuhmvOeBxFo2e47QfXWmQZg3xxh49WSTlGo5kedlBCd/FmhBkLYXzZ15O9ROPuAlr0FL++MT2ZMrZ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:d350:0:b0:3de:12ce:d832 with SMTP id
 e9e14a558f8ab-3de12cedba8mr46919425ab.10.1750088702920; Mon, 16 Jun 2025
 08:45:02 -0700 (PDT)
Date: Mon, 16 Jun 2025 08:45:02 -0700
In-Reply-To: <20250616171838.7433379cab5d.I47444d63c72a0bd58d2e2b67bb99e1fea37eec6f@changeid>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68503bfe.050a0220.4562c.0008.GAE@google.com>
Subject: Re: [syzbot] [wireless?] WARNING in sta_info_insert_rcu (4)
From: syzbot <syzbot+8b512026a7ec10dcbdd9@syzkaller.appspotmail.com>
To: johannes.berg@intel.com, johannes@sipsolutions.net, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8b512026a7ec10dcbdd9@syzkaller.appspotmail.com
Tested-by: syzbot+8b512026a7ec10dcbdd9@syzkaller.appspotmail.com

Tested on:

commit:         e04c78d8 Linux 6.16-rc2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13f5ee82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8f72e140c622500d
dashboard link: https://syzkaller.appspot.com/bug?extid=8b512026a7ec10dcbdd9
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14ae15d4580000

Note: testing is done by a robot and is best-effort only.
