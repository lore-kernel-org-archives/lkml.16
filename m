Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE54C2CA9
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751727907; cv=none; b=ATIvKkJSr1ajoph4YDpzweBF7J2RD5AK6tiqaaKevIX6OxjZXR8nyJibwIwRov+80fy9qoAo0jJZjdQeo8vLDW4rG0RPdeINNvKoSikhIk3SSlk8TCbsz+AmfQZ2mLX8iQNG9LEYoHsiOfghewjYr4wR/EYPnV/oTHiq9Jnjqss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751727907; c=relaxed/simple;
	bh=Z/WNbSB4Zhc6qrK9H8azETT8ypnvxYTbcNb2Bw/7Qz8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lyJR4OX78SH6Ff4x5IL1bvg0/cGzGG+jXGlvK2AQdiYDKgf4/RwcJZO4hwHjMhKDaUVP7V/+uszDvrfq9G4UUwTR62crDtc9P4cJUx3VHU7oLuhKRnW8lL9lNFh1dg/TQgIJhhakKLsXCIOE/fJUUvp0qFdbJXcEzqOhXrHSSEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3df33827a8cso42245485ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 08:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751727905; x=1752332705;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hz48evUUHxXrLFQI+k2ltDvud9DuGBIERTJqmXvZ2nk=;
        b=J6fL3tNa8/hHcW4nCVwuJeBqAup7R2Vv5Ps3PQKhLZBsO8sjZYJQWUOXOtSFKFCR6j
         /AcPWwbps4bKkZZkP+qlnl5cpDtSp/AweUoM2K0JXSRjOsufxupG/dnTsYjS9wriagvU
         8bHpbv8lmNLrHzLedlCLKDpzjxy7PHj/yRXiDxq/xwI6HFJibArhFQsuABtQh/xNh3+I
         DDgcILwExiwoV1JQh8bAhBgNN8C2ExI3je4ddzliy97lTlY+stdpksQW50wv6wD/KpM0
         d6qClmAEjpjXOzJnKtHPxxQiVQ21DohQYlQRyFpdSRN3xyglJ0mH5BqiPqii2q2TLW3f
         hYmw==
X-Gm-Message-State: AOJu0YwQF1+5l6AK2CMhFJDestve8XxRurtIvSDWeZPZpje1tbaoE0g6
	VhfctPJJBlG4RZRUV0SNXF6yWUBOCN8cPkLRaeD13P+M3PbTJTon2E0sOxSijaBRh84wA4BuqYa
	7ZM/v87khI3O2m0E8rnaqaIs4Lg2t/5lQvVc32NLxoJq90Z8aHJmf/L8fzaA=
X-Google-Smtp-Source: AGHT+IFQnqDZn/WWQrFkk+UAForWQytNw0uOOFRemlzttbfP2vt83C7m6AEb7AF0H2D0D7PQG0YMlMWuVvAke37ILf45QsJ6gxWl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:5:b0:3de:14d4:a755 with SMTP id
 e9e14a558f8ab-3e137225181mr51249905ab.21.1751727905087; Sat, 05 Jul 2025
 08:05:05 -0700 (PDT)
Date: Sat, 05 Jul 2025 08:05:05 -0700
In-Reply-To: <f8dee957-d286-421d-976a-c0c580454fb3@I-love.SAKURA.ne.jp>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68693f21.a00a0220.c7b3.003e.GAE@google.com>
Subject: Re: [syzbot] [perf?] WARNING in perf_pending_task
From: syzbot <syzbot+2fe61cb2a86066be6985@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	penguin-kernel@i-love.sakura.ne.jp, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+2fe61cb2a86066be6985@syzkaller.appspotmail.com
Tested-by: syzbot+2fe61cb2a86066be6985@syzkaller.appspotmail.com

Tested on:

commit:         a79a588f Merge tag 'pm-6.16-rc5' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13691c8c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a6dba31fc9bb876c
dashboard link: https://syzkaller.appspot.com/bug?extid=2fe61cb2a86066be6985
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=157a2582580000

Note: testing is done by a robot and is best-effort only.
