Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B3B1AD3E0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 04:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750393684; cv=none; b=u1rXaABtQps6xHmh780YNfG4saTcJO2NwPSkGNetxALea7+MTUhLyD3zHxfO6k89gbwMnPLWIXeYuQAN2eBXG9ehQxotOb8W4fSPhS5vZx935VgK5qGDcYi3ibOymntDRtGZrDZJ1RTx6xIwuQbpcmCJMmmk+GNQxKzLpPM4o1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750393684; c=relaxed/simple;
	bh=rJ7vq7jFwBj03LSfOq7eImpNezJCroQyveX3uWk7zW0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aoMJ3bI/jAfFKNcXdn/JlY9yVLdy0ZXhRkbSptbhS9BRGeAAbgqqNLxXMN14Q/c+cxcS1YTvbGIX/y8ZzrSql4FRf2tsEZd2B9i1qkoDuaohx/s41o3iGAcZsPNYLQYxC4cYS7UgDx3/jNuEyPEHnMs17gyGs6NmNmCX61mYniw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddb4a92e80so17850285ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750393681; x=1750998481;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XayVGBJ9wQI0RVgIxn88SbNXCutkcEQtnevqVzMO7wI=;
        b=fis+FU0r8wFc6SfGSOcOOiVbet3+TVFkOI9nZSPUuphHzfPV8BQBcRpNWvI7Hj7ny7
         01ywuBvZWgQTiAWakvi7hgf+Vqu4BHOSuUeJBDg+PlywJdQCT37JIHm9xX1emM5mUXo1
         32TY2KQxHcQbcK/7KIwIix+TSu24Mbeq6FBT5j6Mlw6q+5tpVtVFJ3Cyx99W1/UToRWI
         yhhps1/y6UMg0yu5heKM+w8ECX7SrcT4DaKokC5fE91DCJFf7cZ+V1Qt1sxFLl/gSeop
         QukU+BHEsGVacDMeeABBURiQ7XOody1WHzQaYPbeh7BQRJoXYG1N8WJQGaKygn52BE8b
         Eohg==
X-Gm-Message-State: AOJu0YwmePRm/XBQeMPzMXbfVZUxWnuloEqVTAu6xLmdwUNeiryf/+f8
	vX5sOZMt6O+2PEYXhdlsjH4KGiJHSM/ILXtRRJ/GXP4J12IZK2iDiIyB96L48WAOpfgF0Rp21Fr
	lMsAfw9p4/iZq8b8rM89hYt7bS50fg0jaxBUsd4V55fATJKq17u+iY8U2wt0=
X-Google-Smtp-Source: AGHT+IEO8cgXqU0V94Rc1XNTEyRpccqGnvU3kJjmbUeo/o2NQOaqtbmAtxvLwrnKAdsiGbE0oxvGyOVjf9pj1ZtoR1elWleismqe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a4d:b0:3dd:d189:8a6c with SMTP id
 e9e14a558f8ab-3de38c1ba49mr14002125ab.4.1750393681635; Thu, 19 Jun 2025
 21:28:01 -0700 (PDT)
Date: Thu, 19 Jun 2025 21:28:01 -0700
In-Reply-To: <20250620042056.1099990-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6854e351.a00a0220.137b3.002b.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl
 (3)
From: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/misc/vmw_vmci/vmci_host.c:396:25: error: incompatible integer to pointer conversion passing 'u64' (aka 'unsigned long long') to parameter of type 'const void *' [-Wint-conversion]


Tested on:

commit:         41687a5c Merge tag 'spi-fix-v6.16-rc2' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=61539536677af51c
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14219d0c580000

