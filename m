Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073114AEE0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480178; cv=none; b=UjTdSswl3GAKKL0Qsm/GFtn84t9la14mbCEPesA9bHzA5estg21Zm13esMD8YkTUFfEqbgm2MlnW7fb8jP6T8lI4BhaioepNpkFMSGli/zsYLUvGZd/Qya4MN2QW7wqDR+uiv3sIl7R//s4+WN6RwJ7w4hlDm2r0JA45IEmieMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480178; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=opnyMU7scof7Qdsagd3qAAED/MEnGhkE59yjiSdTqnA0Sb8tGOwjQo15+rXzGVP2H2sUglm7Aw3vNL0V4w1ksmskU992CEnR0x39V57lss+iTJLRQaFaR2SKgOlGOBsh0Z6Wr188pufVRVZ4OPCcOW165jByJ06zmUObvOAzF1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d5da4fd944so63939445ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480176; x=1744084976;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=dhRQBfla7yq5Pvjz4QsoUSWzj7WK/p7kqzU6YIZrt4E4exTcaYbhxlj1FmJ1Lqz598
         lcYrCaxJzo/96LQ9AzsBmNYA0dZIRoCwZVGDGMYKo9aEY3gXsLT73g2LWS2MjiFWmvpq
         T0mk0yslOjDO7XRsdzwysEMaxLAslrhz679bTKspvoj87IxdSSfecFVtytu30x1T/vUS
         mLRkciVwOmZlfzlErGzwh/3ZwtmKamONLgxAwKH7Wwvm+Q5flum0eos+RMuDvGqGdOn+
         9ymzEEfQtE5Dbjz4f1fbu1Yu8E0/2h3zZMrd/B/iQylTUAuySsbM2sbhntbYG9noeiVA
         5Ggw==
X-Gm-Message-State: AOJu0Yxj0fnQHAHk4riplmE50NHxw1XcLBRpMZar6C0F30W5SyCGkJNu
	9t/4Un+pWYMjtxdB1eAw3NrpC1tNALRz9Dam4wx1eH6Cu+Y8fNrzEU5c7Elzv7VLdX64dyAWbxc
	omDMeJ6gshZy8oc4CnK041PbBV272pxrJnwnVnZfhEIV3m4ktZ7AnumA=
X-Google-Smtp-Source: AGHT+IEY9P3J1Mt8DTN4U8cxR8eRTG4gfM8B9C0IBalLWLKyTUQ9LKLgPBMnOIbaFcfCG5j49JmVXTk4lyr6sQ8BKpZzSk+JMgn8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3304:b0:3d3:dfc2:912f with SMTP id
 e9e14a558f8ab-3d5e0908ffemr117104715ab.7.1743480176238; Mon, 31 Mar 2025
 21:02:56 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:02:56 -0700
In-Reply-To: <676ac84f.050a0220.226966.005a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb6570.050a0220.297a31.0000.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+ed0bdc5b29ea2e281a83@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
