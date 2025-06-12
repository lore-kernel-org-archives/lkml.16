Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBF7242D63
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734345; cv=none; b=VqNkSVX8qD/5IK40OJbHaxM9vNpOjcVW8OOnJpThWcn0mKY6PpxOFwe0S4ImJFxwR7qtRisC4jTrTtorsNzBGmxGXjJEEIgv1cf81/gjLtlqanecVPQTcSDTn2AguDQrgcUuKltHFUk6hWWIPCOM1r3R7/o4cw6Ai2qxE+1M0yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734345; c=relaxed/simple;
	bh=wEDBrz7UieWOAZ4qSG+tujHZvd7NZlffp9OU7HkLgp8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=E9IvKEBhzs8RN1x068HYYAQHKa6eLWUAMJnEQZ5KjnbsDdNf1LQhYcvjRcdGHMXmdtmsbO+SepepaxPFHdt9RllR0+CSpgbfvuuPBtCDMtJZSj14rtzVISMdn8GMG+sFQQlLM4bmHbsLyZl3H/OCUOpeZ0y2+My6mNv8mmgvW6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86d07944f29so187265339f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734342; x=1750339142;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEomPJVfv6N7sIK10wkie2WFaZI7LZ3EKru1BS08pow=;
        b=sv5jr7imuSXR221AsoT2OUxZ5LUUBYcxo+aUxGYjcfVwKeX+dDkIPt6fg0KtZ3FE0e
         qEDydFc8peojF6d+rtsTggDH2mKJuxGAD0BB+LIg7CWTpjCOLSBCJDoYDIrbfj1rw43I
         95b+uSrJ0rAQitQvtX83f1W0z+ufF6mAgvfQFXUhhe5Jh2s78paA3A1081VETbkUXemV
         yVQxd57msK6hwnm0AFywYFRKQOwUABJxZBZUrGVPjDOsIZDtsdY2jGKH1tlx9C2gTacS
         y43yKtJunvAbJCuWqHDVFvf38VXISTtTJ2AWw0JLB6IzWkxofyQJQgf2K8VVAQswa6B2
         NQqg==
X-Forwarded-Encrypted: i=1; AJvYcCVhE5Gm24b8pdsogvLBC58hTl2NVEVU/oThKmKqwK0h8AKzD4Tij2km4QFZJ5ARgAcHdVADYm39fMYLEW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjxURYhkmHWcKGAl4u9CxnSpYXBL5zoYqs0TgojtD1r16u43P/
	YtQjH6tQFjh/3p1Ib6ubr7ZVarciSjIPXWQd22LzruQdd6vnQO+ehb7zHRI5BN9HGXwfGnG8bhO
	HXIogHbhbfsUK+OD29pOGtZItXsi5HjO2AwSpLOhxTekiJk0MD7ZU+YPMu0U=
X-Google-Smtp-Source: AGHT+IEzyX2p2S9SziNqlwW7Q20Eoj0oS+zBQjbyzBCsxO0m49g1o8Mm2QoeL000MA1FMjJ3IKBFEJLGrqsE+25mmZ7iBSX8Qvku
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca49:0:b0:3dd:b523:7abe with SMTP id
 e9e14a558f8ab-3ddfb611779mr33248375ab.18.1749734342622; Thu, 12 Jun 2025
 06:19:02 -0700 (PDT)
Date: Thu, 12 Jun 2025 06:19:02 -0700
In-Reply-To: <tencent_0FCF9E0D8025B30DEE122EDD8FDDA9996B07@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684ad3c6.a00a0220.e7731.002e.GAE@google.com>
Subject: Re: [syzbot] [overlayfs?] WARNING in ovl_listxattr
From: syzbot <syzbot+4125590f2a9f5b3cdf43@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+4125590f2a9f5b3cdf43@syzkaller.appspotmail.com
Tested-by: syzbot+4125590f2a9f5b3cdf43@syzkaller.appspotmail.com

Tested on:

commit:         2c4a1f3f Merge tag 'bpf-fixes' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=160fa10c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=162faeb2d1eaefb4
dashboard link: https://syzkaller.appspot.com/bug?extid=4125590f2a9f5b3cdf43
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15b4ee0c580000

Note: testing is done by a robot and is best-effort only.
