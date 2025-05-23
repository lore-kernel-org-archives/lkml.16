Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D3A20FA84
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747992904; cv=none; b=HIA5rqg9skTzePoImemxMLoJmyRA5Zxu7g+HvpWKVEqwDtNGAH6r3MpJs3E9WLjmdsCYCDedOJy1ynaPS35nQjZYFer+4nsp1eCSx47nGRKkTDppocikHB7cACKsZ4nU+UKpIecy2xuJwBixOUCNbUi7+VZkHas8BgY0ya5DiWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747992904; c=relaxed/simple;
	bh=toEQDKF6Zk2Hriw3WWCo5caOACjKgdQ63+/OBSGDp3o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=E7L+d5EUMIlkb9Sd3TVZkFw3VP/FagLfs0t4AYyaf+sGiEWD5vczD3QqhWibfj2botx14pkOI6K6LJWeTgGfSFrzj4PYZF8KstDvq8kXbmwL39jI5aBMYxdLSLtsb/Ahr0GmCAsvzm3eqi/3kin6RMiQJ7U8COxbCqhCQG+PJPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b4dc23f03so1563378039f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747992902; x=1748597702;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jCvRhgnd8q/WLKrVir5kzV2dCL3FKtdRSy6loFoXGf8=;
        b=In4YsOpC3EBNSeZj5wuGedYhz7hbz8FZWVuBy2Msw+Ib2gskF+/8F6RAbHjIquaWgn
         6TpQfwy1b2dlp8kHIJQy6aTepCSbwURAAvYSTUTN6T8dpmCqd68mXbd7nz7AV3O0Q3x6
         NRyd9SRY2z5OA0mPw27VB/spZxXAeVdCGiNteRoxuc9f5vMlewErPtBjxcRLNWQ4oNvc
         7j1UUgUNEiOIgZwo2uwQLVIQ2IAbEMYCm7eOl/usKkwYsUSWAEfKD6Kj1CQQJNF3/E8N
         GvYK/3NqVSuW7l5PH1GbVQyqtkmiWJBy2oEJAg+RlVNqsvs1pCD1ISsqeLd6e8A6+Tqw
         W5gg==
X-Forwarded-Encrypted: i=1; AJvYcCVoIl16LtN9nuGgxCgMTerdC/ON8KR5+7nMe/j08COFUl1kNClrP/NKufyEehFwyWg4qnwhPdSYl1X30aY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY34E8Ho9t6XW5XsN6bF8P1hd+S8kqNVUYRSRYNizFjmzTTJTn
	0cKFjllHXuIKRVLyZLO4xNvzLpqHTw/KcP8E/cPTQghToEsEESQ1VXSbO8n6wH32x4oT+z5KcB0
	26F/hYMMqW3Vkf2Icoan4fKuFMCDzQ2/x/mZgvs7WUYAuiL3SYlYleATXsiA=
X-Google-Smtp-Source: AGHT+IG+ADBeem8wzhM98Q9Q5w3SapX0t6qoz0wQ6B/qumZhst3QiMnUdE5HfmWR7E7BUUYfyE3m8Z5EqiF/iGmhujQCvXSd5hy8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4802:b0:867:9af:812e with SMTP id
 ca18e2360f4ac-86a23199d6emr3294416839f.5.1747992902092; Fri, 23 May 2025
 02:35:02 -0700 (PDT)
Date: Fri, 23 May 2025 02:35:02 -0700
In-Reply-To: <e9b691c9-f3b9-4bcb-841f-771b24281ecf@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68304146.a70a0220.29d4a0.07ec.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] BUG: corrupted list in mgmt_pending_remove
From: syzbot <syzbot+cc0cc52e7f43dc9e6df1@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+cc0cc52e7f43dc9e6df1@syzkaller.appspotmail.com
Tested-by: syzbot+cc0cc52e7f43dc9e6df1@syzkaller.appspotmail.com

Tested on:

commit:         94305e83 Merge tag 'pmdomain-v6.15-rc3' of git://git.k..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=172f6ad4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ff3e28823376fa59
dashboard link: https://syzkaller.appspot.com/bug?extid=cc0cc52e7f43dc9e6df1
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=157f25f4580000

Note: testing is done by a robot and is best-effort only.
