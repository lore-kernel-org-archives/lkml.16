Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388AB1EF1D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 00:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751504285; cv=none; b=RXv5TMqPIfJVj/x77uO+bGJMLXEyUYPKZkWBlFVfbz0RT0Yt3H2TNTKxWSji9DNloU6RzWAM2kJ8XZV0pkgpOZZjpm5Bd3h77pixplJ6WTTQiJdBTE0sQ8d226DuclF1bkQA3m58/ffOSJ8fqmooZ2mTbVlsezAzzuBQ/3Fa3mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751504285; c=relaxed/simple;
	bh=pmC4OwtOFVDLrG4+eB+G+a+jJFS0npjeg7NUpB3tO6g=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HXG9tdUZHH1GB3Dw0LHEJ2PhIvwv9K/MUJPOJipS2GpotwsOu3mq9so8CtLTjeSKSjX5AvczEerX3VidIMpnJMFzdENx9AkZ1PAcXh0dtWB9/9iGb2NYvmPtl8fIeSAOQNQDnBrxrPsJEGUkHz8H7KjwdF8zPxg5M41x/p39bFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-8760733a107so729791139f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 17:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751504283; x=1752109083;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNai3SPa+6hePVwwqwqgnsnmvCbGZirLX2U5kQE+UPo=;
        b=iiQCs0m7fO6lxO1sSW5w+GYX1tsKHjJEmI+M0MfD2+RHSA5LplnhZJzCV3kT4v/alb
         2RpmtLa25MuJ58Mo5JTPUuokikYhXp5YIqu3hAr7AG1yNzWdP/5Wx/t801zeee+kcOo1
         e6A3UmYtvQE7Ze+AT/9IZskLz1vwS4JYomPrI3+c/RKDmYxY8xMswbG8YvL1j2DfznZi
         GcnxkJpB9Rtad/6LLBXq1cKJ36yjUJQThyS4D42Bydl3BgS59NBS/90Gho4jAad7NrYj
         XuZqre8MsImHA48KzfZBENLuQwHOpP1OKsnPKspnxbz9t5HrSWyufqKC0/RN03Usf1k4
         DpbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMRjg/SWW18ZDAvxTYGxBhiLP5mJ2Yq7blX6mhLCjqPhd5ej+3lH0E0qQOFPJdU2qcEgUhQayg+vLHv04=@vger.kernel.org
X-Gm-Message-State: AOJu0YzavAzHqzjwNf5Iduve4fvs/VuzGfLN4fDkzeG4uWluVEVf/GdS
	fq7UnOl6jyGPnDtBdRvS7BqilqmbjWbP00hikhY/lVHLtWFmlljzfri6u0HI+OmkE9Cru0SyK25
	MCWwduoz9fB1N3jhsyuosiJkM4YLS7Z4bWb92OwWoE525mRg914lBVzy3Nf4=
X-Google-Smtp-Source: AGHT+IFp3T5dg78FtMa4+EhGu7+XMgs/urX6IAnqC68df88Oo3ewTuIZMXhvtQ3EMkZfpK7lcpBSgPM5BBRKuhFGod46zxwLyS9Q
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6015:b0:86d:5b7:5a42 with SMTP id
 ca18e2360f4ac-876d1e1590fmr293530839f.4.1751504283388; Wed, 02 Jul 2025
 17:58:03 -0700 (PDT)
Date: Wed, 02 Jul 2025 17:58:03 -0700
In-Reply-To: <ca69d915-5a8f-4396-b35e-319ed7f0b8ad@linux.dev>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6865d59b.a70a0220.5d25f.0781.GAE@google.com>
Subject: Re: [syzbot] [rdma?] WARNING in rxe_skb_tx_dtor
From: syzbot <syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com>
To: jgg@ziepe.ca, leon@kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	yanjun.zhu@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com
Tested-by: syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com

Tested on:

commit:         6f8d023e RDMA/rxe: Fix rxe_skb_tx_dtor problem
git tree:       https://github.com/zhuyj/linux.git v6.16_fix_rxe_skb_tx_dtor
console output: https://syzkaller.appspot.com/x/log.txt?x=13973770580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=36b0e72cad5298f8
dashboard link: https://syzkaller.appspot.com/bug?extid=8425ccfb599521edb153
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
