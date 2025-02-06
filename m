Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9132846BF
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841164; cv=none; b=QPR+v2x/s5B3C1HCzyzDpM39R4DbVNZV8Rpc6jzi0G8XSgw+I6dPwPMNAU8h4f+FNX635h/hXspPZhnV8/fqRjiLMIMrf69o/zXAaKedU69XuDiHNSt83IwvSJsP9LV/TbLRXtMQ0d5/+m0TpEXFycyYA2TVe5u3gxHfOViOiuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841164; c=relaxed/simple;
	bh=DJnpzmAexKfLvY0bRrpiDroNGWaogxgQcTHY6f9DaOY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=F14ugvyDADvvd0Q+45hvgCbzsxBwJzoGfEmfMlPkQBLCy2GBrO452RiesgB97FJf0iwfppT+9klPqUfG0Hi7Vp7RiHAcjDtYQWzYmrJIzsA35lC2f4b+oz1A7rPN91hcYoMEIat1f2ZGJhrVTltu+slBVoecq12x60IfhIXR3mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d060cfe752so1699225ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 03:26:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738841161; x=1739445961;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OBl/hXV9fEbR+eFXA+ZhQn920Ln2bytw0DZPAM8VJ4=;
        b=rFx+Ty9BqsfcWUc8fBa7yj34otWcLEHvP9rI3Hy+uLJaN/W4RXbMoT9GDj/eo+jSlO
         0tPKuyX97WOv2ZBaeZN1asF4rxpa8k9qqvCergR93BZg9mZYI6h29xh9Z+/AeUbD7yGG
         MG++9ovoGaNzZX0d45PknA4/XJxHR3VJQRxwXTQ2oud0TgKJ9ycClH1KidHsTAf6SkvZ
         N0qHJmp4arQ9iQfvYrCUr+YJ3ZIwQiuLgQHUTyAcXCcoc9QmiaEAM4njaGFA/f1EtuLJ
         cDTzvxnpORcTEXuowwlhHJHONxah9lHs/DyDXs0t37+MXAoAhqWsCeKnZ5hfKIhnEXN+
         GF+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrlyVhFPJNV2ffVs1PRsZ+Ze4kDx0uLmxNtvaclioMyn+cWrv6ComoGQc1cgZHeNs4OSxggHcgX3ZzYag=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRaRRFENlaVdd6ghhtBNZzLZopFKjRSsO7HPNwuuGvJF8mihVG
	w8oeZXkQJGmSGk4570mVMDtJnP5sAEltqVWZfbH6TvrATjkUUPHecN/tbdIcanW1Wi0nrTDFU0+
	dAOsPuQYaSiHdOxqnuYbtMLhX1tk1UgacDHhu8O5MQeL2d+98ZMFIuV8=
X-Google-Smtp-Source: AGHT+IHgFUE20LYgumQM6ZMouVkHx44+MCZnYaMI7/II4PkI4JCoP/OM1ExDh/Ap/rrW/9r/b1fXFGzhP1Sfx/hC1Nddd0gATX8H
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca0e:0:b0:3d0:24c0:bd3e with SMTP id
 e9e14a558f8ab-3d04f42ba4bmr64146925ab.7.1738841161718; Thu, 06 Feb 2025
 03:26:01 -0800 (PST)
Date: Thu, 06 Feb 2025 03:26:01 -0800
In-Reply-To: <20250206112417.1996-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a49c49.050a0220.264083.0001.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in ip6_pol_route (3)
From: syzbot <syzbot+3201be560ebfa39bc6bd@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file net/ipv6/route.c
checking file drivers/hid/hid-corsair-void.c
patch: **** unexpected end of file in patch



Tested on:

commit:         92514ef2 Merge tag 'for-6.14-rc1-tag' of git://git.ker..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=d2aeec8c0b2e420c
dashboard link: https://syzkaller.appspot.com/bug?extid=3201be560ebfa39bc6bd
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1068a4a4580000

