Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3C313B58D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 03:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750131964; cv=none; b=Ss337lMNZtcqffEFAhlN5klXEND+Z6pdv+O6jQm9XtN7pf4UrZuW7WMGvP1OdfIQcb++5JAakeg6YwqlnawNZO2FBdp66AeFVdvDZUltVgPb7qr1XhS1LukjzSX1/qEdVD0cmgNOr3G3v8BGWiu1mvUOg2RsNN3znYO4+dDeJiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750131964; c=relaxed/simple;
	bh=WTx0bAKNUdKZ+P+ZeCe9Xk5I5gKrpygrw7hDD7bg7Po=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=J6iUPil8YC2F6ZuvuDtNl6Ss625vu5tuot+gKBsgSacKh5764cji5hQPC/74NV1TI9ZO4m7G0fzTF3Rorxivh67oeCztNReAYEqKcmCa0SwDPoAdgCwo3cmkp6phh3rjXFlBV4XOenBhoEeUVN0QWCME9UnT9pGBQgm+mS/weCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddc3f14171so65510115ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750131962; x=1750736762;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfNLMsi6aA/HYfCY5iFIxPCeyNROR/DCT2SoWCnOoDE=;
        b=sbhdMnO8/IctcdeMFfL9JY5JtELbgacEWFZnoKfvXkjGy0kj+BhN4fE88S/vPwjgB/
         1Rkj1pEIRobfX5N3M+0/akjfqwH3TaLRDNw4863t7IiLFHy2nuL75aBQk67FKVPgCnSx
         WTCJBsfKaGDGC3PTo0EHaj4ghHEJEpNbebE7yGoMAdF6zrLA1QKrhosDT1v9X3xvv0oA
         vis+8rdRFQsaDxssNo77jzxh0n36/sMTn9krGlNOslEHFcKXAckQtATLQ07DebE0aTao
         oPYynygD9mahDs3hz8T4Yb6nMYY3Rget20jFp1XdMyYqq7uw/TO9mwnX9l8irzNu/MCj
         DbXw==
X-Forwarded-Encrypted: i=1; AJvYcCUa0iuVEe4Gi4mpE5lZ0QPwM+pWuIS7wBSqFn1Mv3oA8lJ0KHXy9e1D0gHPAFioLpI6RAW1NxnIXODhd/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwklJJNTzxcva/03nlA03jOYn0ks1RSV4c1/8hKwrCXPm/S21p4
	MmnOFFFwbz+m4yt2VE+ihl5jF8gZWChTBx5JvTxYDJBh/Q6yUPAZ5Q+hIcajHR0/WgKnpl2vFZE
	Rkj5DTiNgcN1bey5V/Y4kjarhnxIkEjOtF0HqL5V8J3PDIjoWFCqK8a+YAas=
X-Google-Smtp-Source: AGHT+IHPYlT39H0oaIzk9CFMbiiFtqPxV/XEEe3OiN5dSrw1QEf+D6zowPLGnM3QQvoY14/FI58FSLmW2rnXxh9htZN3LH7Gd82b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a8c:b0:3dd:c67f:2365 with SMTP id
 e9e14a558f8ab-3de07d0cde8mr109676845ab.11.1750131962584; Mon, 16 Jun 2025
 20:46:02 -0700 (PDT)
Date: Mon, 16 Jun 2025 20:46:02 -0700
In-Reply-To: <tencent_E870745776CD66CE3C1D36EE977437AA4A09@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6850e4fa.a70a0220.395abc.01fd.GAE@google.com>
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_rx_mgmt_beacon
From: syzbot <syzbot+6554b492c7008bcd3385@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6554b492c7008bcd3385@syzkaller.appspotmail.com
Tested-by: syzbot+6554b492c7008bcd3385@syzkaller.appspotmail.com

Tested on:

commit:         9afe6529 Merge tag 'x86_urgent_for_6.16-rc3' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1075190c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d11f52d3049c3790
dashboard link: https://syzkaller.appspot.com/bug?extid=6554b492c7008bcd3385
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12b44370580000

Note: testing is done by a robot and is best-effort only.
