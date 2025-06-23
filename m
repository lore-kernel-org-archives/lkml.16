Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F5124DD0B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686304; cv=none; b=L+HmthI3O73faujqgHWkDgnu6w5SE4OYih2bUsdcPfqfv8cXiS4541a6Zi0m6/7XAe0aR5gm0lO6hWIlVYRnROeMFhU3Rr2CK+TUCUFyv4lh4L0S8kZSneAOgfmKLmGO3+ArBy/K2vUr9mfuV8ADOavAfEVuwksxXfdgq0ue84g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686304; c=relaxed/simple;
	bh=A5GaEWZExJrrCgH5AOTh2LEV1QSCdggk6Ok2ADs3aIo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OewzgCfyzkcqp9uJTcsDhMZQxncYt5oHrJs7z8ijiCoBEbUD1vCtfgJnfDP+euQlAhbd375hVX8Z22BzqOp9RpELglkImKS95oaMzaxX7z6bYWZ0Ge5OA3u3DYNoPQ14XMhFh8aBAUnQbmFgyDJybk11DgZTzQyAxpFm03sJaxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddafe52d04so135740765ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750686302; x=1751291102;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKdbYS3JVAu/GQbUNVJCZZBsfueGPkGVSixRPRpLlYk=;
        b=aSFLKAi7M1Ogj5TZYFBgIXUypygLS35BlRxc5ed7YXnxJuxfJ99HzKkWynVKrm84Ia
         LvcO0YRSSQyH3ADygGSinVcquUxfWphbO97qpZ5c8Er7z0nVBhYhSQeKq6HQ+zhSKs6O
         +noXnO6eKmnCeTOskGXdWwAz7zP0GQ12BPjJ3OuVoGb1vRWUbJPwT2M/ZTORW+yloGhu
         K6P814w/Ro1nvMZCEeQmQrVzX7pU6qAzJuiv6n5WHCXSeo7NZ1gCWMAoH5uMsTM14DDc
         pHhyBqOkwsM3fA5KddQU90ttunaOL2jzuwws1ZuISh4MrXoTm+xEiK8A7lwhCXZd1S6u
         qvGA==
X-Forwarded-Encrypted: i=1; AJvYcCW0x0RVE+0VP32Vc9my6vHXwpjWqonIMWlGjYBBAa0+P7ign9xqYgHycL0LFO1As4HhI3UZEltjC8TcTe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQFNje9dcpKjUk/U9dUDeYEjWJej994bnpConw4yHKxeNANCaO
	pI43U3F4eA0Bi9mBo7m478hAMJQF9fSne8aZjn/qDnCKBub4R/I+2sgqLczOyJeYk9L1E/M65VL
	WKA9sqWK9HwSKBtwQ6TiJiIqvLUigJhi5u1hflNa21FMZqLSRkWT+vHmML7g=
X-Google-Smtp-Source: AGHT+IH4YLFhK4GAum0M6UdBtv+ihwuPUrpqtGN/omSn4BPwa4gz+qsShej5nKRy7BsgislpmHh06I+PtOEnH8945PKjEAXwTe+2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2188:b0:3dc:875e:ed7e with SMTP id
 e9e14a558f8ab-3de38cc052amr130743005ab.12.1750686301755; Mon, 23 Jun 2025
 06:45:01 -0700 (PDT)
Date: Mon, 23 Jun 2025 06:45:01 -0700
In-Reply-To: <tencent_C2882DF56C089420E9D2EC4ECD707B926F0A@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68595a5d.a00a0220.2e5631.0024.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl
 (3)
From: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com
Tested-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com

Tested on:

commit:         86731a2a Linux 6.16-rc3
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12553b0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=595d344ff0b23ac5
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=106e3b0c580000

Note: testing is done by a robot and is best-effort only.
