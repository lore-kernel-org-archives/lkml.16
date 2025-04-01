Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478F617C211
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480157; cv=none; b=HwGsuQLhKOeiuyyeni18T3WH/NV+H1/puwePSo/hMeeMUy31SpWWKljxghWo8rURpstaJS0YOGPOWavXB1ov8JOe8eMMVd7iie/cMLGjjWXlFvzNmeMVXhcYyayCDk4rJ8yj7f2qCne87jdUgBOcnb5eUY0aeoGfOZ5r7wSQpt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480157; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=YrYhCUt0feilm+VmZg/Clkjm1n5dG7ldnk5SYmeowTHimdzp42leEcanVfocsfo8lT+7goqP9xO/ojNgyeW7SE6RPOiURiPifl51zk5TaflMs5W1g8KkpbPXNzU7rCR3meaLw5FKxqZrnBbM6aamWB2kmWLW9q5L/ZrVogHk6nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85b5875e250so532519539f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480155; x=1744084955;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=tcKLLXJqgh/lWXPKO2Uq6Gb4ZFeNnxk8dDJiRfAHaBQldG0XgTpreOIaoXomADdhJW
         ZS+isbTccBTE+93xImIYkVrOoohlHoW1GbTDmIfpB94gnSjfSxTQJMJmOxS3myu01EjB
         IYOpiqKoF/HJRqyVRT+8fDK8V2bB/Plmajji7VK7vJaNvo+90bJufqSZqpL3UIHO/eBR
         13mX5ecGfJk55feU1csLebt8Kft45AUg6K60vLUQoIgVniECFC1yFUDFqeIpd3R0T2f4
         bIn1Ip3DEJN/syOmPKfvaVPQV5eFe0oMo/Hi7ZHR5aWvnkUZhaAYlfYr42md/VP14oEg
         mMaw==
X-Gm-Message-State: AOJu0YxYhA7Q5Uonyd/5qa0XWhp4MPyeSYavvREdPYWEfgArxRaAk0Ff
	uzUKzmICebABMSwup2lCPg/H6eB0017OhkOK9wC6r06q06y4au7askR+a8626Yi7E5lckZlkVEm
	5ieYWKvxoDoIaBqagh5EHYlGnCJvO8HqNEiua/jqa3pHCZ4RjuGS6mxk=
X-Google-Smtp-Source: AGHT+IEI9pxvCwS+14kB3GMGDFfOOUTQ8vLVO79r/cvTvL/gBQXIvoY33Hn2pYxroRTf+leBUoyPLg9qxNkFLl6TCEhw/hgfvFzs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2482:b0:3d0:235b:4810 with SMTP id
 e9e14a558f8ab-3d5e08f0783mr130987145ab.2.1743480155441; Mon, 31 Mar 2025
 21:02:35 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:02:35 -0700
In-Reply-To: <6749f2ee.050a0220.253251.00bb.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb655b.050a0220.3a8a08.0005.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+09c915024af5057b77da@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
