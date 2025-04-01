Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309167080D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480113; cv=none; b=IOY3FdyYHvAcYAnWEyEVBSkbg98vpAhljKZfqMlI1Tn1M4p6K+y0J7bdl5lLEu2p6vMV0HMxQngBtIfc2jSbXYbRd5D9T39qUNg91nLOmcjVXJQsIDgs+jEkMrD48qQcocSdvr03jrT5bn+8rqn0oOPgrOigFj7hYrWzRCUL9Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480113; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XA1rvK416zmEAOM5CVjW7AqNEXtxJIdFc2d+ZUyWV6Cdnmo7z3fQLttNp5zk4ZIIngGwpqYVAbL0ELo4qfBEXo88RuMGFATW4OTrLRytdFeWMeAtV6Ri3IWGezvo2bN+ZoS3wp7VRndcC41YkDQkFr8bWFSpulCkFbbcY0WdDHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d2b3a2f2d4so97815155ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480111; x=1744084911;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=R4uYeVwFPglHwW2uyd0NOMTwPyO+dfWeM7haoTO40/94r4hpqyC2utw8bIouRd9X6R
         myNKrfQlJet8i/a2Ns3lYSIoBkLAtBmFNgaYFH2pFmWawKMlVigqY3NLo6K1Hf9SUpAX
         x+Pom5es/fwW6x4R5+UbtphDkFuQXNp40cdquks6WEzhpUwsyVroPd/FEuPweoeSvjVz
         bAMJQXfg41dTwq/DCi7zGTSVMriIOKylBCLjKjImdPrAzXdVZSiFDpnW39IriDPV6dLM
         b1QOaOE5sd64cpDsxyPLLGog5cV5A8Mj1jjoOsHc4RTq7Lq+8B8nXdAdQSdLMfqy4w6d
         d4/w==
X-Gm-Message-State: AOJu0Yz7mJa/TAf84XBrPAA8hiwvPrLydRhLGlGXVD5xy008SHE9NsXC
	J9YANJgCMSdw9UybyH30xwp7Lepm4fCIAgKhvsXkX9IyWnYQJokC2P7J6cFjZQKUg1oLwC/9df8
	kPf3HjGrK9ScWg4kPj/b/66i75KUbAMqveTyn8Aeu81D7dTsFqX1Q+sM=
X-Google-Smtp-Source: AGHT+IEWfPRpkfiiy8YiUZZZspaojoT/5SGO11fc9axiYe3sLLsg6X8v9mmXvE6nIww16Cc8TsYrCR5F2eV2Gln94kTZaQKp6o7m
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2164:b0:3d4:3db1:77ae with SMTP id
 e9e14a558f8ab-3d6ca663675mr19315415ab.18.1743480111310; Mon, 31 Mar 2025
 21:01:51 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:01:51 -0700
In-Reply-To: <67476c0d.050a0220.253251.005e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb652f.050a0220.14623d.0007.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+65b594f491e4023728b0@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
