Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDA534545
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744376528; cv=none; b=ezZbo3FQwvXIIaPSl93o0xT8f4rWBTbe0GXopmSLmYFxYylkBasoRVRjRP82WODgjoZKkso43bGpY1TTp+CiO0C/aJMe7uYBBi8g93nbBfNoghV/8bp2yDseDdfBQULt8zK5DgTktOWZox7MexYMd4SI/E9UvpEG0OhZ0278t+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744376528; c=relaxed/simple;
	bh=q0ktaoaDFvCnhT8anD6UAHX3u0hejnaPZ9SU8ZTCA2s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LnVXMy/uIZ/vAUxSpUj3DV4YbB/UBTFq6JOCsUtAbH/Y5UkOt3csQVshnywrMnqG7ugxaFTDcgokiX0hkEyvEWYZWHbl/DgGb2uP/jk8EjmADqHQ0XLVMvrKqkOEhxpH9eTvzXPTuNraN1uqDe3tz4IRmLAS4Ny/aUhlvkwiUA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b4ee2e69bso207933239f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744376526; x=1744981326;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ES0qvpuGg2cUHqOyyFOG0tDU3c8M/QhTsXlrkaqbnm8=;
        b=cqvtsnicsYMwxPvE9VaDQbmSa6jwKrM4SpJyu/uxuH+EalOEVpXmosHdGgGDmgm61g
         s3+4T9CdLVRWL2Pi4lWj07JcHjnaVTu67BLGbd26HAwgBhkLDOZS107KVkmdA7u4GqCp
         4SaNGUj/rW30fPIqi7t7zqbPYppmafP7N0jTEAM+A/zAslWk2DrnRuZcTwLiUiBHLG8V
         m5RJ8xVCNMwYLCtoHrkNfOAlHIeFSxOh48OkoOGdnxaJXtVmIGO7C7U48WPIWjgCySfN
         dxr0Pcq/FAqKZrxwQjaJaNsZeT0KuYQpXLe0hCSJ8soImpo+pxbMepZae8YLMsCon72L
         a9XA==
X-Gm-Message-State: AOJu0YwOVfoXeHk8l//REW+SP3wiAXQWcDIR7m95RCWv7+lPnf/dlnVv
	iKbIzAvpQTkUyR74rPHyievWb3xYaMtKlYt10Uq+A3vIqiB96xwQFEEanIRJ+Rc6HMRK2Q0l3bN
	8YmQs2xeRCPjMMITno45151UZXgrK9Po9bisqQwnDNLEfJSl6J4o9oWI=
X-Google-Smtp-Source: AGHT+IHd1EFFFT7aiMJ7XWTfpCd5gMma1QE5b/MCd4DO8nrON7ThMibyIXCzwKPSZBoONL65gMgELxp1SDC6S4762vWUNsWGMJCf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b28:b0:3d4:3fbf:967d with SMTP id
 e9e14a558f8ab-3d7ec20234fmr27045495ab.7.1744376526106; Fri, 11 Apr 2025
 06:02:06 -0700 (PDT)
Date: Fri, 11 Apr 2025 06:02:06 -0700
In-Reply-To: <Z_kH11FV3JNCmZtf@qasdev.system>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f912ce.050a0220.355867.0024.GAE@google.com>
Subject: Re: [syzbot] [usb?] KMSAN: uninit-value in mii_nway_restart (2)
From: syzbot <syzbot+3361c2d6f78a3e0892f9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, qasdev00@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+3361c2d6f78a3e0892f9@syzkaller.appspotmail.com
Tested-by: syzbot+3361c2d6f78a3e0892f9@syzkaller.appspotmail.com

Tested on:

commit:         900241a5 Merge tag 'drm-fixes-2025-04-11-1' of https:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14eb0870580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=177241b654f7f3de
dashboard link: https://syzkaller.appspot.com/bug?extid=3361c2d6f78a3e0892f9
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11001c04580000

Note: testing is done by a robot and is best-effort only.
