Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9C019CD1D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750913108; cv=none; b=GO8YYjXF1556kOyXZtVpuXGmDQGgnsM6xA4L95/WxzTpK3T8wMc5PPmgzR9eYqmM/7VwJXyApfdYvqq6/WsTHAofZj9lKCuM3hax6S/9L99w7h0fBNDMX6sPHSfv9bJ0xamvepkL8gHEdKPc0wns+1k48GCPIo+mtL1n+61VIwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750913108; c=relaxed/simple;
	bh=g4cq0xoG6maKo7ISF4triDcozSUVIygFh/TI8muMPnw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=G4LnS/DMiUiKh6y9Lwc4K8PpWlKGXFP0iJBmBFn5phhzaGtH0lRTh4bV10I+cKSY1M3GNPVaKMBO9GNNx+PuuYpWlUUZ1clRtapu7LNUm0JzS6KGsbva6AHN6xyqeTdDyQs053u8vyCiUL/duoH68Oh45Z73FjKdvxTxK7wJrME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddbfe1fc8fso13082535ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 21:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750913104; x=1751517904;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/Ni5oL+SSakl2XmQhEF48L+9+lMAdqM3nIIhZLrgEc=;
        b=SDzBMo+WN/H3uknkAPlWy8P4rBu+/BSBIMSIq9Vcz7Ytydyh42MHv88QJ40V+xdZPL
         tsdHaJKI2zWE9NQVoIc2RYWQ4BDtGrbdTyRxZe146+4dCbkXtNMI8acjomEBS1+CNMt5
         4j8gxAAgczwNf0HQG9NLVMTnNlMQtuNNqTV+0zkOrgTMd8Z78pvPhvHqGSF1U1hgvr23
         dcWOYXPeG8jczlvoRqyrLdsjARd0qUFKa88mI+gU++zSBS8hSZ9fO5VgEk0i6JUBOAem
         Z1pKRWK7sywB+lEYEwy0hYU3GBJjCCQI9QWOQNKAw1ZDx2pKho7+DN70rlrxP7fFoJr5
         gq5g==
X-Gm-Message-State: AOJu0Yz3imS0Glcb7YyMYrlpy86i5QqiC58KYwu2fbruMZwrwzBp71tO
	jGpQCbYH21augjD3AKmnMLe02wCxcR4R72K4ydq1eTBNR8LogWXaomRLPnOauBqQm9pHZ05Bxhe
	ETyVRSbi4dxD4amlMXTIO0Lzuqw7yOJlthpLIgqjOwd224aVY+BStylhE7rk=
X-Google-Smtp-Source: AGHT+IHFTCRBvovIMx5zZhig5+gPn4/gJbK7omgrhttlY9g4ZrEBAS/d9CEffn0DNSS/CY4uAj7gIE/hzM0ylJJ0IWxsMxDxjDTq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d93:b0:3dc:7a9a:44d5 with SMTP id
 e9e14a558f8ab-3df32931b9bmr84953905ab.22.1750913104401; Wed, 25 Jun 2025
 21:45:04 -0700 (PDT)
Date: Wed, 25 Jun 2025 21:45:04 -0700
In-Reply-To: <20250626024902.2942685-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685cd050.a00a0220.34b642.00e9.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl
 (3)
From: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com
Tested-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com

Tested on:

commit:         c4dce0c0 Merge tag 'spi-fix-v6.16-rc3' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12325b70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=595d344ff0b23ac5
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=165bbdd4580000

Note: testing is done by a robot and is best-effort only.
