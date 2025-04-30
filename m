Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05C42DC771
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006186; cv=none; b=qB7785LKSFncJGx/jtfb1af6AYhNZgvbnqSAoQ0fdQqhzgXQcgQHz5fdxD4tdx2PLGdu9Mbs+bFpcRyvhg0BS3mNZErzNB4K9MHfQb85o/dVukxz0t/mgnaSSJETA87DB8HZXJnY9/D1QVhmsWbomIyS1Q8lxZS0cEYUHXu5+fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006186; c=relaxed/simple;
	bh=w9iUz3axn30AuawD9AgN0RUbD/HebYK5j7LfLO8DnGU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VsnygwD09Wi4QmUSB1OIlPMjzeUZHdk0rg36q7tteAKvaPQkxAOFd/Qt6MH+UfFaoZ2T3HmHOPvUYlJMJLeHJ9iFGaVOeY0IOJ5lvY1be1rktpYQevIMeSUe6lyDk+MDbFyd9ybw5cv1cz2U8aOReidmjZU2TpisIWsVFrL0sm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d6e10f8747so61855405ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 02:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746006184; x=1746610984;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DYFctn4vHi4PGIunWrMj+qcBjCBIktdppilZmMXJR1s=;
        b=ImqiE9lMuH7ZkprXS6oiEyqxD8sQB72MS3iEymFd1Bsm7VmwCnUfC7ij9vk2MtwGFq
         iI8AZ5Aa22nCJFBfnDWsnwE8bbXuBs+Wr8vpa+mNEuWhBM20OJVwkD/htK0s0YUdHwS5
         sJvHjSOcRJUdr7O79kQT7G5ZWbPck3Iot8d6C6vNjPXN5wv4Ab0tPUXGk8gzQydrGh3F
         VkFICMcqws9dKM7Wm37jWLIvGSAzpfpAcs4pVbvNmWFCDMugSaMkEPFkdI6ReDXSJdYE
         f4hIqnQcwMURXYem3XxpJRa267NxXulyy2TjCxHob4rZBkcq23vE5yL8wOgxoYitppQw
         IVyg==
X-Gm-Message-State: AOJu0YxJhIejjhCeyY/a0jo61bsjS7rAiSY2MLl71KtOWj9TLQqdwSbT
	FJLFJ7ApCwC4/cEohcfBG66YPrqcg9R93KK6ywEyfzlaoPg70Bt34LMj8t/JsabnYixhhPnn9Fv
	VSlYyGeuanTxhHjy+1f7BNp7ks2N7jVuNF7sm45w7lEyp8HNPfdjLF9Q=
X-Google-Smtp-Source: AGHT+IEyn1J1xwRQqCuhGwmQxBifGVxLy83tnLTbyOTdQNo1FRt/8Vkh6FwDoYp80m82k+b4WT5oRX0jkgCPs3xwpnrGMnsBsIgP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3784:b0:3d9:65b6:d4db with SMTP id
 e9e14a558f8ab-3d9676d25f3mr26337035ab.12.1746006184097; Wed, 30 Apr 2025
 02:43:04 -0700 (PDT)
Date: Wed, 30 Apr 2025 02:43:04 -0700
In-Reply-To: <30fb5c18-932d-4270-88c7-4180083b9652@amd.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6811f0a8.050a0220.39e3a1.0d08.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in move_to_new_folio
From: syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, shivankg@amd.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
Tested-by: syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com

Tested on:

commit:         69a58d52 Revert "x86/mm: Add 'mm' argument to unuse_te..
git tree:       https://github.com/shivankgarg98/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=114fd774580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f002bbe3fe2ccafa
dashboard link: https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
