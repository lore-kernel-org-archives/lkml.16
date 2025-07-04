Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165922E3B1E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618045; cv=none; b=lXv9tiQn1WarRGqqYwhc+i2Wh4QoqPGFD+sQKryIz3U6iQUSbZPYH43jsYuPiMCr9kgMyEeTA+YGr2SG2Oj0odavQravMFNiTmGFPMahrjvrl718+9v3tbz88dXLBOJpySdXRMd1MpLH3Otgl4iiqKvJsITcvaBobhmZ+G2PF0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618045; c=relaxed/simple;
	bh=zpjaHVU9o3w1AU1ZPc7ZQ1mQ782dEOQ2yNVsFLOdCUU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aQUiSjt5WusyLjEIwJOrIkKE+Pj9c7JGEbJQsLlwhipIlLgJa4oCmChvrX6/3cRm/SsQ6dCPQeBtDcYf2802wLGD5jR76hn54RZHGim021KRHtIxmCBfe3LrX+6d5pyCcHiXV9w4KZ3xRgjr4I3eWYcJ1bxlFDV0F4ahxhLo9Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3e134cebaf0so9384785ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618043; x=1752222843;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGyzmkda1O439XWhlwqgi+PPwho0P8q0N0XZCBhneyc=;
        b=SLBkAeHOCk379v1f+7zH4viFOzFAGkt+s+6V7Wzr1iUn1s9bd2MxEdNWBfJtk8HDCa
         tki8BSAfDvCY8E5kDLlxth4dH4CaMRoSB6G+hNczUmL2OcoVcom+MIRvs25svxwnABta
         IWa47PUBRzckm81bPGqsj37qWnSfT+CuKCJfmJy9QiYUrL4UXUsI6ULUQC8S/a4TKk9N
         9eHBHswHtDTbZNOb8jdpF7C9odNrS5QNSTPMmEAm8+FWGy27an/fQBocaiaE7jtKA3zS
         NhbhBo1F2hWPvB8RLMT0giKoWRkPqzzCTza4LG3VOXx4spUlKgmvGX3izT9yNx2a29YI
         brQA==
X-Forwarded-Encrypted: i=1; AJvYcCXOBLir+HODNBX5vGoZxgYbf4y/7sS1LDjvGqGRT+oPkwC3HZqpAm96Dlu8RuMq/CT67WgVWPfAUfIPseg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHnuE73k4w4RCrfciGdZuu5yWkeSxQRgRjgpRyE1+LxMfr82mv
	58XOOBvTUTNQSQGdkjOrquD3e2XUKnDp+grfA31ewNSv45yCSUqqbSUMv0fn4N+uWO1xJ+h8BUJ
	VrhkTC6w2QYYvLJdC0Ds/g3Ivrb3rfpokMw2MAc9bHpV9Jbm3Ql0EjKzZqoo=
X-Google-Smtp-Source: AGHT+IGq3iGVa8EGg2H3nidF1Y5oAB/PEaq8fbEsYWECa2At0F9aiZr+qUsebKd63Uwb4ZWqNZ3pAzqOoxWnNHU/LK8aNsnj8ZqN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1887:b0:3dd:f813:64c5 with SMTP id
 e9e14a558f8ab-3e13561cf90mr16307775ab.22.1751618043239; Fri, 04 Jul 2025
 01:34:03 -0700 (PDT)
Date: Fri, 04 Jul 2025 01:34:03 -0700
In-Reply-To: <686764a5.a00a0220.c7b3.0013.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686791fb.a70a0220.29cf51.0014.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in qdisc_tree_reduce_backlog
From: syzbot <syzbot+1261670bbdefc5485a06@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, hdanton@sina.com, 
	horms@kernel.org, jhs@mojatatu.com, jiri@resnulli.us, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, netdev@vger.kernel.org, 
	nnamrec@gmail.com, pabeni@redhat.com, syzkaller-bugs@googlegroups.com, 
	xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 103406b38c600fec1fe375a77b27d87e314aea09
Author: Lion Ackermann <nnamrec@gmail.com>
Date:   Mon Jun 30 13:27:30 2025 +0000

    net/sched: Always pass notifications when child class becomes empty

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13678582580000
start commit:   bd475eeaaf3c Merge branch '200GbE' of git://git.kernel.org..
git tree:       net
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10e78582580000
console output: https://syzkaller.appspot.com/x/log.txt?x=17678582580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=36b0e72cad5298f8
dashboard link: https://syzkaller.appspot.com/bug?extid=1261670bbdefc5485a06
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=164d8c8c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14839ebc580000

Reported-by: syzbot+1261670bbdefc5485a06@syzkaller.appspotmail.com
Fixes: 103406b38c60 ("net/sched: Always pass notifications when child class becomes empty")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
