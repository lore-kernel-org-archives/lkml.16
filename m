Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103E7220694
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744740545; cv=none; b=NrD5hsxEjNeh9FopKZ/x9FCz/57DzU4vgOxTr5eRE0RGcUYcRwD8HgkzZ+fhCqld0hUxjQ4Z7VLVDE9lORGWvPqvdF7DvIycd8FeOY0puCUxVOz8ARgvcUg/fd+PXOPeVvpR1a7Kwd5dZCudz9t0B17J++DlQiO9zIa9eSu0Zso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744740545; c=relaxed/simple;
	bh=sgoyzce/cop8+xKgn/gTx1w77bC/ZJYJSuIoDvXIYyQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=alY8nAmQONxk23cBMv9oB55nlWkpBtbB0qeO2XRZkVrQ8FDejy8F/q1bK8rRG3EWIZlxg1jIyG3nNGkOFT/D0CULLmLkwySGaTO2Vj7zxAw6r9Cu3aw5A+9PyH5KJLqNqFfhMRlrAPjzHnR1Mi+OUGJMmFBf8fe4BQMPfmS4Z6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85e7f5129d5so535994839f.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744740543; x=1745345343;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gThRNQoLuMBHIaw1SksnHk8WnTdbsZuZHAyLZD0cJkg=;
        b=vG2DqPkbzIUNsARPXifg78arfgCjjzFTHS6xS3qeRkX9WUD2Ao0iOyOhGfs9mLvk1D
         8EyhKH99MpWf70PqKHefWGmIGPXG1BDMB7nhP3eRpi+GOQxNDCbgZc3Ni40TfegAZ+lV
         wFtaQAJDJEIuQpkakG/M8wjM5yyfxaUq/9rBpXYXCyRq/hBh1udx+pDFIk9vCrY8feNn
         IdNYy2+P5dgMJOaT2enLFRJ3hLup2dbDbGupt6+FrUvP5QeG80TvFOk3acdiUIuJPwPl
         CAZr2o6fNp/4e3dCzNUUQiQg9107hI4a0oQxHUNaA0f20NResa5H+Qw5DgOBmXfB58wQ
         USxg==
X-Forwarded-Encrypted: i=1; AJvYcCV1dQM3Wg4s8Pt1w39whR0xIo1QNrgNjNX2GOO6qIT7YQ/ndE+6Cyld0F9dEE7tk2xyBfs/ymEtZtnp4Es=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjJUCLmgRIKQHnjd4uafBebv/3Cvvz3OYFw61TXVZQ9F7H6zhX
	gcjsHj0McdfpwZeMaPnvyyAp4OKzwtTYPIYwkaMEH2WtJRXVGDVZbQvJUOkWWkRibTF2Rw3B4Kv
	G0g09+1o8IaUark6vBpn93+e5mcHzlMaPoVolsPY/OtzEBsNnt+JQEUU=
X-Google-Smtp-Source: AGHT+IEjUZGRMM651tTAc1L0Lz1DUf0twgub3jQFqtaf9dwYXwP4fJLQ2yU2E0jHKOI1h8pzcoFlIq0BXzjD9ZiQAX1PnPOwO37m
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16c7:b0:3d5:df34:b21c with SMTP id
 e9e14a558f8ab-3d8124baacbmr3114105ab.6.1744740543131; Tue, 15 Apr 2025
 11:09:03 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:09:03 -0700
In-Reply-To: <20250415175057.392984-1-duttaditya18@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fea0bf.050a0220.186b78.0006.GAE@google.com>
Subject: Re: [v5.15] UBSAN: array-index-out-of-bounds in xtSearch (2)
From: syzbot <syzbot+ccb458b6679845ee0bae@syzkaller.appspotmail.com>
To: duttaditya18@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-lts-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ccb458b6679845ee0bae@syzkaller.appspotmail.com
Tested-by: syzbot+ccb458b6679845ee0bae@syzkaller.appspotmail.com

Tested on:

commit:         f7347f40 Linux 5.15.180
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux-5.15.y
console output: https://syzkaller.appspot.com/x/log.txt?x=11ae2470580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f358c44505530cc1
dashboard link: https://syzkaller.appspot.com/bug?extid=ccb458b6679845ee0bae
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11b408cc580000

Note: testing is done by a robot and is best-effort only.
