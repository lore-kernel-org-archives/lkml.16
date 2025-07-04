Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE20B2F2E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751650205; cv=none; b=A3FjC9UlSpXcUV8Crf1BkbiJ2I6HNH4SSLjZJNl2C34X7ekxrrQZDr80cLaRYKFT8YFzB0tvUmwIzObeR6SbYI9QGlkDocGKjI99o6eq/uu4s/BUx8P8p4vaJzDVS3iFRLgI9Cjw4js6MrOsamdlk1oDMNtn5pcGYlyVdv2iPXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751650205; c=relaxed/simple;
	bh=zrYTDvGOlmSZtQrfORepRRVlqWrDOJpT6GqytBe+RZ4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QGuvSop9EhnCCnMk87Plzi7OYnl1x+nKTYSzkFE+NZlN3ncLImATQnuDv3aBbLBxC7iKdVeYR1HqzuiPBPUdW+sJRpGMvAwpxTZjGTljz8v/Pw+km6sjB4vJ860MRRsZ2Ah30UQGeomUzThaf6kfQKimDbZdx8cJfJcBWI8BBVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3df2d0b7c7eso13173775ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 10:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751650203; x=1752255003;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXkQhBykES1nSwdbUE+gP2TwFAw0lH9cppHJmoIvqEs=;
        b=ew1Vgm6EOSX4T3o67KR5WuydQaPRag2T46J/kf3S1pivh8t8vGlNOGxMw6aqpCnQ+Q
         i05kiYQRQ/aJxYugGM3uXy4nqQgn9RtXMwulukrlWLaEnsTbGedIpNTjY8wQiBphpdoK
         fU+JCE6iWLtTL1QFtdpZrodKMF4CHE0znp+cM4xkNTBROtW3Bws+iJgATojz0gUgj+H5
         EUz4FC5GjYt2MGgV8ja/i8SPcVhugdCnlLBYJM2rXeEbHY1A+ZbDMAaNz4hvpHByi91X
         SfJ+jEdTbe3fB2+ewI1ffvMYpU9/9hbae66eIsFhn4GDbXMVFyF4HrMtLPLDX7m2477t
         pffw==
X-Forwarded-Encrypted: i=1; AJvYcCWnM/P6FHK6FVIazD+K+97Uhz8j+7fUf3amjsmXkUAlPU4lCx47n/mTgfAaB3rYQ5XhTWgcWOveSUCnJ3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBxBNSzAeYCYcwlVAvPiUEbRnwkrPzOpJkgzRnuss40cw6l5hc
	GkCtc6br8vhLvlfEFuCaKBjNPE56SBhvc9a4S4UOpJ8v/ZziftNHLdMzcvuaRFSigx68kNghVyP
	h8mxDBJOgWvNovQM4MQw7huDRR2yggr7wNIM3l/W5t0sNL9+8vFbd9pqd4R8=
X-Google-Smtp-Source: AGHT+IEWyI9pxgAMZpkdRCMtYs+ww+Ai87izt2xSQ/4Rkr020gu3HPFVzM5KSAsBLRXe2bw3RUQVRx3SWfZfux9bhBtL45yREHIr
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2508:b0:3e0:5942:2942 with SMTP id
 e9e14a558f8ab-3e136ed8dfcmr22340485ab.6.1751650202835; Fri, 04 Jul 2025
 10:30:02 -0700 (PDT)
Date: Fri, 04 Jul 2025 10:30:02 -0700
In-Reply-To: <686764a5.a00a0220.c7b3.0014.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68680f9a.a00a0220.c7b3.001f.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in drr_qlen_notify
From: syzbot <syzbot+15b96fc3aac35468fe77@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	jhs@mojatatu.com, jiri@resnulli.us, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, netdev@vger.kernel.org, 
	nnamrec@gmail.com, pabeni@redhat.com, syzkaller-bugs@googlegroups.com, 
	xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 103406b38c600fec1fe375a77b27d87e314aea09
Author: Lion Ackermann <nnamrec@gmail.com>
Date:   Mon Jun 30 13:27:30 2025 +0000

    net/sched: Always pass notifications when child class becomes empty

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10d66c8c580000
start commit:   17bbde2e1716 Merge tag 'net-6.16-rc5' of git://git.kernel...
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=12d66c8c580000
console output: https://syzkaller.appspot.com/x/log.txt?x=14d66c8c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8b0724e6945b4773
dashboard link: https://syzkaller.appspot.com/bug?extid=15b96fc3aac35468fe77
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14044c8c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14840c8c580000

Reported-by: syzbot+15b96fc3aac35468fe77@syzkaller.appspotmail.com
Fixes: 103406b38c60 ("net/sched: Always pass notifications when child class becomes empty")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
