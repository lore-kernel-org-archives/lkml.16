Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55B633E1
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 04:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738382644; cv=none; b=QYy+DG7spZ+RVizwKYDMmmKLsiXjDiNH1FRj2aAjJyq6mXzOe+0BDEZNZIcxZGA1urFnUlzTaFK7CruSPnIuwpod7n9PNJCH7bNcVw17OfncFF5X8pIppmLuo8LbfMtswcN1Bj1sY608JP3OvrfuLTWUANAfBEWOS2U6LV8OIAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738382644; c=relaxed/simple;
	bh=mI8aqq2U6rC/GNhKADwHQoUkErjpo839LgJFOWlVG+Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZVLZPXGUPhSRwCPiND8CD7ItlC6nwqknrtQcSBS/VuaZoCb6GAjAkQoKxBtJbSN9rZKwiFgjs6hBDO5UU9U1eQADo/ttvu1C64fAvzkdThdr4Hy55wkWGpNoLCyakkkl2UsWJssF4fKYYX7+anp1q8CHvWjtOblJ2XD84idAIYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ce7b6225aeso43246425ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:04:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738382642; x=1738987442;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5k7uexjIAZyYKhY9nc8MxLarMNbtEt1JjmzmbOWCQUU=;
        b=JzeUVQT1iDHKzsFFSN5v1Sl+nNa6sgEp3ER/0HoSl+N/X0nq7XbWmM3+6ZMrxobh/q
         ESuBHZzJchgyo0CyvqoqtJm+xCURZB5lqPzByA94ToI7MadXJnj3BESh4t1AUhP0jB7P
         sFdc1pAus62bpbPGMYk1N8LdOZM3ILm0SymY+RoVk957xE6gseql45LLUvfWkNSwtNHj
         vIpVqX6tCWkaYyr8vKazgX3zw32bm+rksVeIHSPYtnHy4vQL59ymcNpwz82GxC4rstV2
         8YdYtbmcHYXekmFAylcJI04vbX7ATC9YIA1CUVtkISYu9WET+KJoGMxKtHYkPy93Vpuz
         Qu0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6uUIoDUKMLE4HPEqWIzqGO++REfNEszigzowtswe4a+ez0/aZXS0O8aRK3pW6uAfNp4VnFRf3ADawujo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAqQtRwGVQqnJYqLI98v+xzmyZsO+gHOeQBndngCxAiNMkAxc2
	2x5EzI84TgJkA8EpM53kSWLAcRAh/28SLFdBVC1QI3M9kCBDW4Dut4HpCfZH/mGBHDGpaWNVZsH
	8VYR5Yu7x3B3as2Z33sinEOI+stDydh63LqGXKE5bk7ls+lGbICCNU6U=
X-Google-Smtp-Source: AGHT+IETkJhwhnvRcBPAaqq83V7Ujj2MwEjVZkZ5hs4sGLxcYNw7JDfhvfBu0D11oGvGUsIIDbrgTkZf+EJnxvK5cQlG+XCG37sD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c0a:b0:3cf:c17d:5cc0 with SMTP id
 e9e14a558f8ab-3cffe3f8e1dmr108987935ab.13.1738382641948; Fri, 31 Jan 2025
 20:04:01 -0800 (PST)
Date: Fri, 31 Jan 2025 20:04:01 -0800
In-Reply-To: <tencent_FA177AC6CC936BE365497DA3A58440576705@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679d9d31.050a0220.163cdc.0016.GAE@google.com>
Subject: Re: [syzbot] [fs?] WARNING: bad unlock balance in seq_read_iter
From: syzbot <syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com
Tested-by: syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com

Tested on:

commit:         974c541a tracing: dbg seq stop
git tree:       https://github.com/ea1davis/linux ftr/syz
console output: https://syzkaller.appspot.com/x/log.txt?x=115fdddf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7acebde734703260
dashboard link: https://syzkaller.appspot.com/bug?extid=c041985778e4069e1ce3
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
