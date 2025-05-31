Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86722286A9
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 23:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748734925; cv=none; b=GBmY7cr9rqlaqfECKO1uJrial0x4iAjsObQ+rbd2MkhN+w1h31llyoCMVnj121kF/lCPLPw1GzLVhMMHITi9gw0h+ga9LUfI/dOKdthLOLJQYjNgkSFsXgwwAthAKq3kxng7ikq0sN2HiCdv1lo8QMRNpQN+wmOHbBA86Mx71V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748734925; c=relaxed/simple;
	bh=XA5ccVvBU42B3XXffnEKJx5bp4upK1dgbXChsasQ4Pc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=itI0Y7SNQ0KvTISH8iiTDMRuVbXs7N6pqP8uPekO+6Rszm6lx+BYm6aadCIIuJAfKveZQBL7JlkuJzTbFMaD7MXfcZIRVaNdqiaTvbL+C9+KCGxATEwt6ADTr4iGj6rFCfXFgLNKEhj6AHcqtcxeCoanMW/yTwja4Udoqe6ak5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3dc6a403d77so76698365ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 16:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748734922; x=1749339722;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R503OpfKpfF+sLpKYVoRo68saoo9i5snzFIhDjGqVYw=;
        b=Q1ARd9e/b7RT4b5vZM+GUODPgCGHfAkJbaMoLfpyrVeCOP29zgSOQkNKtLWreAeuVE
         ISlW3IF/TaQ5eoH+nI+GSbzneEhW0Fl0ReB7EbO7BNaAjDRscxSylvPSDGXFhIBtODEz
         iAXJ/NqekUti56rPe2fKJDs2XXOgBNA1fSbASGOJ+AGAjKD04/VvXpRm97TIPblJB6Tw
         hEJj4VrnnMHIDq6wkB2+Suj/fRQo0DUCCndnHc/S0ajzldaXnO3KyfnYw023bJXSpGTt
         ZPIu1ALHRFvYxmWB+g97hUis1DpHpGYVMx9FFUh9IBX2yz5vTExRbL0xXn6s0Tu77D85
         SAdg==
X-Forwarded-Encrypted: i=1; AJvYcCUg4URkxnvcvBhTLVvAErCfOKh9cwqAtkUcKAx1puy/d8/cMxgc01CpgsJtOgWkbhKUthkG5oGVARUYUmk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2+HVC+zIl+oJcmc5yuL5O3ZHVpq0D+kYB1oeBBlqBiKvxkzrP
	WTFdCI1iWq4QpTNnlgBty9eddC0b9O/RPrQMOGKyH2O/G8GM4YzwzBc1cPiEvtAvTcGbqeMrTIr
	8nl/vaUlnReCMUoVzhEuK3Kd2bwNc550vgyMXKUSFOwsOpGMpLW1ew5PxTok=
X-Google-Smtp-Source: AGHT+IFmLXZzFgKwwCPS0gCpwjjC1hi6jYBuXR3UWmswAC7/4dYfpL5MoZuy040fv90JM9mQxAJayQgx7YZ6bm87tvkgZj6X0WNo
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:194b:b0:3dc:787f:2bc8 with SMTP id
 e9e14a558f8ab-3dda3363f25mr31810095ab.12.1748734922581; Sat, 31 May 2025
 16:42:02 -0700 (PDT)
Date: Sat, 31 May 2025 16:42:02 -0700
In-Reply-To: <20250531232348.2486-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683b93ca.a00a0220.d8eae.0021.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] possible deadlock in start_poll_synchronize_rcu_expedited
From: syzbot <syzbot+cbc79a37b5fa23efd23b@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

lib/rhashtable.c:1085:6: error: call to undeclared function 'object_is_on_stack'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]


Tested on:

commit:         4cb6c8af selftests/filesystems: Fix build of anon_inod..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=22765942f2e2ebcf
dashboard link: https://syzkaller.appspot.com/bug?extid=cbc79a37b5fa23efd23b
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15e9d00c580000

