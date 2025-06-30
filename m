Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDB9258CD4
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751327404; cv=none; b=I9f9oi/JX5PeQJSd+Am5JZlr+tdqgyS3WZPaTDmjCfmKP/dVbzW9JDg56bT4AW6XM7TUiVSibyUlAOI3WoJoYzWRwsronntBZepCk2vQd+WVp0TxvXexKQXz5vVeL7y9jeboGRD9EUHcV0j05hZ29uNtNjWyD72pd9itJkbc37U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751327404; c=relaxed/simple;
	bh=MuT368p6IfKKpkX3T+dR2IeGGymZbEa1LyK2jijTF3k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ereRfAhQYDwGFiDgFa06t7azLHsdJOkdiG2eg3zRXsOzsbOc11xIXyR/DmPE72JrSmnSalEcbKoU1cz7DjyvgPYOmmks9mHOlvV4cRIwiIb1ob7PTrzcLevVjgoTpShi0LKX3010GGTj5usuGyfWzJ5j5wSMKB9ItbhnEf7IiKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-876a8bb06b0so264912639f.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751327402; x=1751932202;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yD+S//53gKUHH/4ojzM2Q4p7sRW2Kl2NRk092Vf1F0A=;
        b=l3V5fW0VyPsVHazsJeIkLfErgKxMHOmz1m6p1IZpHF06prtyWjrIwzPtX85tWPoP4F
         mXQlhq8KjM5DlkNc6lutAq9gK7KuK+nXUkGy+mZQE5UabZY1PgBWY14eIKtqx0KyKo2+
         gnDnlPdFijq+0t4mVl4tnNW/2hOMOK5ecEjrI6DzsMBaHCtwLDzLVm/Of+6gmLCpS7ik
         av+lqisE5fELwfyJB/RP7aV7Hvd4nmJvO5w47cMfSrrYX3H7aquy8sVzz4luW/KXsxP+
         xo4YkT/7vV5yzlMv842otDum2bZXu8s5/0bj5mnW+X7ewzrxxeC8THBDyQQTSDHE5R/n
         5KJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj8UeWZneMwUUPmDmCkHc/+Hk2pXuohrOEJi1NVtem07vrOGcOYHt5oyHoCTRfiYO8v6sJV60k92rKH20=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx54huaT+6DqoKApxICJG54XsJM90vBqOH1Hgv+OAZO2AmfWk6K
	dwJnyxkypUAhCz7aFJQkuygP5L8wc01YZeQih2kRGFTYAWyzUYkgsdG7M//sps8olHZ8vSYg/XQ
	m7Hb5y+nxmluONIxQqs6iOCkuAgw2inkmernz+O1GjwKMpEda1lXw0U0r9Sk=
X-Google-Smtp-Source: AGHT+IGP5pbRduPuwupqCwZQQGWsfdwhQp14p1L4kthx6LZ6tg3P8Emx9tSyhYpwMQWVcGXtVta2akfBCFQ8CMAYVwJPvxTZB0oa
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1522:b0:3df:5314:1b88 with SMTP id
 e9e14a558f8ab-3df53141cbfmr155632705ab.15.1751327402602; Mon, 30 Jun 2025
 16:50:02 -0700 (PDT)
Date: Mon, 30 Jun 2025 16:50:02 -0700
In-Reply-To: <8b0a6266-d5c9-43e0-994d-df557fbf8f0fn@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686322aa.a70a0220.3b7e22.1390.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ni_rename
From: syzbot <syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com>
To: kapoorarnav43@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file fs/ntfs3/frecord.c
patch: **** unexpected end of file in patch



Tested on:

commit:         1343433e Add linux-next specific files for 20250630
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=a3d8d413c6928dae
dashboard link: https://syzkaller.appspot.com/bug?extid=b0373017f711c06ada64
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1328788c580000

