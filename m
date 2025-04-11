Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3DB2367C2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744393628; cv=none; b=oCKb9Iq0b5A8zG/BgVRHbnPp3wdKjrKFT3+uSj5IUcNClt7S8w3yjPGK6IZhbSHIytZL34LdOEpNm7b0Ut9WTW307ZosSy8f49/0oDZovo4fN5E21JX6b8lcKvW7Svv42aBB17IIVH63BDTbspMcazp87gDPT5bfVZ+SfDffCgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744393628; c=relaxed/simple;
	bh=oOtosL1HHFlHGy1b5imn/50Yhv08U7HIjdgOoPs5wX0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=GfQB0yHmok+gonBsyJfYVMKo9DXCNJTqL4CCBqB2JSBhlQWmv15IyHRUxvpZOiFcw2PoDOWiEQaxBjWWUCb0/mr12WAupMEVUg2fFFicz81bum0wAQhFRxwC4ulO6DyQ3BqK/ZsyJWVDVr/nNraWTcVurtSQQ6UJZyr4CQXvIi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d586b968cfso5052015ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744393625; x=1744998425;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6eYB1ZtJj/aUtD4KjdQc7TPmxcY404LeKypCpPv2ksw=;
        b=cJ69OQmzXRObAZEFRZw0LYfIcVFfd9vYxlenHG28pVrz4J6XxezCT+nlI4wfwoRI+U
         vTfvKDDvoHahpM/UH0D1fbEhlwpOCM6r9Xu8n9CR7bp0FMgxB/5bMmkDdUmewQFLNDk2
         Mc5yzzI49OFWDrgI1WA7HcysCeVA2b8NygTOw6ta4qKtY1ogAj5gA8+Kw6DvSOFUAdK7
         Wl9UefgSHcIemggtHKhRdJ1/yWVuUQBrXHhmKZBmYmxzUA26UJWx3riDCD2XC2G55iFG
         Xu60a+GfeEQ1Xvt9oMrHI9nTZbe9fxVM85O23JpLBgkkP/kFRt+ktXDvVuEq3RF319x6
         YkiQ==
X-Gm-Message-State: AOJu0YxIId1VLV6tnrxOxjKM4htq2ByuOHHzh2ogllyF1FpDCcxWYpsb
	LD5eh83YQdzo0pYkqI7lct2YLJotm//4Eb++LBL/gBH+vzUMwWowd8VhKxqU2szofPWeuXy6uLL
	KTmgtgQbF+8vgVTrjwIWw7djIYVoA562NWPSTq7qf+Sggoc+hTRG86sc=
X-Google-Smtp-Source: AGHT+IHjBwSKlZ3uMeVNQ9sGsJzLrvXbkRh5W+fnpD3uiDE5KT766d4vRRgaIjXYEn3pKbv+iazqRND7tgMx8DLLC7W/B1UZVCRP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1909:b0:3d3:f4fc:a291 with SMTP id
 e9e14a558f8ab-3d7ec26fb94mr38097315ab.19.1744393625660; Fri, 11 Apr 2025
 10:47:05 -0700 (PDT)
Date: Fri, 11 Apr 2025 10:47:05 -0700
In-Reply-To: <CAP01T75me69hbXJuS=6Q1z7nCLd5ctBtKk=hU0RMjdDZAQ11Ww@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f95599.050a0220.2c5fcf.0005.GAE@google.com>
Subject: Re: [syzbot] [bpf?] possible deadlock in queue_stack_map_push_elem
From: syzbot <syzbot+252bc5c744d0bba917e1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, memxor@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         e403941b bpf: Convert ringbuf.c to rqspinlock
git tree:       https://github.com/kkdwivedi/linux.git res-lock-next
console output: https://syzkaller.appspot.com/x/log.txt?x=16b68a3f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea2b297a0891c87e
dashboard link: https://syzkaller.appspot.com/bug?extid=252bc5c744d0bba917e1
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
