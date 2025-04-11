Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025A425A64C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744395965; cv=none; b=Q76BCzsDOV7jLdTgvjEK/yYZxQKgR4l5e9OS0HfFVOm15kUiZZb+ypUuHbzlgmRot1o/YuxGILnZSWwVQMp36QiwkCX6Ez0GqZ5Xk5746SLNQ6jdDl3yU8hvzuUGCkCaFcKaIRyk7uG/dD+O6fSkb3kLpFkMGM9X6Li/gY7uz2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744395965; c=relaxed/simple;
	bh=FbuPgtFhOayFXRCeRx4jaZPr2zr7ESJ0SMJ61nHuDP0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=meoNbDB5CpUbMTFG8kPUP6hSjYVxVoOEQjGTQqfy0ZbWHzhJFxSKyu2DcQ8RB9hOE7O2Kf35fBC+Ti4JzBC+jVsSzhN7zS6nLvcVQXp4+t2sM39EgcVG/jMPB0ZyZX001ONfAAE+BGWXuwj40n1FVQQy3wlCOs5jiuGtrylW+yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d44ba1c2b5so22504795ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744395963; x=1745000763;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oep1B6SY2KQszl07sbFPKf10Dwezvq6DfuJGojLWC/Q=;
        b=Vf8cP/0FEIXbrbPPDOFdEjJH2tLefJWXhXyNwWRk5Y/6g9kueCrHjl79++H26RR1KN
         tvyRieh+qLOLwOkOxscmD/sDQVERi0v/YV1EMfPM1jOidHXC33gi6qIrIm+rQ1ccw+uX
         H81zcdUIVN4hzK9CmOVXdh6s+bpYoJXgXuW1QQBdz3Q2nJzQG/lJ3DZwALJc3FF3+Tin
         I7hlQtOqMW+UIX/xlK0XXW9XhCs4aFVOZ6I9qfeloMAeyBH9+hUN+5vFqvWZfPtSe6lN
         D9LKKjEklFQ4H/mTLXYkhXptQUSE7JJSWCgUzAXexS92ufN1nwc5ectMkgG4IWkwFd08
         Wdmw==
X-Forwarded-Encrypted: i=1; AJvYcCVNBDMeWH0To/QWVGbPWJ+lOuRoNQWxS9L16IRlHQVDK891wFEBW7bkeQbfnHYyZKkX4RMRdtmGZJOuGU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkZ7c3E1zUgND8lj+m/q1h7JxsLu/bXTeVnpAjiVoZq/q7EFJh
	Zl177NBK0hwLlw9shCmrDReeZN0TMz0Ydz2FIwuLY3Jis84FRi4nFhEIEIOaqcCUxQDaaiL6Gr4
	L9SH2FIeZCfXCLqGmIM83l+8EQnmP+6nwkXZaj+E9uTEKKsi3XkTBeJc=
X-Google-Smtp-Source: AGHT+IEF8NVjcw48tJ2IzsNR2+B21DrKyj5N3+MwQw+yUyD3QPh0wu7ffoDgBXqWyuUk2peJinJNkjCNdJMxdaiJbpaISygUlD6M
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1521:b0:3cf:bc71:94f5 with SMTP id
 e9e14a558f8ab-3d7ec27b01amr48319985ab.22.1744395963111; Fri, 11 Apr 2025
 11:26:03 -0700 (PDT)
Date: Fri, 11 Apr 2025 11:26:03 -0700
In-Reply-To: <CAP01T74p7xy9riqMYiaZ563p0xd=QUWyPseHkNe_037wAdnu3Q@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f95ebb.050a0220.2c5fcf.0007.GAE@google.com>
Subject: Re: [syzbot] [bpf?] possible deadlock in __bpf_ringbuf_reserve
From: syzbot <syzbot+850aaf14624dc0c6d366@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, kernel-team@meta.com, kkd@meta.com, 
	linux-kernel@vger.kernel.org, martin.lau@kernel.org, memxor@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         a650d389 bpf: Convert ringbuf map to rqspinlock
git tree:       bpf
console output: https://syzkaller.appspot.com/x/log.txt?x=17928870580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea2b297a0891c87e
dashboard link: https://syzkaller.appspot.com/bug?extid=850aaf14624dc0c6d366
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
