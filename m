Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA69185935
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744863664; cv=none; b=VhoKlupgM3gAyUMkrVgNOq1IIic767tkFc/ojLoSQugY45OZA9FUXUqP6mO0ThN3kqB0K56oK6t/yG3xjgb97Xrnm3X2MlHHOmUFaz8Vra/yxE/6zfBiIdWhuMPxn/V27ZdR/j49SuMW6OOw4Yg9Fk6Kl4g7SXasyowV6rfSNc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744863664; c=relaxed/simple;
	bh=zKgmMw5M/FIyzqJDaMLdICR0MGyRBeVckPPHOAqsZ9k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aSKXhxyFpwGhustrGgxr0GLBo0NOwFxWM81sdXz9/tAHMUoAzvniqk71EEKWGR7oqzxfycq9PbYzjnA16eFtlUPtXQ373UvUS9y4dx271RYwg5FshZjCNniqVElqZ17lGlkDMaAcJ9n8iWcoqQ73ie6C6iO2hda5RxptHh8rXNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d44ba1c2b5so4023975ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744863662; x=1745468462;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hOx1qW2VGmO6PLzv4gQpE58CYHIAJJUvQB+BBQ0do9A=;
        b=ZJcrKOTpL09BTxDGQE70rJ7EGLygsIlACN6lgZVz6J/76yvPPrMPABaFkfgExtupB0
         +uKhb5noOA90u64BgWWyREXF+gJHPtwdmixQilZss5ki3nZFK/s/u0Ud+K5yA2oiJc9T
         8IeMk2IKIhWSJufWoAlhDcu1gniaxz66iVggo297NnXPwuJKxos7ToSKAJ+G1TqalgRz
         0zamMCMNASzSErZ1BxvnIAqDUC6FmXGIU9Wq8Q3pS1CJARGKPyM9Kk+UMoOGUp+YV0R3
         8/3Nhz2dN071QUIo5idcPPoP0T6oxCOpJ9qgK4kRpeVviMeP+2yqveIlc9dsntrHhvf4
         /Ehw==
X-Forwarded-Encrypted: i=1; AJvYcCVibTR6lHUUAa6JwoCSSrk1Uk11c3f1vHb7vdP63HDz9enLfmKZPRuwxlOqqtzsaFB23uYpUuhHZNATwD4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs6R2ePl0ii+WRJ3i1bWiF2eXFm6oTb+YVDfbt5Uc+E4ZelL3w
	5edOEu80/zs4qrIyLS5Af2bM/vv1ihICteV/9lxNKaISnmULuuMlX0StJ/XsSQ8/OkLza7rNpat
	LwjPpyAJwwOqqvNkPLh/nHHEet5wXrZ6yunUH2TJZFr5SjBf5WoKvt5Y=
X-Google-Smtp-Source: AGHT+IGnd8eV5ayGQsYUuq2AcTRA0V2EyqoKcS0OYFHWZRk0N6XqhX6HoydKe18pTV9cA0YxKoZmD1Nx8M+d63v9Z2WAjT2eBGFI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:470b:b0:3d8:1d7c:e190 with SMTP id
 e9e14a558f8ab-3d81d7ce2aemr2651065ab.7.1744863662422; Wed, 16 Apr 2025
 21:21:02 -0700 (PDT)
Date: Wed, 16 Apr 2025 21:21:02 -0700
In-Reply-To: <89d94f84-8e88-4860-aaf7-102a51c11537@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680081ae.050a0220.d9ef5.0003.GAE@google.com>
Subject: Re: [syzbot] [ocfs2?] possible deadlock in ocfs2_finish_quota_recovery
From: syzbot <syzbot+f59a1ae7b7227c859b8f@syzkaller.appspotmail.com>
To: heming.zhao@suse.com, jack@suse.cz, joseph.qi@linux.alibaba.com, 
	linux-kernel@vger.kernel.org, m.masimov@mt-integration.ru, 
	ocfs2-devel@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         11376431 ocfs2: Stop quota recovery before disabling q..
git tree:       https://github.com/zhaohem/linux jans_ocfs2
console output: https://syzkaller.appspot.com/x/log.txt?x=14183a3f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5348e7fd1b89a770
dashboard link: https://syzkaller.appspot.com/bug?extid=f59a1ae7b7227c859b8f
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
