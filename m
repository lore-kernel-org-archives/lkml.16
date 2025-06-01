Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D3C2904
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 10:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748772664; cv=none; b=RXONLP2jB4LIDV2ZSd/LsLqccWyZ4sL2futU6vAiEjmj1KbNcGIigX+Up2lZksftMUr1DxGyAAzggBcpWIqkWiXkcYsORF9hxuApz/szzU/T0A/VQ1xJaIiybgkzl9wTsX5d4+ivLZLJZowFo3fN2yYQcx2uSSSE1BV/u1CPEQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748772664; c=relaxed/simple;
	bh=YbmG7WqwR3f2KzSkRMRFGgJp4USyXB/oGlPxcWqUmdE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dedw6Ul66hJ5Hmzq3B8QxfcGLq4kEocUwAobPhI633yyRl7Aw0nZ70xW3UDasf6kXQO0bA9gqZEWNtP1DgiHrQOZSnSChkJzBOKVyw/PKpbaIwJspIyGr/gIq27jFyfrP7i5Le0aUsnKmA7bqzfekkSrRgyGCrAsEuWbU2LPhIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3dc8b60169eso37344915ab.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 03:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748772662; x=1749377462;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4G2dOvfo1DxJj7y0o21LE4UqwJndO3YyLj8SODMz6w=;
        b=B3LFdxArDzpix78mp6CdA0eZasHk1VAmoqCmOU0T/vJWZ5Y2Iwjb/LQb3nKZ/y+Dja
         Hoc+A1MfUBZ/Xuk4hxvXx+m3Grb2PIkunRMK+329xqt+NZjWdLKwSs+QuTmwRwnfWbvP
         YYHapYGKp1ZEk4WRY7zONlduoqzYDEjf4JhHw5lYbjKCY4j8E/KigllGaImt8coUFfJq
         eQ+TDiCI+HG4YRmmClq++FdwImUTJ6IRN9E6AdddE+Agbai+cws1ZybjHwNMXCt8x7Y6
         lX4DJ6zqYbXDJ0h+TjQ+lZ4lmGpFWD+6cA+8JMoQMu4bkFHUx9QNkASXjRMMNzWlvRxI
         EJgg==
X-Forwarded-Encrypted: i=1; AJvYcCXyEIXTB+tpjYZF3ny+QWix2bwjPpswJQcvxAo78ZBwX8F13NmPXmbKbBGgkV79BiARHqLpFA+ZS3mJuYY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl4kMpukFh0g8841Eo5Pc8Ms+jShUG/HL4SN/1j9YKt3XZmBcE
	WRAdneMFpQHxBxraR8UwXPZeXtHY67jjRYtxJzkmUv/Ie5z440uuRVBjBDQ4wD2pK2N2+i7pAfL
	cP/iLBmCxc2YtzQ2b+EJwF9HvvJ7eRJcNdV04ucHA8Y1HgnwO1EjS+07vd8Q=
X-Google-Smtp-Source: AGHT+IFq4xiFi3EMAqYGleLsQSHOhQXvVX1+7bp57OXZI4Vttgea1taEhkup8iL2JvWsaDMXcZu4dbSKgUMF9QCMIwNLKJoqdpJ4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:972:b0:3dd:a270:37b2 with SMTP id
 e9e14a558f8ab-3dda27037cbmr33541045ab.1.1748772662483; Sun, 01 Jun 2025
 03:11:02 -0700 (PDT)
Date: Sun, 01 Jun 2025 03:11:02 -0700
In-Reply-To: <20250601095013.2615-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683c2736.a00a0220.d8eae.002f.GAE@google.com>
Subject: Re: [syzbot] [net?] possible deadlock in rtnl_newlink
From: syzbot <syzbot+846bb38dc67fe62cc733@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
no output from test machine



Tested on:

commit:         7d4e49a7 Merge tag 'mm-nonmm-stable-2025-05-31-15-28' ..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10eb300c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2ea0d63949bc4278
dashboard link: https://syzkaller.appspot.com/bug?extid=846bb38dc67fe62cc733
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11b6a00c580000

