Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1CA253938
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751541605; cv=none; b=jHNUljuy1XWMU8V4lCkP5X0nVTNUT4zYheelesIuT49FtJqVpqgvgsQqamUsgI6FIGqmUBXVmpX5lqeSGXB0SkgZYtJZalzjGZxbpmtOdW5gqAgkjtEj6anv680QDTbBbwUIWumW4L5gXfxRaVfMTOB9vImwGubrRIQPMABcev8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751541605; c=relaxed/simple;
	bh=r1Sm7z7Q7ECB93fsGyTijUODpIsynPWlOhdwqczjj5c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Am5WIDv2Ro4IDS4186wJEEt4KQuqNku2WlqnZTgVDNPR59fJ7clowRdYziKqQNbNiLnYCHP13PnIYetKmoffws0rXi8WfwGlklk/uZum0A3Pm/PTJSi/wKSmYmG2YexEQFWtvZGnHGD2FVx24Qm52cgldxQDVwyLvUoLxGaZ6zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3de3b5b7703so35071715ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751541603; x=1752146403;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lpPnteTphuj7UH/WFOf1zVo4dnhbezFDnKD3sA2zXHg=;
        b=TyQNOwEenTo3tpdcSbGfUayaBgpEVgoXsxAeSjUQCstELJJRb7VpUUl6dUi+RgRe7J
         LFR+iaOW7IrwEGtjOkTJDXeGbvzRfmmrG/hG/vQeq7f+AONAkbmWG4poZSoZc2keWKb8
         /QvYRJjM5Mi64E1yFYK8gOS6wbSqTKoVubjtHiqOpRYmiYFIKd13B2xMGYou4eE41sqw
         D6u9eYwA5TVzncI06kKkuXNVA5y2HDUMR+ZKnqUxkKlZpHOc/uOIcCfl9WsEE249ybdP
         WjkgUi9zPuEd+vkvoc29+6W/npoYNG3moim4UJNOS7Fw4imEApyrfNEjckZ4NvxspJcu
         Is/A==
X-Gm-Message-State: AOJu0YxPsvzKEuEBfpIzhRIhlAa2bgEM8KFX5HsNYMrtbkAM/XTQMhDt
	kQqR/VhQCePlSR9a9MPFV0/Lgghq3MNVXZlgST8k+M9sOK8ofaa+YTi2QXxPJ7jQaOd/kImzGFQ
	M9grfPc6iYoO0LhsF7ApYpKGvwTlCDwL5AcO7aa9mJFOnAuyRrFnLI+oYbUM=
X-Google-Smtp-Source: AGHT+IFDxZ/9wU+SK9SAW9mxQGxvqXyW/jt2nzY6CvAJ0oiOckSaRsmv6+p5YClefubKjFX1X7z0/JoPcLi3JL0KVbtAZadV29m8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3108:b0:3df:4fb6:2d78 with SMTP id
 e9e14a558f8ab-3e0549c641bmr65847255ab.10.1751541602772; Thu, 03 Jul 2025
 04:20:02 -0700 (PDT)
Date: Thu, 03 Jul 2025 04:20:02 -0700
In-Reply-To: <20250703092239.1891519-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68666762.a00a0220.c7b3.0002.GAE@google.com>
Subject: Re: [syzbot] [nfs?] [net?] possible deadlock in rpc_close_pipes
From: syzbot <syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com
Tested-by: syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com

Tested on:

commit:         8d6c5833 Add linux-next specific files for 20250703
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=130e33d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=223eb69834aa2df6
dashboard link: https://syzkaller.appspot.com/bug?extid=169de184e9defe7fe709
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14e9748c580000

Note: testing is done by a robot and is best-effort only.
