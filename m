Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B221189F3B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642166; cv=none; b=L65hoWKuRnMPalA6U/zKNZGIaxd7g7VJtQPaHhIaherzJvjz1AUp14orIgdLDk6aL9U4GN25Cn2sqSVk9CZcdXuLEIFn/2XF48sVMf55umPkF5WqBUQ1++q/JrY27acCtuTDpmGgyxhC+3u66VfivbNwwCobmfKl0IU9tsOR6kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642166; c=relaxed/simple;
	bh=EAsnUN73ruLYHRIaF8c+gbWNnSdE6fXyfBnKlJRLL6U=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZYNtPx8PoheweHUQPNuAmg761V3r/xMpXvLuE9wpA0YAbV0cexJUffv4N+cmsdckKOuT3qDJJeIXSSMC2vVoyY6jh1pGMVOXEQSiJT4nE0zvG3SB6IOWndcMZ8ri5n5OnA325DNwoQjLtuS6wu5shX+m/tifN8TWIcGX4Y3pU3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-87632a0275dso94202439f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642164; x=1752246964;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yu6HMyDKADnRPwMdTNfPbyIzaSkTzS13hufmtK1G5yY=;
        b=QvSVfqKRsJZMbO/gRs+9rl6NWNbX/E20rb3EP4yo2W79CQnSkkCYZavll5KBZryIZa
         ZrBw4KVs5AeH1xqAb1Xdgcm4VcCcbg58Moe9YXUSuHhBWU0IjLuuft8gVx/MA2UpaNCO
         ZJv1GTh6TND2zCjrLTrEGD12/lADGW1FMKhGf/cPy1ya5/hFxBdZUgjgE2VJqB5b9D5o
         ncv7L0h1ZaHszUl4dkYR53NjbyO37qVWI4ymYEvCQZNj8LicBYVI1WG+gvQZK2FxPlCE
         0BGorSYF6z+1dhYxXWoT/rhSKI5L3tdvKoPByXhqK+x0vlMsj96sVX/1UVxqKPqBJJQB
         eBOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXzeEkzh6LO6AJqpuukajJNnq0DYM1ZxZaApEDrSgMpYngMVdMbAVTGiBhAJK+3GpTa4pvjQ+9GFnMWAc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+kGgt7Sf6513vZnfd68ZvC0NE+n4zSIn2uQikaMgYI2zkV+dT
	nAL/WbHPr+cNS5tPrSmJuQ3IMH01oLbXlG4cHtQoFqAiKKCyjsVX5fkBQzS4h1Vz9X119vDRTt0
	hMgimNzcF8Nrph8oCPh1YRmP2VP6zSzZQ8enEgtaqpsoZFu5Mkf3bIxYD954=
X-Google-Smtp-Source: AGHT+IHPzPgdmzv5nhRYyWrZOIqyFmIpRhrpgi9qVHdqGvg1cDqEnTWL3AymTvClyIrNwtFSjlrAYGX6G5SoQauhCxm3WDPROHGU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2182:b0:3df:29c8:4a0f with SMTP id
 e9e14a558f8ab-3e1355eae1cmr24422395ab.21.1751642164373; Fri, 04 Jul 2025
 08:16:04 -0700 (PDT)
Date: Fri, 04 Jul 2025 08:16:04 -0700
In-Reply-To: <20250704145211.2487-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6867f034.a70a0220.29cf51.0020.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in force_devcd_write
From: syzbot <syzbot+bc71245e56f06e3127b7@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+bc71245e56f06e3127b7@syzkaller.appspotmail.com
Tested-by: syzbot+bc71245e56f06e3127b7@syzkaller.appspotmail.com

Tested on:

commit:         4c06e63b Merge tag 'for-6.16-rc4-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13cf4c8c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9887aa986c36cc50
dashboard link: https://syzkaller.appspot.com/bug?extid=bc71245e56f06e3127b7
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16888f70580000

Note: testing is done by a robot and is best-effort only.
