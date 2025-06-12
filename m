Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DB02701B3
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740346; cv=none; b=ToRnI8mQivCq35iFYSic6KoM/OSJYT+LHwdf5vrx3frYFHg14wYMVPMAUy2SLToYxCLAMhki2m+u1upTMXrBGM86InqlKOx22CUDpsw17sBaq1CpQ+Lx8z48Q8zKpvyAlsuRTmH9gYmB5dBBN086HxvvZmKlMeOK8n9wTQPyYBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740346; c=relaxed/simple;
	bh=ZJhWfpILzLlDcso0xE4N+QABzMQhOOl2FbUEOU4VFw8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ya9rLkjMJ0oVVlXI/W/6uy3lAhHh6CAGOyN95XSzjyZQchCyPfZKCVkUvJ0rMrBiixRuoeF2IYoK2q9WrebEgVUIL16XiW+AG0sFGHbhutszkJKjtJFv5KWKU8zY77veiR1IKxK+k75APpKRpHLvvadn1/Zf+0S0BkTMqQVv2v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddc65f95b8so22122585ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740343; x=1750345143;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sOuni93krcVzrqUP8hSv6r9zVP8Vzg1n3zjGp8M4uxA=;
        b=wA/2J8X/seOOJOtafNw1lvZ+wKMSz9VfAGgOywPNpmv9bgUFIj3rkz1hLyFxthDSuA
         BbDJEgYktx7N+0rI9qqdEDoqdF+ea5Loy3wtW2HkRIhGSL06iMmzgFgqhlZ31/0659TI
         b+iziLd4f3KyHdQJCaBTq2KkuqHOX4hqu9QDTnEMXvhvEfBx2hV4FX0Jld5HA6T9qSlq
         pZd9TXQ8o71sF3yrogL/8S/+X1QqzP544OvV+NcTH+cX2kWLjDICrqMJXYIbocXUIFIi
         vw0RUg9EWPqPS2ss9BU/pv4C4+1KgQfgioge/jzXhet3AOcIlue3l83gmxlS3PG2dnyf
         9UEw==
X-Forwarded-Encrypted: i=1; AJvYcCW2TGq2aVR1NdLzguNA9KfMEp4tZqKnlMb1yVyhEl7RuS1lJn88SJY3DA3ZL53SL14ImxqxLoCwaPZ6pYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEyuKG0+mwHjFYy6zjyhGY0ciT1mAfSTRNm6a8Y6KV445Rg6Tg
	aYkQc3/KB+ZFp8nB2hmVOR7BKvQyJkpCskgfpB0W2maqtgo9Ja0abujkPQltskNHAFhMN04vfQh
	4f3GA0r1E0QfJ+zKXRrpp5mtFoi0i/ZQlPPkc2LGA7ezK7wm0u4KX3g5viX8=
X-Google-Smtp-Source: AGHT+IGWrdfRPv6vUBq5+VE7qbsc40CR8IzZ0G5xPaE8pPhS5TDXjN/61aMhnCxyqJP9ZVTIdlS81r9qqFALVpj5KW+OAiUWrQOT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aa8:b0:3dd:d189:6511 with SMTP id
 e9e14a558f8ab-3ddf43010a1mr94787295ab.21.1749740343737; Thu, 12 Jun 2025
 07:59:03 -0700 (PDT)
Date: Thu, 12 Jun 2025 07:59:03 -0700
In-Reply-To: <tencent_AF9E831B6F4B5F1B1A251EBA5ABBBA33E808@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684aeb37.a00a0220.e7731.0037.GAE@google.com>
Subject: Re: [syzbot] [overlayfs?] WARNING in ovl_listxattr
From: syzbot <syzbot+4125590f2a9f5b3cdf43@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+4125590f2a9f5b3cdf43@syzkaller.appspotmail.com
Tested-by: syzbot+4125590f2a9f5b3cdf43@syzkaller.appspotmail.com

Tested on:

commit:         2c4a1f3f Merge tag 'bpf-fixes' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12b4ed70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=162faeb2d1eaefb4
dashboard link: https://syzkaller.appspot.com/bug?extid=4125590f2a9f5b3cdf43
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1524ed70580000

Note: testing is done by a robot and is best-effort only.
