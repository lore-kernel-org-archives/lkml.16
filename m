Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C8221C189
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743460145; cv=none; b=YekmnGkAcVXhnLVdiyLzgzZ/B94aiiAtzJlkkDC80ZzI1hQLnzCy5sApKaha65OX1obMm+XcvcJADiv4i1yGDTTyhWQcTnVHJG7xhgTnn3vQiT4fQn1Sr3n5LWWwXFMVUEFmY+xwJDQvRMl4OWG3ObRysAhu0KIrywxlLl/30FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743460145; c=relaxed/simple;
	bh=UuuVTsYm2Zxjnrhbd/qR4M1gwPPLDDfTdGoa8/t6U4s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LwUilwMLs7pQQQcSROJMm/KuR4JdX5JC86Xx4mu+Om01JbpWAXzyH9N0uDqDb/43wT1We8uYyKMKwO+6TPJwgx3C2xxFcU4kwsQ9tialdbODSyQawu7U8drpRcGTDZEhYLl8Uv+Pha9gGtWj0daTAh3ZQIdmQwLEcpQXh1lVd+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85d9a52717aso430050139f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743460143; x=1744064943;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nSVL4Kp9k+wGSObtKqzEFngCrAg4gDkTKkxR0g4Fz+o=;
        b=Kk8J7LW4SKBaZ45vvAyPMuSTJdvj5zPRreHexmVh9JPzAwyJsuoxq1X/YfweOoBd5l
         9yurXJq43+npn4SBNXeSo+FME7wU3GzBCl2RfhWKEAMquwyG8OJsSO8lQ8S/5b1i5qou
         LPjA/w1dD3Ut+dyiw+aqDue7cbov5GLPPaZk3R/kmluv/EpWizIhzt82T3bLWqBWkP1k
         6q//bqglyZZgkdahgcIHI/23xDeFJ8Y2/AZOv8XXuyoWwcHnpKs48lD4iOhlTOIazTy2
         UA5jx2/G8Zzk0muTIyDM1HAkRJrNtwokD/LzMAhvse7DKD1+eflVvUGnX3ZsduMxyc7G
         peyg==
X-Forwarded-Encrypted: i=1; AJvYcCU6fm0rTWvDINLZ2SuoWMDWRI+4+Jbj3TsxMICA3Yek9bN2+1bqHc1p9e1XMMTFmHaQKWglyrhb3QvMDUU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6nPxRPQV3ed/33e4OT6MIvrSLMjeO5G3B9tiRpEyTpzXwhalL
	6NSpWFNE4zit0f351iqI3psIhUim2TBmcjcZchCvEE80STcxHtAW9IR70hBsoD76+bsBKG7HlOU
	6zBrYYNIolSF1VmZdANIWrtFmv+sU9Sc7frttEvOUx0MGCTmK6ez7r0U=
X-Google-Smtp-Source: AGHT+IGhulxDGj30rHN5fxtAq/fPZbdSpnFuBtPejDjr0uCyV7Dtnz334K3BEYh3LNHWAESQIEL8d4zK76dJIn4o/WrkIUBbrg1G
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f0c:b0:3d3:f520:b7e0 with SMTP id
 e9e14a558f8ab-3d5e09094f8mr100657485ab.6.1743460142793; Mon, 31 Mar 2025
 15:29:02 -0700 (PDT)
Date: Mon, 31 Mar 2025 15:29:02 -0700
In-Reply-To: <531210.1743454065@warthog.procyon.org.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb172e.050a0220.1547ec.0179.GAE@google.com>
Subject: Re: [syzbot] [afs?] WARNING: ODEBUG bug in delete_node (3)
From: syzbot <syzbot+ab13429207fe1c8c92e8@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	marc.dionne@auristor.com, mathieu.desnoyers@efficios.com, mhiramat@kernel.org, 
	rostedt@goodmis.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         1e7857b2 x86: don't re-generate cpufeaturemasks.h so e..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12692404580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=56c806e1bbb36dee
dashboard link: https://syzkaller.appspot.com/bug?extid=ab13429207fe1c8c92e8
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=178cce4c580000

