Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C232259C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 02:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738549684; cv=none; b=PvY/qjuzhZPbbehrQ0w97AjXI0iMuaqU1PnyQRJyyGSkfklz9Kbb+rv009g9SiqXKO31yW54db+C7tOytrGQaNnAhVhtFD666D1GqY7YtwTT+9M/nEl+A2UOGV4I1LwY+eggzafFAfCG+t/55sXDA4j+kh7PqnULqxHrJ+W8WP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738549684; c=relaxed/simple;
	bh=28dR8/k81DUVJREN+120eabnhzXV1scmrW6VDSvdnVA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UXOe2kO0sA3m8E2EvFA3doLNNRcwo9FevhzO/1BupgqJmvVfGdH5yBFNBDkTCJi/yclDimvbzwG07Mnt4X8eWb/CohTb/TcdLP231ERBrpNhjFsyuNRdbXhLC9iWKxTeUSy/T6lSEpyeeU9aji4+qiAMtMPoUzOwlzn/iIneogU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d01c66745cso14287085ab.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 18:28:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738549682; x=1739154482;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDWh+90p2zgccUTdRzqIfuSiJ5USuCNsjxw4H7P7Cro=;
        b=Gv+DYAKn/nNfMzMSTL91aorETpekspcjmeGXv9ZkkM9pVfO7AcPBv9OCjp3oxC0vyu
         lmO7GP1hYN5MSw4GxJDr7HuJWodfCey+9sxoGwDh5nKY1QtH3wy16/uGIuY0f9Dkdevy
         7J6Rll1of6QaxNIh1gojjv2ZDW5gQWuq0QUl4TAh2BkjdC5U9e+rgDj/BbXrZuWQjkmb
         j5DrlbAeKavwAI774vpjMz/1TR59e0urHyatHoWKwijaWH7nOcCF1ESmh8j2pJxIXrxz
         rpdx2XcxovDb5Uk/W7xaIyXEu2nS+OOqu+zMOBgtnpekhhzDgB4bj7gQSjw/fbnUWOeq
         kYUg==
X-Forwarded-Encrypted: i=1; AJvYcCVnOnMhEqkwhz5E1cMjExkIG3cUXWobANk+4zzsSFR/WmSlKybTVYets8pUf33Sdg1aCqBxmfLAIc9/D3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDcSyLkEMoBnV2LGgj6Y02jUwUcanEtaliLXehBJQd+8pMTjE6
	eKcd9tVu7+kok9Z88yGxowU9GLItpEUVfZvM7p49t39hHHxo0Yg8XEZF6+HBGb/ySk6noMnLOVM
	74QCqKbxrhfGWze4Fgwnefu24meGx783LtRbmrMUvhke10/zmPtUIDQQ=
X-Google-Smtp-Source: AGHT+IE1ibTOg6ajOEuEfP1LLkK3vI1kTrRZunARESDLVaUopEEZJeANMGUmk8edjIVeHEbIV7+f+turo9JPoHK6BFREBrEA4W8c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d99:b0:3cf:cf25:ec83 with SMTP id
 e9e14a558f8ab-3cffe3bcbf3mr156257365ab.11.1738549682333; Sun, 02 Feb 2025
 18:28:02 -0800 (PST)
Date: Sun, 02 Feb 2025 18:28:02 -0800
In-Reply-To: <3f1d7abd-3884-4a75-9531-efba7aa0b45b@posteo.net>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a029b2.050a0220.163cdc.0035.GAE@google.com>
Subject: Re: [syzbot] [fs?] KMSAN: uninit-value in full_proxy_poll
From: syzbot <syzbot+a84ce0b8e1f3da037bf7@syzkaller.appspotmail.com>
To: charmitro@posteo.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+a84ce0b8e1f3da037bf7@syzkaller.appspotmail.com
Tested-by: syzbot+a84ce0b8e1f3da037bf7@syzkaller.appspotmail.com

Tested on:

commit:         57b31475 debugfs: Fix the missing initializations in _..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=112383df980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d0bb5e08cf54aa2
dashboard link: https://syzkaller.appspot.com/bug?extid=a84ce0b8e1f3da037bf7
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
