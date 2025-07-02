Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C831885B8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751493845; cv=none; b=fl/qfQkSktlTW7J28LI0McJCX1hXxGFoe5T8qJ90u0kslyNhQ4VW1rpitq3JgzaCOcQ/AZHeUwrB4TiaCkdJLyEO5M3PFmKQr0awlT9GrNe0ESZBw9QStTQBEdGmm/44WU/cmHjgejG9yQWIm+P8ISVESOaUoGad/WVzY5elvZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751493845; c=relaxed/simple;
	bh=SsfceBP+qhOoMo7OoM5UWUZ1eymVxtTJuiLiM1pfvGI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RpqP9lDrEJ8If7X3jfwzSdKUmqszPt2lgp5bD5roAdxc9sQehVabs5K8vdJaLZoJm9l9dD8RsDv5gUOWC7mhw2t24jycYXILHObREPJ0p9EGP+71xzuckChKdk+2aXUhuI1KlI56jZe9rPqXxlJfWdT/d5lQA9TDsS1aImNy5ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddafe52d04so126233375ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 15:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751493843; x=1752098643;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/J03lRbzuvB4PtTp7I4ZDRquz2XgnWn7PW50AxA3/A=;
        b=Kr4Gh0FkhrcT5ip1r3BgLRfLUuFm1hJ0KPyjkIYSi8IQXmFukLfE8BeiLl7H4MUrVT
         rk61VXralDwEWFJC6BpYWfi89UbPDAeyI1ZA6wnFrri8NYM3WA0GqTMZ5iHifGNFmEpn
         yIu88Z3/Un5mO6D9RwLTsuS6gkPE8GWFcMrsxg4GZT2zN3hk7K74moe1tN1row5Z2yks
         V48hTQa0QeHiBbHmqPTD0EzSI/M9vwr9JWmr+vrrlIElYgbcDMD0HioGRQBzCv0Lo0vJ
         Ne+lRC2nDOs/MDXc2+79vfX1myr9oQ1pp3zdGp5wBaoCHV8GONGTdliDcx2TsHK3qcje
         ulbg==
X-Forwarded-Encrypted: i=1; AJvYcCXIs1LLjgyVeBtIdXPImaLI8FLfukrx1Njpaio7eBNEV5mMhC/JXqT6fiLfvDBAsW5qlvShPx985016aWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlwtsGlEsa4/0yZIXdpTA7pJbAOM4ircovXsAnhD+8NsO5Honw
	xEJq6HwfMCgJc+9zvzApwrCxuvkjdZyfT+/4u4Dui+J9/WfeJkSONYAHw2gVp3wIsLJ8iQbQtOu
	B0lislPcbqOig3bNbqXxf4UExpVDuFuSk0mDpzKsfMB8nHFMio9F3egCmhw8=
X-Google-Smtp-Source: AGHT+IEw/ZHDnLHRk/xRKLu4Ya2e0GjrHeyDhj/YYErj5HvA2TZDeohNuR8anf7y3BU+aQdE712Xkz53vyUBKu1Q4hNP8ysjci3Y
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c0c:b0:3df:5314:1b88 with SMTP id
 e9e14a558f8ab-3e05c324012mr16573595ab.15.1751493843172; Wed, 02 Jul 2025
 15:04:03 -0700 (PDT)
Date: Wed, 02 Jul 2025 15:04:03 -0700
In-Reply-To: <686491d6.a70a0220.3b7e22.20ea.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6865acd3.a70a0220.2b31f5.0005.GAE@google.com>
Subject: Re: [syzbot] [bpf?] WARNING in check_helper_call
From: syzbot <syzbot+69014a227f8edad4d8c6@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, haoluo@google.com, 
	john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@linux.dev, netdev@vger.kernel.org, 
	paul.chaignon@gmail.com, sdf@fomichev.me, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 0df1a55afa832f463f9ad68ddc5de92230f1bc8a
Author: Paul Chaignon <paul.chaignon@gmail.com>
Date:   Tue Jul 1 18:36:15 2025 +0000

    bpf: Warn on internal verifier errors

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=155a848c580000
start commit:   cce3fee729ee selftests/bpf: Enable dynptr/test_probe_read_..
git tree:       bpf-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=175a848c580000
console output: https://syzkaller.appspot.com/x/log.txt?x=135a848c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79da270cec5ffd65
dashboard link: https://syzkaller.appspot.com/bug?extid=69014a227f8edad4d8c6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=144053d4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13d45770580000

Reported-by: syzbot+69014a227f8edad4d8c6@syzkaller.appspotmail.com
Fixes: 0df1a55afa83 ("bpf: Warn on internal verifier errors")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
