Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D93F50F
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 05:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738389005; cv=none; b=JziAexGe8lllyUjGa+b0cfpsW+fdygWGrMHiOjtUP2LyQQuyiIyZhBoVIUqLY4luZ4zc/3+zLw4vaENZL3tlTgWahvp9V5Xr7kDnkogJY9Wozh7sAaqxkjNAXmYxr3KkxT0z/HfpIsJBWmCXWAX0GmBf2swfLiUbdyMU2zVlFbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738389005; c=relaxed/simple;
	bh=xkmK86CvPDvEVeCCvdTnc+KefDBCCxZ5juchOIaRJxY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eeyCsZvdkT8zdQt01dvp3Nwy2Ea4jNmWFAiGn9WHBLGk7d5rHsX9yVFfUEuKRp/axyuajuFgmC1jNtmSeOi7zqUu1JA/5rAQRRUcZuOcdpZw5RxerOsLvmd98w7NbnXg7lmQXDSq9NlR5SrTl2p5hlkyi4jjzn9tamfmgfAopiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ce51b2fcc6so40035485ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 21:50:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738389003; x=1738993803;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tHAOlIJrrTB5Z2WnQTqzNTeK6l2VGZU5jMl1gYgi5R0=;
        b=EtjAGediq9TA7rOue+FxqvLb/IYhrbgKol9PNFWnsgnon0PbeMNQbAed8ScH2EY5V8
         GUkGI1vQxCO9c9js84sFUOBVX1ZzOFJo8y3p8ctvFKrStvnQZoxAKg0h0leiytYG9OGT
         ipqJWmsIiJKRr80WAljoF6BQLdny4deCaX0lCZG2sNLDa0J2X5nfR5H5tlUi3eikTiiD
         Hy2fh75fvAbVHljqFkZtHUPna8CooFLsiNsmH8ysjoGI+g7zxowJ/zrkHF5OWlPyC7t/
         QdTZSMRCt2buI1EN0xJP1VP3BTZV63rnypv8cgcgXDqP1Q6CBKUuBozH2gJzWc6MSHQi
         WEiA==
X-Forwarded-Encrypted: i=1; AJvYcCXeFJh34dyXneRZIzkXeZjjrX0Ltdb1ZAn7+ut4otsNoB7Uuheh4at6XNqg9E1BilGfdbN1gZnVyOdPPVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjMWFMW8FLWK1rgk1P8yknMIMXtxBeUeBzjz4BdsLqnK16Ex+N
	sF0FedXlIUV82RPcvfq00837HFQC9M7hBJlZwNs1hQLPrprARJASYfO4lWjoGm7q1Eb3Hw4CO3l
	BdGITUNIDSsh86xH4OAdKNgluaOgzbUeMTexsIyn0EmX0hpAtYxzzfh0=
X-Google-Smtp-Source: AGHT+IHElkdBF5Dg7aM65UWjONv6Ri3yH+FfLflAEYdlECBXZgOexVHpBBgr3HwmvF0fP3pyh9FzeMcXi/lAzTtGhEFRv1gpk7TL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:450d:b0:3d0:ca2:156e with SMTP id
 e9e14a558f8ab-3d00ca21710mr58112545ab.20.1738389002871; Fri, 31 Jan 2025
 21:50:02 -0800 (PST)
Date: Fri, 31 Jan 2025 21:50:02 -0800
In-Reply-To: <tencent_C95D9CDDB01966CFA00DC1A5898D84920707@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679db60a.050a0220.163cdc.001b.GAE@google.com>
Subject: Re: [syzbot] [fs?] WARNING: bad unlock balance in seq_read_iter
From: syzbot <syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com
Tested-by: syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com

Tested on:

commit:         60c828cf Merge tag 'for-linus-hexagon-6.14-rc1' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17443ddf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f83a535fbb3de0e8
dashboard link: https://syzkaller.appspot.com/bug?extid=c041985778e4069e1ce3
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=122995f8580000

Note: testing is done by a robot and is best-effort only.
