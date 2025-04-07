Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C97382D91
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013585; cv=none; b=mA/o7Yn892Liq1Ob9V4tpJ26vFN4m89m+0hhGmqUsUQC0tUSoGFGcMcFV2fDINYpH1wLWUpbAXU+254VwNqKFYrjo0fM7KUSzTqmxaL/syhmpzJgses5RCpAGu6mymZeQDISnHC+fuhvkCkDIOsLS+dxS10Ozjj/fUJku+dM8Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013585; c=relaxed/simple;
	bh=q0gccAoDn/97jLK80bGmGnGBpb61IglwFSzH77KNYTQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WiJ2piAVrGNuqd1HPjYXtNRU/n/ODTLCz+c7K96AogoEXNmhrvJTktYjYZx88z/JYOAAR97nab1Tk5Unjj5ulQ5GsxGExZZqX2sR99FBYL1KdMulrrnov1iNxYmxHykueb/IDxwjaTrZy1FrT/BO6lNVAKnxo+EKswXvkD6BWbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d6e10f8747so31315265ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013583; x=1744618383;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ChzbHSI+62rwdyKegLaasRCQDyxCws+/K6BLPNTrOAU=;
        b=tS9guIaGnI/Ju+F8yFcwETe47S9rR61AFG5ulzR+0+Dg0/OoOm2nakBdOHgLSER4kw
         YgzB77rJIoBzMPG89nuHPNjF+yrfQaVC/kgwBJaPe1AFx0+8Uk1UoIRzMZALOEuNSoTn
         0hDb0XSLunkCBPo5Lx/NpXcHBZfmqZJ1s8jO59Seaf2yJPWLdTg+Xo5hLZGmN3YQDzzS
         bBQ1xfI+MJg3VS5KGm2VqNI9O35FhvbM673aJpQsSRYu5n+0LvhJZGEqq5IS1ZV6BmFP
         nJPT87D30bH6tCHRpHYFnGHJ1DYsB1rWKUBKPNJvOilrHJdV/2oiwL4S5Ymr3XREjFJ0
         XSfw==
X-Forwarded-Encrypted: i=1; AJvYcCXb4JhpfikpiM+jT2GKDnJWal+aRv5UC2tBaOyqu1KswMm/ivxgVKSEioC72nUljhgy08Qg/Xzv+bIgObo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwskjCw4oUYQegfmkT8qlYTpWsEW+NX3jx8HePkKvE+doVzRtu0
	FC0E1o7bqlYvLdD+2eh2bxP/SjtmVVSPj58qK3KUzxQ5Qd4xtAtG6FTfJHuW9/GoDug5qXF/Lvn
	Ms2rGinp2A9mDX4QCvrttKcPow8JpN11E1EHCQu6yzmeQltcxM6Iympw=
X-Google-Smtp-Source: AGHT+IHUGP7Xfr2iz2CIUvQ3ZQXT5qHk/M6C30TwlTFdSNUg2q++UOUJ1xNkhfknaV+YPus3Bqy0cUX2W5DsqhJIaD+h71kXJnXE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:190b:b0:3d5:894b:dfc7 with SMTP id
 e9e14a558f8ab-3d6e5876fe2mr99720945ab.16.1744013583420; Mon, 07 Apr 2025
 01:13:03 -0700 (PDT)
Date: Mon, 07 Apr 2025 01:13:03 -0700
In-Reply-To: <20250407063703.20757-1-kuniyu@amazon.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f3890f.050a0220.0a13.0286.GAE@google.com>
Subject: Re: [syzbot] [net?] WARNING: bad unlock balance in do_setlink
From: syzbot <syzbot+45016fe295243a7882d3@syzkaller.appspotmail.com>
To: andrew@lunn.ch, davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, kuniyu@amazon.com, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, sdf@fomichev.me, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         61f96e68 Merge tag 'net-6.15-rc1' of git://git.kernel...
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=111c523f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f2054704dd53fb80
dashboard link: https://syzkaller.appspot.com/bug?extid=45016fe295243a7882d3
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12f3bd98580000

