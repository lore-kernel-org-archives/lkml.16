Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FEE380
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747872546; cv=none; b=WmzXtazctH2NoeQWFiE/c8et7/SfghgwkteFjRGQhw6/aJixv9qyQNB34If7rma2gN9HidMMPt4vR9D2FACMp185AY0k00bE/Wxvh27YuHYOOv+jVwHC7EcW+AERxTlmYCSmA6uo1FmJOjIr5RWRZN+UNjOwpY093qd1roX9vxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747872546; c=relaxed/simple;
	bh=tJkZ63GGfcoFXflMJv31z1pARkCITvZe9XuuE7qPnZ8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=p1F0G47SkynHKXLbbowLbeigqMmmzVImt2KHfR9vVLXRmvWlJTpS9zPsHNhGQfxnkZ/1bk5O7ki6eEC3h67ISATIJXvLfKATSzMIcHhQiZSXO5A3vAElpIZ/BX8MKMrBMx3iGqGl14Fj0T7HuHV8yemaARsLamVgGf3V8JJtPzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-861d6e340e2so632875539f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747872543; x=1748477343;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7x2fb24sC4CwRowRteZAB39XWGal1EecQT9Xbs9dzW4=;
        b=HTNv0GNWxuIVJDwsZ7023usGQ3/jUeHJJ2OOgXiB79N3EstBNT15MegYqvm6NNod/S
         Fxt+RtIUq+m1u6EeHRHxW99OspyCn5I7RnePtoJOdG0R8VLSIyje5YE+mI+uzL+tx8d3
         uGDY2mQUKtYqtX2W6ZrglBdcrvK9alcEywsbIgYGef+EgQwFqoJiaddn0wZ0gMHZOdwx
         QCaITMFaofeJ4U4iMhQIfb/TlpnOKN8iMurL2PMGJ0cIM0zgarncMIo529sKXROLHM2c
         3FVgM/f9blQGE61Gi3FvE/R8vuEpYQTpQ4iZt5Nn4Ww2crvzGuOlXupGQHmYU6iOdVKM
         0wLQ==
X-Gm-Message-State: AOJu0Yzu68FbMmw9FwLwNqiuc+XMG2Gr1S5uyKOt77KdWEF821iQXxK0
	1SpMUToya+j44I5bGAiQC4cYQzGKioQx/YERJ9pjW5zIEUHvkpBshvgAcIp+oJIw/HmZGXH5nfo
	v//BgV5iv8osotL2R8GqbYLr5R5RUwhtVUGE3ndElHvovIC2j7yupVS54mO8=
X-Google-Smtp-Source: AGHT+IE4y3MjlYml3nWi4lAk5YrWAx7eo6tEUMyPJA+MSS/Zk0SODQS2OqXscxORNWaGFmZcAxLoOI7tur93WnVxQsTzvNLCfGEj
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4c0e:b0:864:9cc7:b847 with SMTP id
 ca18e2360f4ac-86a24df598emr2860931239f.14.1747872543619; Wed, 21 May 2025
 17:09:03 -0700 (PDT)
Date: Wed, 21 May 2025 17:09:03 -0700
In-Reply-To: <75443f55-26f9-498d-87df-02bdfaa5b56c@I-love.SAKURA.ne.jp>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682e6b1f.a00a0220.2a3337.0007.GAE@google.com>
Subject: Re: [syzbot] [net?] BUG: sleeping function called from invalid
 context in team_change_rx_flags
From: syzbot <syzbot+b191b5ccad8d7a986286@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b191b5ccad8d7a986286@syzkaller.appspotmail.com
Tested-by: syzbot+b191b5ccad8d7a986286@syzkaller.appspotmail.com

Tested on:

commit:         d83ec0b2 Merge branch 'there-are-some-bugfix-for-hibmc..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=12c2b9f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3dfbdc0d608b70b
dashboard link: https://syzkaller.appspot.com/bug?extid=b191b5ccad8d7a986286
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17b0b9f4580000

Note: testing is done by a robot and is best-effort only.
