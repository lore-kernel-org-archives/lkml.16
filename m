Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C9A33F6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 03:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743479639; cv=none; b=hTPYMLP/rLb5cLk6fhWaLhQknQHYsXU5P6LuFqIceqhpNkMamOFF/koZ7ys7rjTbR5Cr2R3vQin5A/P8G2CzjgIF+kuEEYJGUg9KzQbNSRt+/OVua0zeI+t3jsi2DbFmAOZM1B9F7juUGoX2mu39d0xy49+kQwKjs8ohLXeKIas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743479639; c=relaxed/simple;
	bh=va2Xbnf2iInYfp88pRFTEi/z95y0JXuZPRpa1wnwMoE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MY9zVUsIiw9XCQ/ZF5OHzF27z/gTu5BxFSkdYMleqMT0Qn4VOiz6Gl8juEQd/OEpZ76HUcOmg+CZYvmBT0q2JnQA2/K98eLdrzmJj0bfL2+d3nFoL2bomXaSlX9ozJrp3UOH3hfb4aRnuavedtqWRWpBV1aljBOJ8Nf/uzDAukY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ce8dadfb67so54451155ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743479634; x=1744084434;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=va2Xbnf2iInYfp88pRFTEi/z95y0JXuZPRpa1wnwMoE=;
        b=dcRz2i0uipLCKFnZF/1+0xFcChxe0owFSo1UDDv39PxvHVrcmo1NTGnsAHexinMkBU
         Ma1pJsVLVGi6BetfTOI3pW4cJ9IzGuRnEk3TXK3tvQy1als351Ly/cF0eUg3ZqsSXPdu
         DStEsmpWDsMwY5NDnuZ2CYlYbl40HpduuMfVAptApBv2TIzUJ6/sRBWSheEOqT5ohgJ2
         Bh1hN0TQSr887Go3nzi8SlTrFz1uzlOFRE0W5V4t/bz5DqUSn9UY+95zh15rw/mJUGOk
         NVX0fLXPW7PQCFJfKo5fuDuCvqk02p/cvUNLsCo3TXMr6zY1sG3gyeJZM6fbA7rl1oiw
         3nyw==
X-Gm-Message-State: AOJu0Yxg33ziSHxQfVgJK+BS26EfbRNUIejWDUQdTzvUkl5cPbpSk1pN
	NIHG35p66RdwdbZnbHHg8mxcIoau+LedYg+SIsiNZo9KTdIM91npCAWz7EDY5L78Hi/gAadu5cw
	+/5qthunRTl4JN+cEQUKR8Mp6+vcPZBKLeIvDSAzeE34gZi8CVJmPAbM=
X-Google-Smtp-Source: AGHT+IG136CDLicBbVuHVv17+6Nw8rlJni1r/DRtoz/KtjmUD7CEMmOFME2VrA7gCIF1PHDRoqsR1FnKIzYXaSQiAlqp6QZYcUWS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3d44:b0:3d1:79a1:5b85 with SMTP id
 e9e14a558f8ab-3d5e0a099edmr105862025ab.21.1743479634806; Mon, 31 Mar 2025
 20:53:54 -0700 (PDT)
Date: Mon, 31 Mar 2025 20:53:54 -0700
In-Reply-To: <6755b44c.050a0220.2477f.002a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb6352.050a0220.14623d.0001.GAE@google.com>
Subject: Re: [syzbot] Re: your mail
From: syzbot <syzbot+c761143a86b1640bc485@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: your mail
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
