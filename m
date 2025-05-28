Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A85F21FF44
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461567; cv=none; b=ep/ARgdWKYykYQAq115gdOOzkhZUTJzNd1ZLyxie1oO1euaPIeKRI+PCSClcbljtXrujhc1mix8G/+D0pTO216JJwKYFUbjZoaBRBNvGN3S9QUwNraCgNm68n3YNv+63rZNqXCnaWLZBuH4jMn1AnvDA0g1xl+l2sBfvmXxP0fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461567; c=relaxed/simple;
	bh=iJOuaGUXNSLBCi5Cl7SxLgcApPyo/ICoJ/nAksoCDXQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gEbortnxbGEUAUFHOBRKusglNPXzwmOldVlFPn07U55RN2A1P3bKdzBjXeqYtkigHnD7qFEO67CVdGTGxTxkYLGwONEvrS6cLsdRV6YbH6TA63ZZ+zBJ070L5rSp2GGT+ZaJuI4ojX7ZBgq6UgSPi6gHnl9kRdQVjeifcRMAUkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3dc9d335fffso2667245ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461564; x=1749066364;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U2FGta9TLbYnrnxh+ih/kzweDDkBO8+Vzsg5bbspBvM=;
        b=FWevyCYNM+2c+BeAPXMdrAIg1vj5eNiql5TSthxBY5fEejHqyI3GnMCsb7g3mN3Vhu
         cFdCZXw52eUAMIZ0piO02Wxyz6C6O3CxY20QGQgXHPyMVFezLEEIyVqMcE6vMHb+fu5r
         E2Rfgnogq+UwnB7Tu4CW4zeGRvxOKQ9deLC+U+OpmaVilPzrCETk9lPhPH+B1JX/mOD5
         SNdJEn3w2TZrdXIiCzweNcaWGAlWDb6rKyWMashplKERmJ7a6ZWtC7Djtkx1xEfF4abP
         V7WPLW41XyU7/VlTCQla6ASkws/S4SsSFozSZPRKai4xQIFLsi3PBTnD2cK1Gf+XzpYb
         Hrzg==
X-Gm-Message-State: AOJu0YwE3GNvfV/RN6i5xkhP9Ug0w2cE57PrqteHEaLBjY4adF5Vqz6B
	uRa4yw5LZpb2vmvg45hJ1Oeip2TqtEQd/qtd7vUl80c1PULg3E2cr+gAddSZqRKYyumB9Q8cTJE
	eNBFmoZSQpYLb5aGCxLyH7SeCTr4eUqJVnKK55EBb8qUU5PwDbRAbX+PfA64=
X-Google-Smtp-Source: AGHT+IFu8Lk68ZiR7VsrEyGnhpvTuRta0fQXJNJCLBonOn0UJiRjBoDlcmFEnAxx7Tb8t5UYDfqm8mmZTDRRZb7sMBg3QsnKm8c1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4513:b0:3dd:8941:9d9 with SMTP id
 e9e14a558f8ab-3dd89410bc1mr34676885ab.6.1748461564520; Wed, 28 May 2025
 12:46:04 -0700 (PDT)
Date: Wed, 28 May 2025 12:46:04 -0700
In-Reply-To: <CABBYNZKogA9JjbJ1QijjBQKOH9NE+20LDBSgMYOddfg3yonU=w@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683767fc.a70a0220.1765ec.0176.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in hci_sock_get_channel
From: syzbot <syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com
Tested-by: syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com

Tested on:

commit:         d7fa1af5 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=17e26bf4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
dashboard link: https://syzkaller.appspot.com/bug?extid=0a7039d5d9986ff4ecec
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=164c83f4580000

Note: testing is done by a robot and is best-effort only.
