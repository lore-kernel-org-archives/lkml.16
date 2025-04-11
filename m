Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6B126FDB1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744334104; cv=none; b=IXH8dXG5K2Ty7He1MoMS9JA2+17HWLwMbgiUjYTdLoy9zdTW/ly1CrA4rqc4ligu03vfaOpHFvgg6imt+kZutceG9f7E9XOUOnCchDCeZXe7q+xr1CPgyQj5ijRc3fVjP+EN163wLYSZsigemVX7pUjCXJWvqfEtA2r3Gg/s3D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744334104; c=relaxed/simple;
	bh=KydR8JXC+N9yiC9tHmsvRf/W1b/Q9BoOhngqWsGYfTQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=g7wkwHYihTvepB2Ra4OlKqxiC3ZAuzqpnnJCqM03hfoXuUHTQn/tjoIEoqZ9HZ1UZYR6aSgYXi5jwhvxLSklXxwj6+JqYpL+W3CrEhWXIuv6O3RmuS4G0K+o7ItR4Jg2/b4uS3JMjFqGIYlQS7ZZ64buoRLsiaykgypL5zFcYDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d44dc8a9b4so15740255ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 18:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744334102; x=1744938902;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VP6kfhKYCkLO+0vpvxPFmDz7COGDxiL80D47SBMivXU=;
        b=GHlbt3qdDnJibhZFFzYBJBu0tEIDes3DTkRzjtbYlkKXZurLiZtgI8MQVTD2weZ9HX
         j7kLHbRr69n/SvfF3h5BXIwADGQY01GZSfDy1giTauFDYvOYDc7/CdfR0kSdL4eHJA8e
         HOWEB0gKyTSnKvFitKRyFb91GSseV/bnn9xeTJr/I/gNHpd0otkQRPtbGYW+ognztseD
         98fYYr/2U9vnFAWkdP2tOCpjGiw8T18P+2asm9DCWLR/eWQ9wnopDpjz7KpK+Xe/Hnho
         lwtfx9WKATTC5fdUFZUWtRSx9FvVni4oymCEzVNOC6vE3uczp9eaAWoAnHnF89AiUNtD
         E/Og==
X-Gm-Message-State: AOJu0YwpIUmPpLNCJVj+/jwPRwcDTiGDC4r5x4kL3rFLN/DekJMjUZH1
	895uY1wLcp+bn5HnNCgoslqFmsBAToXjGrk7XHOlnFirOrIttoLKCiRQh0DD7BGo7/HpuJ5oIxR
	jYNLs4eTerO236uBH4qhcTR/jkL2HaoLF4r+OO4B3S4Ce/IMoJl36amI=
X-Google-Smtp-Source: AGHT+IFrn71Cd1GewTCzk7gystHVRSJWVhGWLpibwnrMZrIf07N4RfzGCUBNGl1PfW8/6hqhxNFMBeYQx22HnXwyhB4wEN5ku0j/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2510:b0:3cf:b87b:8fd4 with SMTP id
 e9e14a558f8ab-3d7ec276440mr9378545ab.15.1744334102445; Thu, 10 Apr 2025
 18:15:02 -0700 (PDT)
Date: Thu, 10 Apr 2025 18:15:02 -0700
In-Reply-To: <20250411005138.2946521-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f86d16.050a0220.355867.0019.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] BUG: unable to handle kernel NULL pointer
 dereference in generic_file_read_iter
From: syzbot <syzbot+e36cc3297bd3afd25e19@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         0c7cae12 Merge tag 'irq-urgent-2025-04-10' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1373f070580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fb8650d88e9fb80f
dashboard link: https://syzkaller.appspot.com/bug?extid=e36cc3297bd3afd25e19
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11a8474c580000

