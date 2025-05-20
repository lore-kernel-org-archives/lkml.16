Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395E622DA1A
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749124; cv=none; b=T9TeKRJhAD4zHd1cMappK8IrT/c23R48DvuII+U/p6QYdMlFts3++w6ctNLInQsQ3OyB8S8kW+9k3xXvpsx9IS8ZUmclw0PrRae5K7DOWpbJxuvwjbfFxutMUbuKr5qkbisNatPIfP8VtIkiDFoDn+xD7Ny5xMkEzTLiZD8FO2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749124; c=relaxed/simple;
	bh=r5Djv1BMm/NJYEqrWQsF2UyWFuB6VtBbyAZAqbkmm6U=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=nLF+vISzxpe8ZXTDnJ4mErs+dgrxs5olneDusPOXq2ugJLPodbbVibDb4NI2Av388G9fFkmk8ldwsUqZpUjOlhvwfQfItirbmtb0bYquIFPe52+chSs6BfpalQ8Ko7HIwqA+4BWZTTuhFaMlpVSue+r4fwXO1JqcRdWnJ7u6vz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85b5878a66cso1597765439f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747749122; x=1748353922;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GkmFJKQjp+Baizaid45MG0LVOZ9asvIc4j0mZ0nRIjE=;
        b=u/CYycZNG1xm/D+/bXFocTGMn+v3Klsp5y7KSHfbt8RV6UWDLZdcoCC6I40FSG0rWh
         JM/5pdf95ZFFd3y22Gt1DDrMq6MSPGfouMkClGGq4IFsPuoQUk5AoYqh9hn9BtWmS4ls
         S1a8jV8OdqkT2gIYnqOHlO0VvjpKK0lsEuNKFqO8nDIsOVsMGEQCd8loYewcVchPrVNO
         xJtJ50fxJTi1bA5K/a9qkqnayIGnz0mHYmPbv4kRaoMM8dS4ZKyt4Gbnj17bsTJkeO6i
         dMjBErGgR5DFUGaxOCBYQvRJ3OLrGa7+JFbaMISc9q1zbwahRdSmpZVXQOKREkbOGgTA
         oR5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJ6hjvFHXUXRpxKtDGJEN+7FXDLcz3WCQ9WU8UY2RoiNRwFFHlH59PxhPgw5UILlVB+EeFf3sTA4rwcnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH/Y/FUf3O63WYwW+aKQ2vBfEVuidFw+0EalxvjGav+npz54D5
	nINqgf1op9FE29PahVnDKA/tpjye594eFH30ui+IArYe+KieqJI+8euF/Zy3+oHYje2TnQ9Gd0/
	wxNhQdOHe04JAoVYmLNRx0/awnK9lU0rwQJhaqPKKf9RioDZDE3jL63QdbI8=
X-Google-Smtp-Source: AGHT+IHDVoExMPPTf8+/uYHyEEBogZYfzCylxUscwJbFiEg5s5xvKXFmCTCIzaiiq0MDnkrNZIyNcFbhdhne6uKePiu8EL6ze7pN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3887:b0:864:48d3:a5cf with SMTP id
 ca18e2360f4ac-86a23257b58mr724013439f.12.1747749122238; Tue, 20 May 2025
 06:52:02 -0700 (PDT)
Date: Tue, 20 May 2025 06:52:02 -0700
In-Reply-To: <da4976d9-7fe6-4f7b-a7ab-4d37db668cb6@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682c8902.050a0220.ade60.09bd.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in
 mgmt_remove_adv_monitor_complete (3)
From: syzbot <syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com
Tested-by: syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com

Tested on:

commit:         a5806cd5 Linux 6.15-rc7
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16bede70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9fd1c9848687d742
dashboard link: https://syzkaller.appspot.com/bug?extid=feb0dc579bbe30a13190
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15af7f68580000

Note: testing is done by a robot and is best-effort only.
