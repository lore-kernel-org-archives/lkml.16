Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF6D1E47AD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 03:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751598006; cv=none; b=Px413mmjD7lKQ6ahVlXUM9EYb8brjrOaup00Cmmgx/CBKMYFWsK/px+e79QtBnyGnerFzgJEcT4yezwIC9wEtHZ8SSdPnViiP13AYXEzrpSx1drXbI3XGHTM7iLYj2QqAZWXOLymrSYpOQnSoM6TyVGuxgIpYzM4WuVdxR6MxoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751598006; c=relaxed/simple;
	bh=P7iuf6Vuzs0HqVct7rJvJNd10fBlI2CBO3FneganoLI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=shtls8+hAzc4YfoVZpxNmIooYWLLHKmzgSN7xFUGeltrXjsuuMBQ60bMeTKapMt8UY/ZVpaLtO9A7oZUa9+1+lIwN5OP5iJ9GiYaaE/QMFQgs6PUm2TkZTxTq57Yr1Vy+ZUS81AgblxqBOzmJ3wG0YnYEiIN7RAnkJA5E3u8LZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3de0dc57859so6902735ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 20:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751598003; x=1752202803;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyLvbnbjvJWW3fNc+1CjVEn67gFNLn2pGzW7dRoqy7s=;
        b=w1ibI1TqwbtI6liT09T3K6VRZJFSAXx88zwNWL72ChUOpSAnUZVQio7w5IxnjkjcxG
         3Rzxz89ax+VSHkQo1Knl9mnL9Kj0cTgTGSgi7XgM8YL587Vim3HMoAeJ5jTpZFZmFNNa
         dbJE7IIJJJYeV4NrUmQeqmHTDCBVa4Z4wcWG9wFbouUuAmTvZzF2jjpI5qVGPxn4sqWT
         +bRzfQVEC2lvLMB9b2e1qzwGn2o6h9aDiUo1eUjGzsvHMEWMeBSR5BX3MYu6Ncyictw4
         lKPTIIJXzt0S4g3g1ldHgr++1e3DTu2l1BDqF4in6tx4idvhxJevLeO1vIR+hhH+kF3/
         oahQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbDseLxc4B6wpTPVCiesbJeFAlHcoQPYOG55nCTeqreqfHtAIQ27/xMnHdhXhrGSV7VB8nVkrjJ2ve9/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YymSmgdMJCfir8N4W5smf6k1MqMNwnMsiOfIQCdDwkH8zYV82Ao
	PlBFzjSzc6I0gzRw6QX0dqSNYkIO8FWAm//EWivX/qlU1hBI240cV+sPk5kijdKJ0/c1Ajbo4J3
	76YUknNhJBAAe29A/RQ312B3pwSqp1oFRb+CueFMXYlp4kII2O4HR6WMY9GI=
X-Google-Smtp-Source: AGHT+IEv6EdNRkjU9TwfOY2EM4PWCKqWakIue/0+Ods3XdaEfCecpi5QU10Wg9C+io/RnY00FFtQXMl17UkawHx+9LyuoFVzJdvF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f12:b0:3df:3ab2:cc7c with SMTP id
 e9e14a558f8ab-3e1355658bemr7546895ab.13.1751598003541; Thu, 03 Jul 2025
 20:00:03 -0700 (PDT)
Date: Thu, 03 Jul 2025 20:00:03 -0700
In-Reply-To: <20250704022016.2331-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686743b3.a70a0220.29cf51.000e.GAE@google.com>
Subject: Re: [syzbot] [net?] kernel BUG in filemap_fault (2)
From: syzbot <syzbot+263f159eb37a1c4c67a4@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+263f159eb37a1c4c67a4@syzkaller.appspotmail.com
Tested-by: syzbot+263f159eb37a1c4c67a4@syzkaller.appspotmail.com

Tested on:

commit:         4c06e63b Merge tag 'for-6.16-rc4-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13768582580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3f6ddf055b5c86f8
dashboard link: https://syzkaller.appspot.com/bug?extid=263f159eb37a1c4c67a4
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=169df770580000

Note: testing is done by a robot and is best-effort only.
