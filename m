Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1B417C211
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480286; cv=none; b=jASCR5PCD0q1Z3jBb9INkbZY9+BGI1TRr5vMjdZM4KYlVz91vHRJl0IHPgeSDu3IuUQ1QcqnB8ww3TJHyEBo3pOMJtTeruDXvmYsrjnCHQ5TNX37BKtcHkAGle2fcY0uO/CS7FxuT/WNJQpquU3MztmK3gUmRxQ6rUxOluPmyMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480286; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kPQGBqHws2RGv7PYtF2T/0uwMbK04nca4L4wdsaO2O3t+FWCh+SRMwnSpklcFwHx0p4697hsTXkqHx8cKyTvlu39XFTEGREpPJH2F1M0FhhJlzbwMRK+N1va+lhCWboHvABeZ4xJp6wQbIsHbVypW/2SEBZQ7e5DsR1Sn1xuFy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d43621bb7eso53854465ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480283; x=1744085083;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=p/6sB3yy7m6B3Qxxs6eq/3Sry9uo7PHRvXVNKnkIT7eaysWGvBzbQSUGXSXoyXfOI8
         9v/wlVwLXs32gqh9fbmjWbZ0D2k8s20dnkR2Ayv1Q3e5L7Ozex22I04fxQ7pLVIxbSMY
         rC7GMcnv/rZmBeg/YWaSEtXLaKJ+XIHzfYHUUxv4nICZmdiJdkhVHrfzM7i0TglKLjqK
         AKHtkXyl4ZVfUK1VzOv85UY6iJhcCEL7ffbhUWy9+06+yjcOnYxhImTYZrUAqGkPG2li
         0RVHthHhUKKKoBVpq41k2l9/cI6/qwGDNq9TkSVUc9K+qUOAFcqh6Ws+8ll8PwdwhRC3
         ogMQ==
X-Gm-Message-State: AOJu0Yxld+nR/FVljq66ueaqQWNyJ0RPOX6XCp8M+T2Z4THDGdCvgHyX
	WQHyfXena04Kka3ZyoHK8f3mUwG8jGpBmc5XnNJUYPt52YX2lV197AyDjtEyOj8jiIAxpnOE9lG
	WleH3Yxdv/IYj2w+fhaZb4A2KYHiIoFU533ZGa40+Fb9ok3T53Kwu6CE=
X-Google-Smtp-Source: AGHT+IEkpAXbelBYNiNfFnkpHEB6ifJHBBm+0bcYaodsXXDWNxR6vsR0lYnq/RXP9fpjwhgeli1pP0wFzU8K/NmNYuzZrBR8DtDI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17ce:b0:3d3:d1a8:8e82 with SMTP id
 e9e14a558f8ab-3d5e09f9df3mr122550875ab.9.1743480283299; Mon, 31 Mar 2025
 21:04:43 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:04:43 -0700
In-Reply-To: <674b6dae.050a0220.253251.00e3.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb65db.050a0220.3a8a08.0007.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+652199d534e8c0a1c0ac@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
