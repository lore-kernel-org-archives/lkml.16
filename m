Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254AE2D7812
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534644; cv=none; b=dLMWR3hwYISfdE5HtxM5PEii1r8CjrgvNOLXskqAZdVkTAGgyRhFrDwj6w5j/C5eadRft9OjLdO8SDlDEHHWUHH4aFmskiDWq8A0/nIx1wSY7MCsAEJMXX6dL/UHHufD8YCmaXXD2w3FF51CWyZbhoc6Xajl+6JrNVvNbfAenSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534644; c=relaxed/simple;
	bh=+IQcbyBaMHkh+iDIU5U9tdvK2LEK+rR6EFAfvgJ+dwY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oHhVOs2LRuM9+XMmMeM711p2CB5YEz4BO5xEGGYPlGrYvO+b7GOyyG54F9pB7gh5ffFr9L3T89Ne63Jkj2qe46/iPCNIOuXps+A0oLGiRO/qVc2jtthk8ovnLfDv/nE9TlH4SDw39QxuxwBaf6Nx58Ja4JneU0Nr+/15FarKSXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86f4e2434b6so546349639f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751534642; x=1752139442;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zn0+O30mLs+II4HZDAwukewO2S08QpU1eRG/ZTBn8Rc=;
        b=qfTXbmuNUkfgko3rmou3LvQoPWPmKrnpWCox992wOsEkdZIhQY0Ml8KXHBT3LSEvBf
         T+9GNBkr1M5ld7NekDhmoOoZzRxVkDodo53Go6hy2c+eerhyy1nIgBIesgof9q5xD5cH
         IdPrkNNNwzbUIGCWmUdPIA3pWRsDW95ccFW56akrzsWIMIAVyV5sl+X1aqwqjmwGmlhm
         Xqtv/urTbKhUis36omniTENZthwB+1BROee2HTq93nAv06mMNa9PZilZSzCtW4IkQ7fe
         Um7Sv1IExsNmSLF+5M68vhUAFt1E9JzDx1w0X0Xz+gtblAXZ41CEb6lQm5z+SK6J7mVl
         ZJXA==
X-Gm-Message-State: AOJu0YytLAi5YJhDNR/SIyebi2ofW27PUop+ro7Wb3vCJ+/dqDom3ybd
	xIebQNdOoO4/3A/JnZm3zLlefdT6CuiZI/tqN4EsYy75x9D9CRVGDVA3g6YtI8bp6iwKCDypeBk
	zyMnf7+7JDM9XTrcnMOb1tIZkGUZ04VkaxDbswoxlMlnzSz4c9Hl/DvjX1RE=
X-Google-Smtp-Source: AGHT+IE6/J/nO2fEiaUGhQ2A2cI3ONUjhsQO/69hDBYBXQ8m0mQuAzddv6CHazT5ufVoAFo03AP5Vu5+3Lxd2fj1wS98RdKzSjsx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4191:b0:85b:538e:1fad with SMTP id
 ca18e2360f4ac-876d1dcdc2bmr388880039f.6.1751534642310; Thu, 03 Jul 2025
 02:24:02 -0700 (PDT)
Date: Thu, 03 Jul 2025 02:24:02 -0700
In-Reply-To: <20250703024914.1196577-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68664c32.a70a0220.5d25f.0864.GAE@google.com>
Subject: Re: [syzbot] [fs?] possible deadlock in __simple_recursive_removal
From: syzbot <syzbot+6d7771315ecb9233f395@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6d7771315ecb9233f395@syzkaller.appspotmail.com
Tested-by: syzbot+6d7771315ecb9233f395@syzkaller.appspotmail.com

Tested on:

commit:         50c8770a Add linux-next specific files for 20250702
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=110a33d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=76d012e863976d4c
dashboard link: https://syzkaller.appspot.com/bug?extid=6d7771315ecb9233f395
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=126bb48c580000

Note: testing is done by a robot and is best-effort only.
