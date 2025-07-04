Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C03428505A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615586; cv=none; b=b9nnmHIyr212cp8+GbCsC5bFge6KpDZslpArgmobt0gLdvBFGo96rsED0ONnlSZAMkIuY2tqAikEkVuxB+meEKy67HHse0sFARxOHr2+k5XjaDsFr59gnbWELxoiBQxU2m7bQctkyLfv5jPP69lOovS2AH9uA+1DGyN1EXjwyHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615586; c=relaxed/simple;
	bh=JHWUHfMADvDEW/OTCDRqZ2+rdarV4Lfm6FG1PoP7wC0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=apX9tAkEfmpch/4laZTSHHQWMNlkwY9TGHcFQSJ7RPqqm0qKFLFsRGBHxBNcQRMuShkjXceADjLxo1cQRS22la51XOmY3BCSbOW6jWjxXsbE0RrHbgcfESSR3bj2qc0TZM4oBxUtsG1loBis7ItnX8bXPwgIkYdf7HfM38km9hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86d07944f29so142312739f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751615583; x=1752220383;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nJKTIVy0ur/oD3TT1kWqw6+4I0OMiQeU6eeRibbTcPI=;
        b=B6/woW2JbVNXDXo7iAw+PUGg0Z+8c83fC9TsZkmHnmkdMvdlh/7RmqFInwXfA5OCOU
         mGbugCCIgcPnbBL7mrgrNuUlsUFz/+hPAUq6GjKs6fWu1EqYpbAnlmUDZ/S48T0lffKd
         W4k6J+hneI6dqyewJYCPe826nroDwryusWNkrK13hBMt1NqqP9IU4Le3Z0GbB3ZbxNFI
         BKWhVXjngQrqL+2t9cbIMbgWEoD1f9UWBhZ0NBGTEkPwvQ5ORE7ZgQDkclNr3RJZPqbV
         ISUI1sphvECY3Mw2/t7OhNrvAdVvVP9QXS7WACOmxkKm7tP+nCoEx4gThctCR4EE9O0x
         sLSA==
X-Forwarded-Encrypted: i=1; AJvYcCWrDGUlJLsMmWnLXSdf0wiKjLxT3SAbdT1/aF3I791thuH9rHMeDHaSxLgaYXaQdQ3PY3Fu+FlooThXsBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCBA5Oi89xNmfgCId7HO58BsfjyvVoZ4arX2JuUEesrIwDGcyA
	bsfRgGEjFNcXKd38Spyv65Wz702z38MLREum7kAsBvNxGKdHX4fzb+/dj2bVHKtnL6kI+0vErjD
	j+do6UX2jOG406zFX1QFYh8HT7Md63KXv9yhjNk0sO68P0RHTtjCi/ilo8Xs=
X-Google-Smtp-Source: AGHT+IHXq6nZfJvWlc8fKncPdE4K0AoMkqJQ2V5SCexE8JJmpkmcp+GUf11fmYmJz1KrluQpXcUtJqYqMcC8dq1NCDl8Pop4LNbF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca47:0:b0:3df:347f:ff3e with SMTP id
 e9e14a558f8ab-3e136f1fd9fmr10229365ab.7.1751615583658; Fri, 04 Jul 2025
 00:53:03 -0700 (PDT)
Date: Fri, 04 Jul 2025 00:53:03 -0700
In-Reply-To: <20250704072511.2387-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6867885f.a00a0220.c7b3.0018.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in qdisc_tree_reduce_backlog
From: syzbot <syzbot+1261670bbdefc5485a06@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1261670bbdefc5485a06@syzkaller.appspotmail.com
Tested-by: syzbot+1261670bbdefc5485a06@syzkaller.appspotmail.com

Tested on:

commit:         17bbde2e Merge tag 'net-6.16-rc5' of git://git.kernel...
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=1691ac8c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a6dba31fc9bb876c
dashboard link: https://syzkaller.appspot.com/bug?extid=1261670bbdefc5485a06
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=145eac8c580000

Note: testing is done by a robot and is best-effort only.
