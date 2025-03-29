Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219D529A5
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 06:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743228426; cv=none; b=qQ7hKUTiwrqH7xYMykKzt91M0Ae5k5JUIZZeOIBpoeCXVDPK4vjXdOFGc7hrk+S5EplCKZOUaUvGgN6D67HFUJgZYoe+l1Fh4BSPbes/2dsOJ8q57SeNHnuHIxD3H6iqbnszdkmCWKI2o2do3bff+yIiHV15EB52c3HUDH2qD/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743228426; c=relaxed/simple;
	bh=MpvjVSdc0WQHW7z1FzEIIOl+lD2KA5yr6W4Of9wFYH4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BweLHSpvELtYDU8+EYUR9WqchZvAR0YgsvhgPbCHWGK5CWmyrkPFRVdYfnDdd7pzsqO7Uo5reiYTkrrkPK8hR1ZpcdeZJCv2Q+wvWpZlKUNn6zQM1uBYd08yJH8movwohKYjWRte/eFa3z4oyw81kCMpaSijhaemDYRpFXd6wrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85e15e32366so282009739f.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 23:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743228424; x=1743833224;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PslXHn+HRCKvMki/o8uXPaurn4b0wbhh4fKpbenniEA=;
        b=KSWOGNJOhsOYMLaFpLcVpj1G5uI2ITnCbHOWDQ0b6IS6mqd+9jjzgM2jiO3Ym4F7KZ
         i4abCk3lj09sQJk8RuWtUPuu1wGpO6UYDy2vCjh3LEWJQT0FhccWM3ibrlMlw3MNnQR9
         jyUmK9JgKtIhrSjc39e4+DHyxqA2cghJ5LlicZfA27A4kDvIHKaK0V7Sffaad1ssUb40
         /dX5Hp8R5CiAnPd07MXCZQQ3LCwvfzbMwKIWk/7t+QRtlHQaz9ld1gYMVwpave4rG5SO
         CnZClx1KfLguTMDEf53GnlLUhgySPfAPthqxLF5MZw/cKvu/Oe6EjmmW7tWsvUmXM2BU
         4qIA==
X-Forwarded-Encrypted: i=1; AJvYcCUARaPqaLwJjd5bAgFpWuqSuv77TiwYfOTyT5ACfNEkDvvjBQ6p+rlMOhPFm/mKiIvi8KCjfiABQUr5HdU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4nZuiH9i+IuKZYsLsqVsCE8Vy4fB/KeWLtyrWFQK1UNtaqjun
	YgvDMRbg4YQdB1Q9fOo6CfuTJWXAoIoeY9WQvNhOT8HzSzSBHMi0nbU9jqDdvWhDE49t4B8qTy9
	Brbbc7sI4G7LX8W2UuEnQY3fLd7ObnThHq6CO4lX8ylEuRZIksTaOgf4=
X-Google-Smtp-Source: AGHT+IFUPX9pw9runny0iEMJYg8F12tktifVwNu6m2yAXo2QQLjXpnMt0pII7QHeD+ylT93x02LXeNLC3V5ZjplGf7Suy0zHceGP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3f09:b0:3d4:28c0:1692 with SMTP id
 e9e14a558f8ab-3d5e08eff80mr21094665ab.5.1743228424129; Fri, 28 Mar 2025
 23:07:04 -0700 (PDT)
Date: Fri, 28 Mar 2025 23:07:04 -0700
In-Reply-To: <tencent_43A5890D8A92615DC95DBA99714FD50D8207@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e78e08.050a0220.1547ec.001e.GAE@google.com>
Subject: Re: [syzbot] [afs?] BUG: sleeping function called from invalid
 context in __alloc_frozen_pages_noprof
From: syzbot <syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file fs/afs/dynroot.c
Hunk #1 FAILED at 287.
Hunk #2 succeeded at 305 (offset -1 lines).
Hunk #3 succeeded at 356 (offset -1 lines).
1 out of 3 hunks FAILED



Tested on:

commit:         1d0b929f afs: Change dynroot to create contents on dem..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=5f1762820c18874b
dashboard link: https://syzkaller.appspot.com/bug?extid=3b6c5c6a1d0119b687a1
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17917804580000

