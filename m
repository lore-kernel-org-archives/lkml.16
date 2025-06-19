Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720121624FE
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750318743; cv=none; b=DQyim+1Depm+M6EcKnRi4KhmK0GmCwJUeU9m3MOnfSlpbDm+RxWNVvBO3QzCfdVwJcpv4aQZQ/668JrzjJkZBY4fzPYVaIqMRKDzJA5+sQF4affhZazPokrE34qEgmWqzTT4YlPZG9/906/dE26or0uk/E/gi7QfyspBVBADfu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750318743; c=relaxed/simple;
	bh=FKiSxKv70Q4dtIHdsuAdUnzQpk0Q/xEK9haAd4vIm0A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UcnyIV08EhCNbTPolyOBpc83QBGPl7omie4vTwgf7AKFdnkDONloRM2dWS+Te/lyi0HBBovRz+KRmKo837y8mTSIAFyEf3OsBrt4ltWl7RnU3kVzmDN+RXjR1qWySXg1D3ZtLsL4OwxmVqLxMNJIdySsbzNtd3M4pOdohWq21Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddd01c6f9bso4433295ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750318741; x=1750923541;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BoywI6fad+UVYwQzigA8U4NPSpM9opi3UN9DnJ3Gtdw=;
        b=ritbKpnhQ4FvJpEua7sr87xo1i6eJZqJUTOQnfPLyDWogcJtojyo4wg2sJD7M8Ly3T
         ymgqy8kfCFsMtq3c82wtCfFh+u0IQm1qzUG1TzINMvcjpgAx5I9dNH0zi+P7ugNeMtfr
         luy2sGYYepsnK3swUvDxPIGiA4Zm/XMT2a0QNIJ2geCJP9B8uMSsrL0Gi734HFn8Dp/D
         CiJBL4wE8OfZc1oBRQ3O12QigFWgrPI1Yg7oB55TUGl3sWH7JDkVinMZNsHiMyvlisL4
         UK80Eyzrq64wOsnyvU9h47Alx6hSCeqpHzxz9axXkMwFAGkumvI2afG3fENHh+w5eQHd
         FOMA==
X-Forwarded-Encrypted: i=1; AJvYcCV+QKITuY3nkOAJmNHr9qZzR+9lsRC+pR6iQFkWTyNjhoPwX4Tm/OlNP/m+ChV2ldHAgJ7tmjVdqoDxBRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNdOG8mk2sXecpHc/PlImfazZR3E9gDcTFKRHQQrZEJxdr4ke6
	+RJr5+X1Cff37ffW48UyyMrcZK7km1V2ss7bblie+VSxlTP1l3IqLT1r566Nx6XWkdbfa5rYIhS
	X6erFvMzAYZxxBpqSikCjruLSEhmWFowjVBB0fswkgwAOG+CA4DIdGyAhmoE=
X-Google-Smtp-Source: AGHT+IHxMeSM8M5NKFe+Uo0VWXGHu220rg54eLMKBIKb73HZ3K3BDbtV+9vil+Oxv7FUnNWjZHOLcNrP1x4Kb9sraNGdBypqOFy1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a6a:b0:3dd:c9e4:d46a with SMTP id
 e9e14a558f8ab-3de302428afmr24134705ab.7.1750318741672; Thu, 19 Jun 2025
 00:39:01 -0700 (PDT)
Date: Thu, 19 Jun 2025 00:39:01 -0700
In-Reply-To: <CAGR7w81YL6PYSYDtHWjbrxLTSEtvYNx9nc74AJ9nU0Nu24dOrg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6853be95.050a0220.216029.01c1.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] KMSAN: uninit-value in __bch2_alloc_v4_to_text
From: syzbot <syzbot+8eb51728519f6659ef7b@syzkaller.appspotmail.com>
To: abhinav.ogl@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

fs/bcachefs/btree_key_cache.c:141:13: error: invalid argument type 'void *' to unary expression


Tested on:

commit:         fb4d33ab Merge tag '6.16-rc2-ksmbd-server-fixes' of gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=db26f33438d76de9
dashboard link: https://syzkaller.appspot.com/bug?extid=8eb51728519f6659ef7b
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17f7e370580000

