Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187C610FD
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573387; cv=none; b=eDybPHswYDOfZA9LubjrClUcgpwQ7kOwHlhmRV82MGV18vjVa2M0ZykKKcK7VvEVgICQGTO9JANpLsaTvEiz3bsFmkE/P6Qxbk4p7v2eHFJPcxT23GRlgBXSVNa3extMJk+fVlkbquYbe/yKD5nZrtzk51JcvsPUWiT1FOXOFSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573387; c=relaxed/simple;
	bh=z9QBI5TEZ6IhIN2sM5RjOZ7WuT1InrdoqHqw5jjogqo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KNl//zrt0/OaEr0MK7qfhEzcte9fzYWJbrrhFGICjk0Zm71+AnqPF4nzFoe6srdP5eBrt/nSAG6F/8W/z1pRFsse0dgoGbedtXaXGckf06RsN8G0GJwDpuIQrkReoPnqffJE/YrhBpH04HXNPXRdq2XokY9L47vX4yK/5r0VISY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a9d4ea9e0cso32943415ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:03:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738573385; x=1739178185;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FsXMnOcCOWOjPC7cqw8Pw5EidqAgx2MNplrPMdPHyFc=;
        b=XiMaP5q14rd5a93at8pbisAfuJ5+/ZfYAzCQS2p1v52OxpC+Tux2nZ4630NgYosrq4
         IZrq3c5Jtkyo5mVSkn5dl8+nEKyxDf6bbCZ4oCzbZqTGgGoVtKB5Ex3ieQTgxoo1w6yl
         I4ttbuWi9dJGlGkCEpYQmiy7KV4uaFBc71/ZrO0r1zAkIqZP8jOV8dqO/NiaOwJWdxA7
         MGXVOu5opOgZW13FEKdSQ5byr/wAKcdE+BZyySAHWn+6QO4NPhlfGhlFU6M7QjNzup5P
         UrMVregZPnwPLpS0CEHNxmKxewHiSxfPs2XFIrolMYWnOP87EOdWEmwIog42NWCHBOAB
         YBMw==
X-Forwarded-Encrypted: i=1; AJvYcCWXdlnWypRhlL2DFYLZLlTwtjLVVO3sj9GCQiKz5+XhA6+ks5TknVXVV+aXjh10KAGWfKnMtMW5pQLKfTk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/PUq17jXzqZ8OgWYG26wGshpKaOr6Fcgin7+Pi80EXjrH35LP
	5w3/qlG5YGWORv1aP9dpbj1ASL4VA1vQkA76CjGL6SOLOCSOBdm7OeQFnTl1t4Z/1RPIu8TjD6P
	k8BiQYyc2KjCucLUj8zlLinuVXiSgfgG3Px6pebV+2WVfAjbwLzqHM8Y=
X-Google-Smtp-Source: AGHT+IE3O6u3Gej6YXy58eCdWhkSO659wMvb7toH8lP8vUdUDpiOD5gjFNEh+TSV8PZ90QxiyEO2Hw1JLOmQvSaNuDc7aZZ9S3h6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aa7:b0:3cf:c1c8:6942 with SMTP id
 e9e14a558f8ab-3cffe3e5266mr206675285ab.7.1738573385171; Mon, 03 Feb 2025
 01:03:05 -0800 (PST)
Date: Mon, 03 Feb 2025 01:03:05 -0800
In-Reply-To: <20250203083954.2020-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a08649.050a0220.d7c5a.0086.GAE@google.com>
Subject: Re: [syzbot] [kernfs?] possible deadlock in walk_component (4)
From: syzbot <syzbot+b4567a8b2d2ad5f9dd06@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b4567a8b2d2ad5f9dd06@syzkaller.appspotmail.com
Tested-by: syzbot+b4567a8b2d2ad5f9dd06@syzkaller.appspotmail.com

Tested on:

commit:         2014c95a Linux 6.14-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=148e5724580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec9aa034f6454c35
dashboard link: https://syzkaller.appspot.com/bug?extid=b4567a8b2d2ad5f9dd06
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=162ded18580000

Note: testing is done by a robot and is best-effort only.
