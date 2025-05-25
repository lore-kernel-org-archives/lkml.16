Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFDB4C6D
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748136246; cv=none; b=MU90rz8V1KD5BtMzZk5jqJ3giWH4METfOCxXbTJhNcFVp/K5qvJ/oXycXKh/7qw5l26EJWxQRgPhnhA+dntdb6EyQCS6reLVEglDyKmo0D46cZFN9jv9Yc9NPVPgy5FPjKRBnzVsfUdWZvkpvSaHQyroA4UQB+msfYSVy5Jj88s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748136246; c=relaxed/simple;
	bh=onG8VeFQ8AV/wbstrcxgKfHBkTeEkdb6S3+pTmHdi48=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=a50C5RCYyp0GaQWBd1H3948yzUgkrX+7x8y1cFdUCZOWqyc+hhqhav/cJIdTT1qWtlLsKYTaYXMWoO3te/cCGq052plDEDMwmf4tcf9KP7Vfk5rQstcH64DY7OVs7uPJcRURBIY2AMYF3yJY+sNpoVn/Kbhsd8nRw7qFLlIoRec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86a3d964d9fso182825439f.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 18:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748136244; x=1748741044;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4425zsg7qisYpGq2AV1Mzzgb+/DjgOgWDwAfBXmv3QU=;
        b=eHxbj+0zzkej4ayDuxS1NsW9UYqsa1HKqR9zvxgxo/JDqSki9ZY8U/ZDCylOO8T4ZH
         YJuXV6hZnKUxxn/zwMsJ13k36eQSnszBrvmD6znsxEU5LObCCMifbGgONhw59R8vwpaS
         aRFUIqCnVUagg/L3efgw3SVmi54TK8brzN7/h5ecnwTmwWInscjbdx2HFN4Bl9w3ActU
         ToKSRU5jb4Y8UrsNB9wt3jJnil40PTsDXTlH/QzA0OdhjPmpM6sk9AauDtXn+ZxOcc3N
         3aCwQBeuiev4yiC0c6ngSmenM/oMfAeT5dYQSMdc4dsGzUnIOuPNATRq0RijR+Q+l1By
         cFKg==
X-Forwarded-Encrypted: i=1; AJvYcCXUjmLhWkVJjfg41BLoAm5dNWuIbR7w1NitIZJF6l9Il0ccwp16+8vRXsgAgvApEHWulYDeeoUQd1GMk14=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTmkL+nlgOD2EcMoUjea06rAdw+HcTtV0XFmGQuQqjBIOVfM1Z
	PQx0WxbXqfYkOGmCeiGwjozV8oo4INHp9Jbv4Sf02m4VCVrt6/lQpTRpaaT1qolgYdEf0L7ryc3
	8I+NKaKPQ0umog93TZsF40o/A12ujsB1UhQSHu4J1Ax5js5gC2QF+4+gYthI=
X-Google-Smtp-Source: AGHT+IHZtGHNcyHqaQOgU8UUiK1DQzVBwD2cTq9zmRklzCK/JsjdfqqiEFZA1ZsdDoj6RisU173YjoWhs03aqLGvQupjLEOuRaMl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4899:b0:867:93c:b77c with SMTP id
 ca18e2360f4ac-86cbb6c2322mr446743839f.5.1748136243808; Sat, 24 May 2025
 18:24:03 -0700 (PDT)
Date: Sat, 24 May 2025 18:24:03 -0700
In-Reply-To: <20250525010238.2312-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68327133.a70a0220.253bc2.007d.GAE@google.com>
Subject: Re: [syzbot] [fs?] possible deadlock in input_inject_event
From: syzbot <syzbot+79c403850e6816dc39cf@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+79c403850e6816dc39cf@syzkaller.appspotmail.com
Tested-by: syzbot+79c403850e6816dc39cf@syzkaller.appspotmail.com

Tested on:

commit:         b1427432 Merge tag 'iommu-fixes-v6.15-rc7' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10ff6170580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9fd1c9848687d742
dashboard link: https://syzkaller.appspot.com/bug?extid=79c403850e6816dc39cf
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=178f6170580000

Note: testing is done by a robot and is best-effort only.
