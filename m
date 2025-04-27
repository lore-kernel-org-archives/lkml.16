Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93DF35280
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 15:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745767867; cv=none; b=nwwPBU1ptdaAVW812xZ5WVajimqIkpJOllob+67xfQ1R2FLfN8TjRUsogI4TK4JglvVOSXGQYvBAKapKaOPgJsasL3b0NG+tErizQ/BzQvHI8IBegFuB3bN2V7vv+zAsyLIAE6Seqx6/JGZ51195RyRLsieiwnIepFIYZRGnEGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745767867; c=relaxed/simple;
	bh=V3vsejouDrV8OcTeod0GsGeVc9miE1fBF+upkX+01qY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Z+yuwOUyICtF1tEICf/EtgpPTS7Ub76nNz+SRJybEZIhC8bTzJuWNwOqEv063860NnJ2Hr5kqFPLlwnWzFAhS3r3FjxKjptaxLkLUPSlCUQYwyFFoWLA6Mba9HzPLccrBPXJm33H8cXINMHaf/XVjJyfBLZCStCQzgWZlzBQkNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85e6b977ef2so693330839f.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 08:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745767865; x=1746372665;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IRgxqRRG6S915MH0LjBS+oEkiaGX7+Ik8BXZBJjEE2Q=;
        b=SKVYPGTJvSjMxd7RjBwKwppF7SCZkQPwQp9ek8xEnEZLGBbM+8PNmzKDW/CzsXEguh
         bmmHGrll+wGWjsi++OsnhRjE3OndnrXtYx95zqFpwZo/C3WvloBNCOTEmM+Fp7uWvR7Q
         nl8lF6jbuSuAYJxRRCvHxy6T0KCqcHWkawabKHAzMe6RISEHyEQOmeuHxsTGj+ShUXHB
         biLMUhZEFR3G/JuBqLwnP1H6VaIw79PcrnAVq5DcyZ6E0iNFp7Zhe1q49UyhAcw8rnAG
         C4+CKStA44om8Os8H2hxT825NTnhKiZhUG2V8ym8J4Y3wuvoNPArLho/sh33HAs/u1Gx
         Spiw==
X-Forwarded-Encrypted: i=1; AJvYcCX+c9QBr6yrwoAuH/6q0slk10P7yJPo8gpFdvrUXYhplF/PoSEBaCTsMF9DxS9lbXZch/hlB0GRu37kzH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIo7Ac7Q9fCI9kK3zPO1vHPIrsvhlD9smjpjWa8RL5Rc+45kYg
	cYnViA5SMtPsGBtpNxoFvc1rhmeW4WczuinprxMtNEcJc6k6KkCcwd5O0RuT7PL+v7tR0Jpcf5B
	/Fi+ot93mUY//HdcQRmbBbp5lpuSVyHKIZhAUr+ukO/7z9sbbNaibK9s=
X-Google-Smtp-Source: AGHT+IFx8pM83WEDZArYSslc6YpvM6FhjGEgg/7ak6EvZ4LjAyCXM+krKVnt6DsFko3ZLjhRfjx8893v2lSbwbOutanEOc1qL9Tx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6424:b0:85b:3885:1592 with SMTP id
 ca18e2360f4ac-86467fa6f8dmr522022639f.10.1745767864900; Sun, 27 Apr 2025
 08:31:04 -0700 (PDT)
Date: Sun, 27 Apr 2025 08:31:04 -0700
In-Reply-To: <20250427150505.83981-1-duttaditya18@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680e4db8.050a0220.3b8549.0083.GAE@google.com>
Subject: Re: [v6.1] UBSAN: shift-out-of-bounds in extAlloc
From: syzbot <syzbot+67f714a53ce18d5b542e@syzkaller.appspotmail.com>
To: duttaditya18@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-lts-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+67f714a53ce18d5b542e@syzkaller.appspotmail.com
Tested-by: syzbot+67f714a53ce18d5b542e@syzkaller.appspotmail.com

Tested on:

commit:         535ec20c Linux 6.1.135
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux-6.1.y
console output: https://syzkaller.appspot.com/x/log.txt?x=1535e270580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7773696573ccd75f
dashboard link: https://syzkaller.appspot.com/bug?extid=67f714a53ce18d5b542e
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10192374580000

Note: testing is done by a robot and is best-effort only.
