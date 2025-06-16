Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AE02BF016
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097408; cv=none; b=CVu7mZENK8d7VwMQp2DRwMhsqnC9ItWz3s1gYK31Og2Qv6RitBWYOvLeGFx54oUjQaofSUOG+HG1/gN3luwLuhoD8sYFe15t0wot6i3iVyJsNjcrnEQ1FhQE2fRYYbJ52VERkC4D710k5deer7bQPd/T2V2n2pcYszidx6LgqQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097408; c=relaxed/simple;
	bh=f3SR+c7V00e/776lUDhQaIpBjgbmR4CMGjTGNyIzOAM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=M3Hins7ppE3doAdPIKoNFrxFaBXti4PMubN9nQc0Dqhcp1Ef9Xtv4azMYZCwTZCXax+mpxYVfIH7Sk0kJJgo6Dn2QQJfmiLtTbw2jWa2FQ4kcQzoWTT5WRHx5sTJl/yrgqICPCKuXcZjvKYi1YEPYTEjSJBzOta1dC4AV9/Yldc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86463467dddso518548539f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750097406; x=1750702206;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQCx4IC5gpDB58blS838hR8n4LTlblpZhOuxvsbvlUY=;
        b=hRRzQnBWGY57Kvd5krWhtGy4bpZwCZ/wELinWmsHdZpyRXIyENEzXXeY5RU9adlyNo
         W5d4Loo25wVa/QgyvJqCVtVq8ZXQkT7tg+/2ekwrTbw0wMrcFPoon2rhZUdGOOGqDkYS
         A9bxQlgyjyAJ9Ten1S/uJjBProF29H9jeaNyuRf1a1G9YVgmyA5Hc33UuCxTkKbDzx6G
         g6sQxhPJ3eXYeid3lYXit2dATht7NJquCVkCbrexRTnq+VaZPQL+0YfezPybxcQZG6bc
         vlpThGNZE1J4XLYR4mZTpJlaiNxtLaD365Cvh0BRxjLqWHDJ61gf7i6bFY4mru3B8SXF
         GZXg==
X-Forwarded-Encrypted: i=1; AJvYcCV4H5VVvXigfkprFOGcqqbbd3601m15BKcgqKRj4+xuIGP4tyoSM3+oztoRdfYwqsT2+DWJr44RDlGMaSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx/rHVKy46cPQhOn0wtotPklsyXkRCQ47K/MGS20OcpbQFKdkx
	1WEELFcyG+4ynbD1fe3pZgXlp/JfLGDKWlPERTGdmHiDSyJWY4Alz8TlT+Td3aiBaP06GL+94Qe
	XTPQQLerOPRAkmKOpAa32NJcJT10q7OpwYSv7aEkghubHJdMnfgWxOgtfe0w=
X-Google-Smtp-Source: AGHT+IEC/QG92AyqVE5oYs+tTrPUmhAowJMr/2Fl304s8I259Fe1ytHhEl7ZOGobkY4bmTLj5CgMe7bWLr+v9UHvi9Ql1O3N9C8E
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154b:b0:3dd:a13c:b663 with SMTP id
 e9e14a558f8ab-3de07cc2086mr101236865ab.14.1750097405840; Mon, 16 Jun 2025
 11:10:05 -0700 (PDT)
Date: Mon, 16 Jun 2025 11:10:05 -0700
In-Reply-To: <d8f04f74-283e-4acf-9e42-94fc0a047228@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68505dfd.050a0220.2608ac.0008.GAE@google.com>
Subject: Re: [syzbot] [usb?] stack segment fault in __usb_hcd_giveback_urb
From: syzbot <syzbot+9a4aec827829942045ff@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9a4aec827829942045ff@syzkaller.appspotmail.com
Tested-by: syzbot+9a4aec827829942045ff@syzkaller.appspotmail.com

Tested on:

commit:         44a5ab7a Merge tag 'powerpc-6.16-3' of git://git.kerne..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=11a48370580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8f72e140c622500d
dashboard link: https://syzkaller.appspot.com/bug?extid=9a4aec827829942045ff
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=175515d4580000

Note: testing is done by a robot and is best-effort only.
