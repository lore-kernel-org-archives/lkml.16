Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17981E515
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745925545; cv=none; b=KIQpLOv8P/mArpAfsmPwrSiwWuHx1DCP7l3bW2Z3Mradh/k0ZpkVGTSATGCYgK7tR78Cy+K7IIIV81OnZfId+e0+JnoC8MIIR8z0F6j3pt/d3RISDZlE74AthhV7x55FakpCtXLDnL57OEcDGXggbtxYL7r4MZ2derukBKMyPmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745925545; c=relaxed/simple;
	bh=P4gJLpHxr/8gydGSWzRxj6aqC1+r1ui9n1yHXyEnWhc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PXbAZyKzUWbPJBrHpTRA7/jN/nFOxDfFvv5yKzyWrs7LtoV+OMl7EABjYTdsMBrXCux1MUJcrxnTBpmHH66fjaN0vbgDIhjeZBJaueSWT6U61xbEvJE3j31ophDqs3A2HwBOam2BaL2lgBWBKgKjiphVeGCIt1+u1NYxa5sZ+2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85dad56a6cbso541813939f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745925543; x=1746530343;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xudSA7foPELTgwV1BrWNMwZGd31Tz1f1Rq5ZP8YEVlk=;
        b=Pux3F6flXc7Bwuu5Vj104hRlZAsALNqGnnhmzWZTYQA9BMyDuY5g5qmkLlwp/Gmjb5
         9eMlwsTntgcZp1PXxjEDeXCtnyBtyX7v2HVG5bf3Qaa7Q1E4lii1jLkqfAhY6fvRMJX7
         rjMF5YcQciH94Gs5InRwvbmPC1XAoNXnFa2bPLCjSG/HSiFX5A5tacy27NRlrxvGR2fL
         U3FF2T/GIBv3hsrx5LknkRz2JRUieBIVa88PAKe7zMe36lWv7yOU6+pFAAmFh951WiF/
         qoS2856cvAtWVLcQK+fuWRIYUfW2MuvGqbaNZ6N/G3eLdf2Tf/uar8UxHfpD6EVJZ8dI
         Ss5g==
X-Forwarded-Encrypted: i=1; AJvYcCVQxA6V3Wponwosm63LZSKPh7uzc3kbFVOUloy8xFq/9087xYBCBkDRncL1/jJnD3xSK4dx2dCncNPNLD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwulEV21nuTiBGX951jP0bRT5cLjNGcLyhSaBmIHFLO69W+1imf
	kaD1cLcKVip4cAO1iGU1OG3WBGjj1yx3M2v2/2WvwtNN/Yg7bRc7/qwTDsDKm4oUN9V2bRoF5RF
	GQnA17dAEQ2ZkhWL/yiOVH+SzqIhAAr2Vl+GmnQxel3rWRUt1rC4bYG8=
X-Google-Smtp-Source: AGHT+IEZ49NBKe8kKDqkRnENdes8R5dk6sLMslrNZB5vvfoC4/o/SPRSDd7eJOLCztQeKcRZHAYSLd3EK66wGDG4CL2fsrHw9zm2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4005:b0:85b:58b0:7ac9 with SMTP id
 ca18e2360f4ac-8648aedd1d5mr235612139f.10.1745925542953; Tue, 29 Apr 2025
 04:19:02 -0700 (PDT)
Date: Tue, 29 Apr 2025 04:19:02 -0700
In-Reply-To: <tencent_302C2D116C8C966CE90AEEAACC407A5E6F0A@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6810b5a6.a70a0220.23e4d2.003a.GAE@google.com>
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_request_ibss_scan
From: syzbot <syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com
Tested-by: syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com

Tested on:

commit:         ca91b950 Merge tag 'v6.15-rc4-ksmbd-server-fixes' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=108e08d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=714654674710be70
dashboard link: https://syzkaller.appspot.com/bug?extid=4bcdddd48bb6f0be0da1
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13993374580000

Note: testing is done by a robot and is best-effort only.
