Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD40027511F
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739587; cv=none; b=TGtAVNB28UaQq63efY/3jIrsCW8j7go2PIRLt4xCpC4TG0xcpfxZyArGiNr+P4FVSNsWCjHTjcD/aw93GDG0DiP/g+3CSABDQZgcIFq9Peq438Ur9Zcmlq1aJOlbmWG+LRL+pJCz/SxQ2fS4uglnbaupnHKkB+8QODkBBWK3tME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739587; c=relaxed/simple;
	bh=VzUN3NGU7q+yc/+dMqXzmAFUUyyKBpsURpNuG+b8nqg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hENYpx8KBzas3U0OS7Bu4dmch+trJi2Ha2upmQcE9i3UJXf6Z0dyy6Ec/Zkp8eKqc/2z3RxjeTy0ZuGzBr6WIyaSToAIUOqcU0weBN9rp6sCnyVkIkMfNEHuZO0IbKbOfpTh+Eqz1MisGHL4qAT8EpLs2LupdmIbrgjdVHV2mEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85e6b977ef2so875931839f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747739585; x=1748344385;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9KeIz7ZNFsO8ojh1bU+Ei8TvVm3G9qEVsxdlM+En4FQ=;
        b=Q5sTRUQQbZg5iaqeqS0ejyYfkbzQPsHBvg2mkahjRO3irYVl1wqlSA7pAANrNd7E0b
         i5ZY12BwUY2tsbAjJ/dDwQQ+SEt9cv0nOo8h+23ycAlhFpNIEvaS6yDvdfzNqsu7/8Ps
         2OMh/mPUOyv6ACNeFLrdCZ5GmxgPZ8ScuJIbK76piY0N+kYfWB5DnW/1s7rFC/tD2QNQ
         3GgHX9KyR7N24qa3+MRLEEQUW1TdCHuaFmMOaU3VuuqeynWcIl7/slh+BFx/EvvuSN03
         eBMyA/IGkpcjswrp0KJ34fZBA6iRtcZfYHZhE/vR9yv1fRurJRRUsEFxgV0VQqKFqUtw
         Om9g==
X-Forwarded-Encrypted: i=1; AJvYcCWa4YWrT69p1wZrIDqcIsTGAt3EDt2dOAgDMpUhy759aA4DijyOGfCYY1twTWEImFnEZjt0XVrClWCIng8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxdfqpcRKhqWdcS5Cda5MBX7GZV8kTqjGlystYzgScqGXp5xgc
	FZiXXfGgnSM1X4dLrA+pah0LrK7U2f7cRBV7rrhOhKOfiqB8OVr8e3SfMcfXiST8Q81gOUpj0rY
	FgK+Kcjl+Z5Mw2n+ktMtyTz8VYNizcGF8GDhyB8jM8yCkABhPaWdVemYIDKo=
X-Google-Smtp-Source: AGHT+IEPQEEoOt3ZC+92dOFjTkVhQCHWWFZYWAU7lfbSzR5mQzhCs+sOSrNUCFd5+oHQ7F9ZNrRhGNeP1hZOcOMjGnzOavVzhxv0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3683:b0:86a:1faf:84c with SMTP id
 ca18e2360f4ac-86a24bb412bmr2171326339f.2.1747739584987; Tue, 20 May 2025
 04:13:04 -0700 (PDT)
Date: Tue, 20 May 2025 04:13:04 -0700
In-Reply-To: <20250520105016.2205-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682c63c0.a00a0220.29bc26.027b.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] WARNING in hci_recv_frame
From: syzbot <syzbot+3e07a461b836821ff70e@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+3e07a461b836821ff70e@syzkaller.appspotmail.com
Tested-by: syzbot+3e07a461b836821ff70e@syzkaller.appspotmail.com

Tested on:

commit:         a5806cd5 Linux 6.15-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=111661f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9fd1c9848687d742
dashboard link: https://syzkaller.appspot.com/bug?extid=3e07a461b836821ff70e
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1712de70580000

Note: testing is done by a robot and is best-effort only.
