Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FEB1E230E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 23:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751067125; cv=none; b=uBHlM4dA7pdq5g8f/2YvnYK6L33SBq6K9RDw2i61koYldalaeKDAg5T46hkQnZFswrsMwQraDVDdMF+O8i0W2D+u121QbyECOlMW1/fVdrk1KIiS3jTIfayyNf/g+0EuFDBPKqQ3Lyr9qcePcXgjbY4uVxv3SLn5UPMD0fyRdLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751067125; c=relaxed/simple;
	bh=HCnnz6zcfpOuLVedgg38avZsWcjVl9nHz0eqLL3LqE8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tgE1+8hK2yTB/+/mUL59UsBqQ6Vgjp6n5IOA1A42JLO+gUsZR2oKrTQcNeBdxhdOKz2HqiS/lFU/j4O8mdgHz2OGO71M8GJX/56yMY/rbJo4rMQMK/jZqVqGgjiiSj+Xn/1pIYoXs91ib2GnoxCvOfI5EAvNUHN1MBcEPdm32AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddd03db21cso38486325ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751067122; x=1751671922;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9uRKXH6qyC/WDAHcGCREMD8s2c+oMoaBhENnXhl0imI=;
        b=OswpZqIqtwsvcQSbcpCo2+NToYFe7+dQ7EC+SX2Jb70TvLjBRPr8SJ4ODmGhxLV4cR
         uW1raGD8qBfz80MzUNo4TdNuyyhCiIUMrQMRbm2F8+JO3bsiKt0FBVUakAPfuyl9AX6Q
         TRUprwywDBQm3qaj1ZE4dvsB5W4V09M3pOD9EpUgEH2Czhyq7VPpIkyVjuk41hQwvBhM
         BWb2Xa+TbJDyYg7WqRMs02Pul3ywy9rYIRjDy51BSo20HtnA/21bC1GhYekFv9gANAzZ
         nFvYozT9z+YEz1kVeq/vpAMwmRQm0PKAVPcwFHneARbJImhSTYYFlT0J8BICcKut6XH8
         xaSA==
X-Gm-Message-State: AOJu0Yy9xgJuF9qOtb1qCKnirR9sGRjJK4RUYTjP3VggiuzWK2dkIyRZ
	OikCIxtA2cgQ7Td227D7S/AScIrMbjJkK91O3sBIfx/ZiS6S5az8doCwZVwQmEzaBBSc/tvdgoF
	5KCjgl82T2yZaXk0Iz/RQrp6D57gm5LgMSCu7u6YsUNDmoIWmjG+A290d3cA=
X-Google-Smtp-Source: AGHT+IGBX+VidVjlJOo0Ko/NElb2ZihUonl1oqqdQXlGzV37O8j51EoMvncViW139btW9qZT/B7pLsaxDGULXO7J7fHKNWTBtZri
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2287:b0:3df:154d:aa5b with SMTP id
 e9e14a558f8ab-3df4ab4eac3mr58952745ab.5.1751067122612; Fri, 27 Jun 2025
 16:32:02 -0700 (PDT)
Date: Fri, 27 Jun 2025 16:32:02 -0700
In-Reply-To: <1109aeb9-1e64-4052-b733-dd4af62019b7@linux.dev>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685f29f2.a00a0220.274b5f.0003.GAE@google.com>
Subject: Re: [syzbot] [rdma?] WARNING in rxe_skb_tx_dtor
From: syzbot <syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	yanjun.zhu@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com
Tested-by: syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com

Tested on:

commit:         fac5dcad RDMA/rxe: Fix rxe_skb_tx_dtor problem
git tree:       https://github.com/zhuyj/linux.git v6.16_fix_rxe_skb_tx_dtor
console output: https://syzkaller.appspot.com/x/log.txt?x=17db0982580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79da270cec5ffd65
dashboard link: https://syzkaller.appspot.com/bug?extid=8425ccfb599521edb153
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
