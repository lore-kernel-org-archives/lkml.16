Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA4A235371
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743586604; cv=none; b=DSKf5r44SlvA+3n3hOEYfpWu9knoTF1Yb1tvoObLi90AwM5mc274vE4TA3S97n+F5CfXPj/7bhyTqcy00PtQiR2HKzSV0JC5G2bGpkK8hfDITt54GaeG5hNQyyZp6/KbTJatcqyl6Z6jPa3W50mqAPxjiaHSoJohxA64s0SqwWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743586604; c=relaxed/simple;
	bh=xC2TSzPWbOUlb2UBRsGOcZ0jbCIVo8I7fsmn+4MUbn0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mlwWROsB/0w5OtTEOeKHN4V7pU4C24MvN/78i2zaZ9lQKlNWzNr89ZAHpLiVvvqw0wxpnDJTV1VDvywQp9W5ch5Nq1tfNHBEeg2Aex6icN6J6Z6dr+mSUVTE5yMGkZMDSwtLI8M09nc5df2cgE3CgktsStpwsG62Od1E4y6qKcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d4578fbaf4so129719555ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 02:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743586602; x=1744191402;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xC2TSzPWbOUlb2UBRsGOcZ0jbCIVo8I7fsmn+4MUbn0=;
        b=mwzNdXm7/cb5Zx6TJgOgUxK1uGMSfRo+t2jjBtbmzLRLyOKZOmwJ/e97xdSitdVDxT
         xXr1X7yI+NHymB5ucCvT9/kE7JYkdgywmo1xLFFBEhSeRJlW1ioEZVaulgSeSp3edMRt
         ezHZtOLdjBTqImJizlTvC9haCK4hqpwfQcuhR2KFZOcZCC4qaWjWSwcRGexpEiDrZs3p
         CkANQmtx6lZpEXA95+6W4mY4jIybShKKT13+0Bj73qI42eCGHQ/3ZxKJ0vXLiSt2Zgyd
         G5v/UlxS++ANhH7ugHhyZPjlgK2xBTRj3Y00VfRpC7olqUHq+yop3ev4VZ+dW7f9WLLk
         FcQg==
X-Gm-Message-State: AOJu0YwtNCgwnBvvi3RT979TNHmr05cxz1ZQpaLOpFpSnrBjQRluINqn
	kRrgdmQHaCXxpBewZvJzGN+YYzGO+s+pYlzsFqPjg9xUvRAWCt4hgj0cm+FRiMW7DOmLUq7VEsg
	LG24ApE9ySYA1XrEmvZ/0Ili1PSCz/eNsXNDPfYMYS7SWynwkQ1ZUZ4k=
X-Google-Smtp-Source: AGHT+IFioOI0n5QX6Pi7L8YxFNjk0D/4XfAJAksn+Tu83RZXKIjfuF9qLmx1mI2i1Qc+NaeHveDE+TsS8nEeIt5+XxJVX6QrqGBl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17ca:b0:3d0:10a6:99aa with SMTP id
 e9e14a558f8ab-3d5e08e960dmr165032485ab.4.1743586602009; Wed, 02 Apr 2025
 02:36:42 -0700 (PDT)
Date: Wed, 02 Apr 2025 02:36:41 -0700
In-Reply-To: <67e8b87f.050a0220.1547ec.0084.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ed0529.050a0220.31979b.003e.GAE@google.com>
Subject: Re: [syzbot] Close msi bugs
From: syzbot <syzbot+b6184128c9fa59212e62@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Close msi bugs
Author: nogikh@google.com

#syz fix: PCI/MSI: Handle the NOMASK flag correctly for all PCI/MSI backends

