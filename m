Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394C9653
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 00:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739062263; cv=none; b=qvsu3yHo82Clq5u2bdzNSsicGqSkXAX4Nzix4W5K1aYRkQEX9h/jK6CGowy6Kh6Y7ExJj3eBcBRzUlk0CwqApq19Dy4ohCr04LmlwwWkOThtI8puk8YamanoFGoBMCWdWdeVPhszwK9XnHEd2qclKpafok5pAbHTTk+St/QJGyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739062263; c=relaxed/simple;
	bh=WK84HB6/OSqYDfgF36wHE35JV26Uiu6yBF8sMhH8yjE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rsR0SjDUPWtNVJHhCqpH3YBm+vBBo9w/BwSj/Q3OpY5iRGZdr5jL50Vdf743F98yReUxQXswOIUPgDj6+405MogVT33pRxkAK05in+2uVSfquWe6SytycLIHt71BD9/zMZ5R4D3RWYhJ/u/ClIANfb7Mwlcx3d1igGyT23t2+VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d058142573so27093545ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 16:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739062261; x=1739667061;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LeuJzDrnvf0AYvwTbHytyc5iAEmYIUdS3Zdm4oKb838=;
        b=VT3clISpeK1IOzw0c3IYncnId8pxSIeoxBxiPhQs03Lu/2Fuo3q0S2VRyzshgznb7k
         r1+maNYxpWVOKDOh2twm5BujWHDY0bqu9KDn/q4X3+b4GPbUM+FXWhum7q5PGEqYaBv2
         c23xedsusnXmX7b6GBzl2UiBGMzcBwRPDYhDlkRfmKz+fFEn0xI4GB6VcdJEp/+AOjNc
         ey6Xxwdg6u/+f3aVruMsCnsta9yTADa/8vWOa82eOaAcHRv200q6oqh8YUWefyxD6R8I
         /fDUm5qmu1uqgFDIuNcAC6q0LjXnWTischqWJs7Exib2h9lrdzr3WwChqyj5NR72kV8T
         IBmw==
X-Forwarded-Encrypted: i=1; AJvYcCU9RY0RU9g2kwabgiJddVvZ9S6Q4aQJxdzV1SkniCIBRUtA++G+5wuhhR7S0f8WofzRHb7lsl2RevShhI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdv0tLKkJdbC8VhNQoYquVtyUGtVpYSvdxfBGyyW0hZBj7Q+/l
	BQevI8NT4HOZ91bKv70G1h2VgdeZJuqooWoOKwIDuxf+aklnwuCzB0yZpLrq7CKuLcLxT/tJ9B1
	ZmwN0KRVEWkz5mlH9bxgSygAPzsUJ5SbaiqkiItuTrihbxFZsapAhKMs=
X-Google-Smtp-Source: AGHT+IEfVj9thF++4lSEILBpzcANQeF93P9KNJitGleqZ0h6bQrpFVB72bo02c99LT1VwHu1MqDRh5RTNDdeGBNUZGMSzYJUmiNs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12ce:b0:3cf:c07d:e9a with SMTP id
 e9e14a558f8ab-3d05a58d185mr94562855ab.4.1739062261269; Sat, 08 Feb 2025
 16:51:01 -0800 (PST)
Date: Sat, 08 Feb 2025 16:51:01 -0800
In-Reply-To: <20250208234531.2110-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a7fbf5.050a0220.110943.0014.GAE@google.com>
Subject: Re: [syzbot] [hams?] possible deadlock in nr_remove_neigh (2)
From: syzbot <syzbot+8863ad36d31449b4dc17@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8863ad36d31449b4dc17@syzkaller.appspotmail.com
Tested-by: syzbot+8863ad36d31449b4dc17@syzkaller.appspotmail.com

Tested on:

commit:         9946eaf5 Merge tag 'hardening-v6.14-rc2' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=109902a4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a7ddf49cf33ba213
dashboard link: https://syzkaller.appspot.com/bug?extid=8863ad36d31449b4dc17
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12b32b18580000

Note: testing is done by a robot and is best-effort only.
