Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE2122617F
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446887; cv=none; b=jYgbS8mFQ6UvNNiVcArsYST9MpgZuMMN+FvthhjJVtZM0ATmaPNdZY8ECApahSCmjQsJJVwnuM81LjJ6l4kZYPeW2BHzbiQEKa0af2pT3G5nrvJ4HUkkZJ2Iy+nAaF2MEmR6ppanPeIW0SsRKggBjtz7BX4iJYIi8o5z3gaxRcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446887; c=relaxed/simple;
	bh=DHwp8aDOJDlgugg90sJmF2XyZAUiP69pwzhuX3CPzYM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=E9bdPU0Q6YV+sRsbAuMT4P7u/PxCrL2v14VcZnKBYSKdI2nz50A8eOmBwcrBgnNl8BmMYSBgbKVWKENRySn0oqWjZQdWDsnD1ga0hJJvBdzaJsOdrV2IKnNfE/9zQct3SXFSTgTLe4r8xq/R9SlfEDPjXtaWt5giTyRq4V/m1Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d96514f29aso54196395ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746446885; x=1747051685;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vOyl3MaiaAtE/UsGWO9Ub0FNoaYpMHqSsINHLLvPVuY=;
        b=gM3eEDhLdh4EW7+SmjmHyNMgXUzq83ia/M8syO9u19IrCZ4CNMieapBKLHGGk6sPVl
         wWiuOObiVvy0jnAjqQlb6JDhLPbS+eZAKHg/cS96yUgm23bA07X4iqf+QD4ipOExBku5
         B5h7WiPlRt4YVMPG1bGLiBqSRcdXz2AGE5WbSUkJw82z1lelXPOimIpdV4IlzWQrU4HC
         jHu9542X81dwL7MOO5dUkul4B03HA1mfUyhp0iFMDW5J1gg066uXmsKQVonRNMLo6ccw
         YFEAS4ViDit5ucQV9nDIdpFVu+SRfQb/Gmu24zQJOTTaRsSSNRnLMP08eBo2DffrCMHI
         j7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXgOj8JFywy29GH0bxH6KVIHo7ryD9wjVPNJb7pGCx748Em92XLAwnhx73z49d8D1HaDWXGu7jVGTkwGoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBI98QmnKSgbcM/9h4xmF4cTK3QZxRNSm1R9793vcBaUNNEL1k
	C0RBmMhvZbbIuPgVT0FQqo+H2CEJGmt5HNXQ2Eu6fUyGHl16+viUupkrI47EWdpBUsnxE/D66+9
	je7p9mPqUuhg6kM8YZ5IvX9xIOUCbSOscfaxxsl8yGlGDvrSAQnm1SoU=
X-Google-Smtp-Source: AGHT+IHAK8haRRYfwkU6RoGcf8J9F0Vip/rN+oMOWgFiAju7v68UvjjYKW45uWvGfQWIfTnuIyKVyDOwQ3f/Q4nUcONsd26bsijG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:5a5:b0:3d2:af0b:6e2a with SMTP id
 e9e14a558f8ab-3d970ad6a68mr132698725ab.5.1746446885382; Mon, 05 May 2025
 05:08:05 -0700 (PDT)
Date: Mon, 05 May 2025 05:08:05 -0700
In-Reply-To: <681732c5.050a0220.11da1b.002d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6818aa25.a70a0220.254cdc.004f.GAE@google.com>
Subject: Re: [syzbot] [net?] BUG: sleeping function called from invalid
 context in pcpu_alloc_noprof
From: syzbot <syzbot+bcc12d6799364500fbec@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, kuniyu@amazon.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 169fd62799e8acabbfb4760799be11138ced949c
Author: Kuniyuki Iwashima <kuniyu@amazon.com>
Date:   Fri Apr 18 00:03:56 2025 +0000

    ipv6: Get rid of RTNL for SIOCADDRT and RTM_NEWROUTE.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=169578d4580000
start commit:   836b313a14a3 ipv4: Honor "ignore_routes_with_linkdown" sys..
git tree:       net-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=159578d4580000
console output: https://syzkaller.appspot.com/x/log.txt?x=119578d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=734b5f968169d82b
dashboard link: https://syzkaller.appspot.com/bug?extid=bcc12d6799364500fbec
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=147be0f4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=127be0f4580000

Reported-by: syzbot+bcc12d6799364500fbec@syzkaller.appspotmail.com
Fixes: 169fd62799e8 ("ipv6: Get rid of RTNL for SIOCADDRT and RTM_NEWROUTE.")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
