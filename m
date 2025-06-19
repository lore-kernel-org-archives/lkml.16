Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCD71CBEB9
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750310764; cv=none; b=a79PxYeWFkycDLvLNo0PqUs/OY0s+zDdm/icbwYOvfUPGHICWx/EfsStXKm98B+lli705CQPvcYEPv5ZGMYHH1I63aLEA3byHXP2XceMQLlwXdAIDaKz1DPIIs3NbhG7g6o2t0kbubG4LG1Sm/C5eHIcd0rrL9D2/eJZ1RpCHBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750310764; c=relaxed/simple;
	bh=5Sdqyctg2uKhVTPW+2OeXcl6bZn8/pDFM49RmSq9VbA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IfDYsia0q7/Z1a/keUzqPQzAC8StpOVa6mUQT+v4OKYu7cLIoBIvdRbBrn3AQRozwloQDuF6GXuC7HUnnU21EtN1NrwsSqWy9JY3cHlCOrcdljmsTGDo2iFXnZYWTnRDktU9WoVXOJ+6KiJatcm1HqDDgfPJoSaaRcxY06NdFjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddd90ca184so3346835ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750310762; x=1750915562;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5AUYbYuCSXELB32r+LjODOWL/mKYb74pK4CYUXZ6rQ=;
        b=rE7kSIdunTQBNoqTjNOLXbYckrH91GlWzCr+lG2qEkFRUw1u6dPEnlgKwLOgWzfa2e
         5owCbDlefuMkj0Cn0l+as9PBXcFODepTNDn5xy7sd5x6wceey4x3/fJZluULtcf+Olye
         EFPGwfRv4M84RPVOMm6uVl+aphtjgNI1hylM3zHxDGEFeZW3CQtwIWJ8VV/7T75jEPzA
         j0KZqHyNGfKroCGNP2T7bb1zbpVmVL66sO2MtSALknw8ipf1V6Gci//exoTKP4ZaO0M7
         56TAQchni2YwKVaAnnyVR4ifVuRN/hRIWdDRdhyvwY5amglbRzglRcrilwfB5YoF0GfL
         Spog==
X-Forwarded-Encrypted: i=1; AJvYcCVTeDARDai31kKCYBSU0dZ8WhnS8jR9UmZtCL3qPM++w1U36AlOtue72bIqCVIJA25xnZiymWwmR/6sNCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJQHSC1pyq2Gsbj7Vu0I/rozkjsGEiLrESTUd5y5b1SStdjjGB
	i0Vi2QsiKmLDIyo4e/ixYDzJ4KR22Fy+pgNGLJFPIgFtKqEiRG8fS36ak9B8UgyFaXH1y2hkE/U
	AYQYYnxlVeg+1f5Zbyqx1MRnyVq/bDDd7L2QEQwRqJzo+8FQfAKt7v93nNtc=
X-Google-Smtp-Source: AGHT+IFTr/CelEExJAxRfB5tskot6+ZUhO5hVmdtdRw2tFRqT9Tb64tcwaM+F9w1Se6ogn7dmIo9Gb6hZtYQVoh6T/T7B0OUEVkO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18ce:b0:3dc:8b29:30bc with SMTP id
 e9e14a558f8ab-3de07cf9efcmr260142635ab.21.1750310762078; Wed, 18 Jun 2025
 22:26:02 -0700 (PDT)
Date: Wed, 18 Jun 2025 22:26:02 -0700
In-Reply-To: <20250618194732.835401-1-kuni1840@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68539f6a.050a0220.216029.017c.GAE@google.com>
Subject: Re: [syzbot] [net?] WARNING: proc registration bug in atm_dev_register
From: syzbot <syzbot+8bd335d2ad3b93e80715@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, kuni1840@gmail.com, kuniyu@google.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8bd335d2ad3b93e80715@syzkaller.appspotmail.com
Tested-by: syzbot+8bd335d2ad3b93e80715@syzkaller.appspotmail.com

Tested on:

commit:         fb4d33ab Merge tag '6.16-rc2-ksmbd-server-fixes' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1223e370580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4130f4d8a06c3e71
dashboard link: https://syzkaller.appspot.com/bug?extid=8bd335d2ad3b93e80715
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=148d3e82580000

Note: testing is done by a robot and is best-effort only.
