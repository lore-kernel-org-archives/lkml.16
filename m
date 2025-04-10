Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F85928D83E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744312264; cv=none; b=Bm8FHO/ETE4QMIGBkcO+yS1qxq7bMquhVpECC6IjX3Aa4bslRCexHlFiPYJVqHP+trbVVk4cv8s5R0ivq5YjakTRteNCey3HAUMe8DL8V1DCY0FeMh4YhkC/ot05mCuJfm/eNV80hg4tdTt1Tldi0NaaI3tRm03gihUIDGmbwzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744312264; c=relaxed/simple;
	bh=EWpdz/aVgmHNDbzN2xefKWQQHuZBsrNOdSfU0XUs3Lg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PMS6HU7nbhLPNcg38n9lDQA539557N4fiJpZW5NQPrTKngl4Jx9K6TRZ4sDExacaLR2Mv0g3VuqP0BhdvDbSjTOaJKVM97ReuPrVGnxm8GpYYy822TmzRL+Iol/wFJHZdJwRDJjBMYmGaDmr63qUi/48cbGWKSbbLs48NOlXPTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85e310ba2f9so107868239f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744312262; x=1744917062;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2oJJgcOlH9GfwjvuQdeqT6sZ0Uu/6XvXhuFlJmM7Lo=;
        b=J8hQEu7HizuvGCfjSOv1EFH7ePz3WHBkwr6qfyTEnO2/YtWZ9u99FeeHBi/MI8ArXY
         pjG0AaGh4uB2Yda2SC8fbCY2fJGLkyy3uBMcth4u2RlRJ5fczb4XebKbOKs0xaZJbtuV
         royoAvGPeZZgZz7DdNOPJ4rODxGs79mc2EaLbzDNCAgR2zKIE2k33I+ZzJSnxJKVDfnA
         f7oEFiEwvfPlTDc7fuQVY0F6ixuzRqSsI27UBJlM99lWMwmie2vlnGSBD2//grZKx3i9
         K94TvgBaFY5sTMQApe3NkNvvDRvAqPX0HvAk4QDK/ZZno+K2jdKZsOovK/6hoVj+qrCS
         EkWg==
X-Gm-Message-State: AOJu0Yyp1n4SeBinQrDdoUhGl70AMtT9CQhSrmYK/QRBOHedtdfrijYT
	ZjJKPteOAia0WJREGyvsXODhM9BWzNGSlvFsUlOYi6UxLVOYF3sdmE15uee37NJsNvYMDRf6sjZ
	Z+JzZLSX1zc+tWlru5emoVCJOJ0808nu7jmOaV9rSJXAK6NIEF/gw8NU=
X-Google-Smtp-Source: AGHT+IFHQfOfX2z4IjLJ5rxM7txwZEmckVQ3iTRVV7N77M7Gq9jxmzq4tE6z4WXrOou9khAGm4H1JZDv7kiI90ELsuqPvJVP9Svu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c24e:0:b0:3d4:6f37:3724 with SMTP id
 e9e14a558f8ab-3d7ec265583mr261335ab.18.1744312262380; Thu, 10 Apr 2025
 12:11:02 -0700 (PDT)
Date: Thu, 10 Apr 2025 12:11:02 -0700
In-Reply-To: <20250410142307.164379-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f817c6.050a0220.355867.000c.GAE@google.com>
Subject: Re: [syzbot] [acpi?] KASAN: slab-use-after-free Read in software_node_notify_remove
From: syzbot <syzbot+2ff22910687ee0dfd48e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         ab59a860 Merge tag 'net-6.15-rc2' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=118af070580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eecd7902e39d7933
dashboard link: https://syzkaller.appspot.com/bug?extid=2ff22910687ee0dfd48e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16ea874c580000

