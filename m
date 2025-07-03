Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640EF28DF15
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 05:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751521086; cv=none; b=D7zSNnVb43WJq38Cbh+4c2Pc/NaubG6OGSFU3H+Gfo1MGLh7hIwNc6BXR8K9bWiplnNjnutJJjqpG4MdOxDERxmeBqKgMtguzDJ1EMXyN2Dc+q7ju7TmXycmeEdu7yukt8FvF7yUl/zmZakLlgbrcSt9jRkCilMAyJ3Xx+AAdpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751521086; c=relaxed/simple;
	bh=I4dYBMoMdRSfu/j1EEIbjWeRY0pKm1fW5e7V6BOZePQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pV3I/dKnba4UcLQ89EutTYkbY/kprCPQaWYt5HYHwudqvdUGCRFJ2SlX9B09QmhI7swg5KSJ5R8q4GPsDDMMhwURex4nYofjKuXrfkOLDJmdSUaVL9WuV1l7hwhzaCcR0m/sN1wwcWj9MnTBqJBaX6/xs/3PsQ1q8k8cPmJYTZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86a5def8869so829137739f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 22:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751521083; x=1752125883;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RVJDZus+7X4J6n/LkYusuq5HpVjVnv+4qY44aHjm54Y=;
        b=BuyM0YEVPzXjpMjM33iE7y+tkEKvQNbTiEP7UkmeBrKJo6C5TEKGq8ZnM3PHmksEp4
         kwSYgo7dRikP2H/HKAphhJgnhn/qdWv01j1vHqObL5cdkFJddlW6sPvUBA6C5gruDwwa
         CY/35EaqHUu0fKn1fEuuvRjTqGhwpaGh+uJhh2mQXBOQARgegPaKOBFcZr4N+qgclwRS
         2fWUrxj3ntp2cTZ7JIsen7PEBaPKnI20CFwqz0Q60Py+zWOo3vF9Ix/EqvpVXzT5bPo3
         Vvhov0Aft1pnRr+JvsABZF0o/ko4S+NRwR6Z4y6zi0V9FT8oOrjclOtMcyqILDKVLQc6
         wpog==
X-Forwarded-Encrypted: i=1; AJvYcCXN9HI+i5UUoEAbkMXvaj5/dRoF3KgYFnu9B0ybl9JwfDtV4NkkuAjrB0OeNwLRJXisY3byPvCv3i5R89A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqogb3KFNkQ8dGHrCqR1t4Pspm6fZ7gePZeE7KzGcZQoDTV+BL
	GqbcRJCldww3eCV0PBFcbxgUkniGzF6krBict26ZK318RCCDqckKgjQ/loyWFUJP9ZTb6dIfRgl
	ud2V9CQ1wEDvTYflYqsAxHpusZFdum2F2R33LZBp/lrroRSycAmfNZzql4ak=
X-Google-Smtp-Source: AGHT+IEYUTcFu4odsZPHCbiu86uqiDIZVdMA/eIUXt1RnNXSAtSEZn9UYKkNHZ0ES7NcpnbS+45lPwinfko89KHXN+BhKNdmN+qv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:368b:b0:876:7555:9cb4 with SMTP id
 ca18e2360f4ac-876d1d28b4emr261225639f.1.1751521083711; Wed, 02 Jul 2025
 22:38:03 -0700 (PDT)
Date: Wed, 02 Jul 2025 22:38:03 -0700
In-Reply-To: <20250702182421.62557-1-duttaditya18@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6866173b.a70a0220.2b31f5.0012.GAE@google.com>
Subject: Re: [v5.15] INFO: task hung in jfs_commit_inode
From: syzbot <syzbot+30b3e48dc48dd2ad45b6@syzkaller.appspotmail.com>
To: duttaditya18@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-lts-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+30b3e48dc48dd2ad45b6@syzkaller.appspotmail.com
Tested-by: syzbot+30b3e48dc48dd2ad45b6@syzkaller.appspotmail.com

Tested on:

commit:         3dea0e7f Linux 5.15.186
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux-5.15.y
console output: https://syzkaller.appspot.com/x/log.txt?x=11f8748c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=73ea0defdc12fa57
dashboard link: https://syzkaller.appspot.com/bug?extid=30b3e48dc48dd2ad45b6
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12c2d3d4580000

Note: testing is done by a robot and is best-effort only.
