Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ED91E3769
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747063447; cv=none; b=aGb7m1gPtBRaJXDfHJiVexogaIZ1nwvMYI8ATX9+kesYGSuaakQNvB6GceZBOBInjKH+oSGHpSHme/SQuNVPvUte91ZH95qOWmyVm3JcpK2u2PvwIIa0hCWMUZdhLr4Ef18vEl/xQ0z/oeg60ZNve8M6IfvPL5Cd0fnoBHJ6wOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747063447; c=relaxed/simple;
	bh=H0DDwxrK4nk014vG2Rrw9izMLB2qZ9CfadQdCTvwcJQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=k2aLartTTPzP/WvHCk9cPb1JCcLAea4+HUTm83B44jUTUrnAvb2KrUHJEulLCrtRJw1p7jvohELmkvvOxq4Ja0E4hjwYBgWRFS4QhZh4vhEle/PMcNGLzvUxSW45xTi5zJjL0kQAHRYbO8dE0WpuddgvdWj9a9tawciDfI4qs+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3da7584d3baso53159645ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747063444; x=1747668244;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmZA9Uj9z247LJvGyARI22vNBWgiru+KG5DXuI+cuLw=;
        b=hrFfhAU/uGvbpUGF/BTbzXZXDWapSBcQzZwQ52pSRcV9Xt8mCPocdg9gqBWoBLIHE9
         NjMjbluDQSMaUyuny2manuzvCA3WBiWatELc9fHU0yJrsfDqpCT+Bbjug4rjKfog0Imz
         LeFpT+kQLJv6dty0Ay0uCN+5ZExcwghWLUSN2ibrAOIE/tRQLkxhd1xvZxLbBzXjvVSw
         CyLhqHh3FbTD0ac7gHk/mqiU5LM1xlts0kYmeaUXJxIXQgpsfx0BjD4YI4IY+w9yJ9Hg
         1Q7c7lATEoe8IX8SrsbfY4lnQHa2xUfVfGvH0c/1i18jb9obLm5T4SmcCKbwNpLZT8ge
         YI0w==
X-Forwarded-Encrypted: i=1; AJvYcCVmiVsnSe52QPi8hJq/0cUNnnoPAMKgnjV0eJJHiWpqQQ6JzRdkGg+kuuDj8uOOzM6hL/VLDugPSsYUylk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkb7BGue3vo03jmx9Y61vUJ9+tLH8XswXAggYNIGX9dUkeUWuh
	vtC8RSzxccgPgaw+yy+4CmUFLMEaj14Nd2/mRnOq3OFK9ydmKgZvZwiItmxpxXkaEXAgJBUL1Ja
	MvANAIFPS3kvKGlo0tyI9bKLiKy7wSoJBIO6oePmPl+NlJ1y0zdhf1Dc=
X-Google-Smtp-Source: AGHT+IHu0Dta9/E7nRFPcyxr7oyq3qbqYdYtoC7Z89KJRIQJ3EjxyX5ClU0EGCzh4poDNIDgPJdtUW+g/kURo8K62UjQCfEKu2wf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c26d:0:b0:3d9:64e7:959f with SMTP id
 e9e14a558f8ab-3da7e217255mr169104815ab.21.1747063443783; Mon, 12 May 2025
 08:24:03 -0700 (PDT)
Date: Mon, 12 May 2025 08:24:03 -0700
In-Reply-To: <89a530de-83a9-498c-bc8b-844ed0d183a7@kernel.dk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68221293.050a0220.f2294.006a.GAE@google.com>
Subject: Re: [syzbot] [io-uring?] BUG: unable to handle kernel NULL pointer
 dereference in io_buffer_select
From: syzbot <syzbot+6456a99dfdc2e78c4feb@syzkaller.appspotmail.com>
To: asml.silence@gmail.com, axboe@kernel.dk, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6456a99dfdc2e78c4feb@syzkaller.appspotmail.com
Tested-by: syzbot+6456a99dfdc2e78c4feb@syzkaller.appspotmail.com

Tested on:

commit:         5a479bcf syztest
git tree:       git://git.kernel.dk/linux.git syztest
console output: https://syzkaller.appspot.com/x/log.txt?x=108f92f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a2f09b26321f0ad5
dashboard link: https://syzkaller.appspot.com/bug?extid=6456a99dfdc2e78c4feb
compiler:       arm-linux-gnueabi-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
