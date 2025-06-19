Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB15200127
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320244; cv=none; b=mfkSBWDegI+hHK7IMBJTkwH2+HEffNwkXUlRQmAxw1NOmn1csQWMbfvUEoe8vB8wdi6Drlq3zRguiB6crh21oHjRFUZ1svnnqz/celp7NKDnTN+h01c2MITO5V3itjNbm2O+WVi+n3RLa3jSZcfiq0Fl0Ge+RjMYwfHWfUoasJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320244; c=relaxed/simple;
	bh=OgEtcR3KXIErMlXB4Q/fM3CnZdYu2EF1qoqbbb+Qjkw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZhYISK90vaHZVX++2LjZoIBV25XRcf8ujaCecA/CbCH9+auteNw5Urff5Gunvd/PpNx7WJPRzH195+FjOHJuxLLkH8Xl3xz7v8eDIp7fHSpwPW5IC8MlC6pBPJQZ3FTca6CiDa7EMGj6b3wW1uALhhTjnHvoNbpB1os+QnuSlBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddd03db21cso9774955ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750320242; x=1750925042;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DlCsqoqIKNS2+ynmcR+51W0TPqRe2rJVBVsrX4Q5ylY=;
        b=qhfGAeTREM9BCosO++/OT3w7RzxoWWEOZ6DkBcBFSaqCj4ntPRHzf3lnZA0jO5GN6L
         S0lrhqu9ibzGXfWe6hiacn3W/pgQcK7Rtc0Tm2WqAUmmBcnTUn408q2DKcgr1owMeA9h
         Fk8qXzG8u7UFxCETUp1CJwTUt75z7VBZ5Cm/klWxXi1o46KENuG4DDceAIzFfPTTpxKf
         jkuMb+ub1qY/SUYo+g/4KB6MRGXSOVp21RoEWmNmnTUiEbh5vHcRjmTuPahY7hoBP753
         MZX02v56W858vmO072su0mZCLDso3iR64bQGXsT44aqQiZZ0mCGHqv3DNrUSW6flTSc0
         gXtw==
X-Gm-Message-State: AOJu0Yx8Qz2XARRTDDeqjTbomK87TqLxWj50r+og/hX8iJRQVpyYLgvL
	/THQ4byAmLSNFH82C7NZ1DrZS9G5JZTWVIAAHDsjG0KcEr9geqcmPmBNI2DIvqpA7znCH4Vx6+t
	9t3OY9aUKFiCh+2fPY1g2kWfz5nQKzUPHX7Zcjt2uNBStqEMeMCK0GP8J5kY=
X-Google-Smtp-Source: AGHT+IHypkJ3MjPWe9PYsgHpACy2uG4A4X5u49AZGmp7WPeN/rZ5PkM6bB9J5uIsm+kxDbNO1vK2S4epxflsAMGipms+IzQ7BHcq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a0a:b0:3dd:a3e4:2def with SMTP id
 e9e14a558f8ab-3de07cd01e3mr230622825ab.16.1750320242045; Thu, 19 Jun 2025
 01:04:02 -0700 (PDT)
Date: Thu, 19 Jun 2025 01:04:02 -0700
In-Reply-To: <20250619073752.740424-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6853c472.050a0220.216029.01c4.GAE@google.com>
Subject: Re: [syzbot] [wireless?] WARNING in cfg80211_scan_done
From: syzbot <syzbot+189dcafc06865d38178d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for wlan0 to become free. Usage count = 2


Tested on:

commit:         39dfc971 arm64/ptrace: Fix stack-out-of-bounds read in..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=15fa850c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8409c4d4e51ac27
dashboard link: https://syzkaller.appspot.com/bug?extid=189dcafc06865d38178d
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=116a850c580000

