Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEAD3BBC9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539459; cv=none; b=K1nzEbLzWETkvRLxflEYOCPzu8OJEXFL+O0/z4WOoPNb1lBvChqSTcdkYmtGtY+vUhCIEnlHT0rswrCIWeTfWdn/CKYW+Wl7wrA3xTQlhbskm974Kj83KfhlXlSe8gEs/CSvPiWK2XJtTn6pbOnDfMvJk+Fn93UsD2PX+6kHwfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539459; c=relaxed/simple;
	bh=v4UCoYHQgciSxhmGWQEI8MgUwZtGqXSfrCRo9fn6EFQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MqqAOcDCD471EFaeZxW+T+XcWWzym++LC1Qc00YIWFauuF+oAqsygmJfDaw+cf7waKcBw7EotOO0XsZYlju7B6m9S6Jm/R65hLTaqHJBNs3Cqz4Bzdwb8WMjZQAffm2Y24kXPGIwuH+06imCsRmYpqQivu27Xu/nkHVpA5CyD3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddc9ee4794so67550675ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749539457; x=1750144257;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v4UCoYHQgciSxhmGWQEI8MgUwZtGqXSfrCRo9fn6EFQ=;
        b=M8TXYT/RUPaF3A4Kw4g7mCrKNiE4XAXzL0Skjn8kpuiJPSEWGQUDlgGVpWv9oxtc7w
         pvEvwE+gJe9VCz8n6c/R1rIss54NyvcWtukQE45AKc4fnDIyyrZbzF03PJHSHxEllrr6
         2/YbZ2WYLtkFp731IfTxim7AnpbNqOTI38Fed5209UNsVmm/iCk2CMEn0kAYkT2P6EdK
         cyBjkzOeJnUbFbzvNnsEX9Jm8teZS/BbIppYm6cjjj5p5CN20C6fKxbSCQ1y/Xm9f9+L
         FX1knRucs6BxBBi9d8pmR5l9hmWHIKsmGdz2mUFa3OlUUpdAp/zTSwi6Zhkf1E0Hu6qo
         l7dg==
X-Gm-Message-State: AOJu0Yxa88hagTIDvIkU7mYrxiWqzEq+QLBWiBxA4bKre4J18UH2uEOH
	Ji2qRcYUp5al2mSwzzrzN3TNUylsc8y4Ziy/TaPktZ6dhXgPBvRPwryrKrdLZ6eP8WFpvUmunuk
	K4XdlhmtGp2MyXrD6o21EV8g1NGivJ3T4Wbz75sWKLn5/IvRgfymH+OI9ELE=
X-Google-Smtp-Source: AGHT+IEC6rUYBGy/fNkjkwFI0ub+WSVLgZB+hYp5fJAU5bdCqCm1Y82WOKTNllDnkglmPZi0uldgDUMyHUFQ9ll9qGj6zAKuSWab
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b2e:b0:3dd:a3e4:2def with SMTP id
 e9e14a558f8ab-3ddeddd4625mr14318165ab.16.1749539457232; Tue, 10 Jun 2025
 00:10:57 -0700 (PDT)
Date: Tue, 10 Jun 2025 00:10:57 -0700
In-Reply-To: <684392eb.a00a0220.29ac89.004f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6847da81.050a0220.daf97.0b03.GAE@google.com>
Subject: Re: [syzbot] #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
From: syzbot <syzbot+9a4aec827829942045ff@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
