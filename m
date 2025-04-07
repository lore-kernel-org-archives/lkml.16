Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216FE1E1DE6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035964; cv=none; b=e0UANh8gL8gkX9sALjcl3jBu/xtY3CzVDFYk1XsCCmO2zgvYufZbU3qysgwld39Hv1yytGeoUYG459YIUJi6pwnEDxAYE4IEWFcWe3hFGyr3ruB1SxaLEBmH0vP1JoA1fkT9oiYclHrlyP2c9+D0FjdbL+6pJ/Q+QUklKjUeR3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035964; c=relaxed/simple;
	bh=KV9W6AUrHJdqHLgUBuRoozIFZ9XmFBTpBvPPo4dCfx4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bBH+6YOzDoc6h1DT/yN50sAgBEs1/RblPlRZu0GWhE2AnmbOb1NL/0pIfYYir4bzd3twwwZ8DO7qfyhTJgi85gRuTFA1NbOTk1pqFP6Mpzgjid4mZxVZtljXliZjvZUF/McXvJVAeZfpQjPExUKhchULnwG8oIP4qLvIRvyVzsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d6e10f4b85so77518225ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 07:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744035962; x=1744640762;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UjUxYvY1YiyC6OoVQvcfUdICOWiC2nlpSbYx2k4dA5E=;
        b=NhBjGapDKDGSQT9XM/GIaI+s/bBKZQJCGffkz1LK7UBUzA2r8D+LoSd46mABH2Ghea
         Nvfxf/wpY3YcoWuVAiwW6ASpIhLCR/Nr6TjLfv62vWhWZSgokvlARBXi8Px8dcAhcmiw
         OCOljVVI5xZ1YAyTwuxmRQp32Hw5Ql2z8QRD4N/neQUAN31KmZuLuclA962oUerd6eER
         vYVng1Q/gfZd/lw/BJEff1UNX9YdRI5BBCSZjCvIOjDvS312IvO4O670+YuHRMjOGcsy
         kfG5cwtwzU6QfVYXeUv/rw5/ravPU/u4aK44JP0pGcATXLke8cNCO6BbHr7V2p/PxbBd
         Ij8A==
X-Forwarded-Encrypted: i=1; AJvYcCXkc00PpqO4Bg+CVIAoX/jt8dO7N7NGA7O30DuGe/3k84kKDohh2VqQeFFZJp2oqey+ZYxB0rQ+8cNs3ME=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpIcYATMS4vB7SQl+k0RHVv3jE9maQca9Vyu8UvvydJ4YEXwHZ
	s5KONgkrvgY00cbWWKClCGIjxvd/59zmpPaBhU0p+yxt9n1GZJjcBwJajIyU+jeD9a1p1y92zpJ
	8RuJE+5H1JRJD6u97/YjiizXIKE5CsTGdk3BtJsNkFPgS74oZc/o5eJI=
X-Google-Smtp-Source: AGHT+IES1QhFs+V/b6s7CUZ53WUmbrsnVac05k1xT+P7gkYs8jsVm0O6hIaL80/furuc5pXCxzZmBCavcYC6KBxWmpBPEquUvWTB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3e91:b0:3d5:8103:1a77 with SMTP id
 e9e14a558f8ab-3d6e3eea919mr161227325ab.1.1744035962257; Mon, 07 Apr 2025
 07:26:02 -0700 (PDT)
Date: Mon, 07 Apr 2025 07:26:02 -0700
In-Reply-To: <20250407140603.91155-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f3e07a.050a0220.396535.0550.GAE@google.com>
Subject: Re: [syzbot] [ppp?] KMSAN: uninit-value in ppp_sync_send (2)
From: syzbot <syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com>
To: andrew@lunn.ch, contact@arnaud-lcm.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo https://github.com/ArnaudLcm/linux/bounds-checking-txmung: failed to run ["git" "fetch" "--force" "98936a0cc8cd68334b039c881b39b10e6f0d7c99" "bounds-checking-txmung"]: exit status 128
fatal: couldn't find remote ref bounds-checking-txmung



Tested on:

commit:         [unknown 
git tree:       https://github.com/ArnaudLcm/linux bounds-checking-txmung
kernel config:  https://syzkaller.appspot.com/x/.config?x=f20bce78db15972a
dashboard link: https://syzkaller.appspot.com/bug?extid=29fc8991b0ecb186cf40
compiler:       

Note: no patches were applied.
