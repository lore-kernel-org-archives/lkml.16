Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421552E718C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165575; cv=none; b=Jid7TR1ORY9p3dcxd5YlO9HxX09TBwPrPw34e1JoN1tf0Fqy3be2uJKYraExZ/kMN6kRAzSiWa3o0IsRj88HlDrXihQh0cpYDWw2uC1oceOaFMqptH22S5uxKyeBUeXQ9W86GgENXxKmi4yVy0DAKJc5IU/gX6UcQbgA68acI/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165575; c=relaxed/simple;
	bh=W51mU7qZLodURk2i5xa8G6m3EieBsoHBQDnhnGOYS4I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bqYn25g5V/UB+G2wjm9MWwHRXPyqdMLxrcX0ixTo0mnhXXIvC8gP5SIjzwSTs2dH0U1O/fLLqF9ySm1ivu7EC8pmOzkfpKTzNY87IrgSRCdntnQgV35r+ut+KjIXchfhntET1cDyNyzHP3i120MUWXYs9O1ZuAFf1LttkInqlOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-60f48d86076so4329384eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165573; x=1750770373;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Vs/ukJhTRWhCFXvyAhwm/6YRQW9BrrKpMErIgv7ibU=;
        b=qw1OeBk1E98sBv/fqDN22h2PWjrhiEym9BP6vtXM9lGXvHkQMXKIGy2e8bKB2xkpie
         HjO1XMus/B+fd7BEp6NS2FTwJ/LtsKq0qqUP768ehkvw8mZ9clv3OK5fpAaxec6RDt97
         r7LOf91Vxk/K16zi1DKw4iJJqE3IRvSYTGGqxdnud8o2E5j+/xjLty+RzMNM3P/t00i6
         Vi+b5YV2VR54itdyzIRFn0ibHBML/PO8VOhjD3QuMbaVmukbV3ocwz4EutBHcwPLQj4E
         anmfZenP2qEQRk4RD2ga8A5/E8c1D93m/yQA1tTGu7qOESh4XerEGAt/NqDqxFpkpnVq
         +QHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWJA4A1d0idhNOgkD2hrY1vHx/RFdUFmnZdn6U5E6z9bLxb+oQW5xa6I9crVeowGHXDaSsHW92R5pczTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCgJBjsn30WFOTuubc/pskjwFJFtn0W9B6PeMZZfzvly6QYFb5
	MCEV35hN8HtseRsBRDNIksza9r6ese6JMzrxSf08mQgMucp/heUz/TuAbHYSJ6/yiFML9xbgv8+
	TZnNjg4GCswTVOFzH9uRAJiluEAWAVFUA1zgJiYnGEkrVr6LPuKWcWIwwg9c=
X-Google-Smtp-Source: AGHT+IFj7r4b3ezOHm5uSZPtYPrSf3hNmwPZVWzh99U5SDKlROXmXAFNqNFTxggq1yGcXHwUS/AJNvAJP3tl8V8ge9S6Ue8lj8lo
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:174e:b0:3dd:920f:d28e with SMTP id
 e9e14a558f8ab-3de07cb6664mr136490605ab.13.1750165561815; Tue, 17 Jun 2025
 06:06:01 -0700 (PDT)
Date: Tue, 17 Jun 2025 06:06:01 -0700
In-Reply-To: <c655293b-b2da-497b-98a6-05399fd120f8@kernel.dk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68516839.a70a0220.395abc.021b.GAE@google.com>
Subject: Re: [syzbot] [io-uring?] WARNING: ODEBUG bug in io_sq_offload_create
From: syzbot <syzbot+763e12bbf004fb1062e4@syzkaller.appspotmail.com>
To: axboe@kernel.dk, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	superman.xpt@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+763e12bbf004fb1062e4@syzkaller.appspotmail.com
Tested-by: syzbot+763e12bbf004fb1062e4@syzkaller.appspotmail.com

Tested on:

commit:         100934ee Merge branch 'io_uring-6.16' into syztest
git tree:       git://git.kernel.dk/linux.git syztest
console output: https://syzkaller.appspot.com/x/log.txt?x=1284c370580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4130f4d8a06c3e71
dashboard link: https://syzkaller.appspot.com/bug?extid=763e12bbf004fb1062e4
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
