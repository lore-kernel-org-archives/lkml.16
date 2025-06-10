Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D538F2D3A69
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560945; cv=none; b=Y11+8nCxa30V9U5wsJnZgvp2+C2VVbPFNcHB5U5u0MKhTDq+RltQJ+ViysBHFQKPJdP2B/3zwCwUUIEF41ss3A4lEdqlyrsID2m3qtPlhI5hUlDg1iKzUDpxjQJ4/pV0JS+4lXGuzj1QT5V07qqVN5F6nPth4oFxc2tQkEQ8jSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560945; c=relaxed/simple;
	bh=N21Pj8e1H3gkNGAXJCePbJBcSmrFY3XrntX39WSICaM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PB/VrU0ETgq434XHljlX83cao74dMr8lRk9oZYZ/0WPwUZSqg/jGRDSetD13rADG0xXK6+0xur67TusePehkW1LzKFy1Gjg0zw7C1fkdD/g585Kcr9R94MmNJiqlMfGwHWCfLRaTN0HsonBhcjsuNELxeLTmBWICzQOdJJSsFmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86cf306fc68so895311839f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560943; x=1750165743;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N34zunht3H8Jmd3lb1JGf6Lms/qVN6ns2F9A9mDcHmc=;
        b=K45rVVF37DHXXp22PeOncIaK97Xl1yv89cadFKLPstKv5TWmMk8SiKYcvSnOmLKeo2
         kjijMC27/pBtiRdr0ITg/rCunMHmk9BXDGSdbljIWYdKev91CFcRFj65MzqD1ZT6oKq+
         06LEWpoC35jhuHLzw6iI4kL4mpfBcmRUBiBS1n+cFB6+A6Xd6bhB14ISOgh39bQMSGDF
         N5OSo4QWXzNy9eBG8TIUQcj4ji2xfSz3M52zUtvHrnR3gk7srv+hz51Db/k7WhV39z/F
         pkapAPOpYyty/ltMRMFDqQOsBNfvH6GSetJblu4Gu57NA9hVvGGwMNWfAiaHpJ7g29gY
         Cnag==
X-Forwarded-Encrypted: i=1; AJvYcCWZAB8WqzEe4Qd/VWsWvfgmvKzvzuU4x9p4uCftt0mspxmMQvupehMBBUoD0uuHVWxMOevN6gj2EtfEy2o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4TyYpuPCr3/mCp4dhOeW1EE80zz2pvnn1OLxKKZfHwsULXVCT
	uA1B+pmYIG+JPN+01rGbzn1a6Ms5tvss8bdIXrLP/ghg3yEdzqmOjvmyzgNmWTfNYBOkDT361vq
	sonj6VzMJRG1d4hhNStJnza4iZpEZRLn/RN+at03w8NUgrz+9FT7P5m98Pkw=
X-Google-Smtp-Source: AGHT+IFF9mpKtLyzahZuJl0C/q72ifot0RbFXUsQCEcsDEts+qWbOqcz6hLPTFmF16zblkydyAGdTIgMz8MgaylmfUicJlUQnArm
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2162:b0:3dd:b5ef:4556 with SMTP id
 e9e14a558f8ab-3ddeddd7398mr29862165ab.18.1749560942922; Tue, 10 Jun 2025
 06:09:02 -0700 (PDT)
Date: Tue, 10 Jun 2025 06:09:02 -0700
In-Reply-To: <20250610124453.1064-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68482e6e.a70a0220.27c366.0064.GAE@google.com>
Subject: Re: [syzbot] [hams?] possible deadlock in nr_rt_device_down (3)
From: syzbot <syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com
Tested-by: syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com

Tested on:

commit:         f09079bd Merge tag 'powerpc-6.16-2' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=104769d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5080a302f3378422
dashboard link: https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=131b69d4580000

Note: testing is done by a robot and is best-effort only.
