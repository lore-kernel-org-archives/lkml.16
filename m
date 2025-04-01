Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7678886349
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480605; cv=none; b=NTEUxrTqaAXVnURkYsoWzjn7kzz72joZi5DeX8R9ebGdoSIY61tHNoaG1M0wxRu9QfEawnDp64iAPYQHeUI+Pf9t7UfHXBDrDwd6FsWdUKdKgTTrfZMR1hhcEZbNNNjPJEFTJ/D6P7hXn27n+549nvbjJFpaTSfK58VSJJ5Ks7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480605; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XPPAZJ2VF3n/UT7qXKRgaOBelABBW4SPlXyCSolhzn9gim2ZBmrxzIrErgW+cg9TivJRTc8yor6hfPUyzAsUK4PqsrHPptaWxlnYk99kXqQdyjp8eBMLbdVUplfeUQJGACxjjZIIBvx+okW6lR4NTws3yLqjP+DiFwOZFUHOUa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d44b221f0dso95490705ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480603; x=1744085403;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=wTIgMCMw9MhTc1XkoYnsSsXIaqzOpfOm6afphLPxc3vF7uC9wUr5nU9rOU4lNVzaXM
         Lidq9KFs5Uye85coBB5QUEqaaCEuaIg/LSVqkwyiFhusJ7OMqIzIirVUg9XqeYO7WI9h
         TkS9cO2yX01dV64jJCvl5SUYfgEYts7sCRjXhMx7rcYwX1zxPjpuw7uL/66/mI8pdSIP
         47guhuF8QcknG2mKqgpevgBcsEotPVYx9Lxp0Cxf1saNNxSbVPrxK+raHLyKAS5balxV
         xlEizszkwMPQDSrf/BPpupZy+Un9jLhT6152MrqvDDVMot5tZSww1MUQg5f2rea3qyxz
         H+bg==
X-Gm-Message-State: AOJu0YzNalm8OT1/KDm0Cbr4HX1hhS6tPLuER5SxP34fG/8bmJbmpOU2
	nKfnsFbTmGHM2zxDhDlvwIsVpEDxlQuLrq1H0MkbOo2Ku7aaktTCOBgfgz5uIwvKTCG6DyK3eu/
	j29bkWgzaC4ytkW4lsy888AmGONJndGMnD+NvDfAJS0EIB5uv0Beswzs=
X-Google-Smtp-Source: AGHT+IGyswfkVS7430HdfiPNVw+NgTPU1XpNxw5QUcYsanzpn2zejuAi3mOz3I1MBw48r8NxdgUegW5Oo5uZ9Fp2ijoQ03Sm/RtF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1563:b0:3d4:6f37:3748 with SMTP id
 e9e14a558f8ab-3d5e09d9293mr85346305ab.16.1743480603595; Mon, 31 Mar 2025
 21:10:03 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:10:03 -0700
In-Reply-To: <67314fa8.050a0220.138bd5.0057.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb671b.050a0220.297a31.0006.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+494bcd3631a9f6759f91@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
