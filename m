Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E556914B06C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 15:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750518306; cv=none; b=hWtHUFreNgopI3hQpUjYZ5pj2Yt44cVeTcSsP03Df2Ap7rRsgxOnHzo3yplifeYxV6lvrpB22bSd5uPpUSYwaEeeg/0ovqEYVmf8UZqMaIfUB/hMNt6jfBC2USZzMhRReawE2XMqcRyNHTpQ7scz7M3XIsp50QwoByz2j23ueHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750518306; c=relaxed/simple;
	bh=uBVRYDdxKtxenU0ssX/gUOOV0ukTaDpwRyDwrLc0lFI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MzyDNo6FMJ9vxhtuqpCVhd1c3K6ny6JiXrohPrncuIhkXCnHWjXMzYfLb6b1PLKji1s5jT3CRVqGOiK/4o6j1vS9gT8O/Weu5vj/MFInGdVjaiV6bZeBz3P48kE7RIM3K00duMyxoySdlk1jq/lDBgk3JuMHAQayiZ46uKgEIrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3de121edd59so66831575ab.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 08:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750518304; x=1751123104;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gogxPiL1sd1xyjtOpCdCJF3YAA+slE2aN5TETVQMJWI=;
        b=Xf2Em48d0+dwKTAHLWOf1fKvts40zXz6Vot9pB2lJKaTJ17ciGmzedshDJP1IzWPpY
         1OmIXP0bdSpREiJ/0R9oxHEapB6jU0ImCkfFibjuN8D1ZlRbNJA28uyyiTtwagYL5sGR
         gtkmHhl8fG077gX41r8cFbmuURUOt+QQxzUXaN84us83nw5xiQV3VDTNJi8SIaF5ccAh
         jJhlUKtkYayHxpm/2yXbGAaums/4Cy42638ZNYXXvoEVoHUgEyP82DH6sEUuHg47XnXa
         11i7neYs0aSmJzJ9EL9J5+D6W8xdUg+BfARPF+4wU8i8jxJFTC4HLuX42GvJ3yoX/ovn
         jExg==
X-Gm-Message-State: AOJu0Ywb+ay9qzhLP8+xdG158wCji0ZZ1c34kT/MzQ9O/3ELeT8HP4e2
	Jg7BEUHskclyi59jdqEsha8F5DX4AzMvIl0RsAkM7/eOVMwu8p5h447hkiBVlkZ60BhoFdWA09F
	X+/H61mUE2zMezOU0cSDzp4Oie7F3YckkVChK23pwVrANCjb/0Egw6fLZVi8=
X-Google-Smtp-Source: AGHT+IG3TkxHnt9RheNzYHUUS9YgomSevtO8nMxPHwOmwYsHSokXJ8z2j7obqGXim6BrjiCWLwqzgwwxj0rY5f2g34PfPPjy7Ig0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2703:b0:3dd:cb92:f148 with SMTP id
 e9e14a558f8ab-3de38ca2f07mr74988625ab.12.1750518304105; Sat, 21 Jun 2025
 08:05:04 -0700 (PDT)
Date: Sat, 21 Jun 2025 08:05:04 -0700
In-Reply-To: <9a1a4a25-f7cb-4eaa-bcaa-d655a444076f@I-love.SAKURA.ne.jp>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6856ca20.a00a0220.137b3.007a.GAE@google.com>
Subject: Re: [syzbot] [ocfs2?] possible deadlock in ocfs2_try_remove_refcount_tree
From: syzbot <syzbot+1fed2de07d8e11a3ec1b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1fed2de07d8e11a3ec1b@syzkaller.appspotmail.com
Tested-by: syzbot+1fed2de07d8e11a3ec1b@syzkaller.appspotmail.com

Tested on:

commit:         3f75bfff Merge tag 'mtd/fixes-for-6.16-rc3' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1730f30c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6a237c32900fc479
dashboard link: https://syzkaller.appspot.com/bug?extid=1fed2de07d8e11a3ec1b
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=158ac182580000

Note: testing is done by a robot and is best-effort only.
