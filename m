Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09942D542C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749611226; cv=none; b=ezjeYb+H//Eh1gTi0NDK00x6qcZYgIap3ULk8qnrM6yJhC+rcmUH1uDfbDIueGkjgd6NCg9i38GwZL7gJ68aRRI8Ta9MeQaLAr/6AxDuzXgUlxICKTGFXXyaGhsQeGS2xxFZ20iwvsxcSnE1BxF2TkFz6+Yvbd9ieCO9toqasZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749611226; c=relaxed/simple;
	bh=1ZuY1GnIBDjTIqTPZ+T3pXiz6GL/0r4E/QmJ73FWffs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ckXJ0MTvNKiku0mC1UeEUMo27ofkq3wwIimETq7ccCGM9BnSU+KidfOeOyKy9ce2p43AykGWIFJidveVSIzjSkucf2WzA9huqEU1lW7XNilaw2lA40Jc1D0EHR7eKM5ykTjeSCf/QmVwYnnfhPeuq5V0Y0ipciZi5cNOIHnzJDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddc9ee4794so80076385ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 20:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749611224; x=1750216024;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmGmNAhrD689ukVKK2fUOboMN2+3ljOerd7zbg7nsfw=;
        b=eZXqdauLNJOKRySjLcGHRha3zuZcy8rmfm1iD15w+hURd8DkIgRbb1uzKgq6cqI2fs
         KYsvU5iQIzYwce92YSlNeXWUw6fVL987ynz3/nNlyQGmVFxAD/OTqOCjc/WTjv0sdJE8
         Os79LVRnykS1GKWfS2RbkEvd2m1PHVJIMCTB8ZaEseWqgkELgs1nCDj+9ozFh3ijB0Pr
         h/2BpGcQ++RXaOq9kqMQ91P72OyXSxf37ge57egpvJvd+gQ7Q2HebhJOtD+IIMAyNvQD
         bk3QouIFYQSSCfvd5jNt1ERD88ybahfOHVU+OTjY3fhv6cNKiO9T6UlV2fwWA0jTXgsL
         TgQw==
X-Forwarded-Encrypted: i=1; AJvYcCVKAUfOqgs4we5sABirS8+mgyAg+m4cTg5MtfUQUB5Bj8r64coK81CU0za/GNUlCgLNFpll9/e3BlS2DqI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv/8cs75IviNGVBfTwG1mYrn6MolsdWUhkC+KjzVZxcJzrtQ7E
	FVYNX6LcD9spDttuslDJlceestHktauSq+UwArTnVVVqwrt2A6XT9g1DPWjIFRVPLlZAnYnJYQ8
	M+V0MVdMmFGD1hLM9dI3io1LqGuxkK4px3vNsEPRNl7t+tlbKuw8zHi/Yrsk=
X-Google-Smtp-Source: AGHT+IH5/VT8czT6oFeQixpNu6oaa5/lUJKAcxCoO5A7Bxfg0YXwuVMZ1UXUwOO2rurWxNwUqPeW6H7KflQQbHQHutkBJ9vuRrIN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:144a:b0:3d9:6485:39f0 with SMTP id
 e9e14a558f8ab-3ddf4263abcmr16769075ab.9.1749611223836; Tue, 10 Jun 2025
 20:07:03 -0700 (PDT)
Date: Tue, 10 Jun 2025 20:07:03 -0700
In-Reply-To: <3c5860a7-6772-4ea2-bd74-82ba8df4b242@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6848f2d7.a70a0220.27c366.006b.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: vmalloc-out-of-bounds Read in hci_devcd_dump
From: syzbot <syzbot+ac3c79181f6aecc5120c@syzkaller.appspotmail.com>
To: ipravdin.official@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ac3c79181f6aecc5120c@syzkaller.appspotmail.com
Tested-by: syzbot+ac3c79181f6aecc5120c@syzkaller.appspotmail.com

Tested on:

commit:         aef17cb3 Revert "mm/damon/Kconfig: enable CONFIG_DAMON..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=156619d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4c8362784bb7796
dashboard link: https://syzkaller.appspot.com/bug?extid=ac3c79181f6aecc5120c
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1140a60c580000

Note: testing is done by a robot and is best-effort only.
