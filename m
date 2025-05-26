Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A6C13BC3F
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748247560; cv=none; b=NIaIuEb16KJVOlFbHUB83/RMyRJrvamd+BHuTm0TYqyIgesw/ipyw83nFzFyKDDPEAfu0YbVL/x2c8R1D/d7QGoDSryUSjWr/noch39jYEDOJ6YHqjOVe85nO34Y/9WqOZZ134Mfhq8CSm6tge8MCtu0zpajDwA8RARULqsKZeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748247560; c=relaxed/simple;
	bh=+7FlR7wbH2QVX/4UL4sFvRsl1MY48ikGRf29bMZQsco=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dT5hPEgw9R0Gl6bgLqRkWXQUwGS6OQdB5SOqrG6GbqKOcSmsKaGqljonHZVD/VHMHoCNl8VUYREgKqewDVe3to8gkfV22c8MJAZ2lLXbPQDdkcQbzALzlptLCZATkZOeQIjsBJ7OMLmrCGe4AsDcYT0Qd7cgjL0tZWbMEUYBtds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85dad56a6cbso267437939f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748247557; x=1748852357;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+7FlR7wbH2QVX/4UL4sFvRsl1MY48ikGRf29bMZQsco=;
        b=bXlZ7BYrbeL8oKsW0cVpreT0+of1PJ8CbX0MIz0Rq3NvUy58t74zgM7D1Laniu4/WA
         Q5O695MCLOMCErq3W1svnLLCZDGDWybamtUspz2Rjt6RIBsCQcTBgMqSi+QEUEW+Q/jd
         0vz1Ji7vGjlvOjpZLh94rNcow0qxD0WQ3EJq75R76txl0N2DhVsArd2/EVYFxgdeATHP
         HvxXIx0Qh9bmz5zcM0meBxxEoxaejmetZnf7OHXXmO4eTOqdvw1Sft7xCxP/yuHzHITO
         z3wJipqTvS/eTOBLqsLEEXB4F00O3WiQaZ3coVeKxBIvyIRR99auCx/rLVcwwBiCtCDN
         5GlQ==
X-Gm-Message-State: AOJu0YwmKWE7+5GT6ZKm/Y8d1IuKScw1qTP22BhcSN9+mVg/Pw4siNev
	QkT69EwPIRPO7sI/vK1B/Xvel+EMIffzwXOoC/oIeKP4fARhDrMkuEQggWyVG1HVonjWaJ5QO3C
	PziFXPN40OA46zEwYO8m6vUlDWnJ+V+40QHIOUHVI4TcuTlNWpTToHwdlG/I=
X-Google-Smtp-Source: AGHT+IE7SU5tWY0+rUlkjlDUl8Ffos+1ZiFrD2BYR8gGgvSbvh7lPP3UpGp1g1MELbttTzSn7u1u/wHrGnOeqq8FSjjV5gRReIGY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4a0d:b0:86a:25d5:2dbe with SMTP id
 ca18e2360f4ac-86cbb7dcffamr971512839f.4.1748247557666; Mon, 26 May 2025
 01:19:17 -0700 (PDT)
Date: Mon, 26 May 2025 01:19:17 -0700
In-Reply-To: <6832ca5f.a70a0220.1765ec.015d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68342405.a70a0220.253bc2.008f.GAE@google.com>
Subject: Re: [syzbot] #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
From: syzbot <syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
Author: dmantipov@yandex.ru

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
