Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B89335BA
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 19:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743882965; cv=none; b=QURV8zNIEff6jmcOvvt8tE9P9t/H4jOX660jArOFsY0GqCjzrXwcJ1xxmHFE9vKLkJaH8I7JA3suBqLU/LGP6hGvyndoj7ABuPNg9S/V+qEn4s5eMVlw9a1iAL6nPqr/GMiQ/gd274xtJd6gqnQu0nw8aOI5PA/rXWgnxx9/4eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743882965; c=relaxed/simple;
	bh=pp+gU6q2X8jmA2HgYrgWk833yDw6nt8vTIAOrrXSbeQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sa+zFuO1nthp9tpxkWr4AZNknvY84VydM/NDqvLv5kXl9JxDWREvuxMxhOuCQFf18iqnTawwp+cMAsXz2sflsoOun0+FT7fY6ZyB2x6m5yunO8oIFZpcGP7G9sRiqLr5uV2x60Vf2YxQfbhc81RKombJOfUfpKmLhZujpgY0dGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d6d6d82603so29910605ab.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 12:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743882963; x=1744487763;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Hm8eM0LgqeHm2e5edqCzh5LAaCNPzPWs2dgSjTS7SU=;
        b=bDWeRW+KCvlraAy9tgVlmaoAxCumdx7PiFWhIgCblIMx/ZH2MA+nOaPOdWn4lUsJ5p
         fmZNaeWDT/V2gVdNidPgXHc6go771rO2RMO1CjYt7BUqpTWYa8vFc+5t/d4tL+JR0caT
         7euSm5Wr3UaDXBVGBVLaOTSX+PKBcyKdlL2y/bFYHyBBw2hKrFn9cNynjzW3lJxYmkYo
         t/dOzkvsFxDKv2/r0GvYpfC+nsHAaHspGvhcWw8sdt7D3YKqyY5Gra3tbL1YqninkzVZ
         l93VErcw/rmNufpk1oLS15FAfYK2oJV9miQGquqMQtmssovEu/l1SqOlgPkTX/zjgL6x
         fPuA==
X-Forwarded-Encrypted: i=1; AJvYcCXTLBH6NzpirsA3VU7oAefuKll53Z2d47BgxDvACr3atnVA79vsKu7xsAuuLgC+REHYeav4rRCahemQHwI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0tf2FY1fDxfmbESYcOtnhGmgTjCGranbx1hQw2iL+VgAG5K4Y
	a1fizoKy8bh07unwAwNu5Rs23cJZ3Y6mIMzYfXjGyu7QLsJqnr5cFx0FEK/fP36rqNbXeZVf3QM
	GYImZhiPgbOBzHE6P+ilEFb7HfyyWV+8arUZFPw92Dv4b/mUFR3xEq/w=
X-Google-Smtp-Source: AGHT+IGNJ/ZH8fm9v+6nUbPybtNaKru9G9hrW854Ja7Bw19aoQfnh9x+ZL4k6PKTYPkJ+UtjD9C3KIsqbfO0Sej+NeWS/POAvs+I
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3081:b0:3d3:cdb0:a227 with SMTP id
 e9e14a558f8ab-3d6e5324ab2mr68055775ab.9.1743882963610; Sat, 05 Apr 2025
 12:56:03 -0700 (PDT)
Date: Sat, 05 Apr 2025 12:56:03 -0700
In-Reply-To: <20250405193222.577992-1-gshahrouzi@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f18ad3.050a0220.0a13.0249.GAE@google.com>
Subject: Re: [syzbot] [perf?] WARNING in __free_event
From: syzbot <syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com>
To: gshahrouzi@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         c9661394 selftests/bpf: Convert comma to semicolon
git tree:       bpf-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17df2b4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f2054704dd53fb80
dashboard link: https://syzkaller.appspot.com/bug?extid=ff3aa851d46ab82953a3
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=165f0d78580000

