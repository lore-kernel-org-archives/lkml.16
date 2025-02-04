Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6AA1917E4
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 05:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738648025; cv=none; b=twL2hheGiqSt4La7Meb0rWqyNz7iJ+AXC4Aq1SjPwlvAvM/0TZfWnqxmLM36TxbzPeLtC+UMKZh+PD+qHRf4WD6RXmaZlY/wUgD4GVDw0xmH+NexRk21h1qTMDUmvf+ID9HbwRRmq/vsNeHmaMwL12HC7R9uFuzm2Ip1Z+wN4C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738648025; c=relaxed/simple;
	bh=5ZyG7ifwXL5Qk0w+wMu+EiQ2Vsc7U3PLdFPizerSpXg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=a2gMJFzkjfxr6rlZ2Lr4ocbM/B0Rf6+0LFnT5wBVSbYfooe7I6cpVPZ7q1GZH+nDIeAoZIH/H6M02kYdhWRJ9H5NFTl2oT2fA/4v+LY15yQHibEjIw+rtshD4ofCfL42WfS9rwV14JmNWgGMcpnY5shO1fOSSeRh0YYP7dx6RdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a7e4bfae54so44498845ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 21:47:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738648023; x=1739252823;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N7LGeEL8F7wf9a5OgYmzkt3LNJaHMsDzwIxIXwnUXs0=;
        b=PXFQlmBRzTuS8iaUnAgfyMHCSpl5HqDjgt17RgaTVgOL1SnXSK2thtaMhh20b7XBYG
         mRiDQCmxf5YUtqpML/S/oDbp9Ahrc39ZqnDH/2ZuWtri66kKOXRZHlrhrI9k+Va46AOz
         mxn33gRcPB4t4rVOhnOA0lUt+kJQDOkRtTlDml+Sak26W3wPbCeoS68s90F+bkYtgzHc
         sI5SvRrCB0lroqk3uxGSr7I1hOKlvAfYQb0T6k7l9RimvTQ11J4oV0HT5qat0XgVZNrf
         5qFCzeLhGuz5s+TA6CvTCUdf46DlRPDWr4J8XhWKBrvvWbBA4hRENsyntthTkTCnPWbJ
         TgWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuUsGpvpmsD7/m0OVTQVDAA5wofR06/XwZpqvzXslJQ3EvKzhwoanotmGst3/3GzL0gjHj/9SDuXmpzJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjPPaXW8ke5NvJYkh1RYCEbcBqJdUBRmB9K7Uf0cSqRzOFvxRX
	G55kDqcAX14osGUwpnthXEsB1euJ7APL7g1nw/qxDvoQ/6HiOdsSpVWQEWlpbzeuuKD0TaiDa9a
	TrMFzC9D10hn04fXM2uglMoJPdcj6jTXqspyP6SyMPgT6TVB1kMvntr0=
X-Google-Smtp-Source: AGHT+IEErdiMzYvRdx8cGsjUfrM3bBrqfIIlO6G5iI6h1DhJcUoRT6DmdEHENfV1laeXetHw3iTrzbp1m4tsKPzTEtUYqEHfSSyP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:168d:b0:3cf:c9b9:3eb with SMTP id
 e9e14a558f8ab-3cffe29107dmr208564185ab.0.1738648023278; Mon, 03 Feb 2025
 21:47:03 -0800 (PST)
Date: Mon, 03 Feb 2025 21:47:03 -0800
In-Reply-To: <20250204003234.2063-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a1a9d7.050a0220.163cdc.0060.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in add_wait_queue
From: syzbot <syzbot+9d55b199192a4be7d02c@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9d55b199192a4be7d02c@syzkaller.appspotmail.com
Tested-by: syzbot+9d55b199192a4be7d02c@syzkaller.appspotmail.com

Tested on:

commit:         c2933b2b Merge tag 'net-6.14-rc1' of git://git.kernel...
git tree:       net-next
console output: https://syzkaller.appspot.com/x/log.txt?x=155b9d18580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d033b14aeef39158
dashboard link: https://syzkaller.appspot.com/bug?extid=9d55b199192a4be7d02c
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15a96eb0580000

Note: testing is done by a robot and is best-effort only.
