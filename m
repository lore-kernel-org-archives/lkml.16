Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340A9165EFC
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 23:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743895684; cv=none; b=uFyvfm7IhnqsIvZatVGoC0QsJIPHIaP3bkMBPMqiwt7KeOdpFmcSGDUtS1ZrSos6obJygzouWY3/5d4gevHfVusC2upSrE3CRObkSzuHvLXWtW8uAYpXPLlHfobCvGDlgBxL6cQy0h3knD0Ee69RIhLEKDGzIlrKMxsZkz6iFdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743895684; c=relaxed/simple;
	bh=5OJ+y9YfTR8nuHj+MrpiaG9ZEQb8AcC/bPwlDtM2ncY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bbNFzQhC3AXyg8z95hCdwUiS1Vl6ThCIat7bTuEQjL2Arw0JLS0gVHXFw03uFBleRIIGGWx4MWM8m2P7pkfOaJdQITinkAzxdN7mNvCXr3kqg68CxBHefbU3/eJr6Yq2G9YhfwLsXjmYJBM/SQxNsdb0xEjOUatD/Ww9/Ow+vRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d44ba1c2b5so36580205ab.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 16:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743895682; x=1744500482;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mint0ske1wJcuG6tMqeIWWRTGIGTC9MvFsQ/kBik/5E=;
        b=MV7oA7cQCCmWwANPEYmHM1M4JcjxdSXwaznpz4FyoNfgAdziMfGWQXtFpFnYrJndPR
         YBzMFehT4pBRghqjbACdlviNIVZerhAf7cZzFAyRVjKeBhXV3h24bX8U4jonUWIcULn1
         AsQz+gRwqS7OnrRCqR75xgFLe6IJlW3pvU/4nb5iCWcZhhImXJNqUm8MxmaU8aPRH8I7
         DHbWPYd7ASUn8EGn+/efByjKjF9g/hxJbPpXj/sEhtwnDnWvE/llKXkgjx88ZdSJVway
         O1Vi4APbz0ZzXgpka/Vc8cs7J7D5eaF4MHBUnP/UlbiyDdmC5BQrWH5oYNTsRDwZ/Hmq
         0zuA==
X-Forwarded-Encrypted: i=1; AJvYcCWpEXWeywBWFzVTDfVQ48az+Y3nvwE3ubsT3O+JUOElU2L067hJ1MwNP6X13OLPzHvwLfryhRE+Ym6qYv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaGxQjniW+RNPXB7IDE802lTRNChEOCXZIpPVai9V/hqXrNkEl
	cn2XtjPigIzeL7tAbxMJTzz5Mehgsrz582jyYtkg5Woi7f2jbidM+VSuCKCiY8/Hhu4bLJONfRQ
	uG3yjafDHm3Z1fJQfMygFyQxeISc/KDWwIFjTypqNMk4lH5k5sozVw+I=
X-Google-Smtp-Source: AGHT+IGktzGr4hQBbeU5b9MAat8tCZ9lSMFEHgIuUdReE1QFt23d8tyYojPVnE2byE3qkjcaw0mMTGHK2c2Fy95bitiOGI+ArZlE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c261:0:b0:3d5:be65:34ac with SMTP id
 e9e14a558f8ab-3d6e52f66f4mr84044955ab.2.1743895682113; Sat, 05 Apr 2025
 16:28:02 -0700 (PDT)
Date: Sat, 05 Apr 2025 16:28:02 -0700
In-Reply-To: <20250405224538.587802-1-gshahrouzi@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f1bc82.050a0220.0a13.0251.GAE@google.com>
Subject: Re: [syzbot] [perf?] WARNING in __free_event
From: syzbot <syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com>
To: gshahrouzi@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com
Tested-by: syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com

Tested on:

commit:         626e6212 io_uring/kbuf: conditional schedule on buffer..
git tree:       git://git.kernel.dk/linux.git syztest
console output: https://syzkaller.appspot.com/x/log.txt?x=12d587e4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dd7fe622caa5926a
dashboard link: https://syzkaller.appspot.com/bug?extid=ff3aa851d46ab82953a3
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12a27404580000

Note: testing is done by a robot and is best-effort only.
