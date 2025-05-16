Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D819A27CCC4
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747421105; cv=none; b=pb9/B4vZjmnn+qDgYonLLNUVy21sxPsJ0q8rFCsCPNONREY3zVvo5er+wEEdePjQTbixaSamE1gZbf+Um4Tw2FYwGVhYZEYRS3PkMUyVfeLsLyKPkCCmdLjSwC17Px5KBYJhy4hBXeB2ZoE8/FkLck5a0XwbFXkeYDev5HpBD8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747421105; c=relaxed/simple;
	bh=3zU5lccxYisa2c0Xm+1YCDe5bhQDtMkyttxk/rAVZk0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UNzbjzXtDnRkwMygZV9R9pFK1gLV+0P2NwlS/KgWlmLI9z73tQpsOQFmtMnOxkL5ZDHsZHpJinUKhVSDvQZzDx+iZjFspN6hRuHVTuFqZFZObLrS25+GJnTvGZvNWdFHg2EldcdZChn1XHOoXcncLiLTEbDCRzjNTeXJ5gjs96M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3db7fba1219so32242595ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747421103; x=1748025903;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SWK0DMruRfzJJrvDKUJQJO/B2fDC4JRex327zZ+JgOQ=;
        b=OgAZEpW20w/6927aCWGiIrgQbOq/htDqxenKy5sIui3IO0mKNHNaGiptMEwDbcPnIQ
         4bqSa5++293cD4y/6ms0zOoo2kiwinm+vqnZbE/O+L0lfvevrzD6f+pu33y2wPdvGCGu
         VSl2uVMc802lzwGwgEVk7Wl3N9WJ8LS8B7q4IzLE0bMtQfEtqXB7xadXKt4COEO0OT/v
         JC72QuwsheKkIi9+BlSMhZbHWekAJFF4FIsLdRjd0tIAOTes0pHMPoPX95taexur+Bp3
         VucdoNTqpAKeGlfp0Pruf7P6Z43NNbxYXvC+Ywvvwy2chNEjxbdeJlN4L7xzJSPK/fGg
         3XoA==
X-Forwarded-Encrypted: i=1; AJvYcCVu9OZgJ2SLmw+ofkb5A2wtLnFhsKfEYt2tH79+YP8PsRmVHjvEpcwnWCxmDLGigxha5mW8PEbopcaOd94=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPkcjzwJfIQhN9JAC66fE+UKsiPNMt7cXaOhWBI+GCjSvTyTgL
	FxBZ1PiqQktRll1M1uMon3vrnFJ/Rl1XvSKlXMPXDqojvfiRVU9Oiyi49WXododjMVYhX0plVMD
	q//661cvoNXbS+nZj3Dc6yESpNlZ6dk9shZ8CyRidIhNNjsqegvoS31PwO1A=
X-Google-Smtp-Source: AGHT+IEZGdBh2jj7st6w0Qn0GagFq2h0HfkJfGl8dHN1/CGdCJN73hMHWpECKCzRhYJwsaNFF4T3ENJLALeaB/qO0iLv7ypEQ1zt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:7:b0:3da:71ea:91c2 with SMTP id
 e9e14a558f8ab-3db843350f5mr56687795ab.22.1747421102945; Fri, 16 May 2025
 11:45:02 -0700 (PDT)
Date: Fri, 16 May 2025 11:45:02 -0700
In-Reply-To: <20250512150134.GB200944@mit.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682787ae.a00a0220.398d88.021d.GAE@google.com>
Subject: Re: [syzbot] [ext4?] general protection fault in jbd2_journal_dirty_metadata
From: syzbot <syzbot+de24c3fe3c4091051710@syzkaller.appspotmail.com>
To: aha310510@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+de24c3fe3c4091051710@syzkaller.appspotmail.com
Tested-by: syzbot+de24c3fe3c4091051710@syzkaller.appspotmail.com

Tested on:

commit:         3c21441e Merge tag 'acpi-6.15-rc7' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1630ae70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=97ce7f89bb9ce135
dashboard link: https://syzkaller.appspot.com/bug?extid=de24c3fe3c4091051710
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
