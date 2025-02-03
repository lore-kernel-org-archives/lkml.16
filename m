Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE76E20E016
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 20:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738613226; cv=none; b=Zn9dpIGON8/KwdaXNpuFgOEdal8cJIhdte9p+tZfXqzYA0+j5fxnS0ziFEdmIni0qVCc1PPbuJ20IR9YupKvvo206xw2mxSLxIvcaLE1mUjcrgZj/vgBpjJm12/ICVML0pin/gFDh7qsQRvJhiBtDLH+V+RSGfUvb1TzHTSyXuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738613226; c=relaxed/simple;
	bh=C4q7DhtXzubi4zoGZE/F/DY/GD4JroAQrUakRX70S4Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SuK6bZjwdX+ZX3Cjb+5vQQ29uc6NKgaX8fmyxzdGRNwy5rMuBRSiA0KjopAUMwBy6BYH+CHsUPiuiM86abU6qSH24uuiiqmkq+VwHUOI3CiyLO2ZIfT8bMpKn4hnuZIYveosTF1pS5KbshFzMSnV/I52tY42U1aFbKy98F3FGXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ce8cdf1898so33223885ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 12:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738613223; x=1739218023;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q3dcaWL5e1yCWOQNb8AtC8uUY0dR4pJvtU+kJR/wqYY=;
        b=FzST05FSeSkcG+myNCibpOVlZj+94uusO+psIHbFdSTagKCS5ZXVW3KtTYpUvOdZ/x
         fQJo57pctY4UH0mX6ML9UD8wMSWf1IRA+nTAtWNOnFoa69qjrtidWeE2Lts/il8QxZ7C
         gsfScp3PeKZN+SuSPkX+oWr3Jm8V64M6gdWmRzf4JYZyKog6hqsFqY/KVfTnOh2ebxep
         CsiVG6tvNHLI9gW5ms1XtyzLOE+K1IkMbwgj7u9gIRhgIc9oPq7hg3vclmHm3FCJRwpw
         at+jH6gDQHejVLduRnvkQo1efTxb9C4RncRTiDL0HP3LwzjhNmcU+Rggl85Ych429snv
         QKgQ==
X-Gm-Message-State: AOJu0YxtaZAI+UgQOEhgRKNJM/Gp8kxqkLqpSPPu9x4VlzHj+fcW+pEj
	12LyINnefdABYMAkazxCBtY91efviqnYLC2EDTF76qs+UnwiDHSHz9SYQvGp5L3N+qiz8BG9FYO
	JJFGbsLfyqIfqLlVrlmxrxFSBxcXQCUzxXGXoN9USzl5r2tEjTlIoxIw=
X-Google-Smtp-Source: AGHT+IGEQiQAUeq5RSK3VPCFK0Hs/7UL17TU88bxf3e7LfTojNZWvUThdSuzBUmknn8NJDDrLBATdwhxl1rOu0fFxjcN4TB6McLp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20cd:b0:3ce:8ed9:ca81 with SMTP id
 e9e14a558f8ab-3cffe384215mr215218485ab.5.1738613223036; Mon, 03 Feb 2025
 12:07:03 -0800 (PST)
Date: Mon, 03 Feb 2025 12:07:03 -0800
In-Reply-To: <CABMo7LJJOLC81RsPAu=TikqFD8QcOAYNeAPuK4cgakDKN9UAXQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a121e7.050a0220.163cdc.0052.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: stack-out-of-bounds Read in usb_check_int_endpoints
From: syzbot <syzbot+9c9179ac46169c56c1ad@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tuliomf09@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9c9179ac46169c56c1ad@syzkaller.appspotmail.com
Tested-by: syzbot+9c9179ac46169c56c1ad@syzkaller.appspotmail.com

Tested on:

commit:         9682c35f usb: typec: thunderbolt: Remove IS_ERR check ..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=13c26eb0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b18a1cb19d14c444
dashboard link: https://syzkaller.appspot.com/bug?extid=9c9179ac46169c56c1ad
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13eed724580000

Note: testing is done by a robot and is best-effort only.
