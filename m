Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3648149C7D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 22:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745446206; cv=none; b=a/IRf/NO63MeCuk8HU3jMpDsRjbfTU1gxa44aI3giHfvaRWYzvnODMoVfVitSYNWdjI33dQjSpxhGRIhbi6iy6J4N4Pd8Psv9zbUHB7IBPv55+rS4Wp0EmvNvHqt1qxB5hxJlgViBbZRkkEA9mmLm38S9feAdQeUbMuTVCK/Cb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745446206; c=relaxed/simple;
	bh=bAoW8pPjdSowjjp/748R7yWG3vVh6DlEZBkn3iQ6vaI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FbE8DtSSV6xcwDjUktuXiJqBZ9hrfK/Hz1KxJ/XWj+xBSKd4CnR/YVKlZu7/8vTXf0KW/gJWJj7OMxsu2a7BX3VO/95UnNCAuk8vxcOKRGyoK/rdsfiJuW/lHApfS3FWB2GwnyAZgMav65rOwM6xHNLgUGlHoZ2jLBE5QQTems0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b4ee2e69bso45787839f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745446204; x=1746051004;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQ6mSUR6huP/2sRS66PfC+BFrcP2it5lE3o0daMN2ho=;
        b=Po+txNhPDFiTNn6HwXQYOHKzl17HFZ2OLUrIlJAkW422OLMiiv5141IK+Ub5V6SGHk
         r6fQ6JjVxXzlR4c5izw8BFQh6flQSCIOUrjukqVAGo99T9zInnrUbOI+kuQHDSTffTlr
         ICXph8vHGABtuqHRs/TQeM6eRJ7KgNdBlNaePir//d0t6AYprpz0m6arVE4df7yN9QEx
         9GI8tKpsbP0CNUhlXgxxB26dTZPsC/PmzI/okyfdm2O2wuqVcU1LFn0/A2mubhqdszDH
         VTCTCFli2NoXo7F77z7SB0Do0/1NqHfuYo3kK4CtOxpmRmHECHlP5D4Lga73OU5Ty6Pq
         oFlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7im3WFt3budcuiftgr6+tfPoodfldtLMq0tio0BMAHqiUUMHrmcjeMFhbWpNK7zJgeCAQ0ygxZeVJqoA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlx6sbc0pAFUTfmEkM99NKssW40h1yiBoKz9CAlpJYGCNDWlMP
	yAJtXV+KXWHYMmcJqVcb3zNrdPNPaeUcVJcg2svw6RfAb/1SZACzkWewSOJqQNqd+Ivj/thxw3q
	TLvsZp0Zw+B+Sjg4bRz1PszC2jnIViLJyYOeZnNGnPnNgxVeL1o6lN5E=
X-Google-Smtp-Source: AGHT+IG9UXANK6qWy/l3o8i0ZcurbvHjpfPiy57BnNMBGFgaovuDoSjJF/54+GrYQf1a+BT8ivw+MU+CEfNQF8QCuWGLfbo6gmkr
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3f89:b0:864:4a64:f28b with SMTP id
 ca18e2360f4ac-8644fa6e148mr73527339f.12.1745446203829; Wed, 23 Apr 2025
 15:10:03 -0700 (PDT)
Date: Wed, 23 Apr 2025 15:10:03 -0700
In-Reply-To: <20250423214710.551189-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6809653b.050a0220.10d98e.0004.GAE@google.com>
Subject: Re: [syzbot] [jfs?] UBSAN: array-index-out-of-bounds in dbAllocAG
From: syzbot <syzbot+cffd18309153948f3c3e@syzkaller.appspotmail.com>
To: contact@arnaud-lcm.com, jfs-discussion@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, shaggy@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+cffd18309153948f3c3e@syzkaller.appspotmail.com
Tested-by: syzbot+cffd18309153948f3c3e@syzkaller.appspotmail.com

Tested on:

commit:         a79be02b Fix mis-uses of 'cc-option' for warning disab..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=120ae574580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=45c3bf6fd4cb6a10
dashboard link: https://syzkaller.appspot.com/bug?extid=cffd18309153948f3c3e
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1252e574580000

Note: testing is done by a robot and is best-effort only.
