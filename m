Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104C227FB19
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 19:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747422907; cv=none; b=AP/2f+eu9nN0Zh42vs4CPjr2O9B/pQbH85UKtf9qx79Oso6wo1lp8QusqHKhiGCXI8LaCPmx2wQPw4fklStxqnLyzf8CBOFKzvVjqZM04+TndiTF86dG+7Tb0Loa7U5Z3qTbC2b+KJ2eOm31CstQqrp4qkD/90+39YFywss8D90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747422907; c=relaxed/simple;
	bh=G35392uCTkWo3tyFMASjh/6Ph3SGjcIfXoUEtps6ogI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kQ0THG6rZVUXi7iw+bW1x2vJP9gYT2XfTBxxPd02UYXEsKNkQRqzH7QsBpH76XUhdBlRKyM7vxpqHIc0lAFv46dNhaBwoxo/1Ks0SuAc6W4lszpMbJzFEl6NBExBA3TxAPkmTCkDiMVoYqU9vryBM/zwavY8Zqz1ZpYx+yP1R7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3db84d8ac08so12088105ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747422905; x=1748027705;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Cz9rWh2upx1xxlBClqnLaOuBq19NFNWGYw1jTLbKKs=;
        b=BfcPuC4KI/voQwmByNb/ddH7uJSFYNhEluKn0Vw/V5QSIVoRhi6mxznRx3aBPhBZsu
         NXU6c5uX85nZsa6B6tRmvZAVUrJUrOlzKvZ4dGYyqwViIAYnMxXmPv3jNirFbXD41ESs
         lnnlJrsRvX55MOnEq+gKgY57JbTGu8dcmymwq/Rim/WiInnSD6inN5AkAoYr1XFt6SKD
         sM2v7j1eaFBKO/Bs2pU+HXyYec0SlyWc09vHXOqu6a82qKNfl1MTaRTLTYlcwJf22yfk
         N00h6kgEZBg72gAftSOBqTAyyo9igyeQ+AHNOj+V/8CkLJuYsSaTNhDAnHOMfl/n3ftC
         r4Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWhAEqTEfXa3urYnn1Bv/dOFRQ+/ovv66gSkcHkpYbGXOuWBAGWf4p11WwppTNUG/uabZBKXezrxpCOXLg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywytf2iMf2np52VktXrfNvXgok0FuPmsyd7kpx9Qnych1m3yVGR
	7Wj25opP6Au52SXsr4wLgZG3Y86LsRZGpD562kwB9uFREu0im1LhKLoVdDAsyx6/IK3MNoUY1fu
	qRqoMOOtzMbgQ2JyyN46mTYhu1O3ZDzbrr6ldRcIiTrvAypjVH4zLEji/WJQ=
X-Google-Smtp-Source: AGHT+IEqEeQJq+KnKHHB4M3mtWwuath1nVpslOg2R7PsjbjjQSO4flB+oFZD7MfplYoyPijLFSBM21d06vF4lCK0YIuIUekt6B8s
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3a0a:b0:86a:93c:5571 with SMTP id
 ca18e2360f4ac-86a2317c56cmr657314339f.1.1747422905199; Fri, 16 May 2025
 12:15:05 -0700 (PDT)
Date: Fri, 16 May 2025 12:15:05 -0700
In-Reply-To: <a0192a61-3d51-46e5-9db9-be863db9c460@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68278eb9.a00a0220.398d88.0220.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in
 mgmt_remove_adv_monitor_complete (3)
From: syzbot <syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

net/bluetooth/mgmt.c:9362:27: error: incompatible pointer types passing 'struct work_struct *' to parameter of type 'struct delayed_work *' [-Werror,-Wincompatible-pointer-types]


Tested on:

commit:         9f35e331 x86/its: Fix build errors when CONFIG_MODULES=n
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=91c351a0f6229e67
dashboard link: https://syzkaller.appspot.com/bug?extid=feb0dc579bbe30a13190
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15cd0e70580000

