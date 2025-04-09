Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2261CA9C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 01:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744161724; cv=none; b=brX0aGjfen+unJV8ua/RYxVuwzegzS74/qJHjuWVsCB5iRhBYFporb5MBTb9mYyHJrUL36JByYZ1kAaTfHMDLwhZvza6KMFf9IYTishT2wKxR82iO84ivh2z3eVGed0S0AY4M5SPld/CFjPBoE0GRgPGDs36pMTa0F0yjxGkajU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744161724; c=relaxed/simple;
	bh=JQ+VKEP7I11TEVR/N2bMJWnQJmFBin+ypZWReN6bQWg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=W9/qtA9XCyHX41ZefNBU9d82xOfMZH1i7U5ZTBXE7Fxl1Cut+MYanQF9xF3O55l8Za7ERrtto4gMRREcLQckuhUs/eL5oRHtYES/Gvd8ionPfDEytrMc+TI5SVYuyYPFRbSXowO/TfAqgYGbNIuQe4/tKSr0xS8sgML2hvHA59E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d4578fbaf4so124181655ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 18:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744161722; x=1744766522;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kg50C7os/rktBxeAT6yNzI9lqWtcVpVY8/8LVuUIeOI=;
        b=K2Y+5mwSZ7SBSSXcPLeLA0Lrak4dTMNYR0/oM/gy8HF9Hmtvk3bvGe6Pa3qZJgi0lZ
         cHaQO/qN4pV3DMqfRRtzEnrNuBvA2ByR4sqJ1aJTnHd2eU1rZ6XUN23wU7A6KfYlirn3
         RIX6oKAHT2l3rYqQO2KPPbnIV38Xstf6NznzF8fH826w3k2tlF+2Epz2yqceyQYtgUbZ
         kKxL4+sIGfLEut4XYUcOAFbEZqRCN8SbhcJaTOd0uNGHEFg++M/kWk7fo+21mBwHnFxv
         6d27cixHOiRUCvKMUVCacutq686ELFi3VBJ5nvPKHe5V0bYtZTgZK46MEqLJMaMP+s4m
         8gXw==
X-Forwarded-Encrypted: i=1; AJvYcCX1wU0eXQgIA0+++rjEsH8dwKEgsVDmLfwIFSnedrfZAssVvy7N76mNMExJYhPl0eECtiF/9w4h0JKfyZk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+CtMzQQMNxxvslXlSoBO52jYK04R96DqjT048Wr2RhucmOySl
	fQQwVXb2bCeEO14GKBxmRbP9f5rhR09teR8t4+smkSPWvj4Hqnaf5Q3vyT4a4Z563k7Oeqc5JgW
	vv5b09WAZb/MuD/ljAsPiHNcp4JVdqIuLlVJEZjbCOIH9Fhi86vxNH6o=
X-Google-Smtp-Source: AGHT+IHQRRU3fbDJdMTNLvzBKPS4Is0qPWjXtbR+43I1DadI5SKKF9BYT8rR2BSggGi6DwVAHHg1bP3xwU22Jvt0A6dB+JtOAUr6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3304:b0:3d6:d145:3002 with SMTP id
 e9e14a558f8ab-3d77c2cd3e7mr15370955ab.20.1744161721868; Tue, 08 Apr 2025
 18:22:01 -0700 (PDT)
Date: Tue, 08 Apr 2025 18:22:01 -0700
In-Reply-To: <tencent_C66C4B6E75BF769166183CC9377297A83609@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f5cbb9.050a0220.258fea.0006.GAE@google.com>
Subject: Re: [syzbot] [wireless?] general protection fault in cfg80211_mlme_deauth
From: syzbot <syzbot+00778a9a557a2a5e1a33@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         a2458824 Merge tag 'linux_kselftest-kunit-6.15-rc2' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17545070580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eecd7902e39d7933
dashboard link: https://syzkaller.appspot.com/bug?extid=00778a9a557a2a5e1a33
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14fc7a74580000

