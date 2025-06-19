Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F152776034
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750366087; cv=none; b=pIpmFe3u96gzQczfLRAlbjiixWvPmMogfh5iLs/371oFv9zgFp7E5n9AnmjnJKt8qZCjNGKggnF77r2QFfO7nY/qwEsfJBkv/vYl8M4/yLZpeu3geBP9kdz1O3+zLI+JRSBlOrY+BFbHcppB7LQrtiiBTHhnamLCGXR0dGJrPCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750366087; c=relaxed/simple;
	bh=oMdykAUw/PNnCAqxFssXe9AdIblfs5RDZadj6TVf0c0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RnKSrIdLBuFlpYfvzHxzg1kyqEPxl7s1VenyquYXytOShFMw7tTc3SsXbSNzlu427q4OEnoVsYejp24WGMuQ2mM+hhDE6JGwD9LKsQDZTxVoIMMP6t9WyShnjK1CQf735ab25W5f7U/7WBeFOdkPb6vvf/aTVTeWwz9BRXC3M98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddc4908c4dso15558385ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750366085; x=1750970885;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTqe+KHA+99J4Dn+ByqK+2DHn0R7rINO0ylipLZhOQI=;
        b=w7bTIyPzba4l7jXONPBzseWV8n4zcpsjWr2ZyVMNGHirFDtoprFGekZXjoF2vTWT6b
         D7+0cl6voI3t0nIGpgaFRfpe9+23NHnQ/FdgvLcVUamMGgnDVcqc3wlv/uoeGE64MTf4
         8lCIWaaG0Jzjm8T0qBAl34XJxDwl1+AIokLoxD9nc1LXEOTpsa3Osh54SjGnonkiRgnA
         HtAmWTQunolMeJ9Mpxa7IgBDc2T2JMb+CkgYavw4RDHKajP/mTrJwEns3oKCN9Nf+Z8H
         jiZ1hK/XVsJhNSy5Dcp7zdQVIte/NJoBQShX8tmF8YM6V2vy7GJgQ3/+uaqBiR0dzzcH
         91lg==
X-Gm-Message-State: AOJu0Yx4C3mhN+a924bInFI2bpuaYOTiZQVPrJd3UcGdwCOaZieGFHD/
	ASjtkqs67d+4HPCiEodUOC1GrFSK1Qu3fhy+MLk4D13fLCX3iMM9vJATGXbEDebdXFKTrjzjZw4
	55YbKJ8buuCVCOImMZ8OpzXNXGDzQ/vpkbA4dN0hizBqZA8wiJ/ICBsUnZxk=
X-Google-Smtp-Source: AGHT+IFBE6+0gX50wrFRLbwmzfiNRkcjwmoNfH+MXlHSlrwDjv7oEb+O00FxBtfohNIT+R57CjJu3zhHOGC6mOnDyzZA5T2yIArI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1486:b0:3dd:ebb4:bcd8 with SMTP id
 e9e14a558f8ab-3de38c3bda2mr2844195ab.9.1750366085024; Thu, 19 Jun 2025
 13:48:05 -0700 (PDT)
Date: Thu, 19 Jun 2025 13:48:05 -0700
In-Reply-To: <0000000000008881c5061d28e041@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68547785.a00a0220.137b3.0018.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+18cfb7f63482af8641df@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix: bcachefs: Fix possible console lock involved deadlock
