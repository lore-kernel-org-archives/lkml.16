Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCC21DE3DC
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748250125; cv=none; b=rKnupPey8O2Y0two+keXF4WBnUCaW9ztlZMv3t6GoDlkaD/l0I5zh9fv5j1qqB8pm7KV9ZTiBRtGleGYsZD4kFRLjjKB6CGig5ARiYPKauJu3e+KzBzO9UR71NLxwOcPXUzJSh9c1XNIREXQ2ooeMtiDTMYQ4zI7XJetq/Hi8iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748250125; c=relaxed/simple;
	bh=iNv1gQSKyIMIKr9i6JunsrlpXrdjDYXhGUYJ9HKPltw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Y05IF+gfziKOEgzL8GxshFDLOCCzePLFUvTxx4eMEQj7KV2c2b/5GNdIZ3mS25oletn71DCHatJe6EHhJUvl3ROmMAowbsw7RM1xIFraBPVXvJhP2MssVoTrojma01ftjELl1QA4U3c6k6ppoakfOGoPtdsFuzTNJ9mIhotMtdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86caab2dad2so414167439f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748250123; x=1748854923;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z1bhu/Q4fBCIQv5JvP1GVj1ujdFmEGHSOuS9K7uvR+Q=;
        b=h5KpTTFJs8LFuSEKEr6nIphQ0FeqVeCYRUHRz4M7jEJqFQEFLTNRyWs130Daytx249
         sLTkcfoD/K3BMnznDr9veHk9GkTaGmoHat6NMt2X570EpuS50QD+saFjWCXYqv/r4YoJ
         aCHJMGYm8YM/eJLGlvgjX1XU92tMwT/3JiczENav53VVbgsy6v+7GDkOOumutgcGIaMS
         vUGHV+sK2yxUXonxJc9hipzChQo3X8qmOB2RnBVXRDDewfbzoq5IxYjhb5HYaM4yj//+
         eSxDSPY1Jesqv/iXQTlbBzwacsZetN+wGUa90cXO1dgDkfFOZoa/aeHAYFWZ9xFiwJrN
         f69g==
X-Forwarded-Encrypted: i=1; AJvYcCWKhUHUIVC+cn8mm2Pa6hFDUH67Z4p19NGBGqqgBjAyTBf1FXf6JkIqCtoN66Oo/qbwgQ0HofvvF6KpQc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIZ4c3d/TI4S5rJ1X+QLyp6PtUw/5OboSg+G8tmEbINsx2DKwT
	wm34LET91nUY8iOsknGaoal5c2281huVJeu/uma5TmWGMCgGKFqXNJVS8YfXUTFDMaeJo0ur5Th
	ed/sBwRbtD4p5xQjukuAHXSfZH7alJodWSupbrOEDlQZAb15EADYUdrrQ+PU=
X-Google-Smtp-Source: AGHT+IFX3kWTjNpBqKEVLQJLm3XJRnpHrdteqAl1zuQuEOsrGl6r3hTiKQhweIfyFaWl8D45P3jGoJTEmi5H5B3KkRYZfk7TuYSx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:7205:b0:86a:235c:3fd with SMTP id
 ca18e2360f4ac-86cbb7295d0mr784735339f.0.1748250123488; Mon, 26 May 2025
 02:02:03 -0700 (PDT)
Date: Mon, 26 May 2025 02:02:03 -0700
In-Reply-To: <cbdb562b-65e8-4610-bf0e-307b93ed47a7@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68342e0b.a70a0220.253bc2.0093.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in hci_sock_get_channel
From: syzbot <syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com
Tested-by: syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com

Tested on:

commit:         0ff41df1 Linux 6.15
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10e25170580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2fc22398e1fbdb58
dashboard link: https://syzkaller.appspot.com/bug?extid=0a7039d5d9986ff4ecec
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17561df4580000

Note: testing is done by a robot and is best-effort only.
