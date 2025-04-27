Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA43E8C1E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745771944; cv=none; b=L+/2A8BCOo4IBbbFhUjTsD/s9u8+pVp0J5sM2Fd1Pi7NwcBUIZl4sYInQmb59xAWDDf6cMWLdmRUCjZL7q3lwhCoNuNlX676axdu3SouRbw670+GjuH1yWaQ3YUNRIQJmh8fnmP+0mi5I9uEnAFCX1Y1YOMVuDNwnJTGLCSqxZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745771944; c=relaxed/simple;
	bh=MXyJC/oxeeH+MtDnSJ46ZtwMlveXJC8jGeptMsaCc0k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oLkXJUF0e7z/oEOofqNrVYTniloy0ICx/Rv9Lac0OpRFPJx0hZ13LYrtNFnT1hjCR5CM5cmgWgHgU8ft0mM1b1fz2xrknqfZMq+DmWuyHVrmNhU5YdunaCrXZHm/xPJgT+vZECKpU5rjWnXYqqOG7kB/H9a1Vwh6tE3o1KIkKHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d81820d5b3so69618955ab.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 09:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745771942; x=1746376742;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ouHWKL3o2HV/bRpFS6aSZQ6ZZAsZjvLc+Ie3NDYItj8=;
        b=RtwE9GLImDCmRjdVl3vUYcBExbVou7gJpon1e7RWpgST7Zjhv+fKH30N5DKcYsW7Yq
         mIbwCgwCryTZEje7BXiZlvWTWCoSy9MzRQg5qtmBVJRVeD1rUeTsfF6yepgta44rnzOU
         szxCwAOCKZZXbZWwBMGQSbDeaC1wOXfSdHgTU0zA3PWto6l3j4Hi9U/P7ebxVSk3xBh4
         JqGOH3OHelsE5EILFf3p1Ua+YSYHqxzbejcRHgtCppSkcDjHsdAIP1fkkisnVJ5F9k1F
         gUgrBY8zUsscup4tp+BEBn4B/1N1nZWzYzXAwrYPrDe3eoLRp0eaz7IOeYR1GMvnlewj
         6iRg==
X-Forwarded-Encrypted: i=1; AJvYcCW0m4Yk5JBLysRv8xKkZxffy33MmMkToubj9SUJg/UzA6N03KyUNPOGupjrfZuu6rpgZgeytnesjIpGnc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWJr/NWnLS8aJtbtn+D4W/DDvGN6412LYFGWbdIfa87nd+InPp
	ZKine0ttWltY1fhbZD2oCCiHQ8D55Marhw7AS3FT6n2mMlYXaNt+CqqCT4pY5AUilOudJehqVia
	zqUEHWewVHrUPypiDxCyckgJq4oyc89GE8xn4eU7ABKLpdeJwGHi3W/o=
X-Google-Smtp-Source: AGHT+IFtODjObCQysZgpXX2O+Ogx1IfkxTXnjqJKNjQkJgX25KjjlPZDomIKvQn7BgJR+b4+FeflW2LSHNTej5dv2XJ1D1YUatrq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:d211:0:b0:3d9:4172:eecf with SMTP id
 e9e14a558f8ab-3d94172f25emr65369575ab.3.1745771942109; Sun, 27 Apr 2025
 09:39:02 -0700 (PDT)
Date: Sun, 27 Apr 2025 09:39:02 -0700
In-Reply-To: <20250427150513.84040-1-duttaditya18@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680e5da6.a70a0220.23e4d2.0027.GAE@google.com>
Subject: Re: [v6.1] UBSAN: array-index-out-of-bounds in txCommit (2)
From: syzbot <syzbot+e829cfdd0de521302df4@syzkaller.appspotmail.com>
To: duttaditya18@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-lts-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e829cfdd0de521302df4@syzkaller.appspotmail.com
Tested-by: syzbot+e829cfdd0de521302df4@syzkaller.appspotmail.com

Tested on:

commit:         535ec20c Linux 6.1.135
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux-6.1.y
console output: https://syzkaller.appspot.com/x/log.txt?x=16204374580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a3976742cfd6bd7a
dashboard link: https://syzkaller.appspot.com/bug?extid=e829cfdd0de521302df4
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1131a368580000

Note: testing is done by a robot and is best-effort only.
