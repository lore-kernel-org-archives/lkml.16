Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A29122DF9F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539495; cv=none; b=CBsAxziwyJC9BPQdLc9ozml24R6SAJqpHgbJKMuTsk+F+u1aK1/sRPvmEH/DzsiH0W+ehvWswTg2hqAM5Z7dKL2b6WofMRJDWYXxF8mCj5S+aNH+XIgWts3YAtia/G5zTDDkTW3xockWKtUZ9Jt2pyx8xSV0RKGxKCNpnb2914c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539495; c=relaxed/simple;
	bh=v4UCoYHQgciSxhmGWQEI8MgUwZtGqXSfrCRo9fn6EFQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=E+ET4E0jZ9in5G01rOx9cr3imwbA4J4ImPsknD4XRGuEmUGxl4lBrARU45Qy/KW9XrJ/492GgTEGEaYjWO/ZE+uM7fjYCGcUawT/tj6LODDTlFDqziYXvxXQZsH0+USs7t455YoCjmyR1ZgVJrNNgQyt/knkfjS2soHYaPlUEH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddcc14b794so27230275ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749539493; x=1750144293;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v4UCoYHQgciSxhmGWQEI8MgUwZtGqXSfrCRo9fn6EFQ=;
        b=hN7I0YUqc+kbUK5JQyRUj1JVgDWfQM/Y5iSjb/NN4hcdKKvZf15gO/1sZCX53h+ZI4
         c6WCR8UNGSG1sXlOY7WxqmQwy9+HYULXSJR/lXIbu8+qHkgbJXhomyvKSXlquL5ESsO7
         mL+pOmX/YwiyMDBo0Mj86bueXJb7OiRO+QPtu9r7eGRbfvumTrYrNIn9ZdizaaunkO00
         V0NgkiG+AzL/6h0iaidBfv35SCkH5SBAjG9HNxW2d1I0yfmXfsLV//HBwfmOLpdkJqYG
         G1TbQjWP5h1h/ioDL4/sTnvJrYqZdfLAnh/3v0r/e3pIFoblvu3LKZ3TZlJKWx3TTGG8
         fd3Q==
X-Gm-Message-State: AOJu0Yyf8tvA4Y4wOYQb9SoFYGb2hjsDKhbZTsepm9dcXAivWi/4wyxw
	2IAtxL/FL6er5Ok3KU8UwGe/rr8F4dxyWUH8eIeLMSsz3ldLFPUNz4/bdcDHFxavEqOESNfThxa
	Xyu3UHMz0Q2OyRBYuzpnB2TcKvApMQVbShlprXaEEXmeALGYAYYNZ2h4WLrs=
X-Google-Smtp-Source: AGHT+IHNOxfSt7TzVWgdtRaOY5tyvjsZjBW3gQlV+mfMQqh/24c1eRE6F4YRWWXL93iChyiMaKESIwdEhd+Aj1O19ATK/iOj48H3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:330f:b0:3dd:d4fd:43c1 with SMTP id
 e9e14a558f8ab-3ddedd661f7mr15419815ab.7.1749539493198; Tue, 10 Jun 2025
 00:11:33 -0700 (PDT)
Date: Tue, 10 Jun 2025 00:11:33 -0700
In-Reply-To: <68432451.a00a0220.29ac89.0047.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6847daa5.050a0220.33aa0e.031c.GAE@google.com>
Subject: Re: [syzbot] #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
From: syzbot <syzbot+0d8afba53e8fb2633217@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
