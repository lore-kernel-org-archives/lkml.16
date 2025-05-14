Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A472F42
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747185185; cv=none; b=s8/4+uXgHenSdUxSxccFe8tIbSpzq3MIRO8FF5sifsoOatKLz8d4isW/hBeGUDvlKl43peURGQEtwF53yLA+HZqUGPIbtMWYrmKfSBREWdwH7PUUlAH/eM68XMtOTWVriaF8hxy8d589F0+N9bgmgX2T0yBmsFpv7mgqhx4WBec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747185185; c=relaxed/simple;
	bh=9GMBNKhV4fbOk721QCD6VXUQ7Qohp5KdPQaZHwAr/GI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=T4wNxD7bon0V6O7gtL6MhMrl9mXBhIPCGDZN53MYn3FqIFoIaxyP11dAN4BMuBtVW7vNX4KjNd4/Iba9Gs/5RxUxdnKMXxV+y2lKsAmklmYGZP8CcDqqwTIncvjfkbd5FLn946/IWv5nPEiCG31U0jtXJ8YhMR6fHk5gldKscck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3da76423ba1so126136405ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747185183; x=1747789983;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7ISYOM93iDFTXdXrzBtmI+YtulPF1CTI2PAIkYsJOc=;
        b=U61UvmDn5dDNO7Sw327Hg4/JpaqvS37CHXnlh70LH+M+6OkY8msbss9T4gXvF2mJtU
         JisrZjwp7HA9N5E4smMgeg0tgHGDeaV3M/xTWzaLKKy5Xs9vffKqv8cx2Nk4A93KI367
         w72SwHTywVvedVTS1yHziUh38uk5RpFpWJYLJ3b8tGNfpwNnavkXNIvzO7RMqHoYX41G
         OKAVXgltupC6OJM345e4BlPqbi8C5lBoT8ejCSTI0W09werfDfJTAnt8Y2urSVnVOYFz
         XksMPuCVmKOzZx8FuMLslGeyt96hDSabb7HpdGF3UqW4Lnd97EsU9It1rgWNqz48EAN4
         5WZA==
X-Forwarded-Encrypted: i=1; AJvYcCU/tp1Maq5bjo0DPC115Ta0IYbDU9R/E+RA3Ez97Q4xR1rnVrf7nkJdEXak1B3XxU/VNDFMhQ9PmRUJLDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXgo59K5k68SZWWIHebY3L+x7wO7+yuFVDsml8ktzzLejHMby0
	YYwDieaNCuinGHrClxJTvUtl/U+onnSYwwc7OngNfUZvonYFhKMV3mYrlbw3p4h8JoIOz+jVJLS
	CFmzSMlSI1gP35MxpefaqinaCM5ogT4kOiw+v44LGPnKxHg7ySAewXT4=
X-Google-Smtp-Source: AGHT+IHAzahNaE0Gcorw9iq8QxuzBpdl5jwU3CN6wkXtzL2dDFYnLP4NF3I1Ah1Oc2rZfEBfyXvb64DMPVq5bMpKYkRLPL5BjHO5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2503:b0:3d4:244b:db20 with SMTP id
 e9e14a558f8ab-3db6f7f490dmr18549125ab.16.1747185183101; Tue, 13 May 2025
 18:13:03 -0700 (PDT)
Date: Tue, 13 May 2025 18:13:03 -0700
In-Reply-To: <20250513204140.1987-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6823ee1f.a00a0220.104b28.0005.GAE@google.com>
Subject: Re: [syzbot] [fs?] [efi?] BUG: unable to handle kernel paging request
 in alloc_fs_context
From: syzbot <syzbot+52cd651546d11d2af06b@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+52cd651546d11d2af06b@syzkaller.appspotmail.com
Tested-by: syzbot+52cd651546d11d2af06b@syzkaller.appspotmail.com

Tested on:

commit:         ac57c6b0 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1124f2f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea4635ffd6ad5b4a
dashboard link: https://syzkaller.appspot.com/bug?extid=52cd651546d11d2af06b
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1009ecd4580000

Note: testing is done by a robot and is best-effort only.
