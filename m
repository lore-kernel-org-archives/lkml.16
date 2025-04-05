Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA821C68F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743855367; cv=none; b=V7sMlGRA95ctW7VQ6DprRSRc/uwEnEAcSMiizgUIuPxi2RYGxa0CYwPQYkCavu0LDmtk3IfbLvIcIHI0mM2CWnrRXk1q2t1uLzx+CkxULg+bWfG/wGUOr+Uer+jwgqSGUbrFRUscf+sgjmfPvc4TZcpWjr6nuewzfNUVBCykkeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743855367; c=relaxed/simple;
	bh=a7/X9gttkCKDI5arFrZ1PdrSoN/lb9GPLf1uAHawKK4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=unqSoLzAvvMR3XfNkESahNBoJEyHAyU8Z7ZCLYPnDIX5V4e6feKAsEj+CxXT1y7IAxz85EIdFoHRP9D/sIqXbv+ej7SyJEL57U5WSFOrZUyoOXl452KtTKWDIWTejxdqb+5EOyWG9RCBvcTEKSF0v0JeaJmuWRa9JcsYtTn9GEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b3827969dso268865839f.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 05:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743855365; x=1744460165;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xehwRcagEfTc71yOksGlO+aFdESq+qTaWVqIPUWtR2Y=;
        b=By1bR64y0ujxksJJm4t2lXswkoAHuHj5XCxERKUxdJU7XyTelT7b4WAXUBjKxMvWRS
         XbB/SFWoEeR3wpcWPD61f0vpYrYMxrrJ9n4zF7zOVQE+u4v2Hlad5EGXwlW0DJTEssJn
         9xNfM+rNhIH0zAzOvp00iK/VYH/1HZsrPOI2P0uwBgKVM9E41+58YkJvfnq5Ohp2+guj
         PZaVkVBQUIDLyvKVO5vXLCFprGbYGirwp0MLUnR0nRa2LnevstdoD6Xb4Eo0C+kEwk1P
         pR6QRPlbl1x7iHCa/+UdVlFjEuHc8MLmHpvRpfhnEJh/gjZZb5JL+dHH7cvI8dMvKlqv
         tVlA==
X-Forwarded-Encrypted: i=1; AJvYcCVyKaZ5sXcfC4hDPPNKAKb0+CXX6Cwk+alHOUgpJF71e72de0R2nK+fxHHFopV8fiDzmr52FA893m4S/30=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkCtrRFLUVsxfphFpTHHs+h0f48o3iqQVE88XVVn2MDRAoTLcq
	GXyZSCjF3cKwRVmgd5OdxKXKUAKaE76xWT0eJvZ3t+3DdfmYaztVXVn+9HqNDNmxbiBshb2KMYw
	sDyll7AZ7feYwrnypvaqavbvvQxguDxgJfArgvRUXfVJJLV3fjTzrUMM=
X-Google-Smtp-Source: AGHT+IEdgRvm/wfn3FlbtqQ/M2oHiJoSiWjs05S1sVSMZohCaDpw6uvvgJv8c5LT2y0PmE69nQIyiDIE3nqMYC1rcV0qlFlqhxaL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cd84:0:b0:3d4:414c:6073 with SMTP id
 e9e14a558f8ab-3d6ec53372dmr27413295ab.8.1743855365502; Sat, 05 Apr 2025
 05:16:05 -0700 (PDT)
Date: Sat, 05 Apr 2025 05:16:05 -0700
In-Reply-To: <20250405112138.3888-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f11f05.050a0220.0a13.0238.GAE@google.com>
Subject: Re: [syzbot] [net?] possible deadlock in ipv6_sock_ac_close (4)
From: syzbot <syzbot+be6f4b383534d88989f7@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         a8662bcd Merge tag 'v6.15-p3' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16ec9b4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f2054704dd53fb80
dashboard link: https://syzkaller.appspot.com/bug?extid=be6f4b383534d88989f7
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15e4efb0580000

