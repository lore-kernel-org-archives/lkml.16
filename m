Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A112F852
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751003044; cv=none; b=DrNeHDS9Sc7quUhZfwPgiIAjx5c/hLLb74mU6Li23zSTPlEbImlHGwlvWEZkryDqYHAZofUvaaw1nlMLydU4FvxsmHdiW7kmBTi8VlufJpa3yLrLovTqSWv0gs7Z0ksoawd9NY2sOWyaqSHMKK05c+xeXcvPTvdAYSi5bon+bh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751003044; c=relaxed/simple;
	bh=soSTAGmaFQ30rdWSI32v3PHsN9vFxhd0C7khwWjTrWk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fFtKTKv/AhWee/UEzt5HS8TGWLlkJNeKFr8atR8vGEH62GWO+1D9dvx2fkPEWsqyXknIbAWQK1YNyjJsfckmV8J59QYwWE/rPRuhVh4v2BemHqpYrBuLE8FcWrRoGgkQgoofSlMZGYq7wHuL5999mUUHEA/2wxPfvDUrKoWkt9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddafe52d04so44412385ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751003042; x=1751607842;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Pd432zo7LFGK6KOyiXTXMOvwX3eozzXxwAFL1DPThI=;
        b=w6gUfwX4pvdTHEr9XE1STjjO81IPs+aG4DJUX8nYJOMRO0fkRc9gHD7E8iLPTTwOHk
         MtYGVbDEq4NGZSfAwFNYVoI0TrlqcS4GO4mjt1y5t2wZxs6eTPz9+HxPRAC1O0jZqRqv
         OSUvhTZB/jJbynJ09Z3Tl2rW5yp8BV42YoWG3qK8CzMTM3LswMDkJoYsZhNFMhQE6q7T
         YMqyvFBBedFmTAulyrGK14D0lSZQDrHpW2uZYW06+2bOOsadGndcmSkDq2YvmcmR8o/R
         iDgucK9b9jQMROOkcjimT0l7Q93hDekb1lT48pR0ARIEqGpHMDYjhs3EyEGkgKLyyYl7
         lf/Q==
X-Gm-Message-State: AOJu0YxPDeu70GgW0pf0Wwvf98J1Po5Zjgv8D61dvaI1b9Qc5hkfhqbD
	Enl1HDtGQBtVu9pwNkq5DW+jlve5Nxu1PA3lDLVU0whIKh3z+UnfBDLOjghjXnHvRpwYjozQLDY
	ODajcYS+PDt7+ZHTgA57be/E1JRgiuWWlw9lGSzm0mLl8CL0rzRFHL4Vjj9E=
X-Google-Smtp-Source: AGHT+IHVpClRtlO3j1SYzj+w0FS7Z69fNeAIKojFmVrL8DN54Qr0A+mFUE6fB0bTOnj/NargK9mVhJOPLJXKzrLRHsIad62GHlLS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:194d:b0:3dd:c40d:787e with SMTP id
 e9e14a558f8ab-3df4ab56738mr27583995ab.2.1751003041875; Thu, 26 Jun 2025
 22:44:01 -0700 (PDT)
Date: Thu, 26 Jun 2025 22:44:01 -0700
In-Reply-To: <20250627051303.2837086-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685e2fa1.a00a0220.34b642.0154.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl
 (3)
From: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com
Tested-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com

Tested on:

commit:         67a99386 Merge tag 'v6.16-p6' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=134d3b70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=595d344ff0b23ac5
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=134a808c580000

Note: testing is done by a robot and is best-effort only.
