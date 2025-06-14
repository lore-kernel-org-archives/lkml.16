Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E93B2E11DB
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 03:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749873246; cv=none; b=jIIGnO6Qyb8/jRRx46VU79MAGSbzkQ3Xvfn0wy2JLnUgiKjSt9MjndROLzJfd4ddm71OI6fhvJR/Q/KvPNMUSt/QX1faSfHliDEimoJoHGEagyImzo9zL82wwjZVTPDnVc/ZJqAcB4H+K+P9bbivYgFuC9++Psa9UWWR7ruLNJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749873246; c=relaxed/simple;
	bh=36LPCYVBWsWTUNZzcKHTVgoorLeegQSx9s+HkrMX+Lg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TDRN0VkMvNcx97siInqHHfEUYzbMgpwY93Ar3I1txV+SRJAAzTyWeTASFoedhC3Lt9gaadFcGmBzP8ummPs8buktV7g/wlcjukGbZFtOG0wChEJNsRmcDlOyrOF3b8M7kmuszejEBxBImw1CKk6JDVeSJZzPD5O06bWOkY3ynfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddc9ee4794so43672655ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749873244; x=1750478044;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l52C0VWji3jRlfxS+jO0+NgBrQfw0F/G3WdIJV9kVHE=;
        b=JpRJQmU1XIBMccFVTl2OAPX64SdyNKs/UdIGO1HFbJ4L74TNVTQbymmyK8sP2cdJFm
         5UxibQQmfK9fUD/UuvLWn5NbUzX2JZeEKySaZi1PQf8EsflJSNet1p4Qo/i5oBgoLw+q
         6e9u90xZVcKDMJOzOO1jQnUJqNTeBGwBtZBJpy7+KUZ1vOlk/zR/NRcDNANyo1ARWD5O
         Wb+yAN84P0RepdzNxP5VnSpnKm2i2+u1/JlKF/yEJ3bj7MCPpxGzNPMWcFffW3Vf3wJB
         xwpPvwJ/8+VLqStvdqE2qouKwzwohaxIJ/yhX46/rgVxmmebF4IiOLPkSEDNBtukwDGI
         7LSw==
X-Forwarded-Encrypted: i=1; AJvYcCXs74lLyBwcvCRZYMedlvhndg0VEipba8Y9KLEDETzwMSgVzvIEbCx6EFv4ZIsCJoEaU9cTnTQCNehFQs4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+HCMHCbsKYjmKYWJoUos9WsjOAMsFzRhIkrkhkrU85UHH6in0
	kqUkiJuxZh/6q5/WVDsxGT4BkLK9JEdPnOs4PcEnP5KBPmXcqdEAlbQGOvHIBoaPwM4UGlm5Tqq
	kUHZIBbuzh1+Zd63uK3UoWEKU0F54jrklzvHtJRn9SWOirYe5c7eA0qs32/I=
X-Google-Smtp-Source: AGHT+IFioFRW5F2iKeY/qkvT3XH2nsdP6grVBPrtXEdXvAQ+wnvoVVve/krcqzBwo+iIj6zy1PvaR4e3PhBXSgGuSa7470lLtqtk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:198e:b0:3dc:7a9a:44d5 with SMTP id
 e9e14a558f8ab-3de07ced270mr22311605ab.22.1749873244528; Fri, 13 Jun 2025
 20:54:04 -0700 (PDT)
Date: Fri, 13 Jun 2025 20:54:04 -0700
In-Reply-To: <tencent_5164697F63AFA45C5776B771A6C83368C305@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684cf25c.a00a0220.279073.001b.GAE@google.com>
Subject: Re: [syzbot] [iomap?] [erofs?] WARNING in iomap_iter (5)
From: syzbot <syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com
Tested-by: syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com

Tested on:

commit:         4774cfe3 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10a48e82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=162faeb2d1eaefb4
dashboard link: https://syzkaller.appspot.com/bug?extid=d8f000c609f05f52d9b5
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13c88e82580000

Note: testing is done by a robot and is best-effort only.
