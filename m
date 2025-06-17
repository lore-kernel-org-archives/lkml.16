Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEB32E717A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166345; cv=none; b=e06/cJIXEbc5qzPlOOwVxMyjZa24wqoRK9VWNxEyFtA451/hfqDIQCCsI9/82xUCAejNTkpPsZhOcF8hhKRnv/vBX0H5hlqTFhfNmJuUBUf0aPsuY/vihP/c92WY3F6juguslJ+6EBe4bvBvLcfub14GYf7GJL1TumXmDQsqD04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166345; c=relaxed/simple;
	bh=TyyrTw3NmEN7mhIHwCxdbVCQN9JcVNVgZPjsXpka6So=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UTGALHMwl/fQlTKqvb+pxRzJWlf1ilq+qB/HZbZ2cgyU6QA+FcbgfyWzCqR9UvLj3Nh/NOy0+Yvqjy0llbegZBeTrCZdUawC3ZV2OwiY5sUDsxFwxJEutb9gd2wMUkZwJAvlSCHHKrpwaGU5KmaiK3bdkVd91KDK5+oz7vEnzPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddbb34fc1cso67760095ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750166343; x=1750771143;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CGJVVR9eAKrY7klNRCMqQBge3menrrFL04+xC0mi52w=;
        b=h/BVzbpL1XOdxYToKKpaBRmS+hpBu7sYxh5XWvRwZK+BoFRs55M191kvP1eJupspZg
         X99f6tk0MSNX0d+OfiLrvQ20bknabgkV6V277nz/s/PzMUdq09ivCki/VCgd/+YZGaEZ
         ROjOypDbyMloutCL7JSeY7uJbcjlyYHlKK14+HqxpDUgMNpvjiWR3NgPiP9vIlBRf+M6
         haRxI5gc5Oj9RURqWy3XfBEEdEuZSdeI3deu3IZW0kT+jj+S3dlQM9zlkFdMKpcN5ub2
         R5889Q990JCSLNXpEXo6kjXll7RuO96cUV2EJdG3FRXaRB7f36d0pA6vj+XSdrJiILHS
         QEHg==
X-Forwarded-Encrypted: i=1; AJvYcCUxBVIdVLH0GuJS7fps5SSoa5HR3F8Ay9HzLvnc7PdC36ODXmEXM3nc4P21AAi4le8bJfNdl7Du8DKaBk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrrD0jXhhNOmNc429Um2PrkBPDbaVJa50Dg+EUlGOLo1TlapAx
	186Hl8fcckuxp1CyxfbI9yAr2R/tcd+wProBNNuwowGenbXAero4MPQvCvcZy95U2/N49VxzI5x
	W95Ect82XAsj2p/6xkizGuIt6nzzNeiO+mousfI1TRQtsVIdW9rOkeWG1Q5Q=
X-Google-Smtp-Source: AGHT+IEsCpdND2d8+4FVYeeLD9JC7tfKQdkB7zgRrCUI4UM3e8C8sUBKdV5mCHx90e6tkTGy3Rx9v5I+FSlefWWgqQ1meKsUXMml
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:5e0e:b0:3de:12ff:3617 with SMTP id
 e9e14a558f8ab-3de12ff40dcmr78918675ab.15.1750166343232; Tue, 17 Jun 2025
 06:19:03 -0700 (PDT)
Date: Tue, 17 Jun 2025 06:19:03 -0700
In-Reply-To: <tencent_5C66A03CF936689664374C4A0A754B765709@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68516b47.a70a0220.395abc.021c.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] general protection fault in pick_link (2)
From: syzbot <syzbot+1aa90f0eb1fc3e77d969@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1aa90f0eb1fc3e77d969@syzkaller.appspotmail.com
Tested-by: syzbot+1aa90f0eb1fc3e77d969@syzkaller.appspotmail.com

Tested on:

commit:         9afe6529 Merge tag 'x86_urgent_for_6.16-rc3' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14eac50c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6a237c32900fc479
dashboard link: https://syzkaller.appspot.com/bug?extid=1aa90f0eb1fc3e77d969
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1098c370580000

Note: testing is done by a robot and is best-effort only.
