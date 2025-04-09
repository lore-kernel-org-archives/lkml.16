Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299FB26FD82
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218125; cv=none; b=crWoFkENC4M9kXEz9lF7BnnC53Gia/K7N7nILxrRMDbIKvph/0esfk8QU51Kp7SlpJha7AQUtD+1diuU8RcoDvhL+K/3OeAkMti9q4W2UlNhW7fkwSSpazzfgFYWyKhAnexT8FKRC67DFK/wxcoOR547dpP8xWskM8rBVjQoNAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218125; c=relaxed/simple;
	bh=N/Q29EyrkUNjSpHrD6c7uvmrA++bL2w5w55MY0tEk6M=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aMwNHIOPowosMNx0kJGz3jOLUKxO4PWdFgXu53yeK0CjEL+VpxsYucCzqNOgi+hS+YDOmwmGRAMIGaQJ3gH0GJehYglGpacj0CiYqPDW5KIESVFmeFZ0WTB2jvwSAvpx2fy0VINR2GL+WJ6E8KdcDnCBF7y1GC0BbDcG5iJKXD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d43d3338d7so137289435ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218123; x=1744822923;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uh2RDEiNjcy7yVV8K/XknWCLeT7CD0KwGkJWuruTDKU=;
        b=SXqTfYkMtjV9PRDQjEeQp0nVndN5AbZShrg6pD4550nnIAnFvUH618eQZordFholLN
         1NnJs1blWd1oL80Tl8j/FmzEQQo5m1ExIbFGdQWJ2em3JnRGQYOp8Wa4s/NvRJrw3Nxn
         sjpVv1VctWPPAdmD/rSAyx2UOUgKrOgCfNWs1iX61Zvms5F7bv90myPkvm5dhWfVHt7Q
         Ba44mSl4wEKecsw4SgAp9hjfalagtzTuxxq1bI0RtdUu/tvrEJShikI9bvRgsUdUb/aB
         IYp+76HjGBzWEOcGS6TDJEOs5+vQsAcU7khPxFwJVHU6P54HPE2nfNM+0aPKzXajEGWi
         bFtw==
X-Forwarded-Encrypted: i=1; AJvYcCUZRyP/WtESirjGNmSu20ybjlhfyfTCS/2eqMlPGklcPoYMxb2jQobLUU++iH8wjkvs5UqgrSGDohhUAWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrdauzbK3mf6P3f8vq6hHb3YlnXlJQFSR+xA4F5bEbhd0vncSF
	bbsIYYYlRLgS7EauT08TQDFzg3K6JVqwNlYe3zhg1Q0qAjAPEwL37kqnVJnYLzj0rB6xwWvBOgp
	zaNICDvghkNQENeiQbJIiUVGMXuWxHjUxIHkixWmABVR++SP6Ke75Lvg=
X-Google-Smtp-Source: AGHT+IF0p9jxNcDd6PbkOO2yCKjngIRE3FTMwu/mbuIiVBJBjJOR+yItnAYXFBtmxHqRTomyXV+LFwIPkW83vSGmMmmb2Jf1hm5A
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3004:b0:3d3:fdb8:1796 with SMTP id
 e9e14a558f8ab-3d7b45fd15emr33844205ab.2.1744218123325; Wed, 09 Apr 2025
 10:02:03 -0700 (PDT)
Date: Wed, 09 Apr 2025 10:02:03 -0700
In-Reply-To: <m25xjds4e2.fsf@posteo.net>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f6a80b.050a0220.25d1c8.0007.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] WARNING in bch2_dev_free
From: syzbot <syzbot+aec9606169fbc3a12ca6@syzkaller.appspotmail.com>
To: charmitro@posteo.net, kent.overstreet@linux.dev, 
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         a2458824 Merge tag 'linux_kselftest-kunit-6.15-rc2' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=153ffb4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fb8650d88e9fb80f
dashboard link: https://syzkaller.appspot.com/bug?extid=aec9606169fbc3a12ca6
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17b7fb4c580000

