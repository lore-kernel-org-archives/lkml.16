Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D7D2D77FF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535488; cv=none; b=UF8Eo9cfv/N74Hmwp9WdYHC4ZMs/k9Q6WG+/yIFNhMofhLyp+bM5trV80fvJ/qzma+s7NeusCoILiAy5BofWq0p0w2Crc1NuCPlVacJSWjhKrFMATCIcgVnsbK2qvJVv+d759JXar4oMJL66FZ6avQuJy9vtahhYpXE8YG3uX0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535488; c=relaxed/simple;
	bh=j0kHbGX/BbO2qGlKZQ3PP/Mb3tcTHQGxbuPFI3cbr+k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eGmsod2wSc8DDlFK6TPlI97mGlB7H7DxWxi98BSgiXqRSqJVIsfWZmfk2ZBsBBg+wbVa05v25RgfbZLL9llaVtnJllDcp2DoY/4GCkngDTzmxaIux2pAdJIr3L+pLRg5/8jfH9HRH19qL4InGBpNz1wOD952DlVyqBuzR5bDw24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86cfea700daso458096139f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751535486; x=1752140286;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLWF3XL1WFoc/ceE84KQzD8W4nX1um+AWtJuwHJWiOM=;
        b=plTMmOxynqIXXoFgGrJL6bgCxtIfjU14CKJ3pPUCmF1AHLl5GGJ2DnIzVzKi+VSqXe
         sF5/TiOWpje3GWWMw4sms4ugCosxX9ptMYpLO2J1kYoShHdC3z+tIJytNdPpK43xX2U6
         HSPwdqOyvjtY5idIGLCUfCjXeUScK4n8N8tisMD11NKCPuH/lYA4SztOLVY0uxTPM7ap
         NX7xShhkXMd2pWBAxuzlf9T+diba99wap2lj4yK1GToG+d6dOzd2I174RDkpaqCBHR/V
         CryiMXGfPqZbmAbM3a0P9qArAXkHD96W52LIMOlYAbX2fMA2Hd9pb46g0IQcV534VwD7
         4bVg==
X-Gm-Message-State: AOJu0YxHuN88k8254f4nti2/SOlhrMIjm6dVadYB63YyQUh79ek3SGRB
	8wZn6wEFJxdlv3Y6cpmB4FYFAf2Uny9YzK89ZviFXuzuwk6p4wu4lke46EPpnfN6Fgk0GY899Jz
	O/Q9xGFH67cvRgrOocUjk1JevItB3agFTHic0CMLNEEqiQBgOAJOWGJFRoug=
X-Google-Smtp-Source: AGHT+IHW0nK5K+tKIqlc5Rb9qYOLr9DlE0iYPzss1uUqUqc4i7Z51HnbtleF1XheoqmeR+vkO1c0WMcOwwlTucqKBrVWOQSfbiWS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4147:b0:864:4b3a:9e3a with SMTP id
 ca18e2360f4ac-876c6aa2ad1mr778498139f.13.1751535485813; Thu, 03 Jul 2025
 02:38:05 -0700 (PDT)
Date: Thu, 03 Jul 2025 02:38:05 -0700
In-Reply-To: <20250703025955.GJ1880847@ZenIV>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68664f7d.a70a0220.2b31f5.0018.GAE@google.com>
Subject: Re: [syzbot] [nfs?] [net?] possible deadlock in rpc_close_pipes
From: syzbot <syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com
Tested-by: syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com

Tested on:

commit:         350db61f rpc_create_client_dir(): return 0 or -E...
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.rpc_pipe
console output: https://syzkaller.appspot.com/x/log.txt?x=15970c8c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=af650e21e0ca5e40
dashboard link: https://syzkaller.appspot.com/bug?extid=169de184e9defe7fe709
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
