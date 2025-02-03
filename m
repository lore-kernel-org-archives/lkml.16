Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AB2204C04
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738596125; cv=none; b=Trt50XMv6HP+l6bqmXQAnCm9f7dFsr8aX8TqzVoGwdhpMoNvx7fQG8CY/meA5xgqhItjZYUb6omFWAuhRZ5xSPaOCw/8pCccgBGwhKYCczLCoCrNqXetQBPAr9CcV8X55bTp44pUwDp7/7/qgZXOfC72yYbK7cgekPQEERLIxFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738596125; c=relaxed/simple;
	bh=PLJsOnrrWE0gFq5S1NRzXE7wamN1He+uUIH1bIeFatQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HKr4/44kU+JVQQcI7Cz0ukexm8+sWQCGiyVIBUClNdA7mH1ogEvNDMCR7qbaN2/pgJWW8JGc8wmLaj5YzwRxq8HRFOODN5DFxZ3FbEGHIEin4wLIzzC+EldVD5eefIGYJFQY2JeJGLESyo95rS+Hz88DqnZvpa4OPClOPTYL59Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a9c9b37244so85607785ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 07:22:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738596123; x=1739200923;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BboPUz3qniofjQR3sUVFLqvfOcdsv3T85/crzeliSZg=;
        b=Ze2AjB/pXqzKBwLLXU7OFxeX5YO1lPzx2rVXcZUNeDFwNrxdj3mr4Bs+sF6uTPS59x
         I+vdoqDUM/fRJeysb7mEqYD5F2U9gMX4LS8U5OQ09d0yH55hTfOatp773HymzlterlYc
         8/1EERscVZZIrLrFWrJZXrLQ/RbP8LplaJEzPk59eJpUBHIJc54tZpJiYo7DZaz3JSEP
         67FrEUCyzHYLUn/3x4jhLUXdzuIdy/evqRXgjQ3D/qrxLMJfG66LdwToIAYQixVGj7D7
         oFj4PZQ7C4Sq8VxNapLXXT4l+Y5KNlIwTw4oh9RE9uqMGyBlgz39ATJyCe4Fw8edE0Xk
         lb7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVu3Hfid3sWxDV3xXRFQgAiqTNcR+8mqE+7owD97EIMtHJEzhtisebnBAfD4ap6Wo1tTFIO8yADmBCzx0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSnyYnrHkyqsH7TfiQwUnDiHvqQbMEgRcrFh+K7pTgckWuVrvq
	wxY2xgLw9tiDREMzHLfAY0/0fTCqyLonfnxa39Y3u83/Az7sCjGVcH1h5SmvHmXnHLFPQmzcjjm
	ZW2QiWYFErgw92aG+7ojMR5OrTHNcvz+2xgnHUeMTvtOFHD6HZoy5K70=
X-Google-Smtp-Source: AGHT+IHIAE6dQgufRkmxRv7Zy1wNZiIlMfiWGyg7o95+lbxFTQ2EgYJK0bxKDDP61LDIgyZ/1ZpFfBZ6m5RVCrI6yD54sFseRlxG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aa7:b0:3cf:b2ed:7e3b with SMTP id
 e9e14a558f8ab-3cffe3f68dbmr187392905ab.10.1738596122982; Mon, 03 Feb 2025
 07:22:02 -0800 (PST)
Date: Mon, 03 Feb 2025 07:22:02 -0800
In-Reply-To: <20250203124959.114591-1-aha310510@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a0df1a.050a0220.163cdc.0046.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in add_wait_queue
From: syzbot <syzbot+9d55b199192a4be7d02c@syzkaller.appspotmail.com>
To: aha310510@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9d55b199192a4be7d02c@syzkaller.appspotmail.com
Tested-by: syzbot+9d55b199192a4be7d02c@syzkaller.appspotmail.com

Tested on:

commit:         2014c95a Linux 6.14-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=165c9764580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b93160eda29d3321
dashboard link: https://syzkaller.appspot.com/bug?extid=9d55b199192a4be7d02c
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=170b43df980000

Note: testing is done by a robot and is best-effort only.
