Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D5938B
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 00:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739146806; cv=none; b=JEaTU+YdrXcXtNGBgW5f6YeQ/oSqepPXA2/HOWBAPrUOvFjXSvaa9Jo4A2c+Btt3WyE1xZUnczt1JoImPZS8gwI/+9NXeXLpMCUFhHijz0iT9sxyI6hH4k37aIROztF96DLUTCllk5u5gouzxjSJjJmtV5A4aeEhPFbo5XW78Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739146806; c=relaxed/simple;
	bh=Zc8iyrguv/vddRtaIi7VyNlwTkxcac3ZMD4W5EvaMGg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=q3ckXUvd76BIn0i1VyQ9LwOu7c8flrbqRDBmQuB0W47bjo+9khNmDWgBFW2Kfiu7tzaCq/Wtq07mbS40Y36kmQ5Pjwolxet06I+G9TDlp8uQ5Duhjto6vNe9qTpHzBIuDgK0NTCBn2Zw9oX+M+1RMWSkxdzROWRS0kW73KRNT7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ce81a40f5cso78699015ab.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 16:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739146804; x=1739751604;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aacYWXOwd4JWlNPVUCsyr/zAyiQoAKtPEE28jjNELmo=;
        b=EhrS5PIWsnA+0A+kCr0HvLweXfLNnEyAjauhPBVVwTC3qCiDjkP0wUEZVYxduz21o7
         qGG6sV/eAw6Qb5/CkLks/EdtttlmLC8TjydCfoVqyM2dXjxGTjgfIVFDaJRXwyh0Zcc1
         9sovYwZMxzmmNaGykjUhYU1BGf8kAL+4Xf/HGdLkqznykJ4Hurgi4wvSEWv7OzLOX5ui
         WLeWMk/RsR29Qlpem4F2hVVpG5eiBUN7tSIpv+3YfidtfyMQTWo9r6phaXdLSOBL8cfY
         6CTHXxgio/XyKtzmIzPEAXV2KQCc2+f4N54Tg+QLJXi2kn5D5IkWZrF+GULko01pZ4b7
         OJaQ==
X-Gm-Message-State: AOJu0YwyZPW/jxVGlL0JClx0RLd626UlwQkc9Zxoc1bDwn/T9HWo0e6P
	9FZj3tjzBSLNoVwSpHlCOmIQGW6q4HAK0Gy3oRM2x/CJ8x/Am/93Zwzq97ce54VJtjtP/qVz8bX
	yAbcUiaHOutblXwDZk+wC128aEuY6vcHOSyc/YrmykEsM1jURkSdjLMc=
X-Google-Smtp-Source: AGHT+IGGfB6MO76VaO/eyq+GXmfPqSJ9bdGxAlFPI8rqJg8nQlVTi4OPDypsycZ2WH2PkTvIzcyFuYGwohrOfMj+Wq6gfLxDUQXa
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3112:b0:3cf:bb6e:3065 with SMTP id
 e9e14a558f8ab-3d13da217ddmr106494325ab.0.1739146804385; Sun, 09 Feb 2025
 16:20:04 -0800 (PST)
Date: Sun, 09 Feb 2025 16:20:04 -0800
In-Reply-To: <Z6k9YjC7dJmazME-@qasdev.system>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a94634.050a0220.110943.0020.GAE@google.com>
Subject: Re: [syzbot] [isofs?] KMSAN: uninit-value in isofs_readdir
From: syzbot <syzbot+812641c6c3d7586a1613@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, qasdev00@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+812641c6c3d7586a1613@syzkaller.appspotmail.com
Tested-by: syzbot+812641c6c3d7586a1613@syzkaller.appspotmail.com

Tested on:

commit:         a64dcfb4 Linux 6.14-rc2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=160d7df8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b6a9ed1e05c7ed4f
dashboard link: https://syzkaller.appspot.com/bug?extid=812641c6c3d7586a1613
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10cc3b18580000

Note: testing is done by a robot and is best-effort only.
