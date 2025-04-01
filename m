Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5C133F6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 03:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743479754; cv=none; b=WfStUDvS5vhVib4bSlZz+6L4qeUrY/W/HM6fPDnX4xIwvS6H4FATtl6JhvAD6K5oT0YGDS0SDhxu87oQVSaoYUUH6LJ6yY8kGaofhiZ2Fm020cnNsrW2BD+uGtSNStWMpSHL8ErZjcGo884pF084Bgug10Q/BM19xtpYMIh+1Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743479754; c=relaxed/simple;
	bh=CQdfz0cY8sbPhkKTFmP3cKdGCtZfGe14WPlZY7ayloc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=a5eIb9ns8xAXSSdd6hNev4gd29JKMypxI3OJ3i7j8Ibya1JI0ztE9Q+CT7tbzV7vrYjFDUJfMroi7ZusziXLiZ1ev4E/Dl0Wqbiw1FSEeOnG1yyAlHkTDBGHoSCAgDdw1Af67rj0npSKZJKTG/lOHbjufWspdco+/lFYfJdM660=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d5b3819ff9so46244875ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743479751; x=1744084551;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V+WIyrV8nuKd/Q4jVGl04PVsNAqCSqjz5Gk2uUolHFA=;
        b=e5lqp8hkI1BtXIkDwdPbpOfVsYxO27OlzFekR9coDN9foogrYgg4dfr8R0DRfhAL2j
         wM6YfX/ld82smdVksHomRSzNjs2/XqK9eJhpvPQRWWsqrScagdGO36vfoQhCJ8pVrr4T
         xW0ABeWmq1c6ZiQIME/AeB4sYgfihLvA+BmJwC76ZtssWODHDJ92IW+qxrofpCxU2luA
         3aZp3RtFCh6tMhUPlEJlkI3O2LX8he+VQ0w2aJsraAgqySUQnL1jbRBA2LaiP69CjIbe
         iExyBtBMKYd/A6G/8DKc4qw9KIPunmvGghKh+sOI5BOpfOkgaVYT3lKUg8mB1tWrgTv6
         w8Qg==
X-Gm-Message-State: AOJu0YxRGW7AACe1TtRUVfTqYmnaXgwuAfwz3cfgntA8GUyFBm+UOaiP
	MAwXYkAiQPRnf/J0E0wyFJNSyuP4ZITolu4sSGcVpYFVLGFyRe6i033Lm8XyBBWbpz69Z66sfwM
	gbtBOIwN0ibIkFS2pt7PRENzttFJWDa4JlgIbs+REB6fq1tnp/uDTMNQ=
X-Google-Smtp-Source: AGHT+IEsb2fQAT9OBhiv4O/sVhYLMpWEGFKxBsIGRLat3c+/By5m99xSpy+7pr8WgB7Kwa8dOcu5cu0+EQVU1o4+OKrIk818tpb0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1569:b0:3d3:ff09:432c with SMTP id
 e9e14a558f8ab-3d5e08ea12emr110158675ab.4.1743479751772; Mon, 31 Mar 2025
 20:55:51 -0700 (PDT)
Date: Mon, 31 Mar 2025 20:55:51 -0700
In-Reply-To: <67cd170b.050a0220.23b02d.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb63c7.050a0220.3a8a08.0001.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+79e4e34c2a37d5a9c1f7@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Fix kmsan warnings in bch2_extent_crc_pack()
