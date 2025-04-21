Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF4D9444
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745251927; cv=none; b=gJmxfnGlPnYImd6FGVEOcvc1hPQz3LYaQ+EVvzTFr5rzp/E2j8Fqt87Ve2S+nwQ1kgY7ccjPs4/dCz6Xi8UyfwInwaGxI2FEuqZmC/2GB2C0X7DKzmH0BtcQZZcuLkhCMnwLcUqD73aJmJFpBwKDvpQ/75YksRDGhGHTTroN400=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745251927; c=relaxed/simple;
	bh=I+UkApbBJ3Rc8fFtXoB9gb1h3X0typlNP2qp/aoUiY8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=GC4u6t9yJiSgVVIHpgAru0/o5cgkdBvaLcSXAiFia9NYEs/JT8pd8BY8uONjzvgLcgoh2nlTmokWY0zxTYIgYc07d+d1G//BjbENQUVk7xNIMaDI8Sw3mXGufgsFb8ADx8fushtLYJzTrj4kqG1B9iD8hzVonx/6jAtkDDuqzGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85db3356bafso995997439f.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745251924; x=1745856724;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10P1iGVClG58MJD0gtqV8hkpemEew9Qv7aKNGdYvFHU=;
        b=AG85ZBQxJgrXAHbmZ9Z3DnHmg+8kX1InXxsO8Nudq0HMqd0L3HXkX3O8rY3/DAAJ3k
         aGHBDv2+I7+kUQpUSpg3mJYkl9Pztzv3lS5v8NhXyET75STUHFHVznD452xikBZbPUbR
         rocfo6k9ZsZI6N4Zm7AGUbOBxhbOlTZiwiCa2WBW3TLtr4GrSL/WAOVlyFtoCQlsvkad
         DxAt8dKJR8HZerNot5IWhga7fLnMhYms9Schwkz+EasZ8mAuMiWyhuGKHrd1n9nhOcjB
         Ux3fIB8NsoEWLfL+YOwUgub5Jr+BDaHaviNN1rEca9yOVR6HTyMVEc5mrF/pH4kLHy+Y
         8LuA==
X-Forwarded-Encrypted: i=1; AJvYcCXOPD9vJ/r8NEmLrzrDFrvi0k9XGxn79s3sU4nAzpL94c1dkv6oDuRkJXxTYyDkX1f5Q+mfQyTy3dWsmxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuj+PmidtKHE/N+LnYLwYzZMbR2tcdRaQPoLE5D+i19chwBUbe
	7P+BdUd1290B92FG5AGjpY9UNYq1chSgSJbza+GGklTKA7pSyWcX0ykw6ty2OvUddBXENxuDr8B
	D+CzOQ08461tIMPDPQ2yo230xXw+dAXCaZACbHYLk8vyO2goiTMQkQDU=
X-Google-Smtp-Source: AGHT+IHqn+9lS97pG7VeJ0sQ/GKSXbeT91UxGhefgcXVybtb7h4tuLHblkJb+03x/HDZGybbfDBAAdo57uWY6WAOyycmMY/Xg+yO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:240a:b0:3d3:d00c:3602 with SMTP id
 e9e14a558f8ab-3d88edfb6e6mr128197815ab.10.1745251924739; Mon, 21 Apr 2025
 09:12:04 -0700 (PDT)
Date: Mon, 21 Apr 2025 09:12:04 -0700
In-Reply-To: <20250421142219.158593-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68066e54.050a0220.243d89.0041.GAE@google.com>
Subject: Re: [syzbot] [media?] BUG: corrupted list in az6007_i2c_xfer
From: syzbot <syzbot+0192952caa411a3be209@syzkaller.appspotmail.com>
To: contact@arnaud-lcm.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+0192952caa411a3be209@syzkaller.appspotmail.com
Tested-by: syzbot+0192952caa411a3be209@syzkaller.appspotmail.com

Tested on:

commit:         9d7a0577 gcc-15: disable '-Wunterminated-string-initia..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14604fcf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=efa83f9a6dd67d67
dashboard link: https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10f3ac70580000

Note: testing is done by a robot and is best-effort only.
