Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2FF269D0A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107665; cv=none; b=c36WnFbOcHbWcirLq467XK7+SD0O4A+Ehj+m5/pWN5FVsKRNogHIvkiHXkRsYKPd87fKShEJ3yU0j4bHesFA5cVDvY9170hBpbZGUPU4/z/OwNsoLddYhNud5sctwWMQ4H/zyP3cg9y17W/7QkYOCpOEHeFThiAPHRqsTYBGZ3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107665; c=relaxed/simple;
	bh=6FkK+YVzsMBW9RkRmI6Rn5ZJmcDNgFYU7g+QxQmgfcI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hzvlszLQzYqAoh636f0RmbssOfK+Gx+uGVhvHZVfJtIcQ1birCEt4EPopl6AcE9Z9Jk4/LyFfGlG41W7xty27C9EoxQeoGcU3DfUt0hGow1BQyiZvmT/U4l76wVnknnH5+k+5kOz9b+5tp/hBDdFgJOHypSPMSj/20Bh3f/C/vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d43541a706so53612535ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 03:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107662; x=1744712462;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q65NMRwklu4Gg3M1RkU6U6i/X1ktlPqElkxLT6HbIrY=;
        b=oD7/xSc4KAlGJLLOLkDM4iEX1oCNa8Pnu7gRhX36AqlFkmm+TE7bMGQWHnLkOzr5pJ
         EpTVYzMRVXM9QUHxbfxA7NCr8R08EOlI569tdS6F8J4b1VDHyphaVEEzCJ+cDD72Ss7B
         shvYsye1Gtq64X45wPQBfC/KICsqPxzonxjOq+QoL2HWObVGK0DlR5w898vjfKcBc1M0
         Ayxam4EMk5GYahp/Ai6gN30tRbuy9ddKqJvvKTlMyWFdHHo25E/DbfT60E94awBvA4Gs
         meBvHT+PkmNM55A0q9u8TvyxRNGTAJHxbPcptGQZJLTXAvlhO3s6YODOwWkX7a2fhygd
         9A1g==
X-Forwarded-Encrypted: i=1; AJvYcCUlq1/kLKdRbDE91OUgtoyK2sHeQlw05MVy5WfTOhQZC65tfmELCvdJV/CRw2r4KJr5m9qu6B71iFGDMpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4sN1NODfQAKLMtaODX/HYeeIQdI5QmoAwVceMAEv9+rFaRxlX
	L6XFdz5KipbGjOXRGBe25uGG/H0asSWzM9NlOmx22ChuOGSFcSmHHq23Fgg0cB4uRnViNOqLcSr
	fThZKDRtPCWT4G+BKuMQ8FoPzAZ7UfW360IUf25X6R6cO1/jmlpT0/f8=
X-Google-Smtp-Source: AGHT+IHxZcubI+jQ+FURFG9su4Qr2QFqm4SZ2ZNjrGO5WQ1exgC+lcHYdJCgjb6Dxx3lMax8x1QVTcVouQ8CKIGuRdWBkrdugLjH
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:160d:b0:3d3:dd32:73d5 with SMTP id
 e9e14a558f8ab-3d6e52f63c8mr165088285ab.4.1744107662646; Tue, 08 Apr 2025
 03:21:02 -0700 (PDT)
Date: Tue, 08 Apr 2025 03:21:02 -0700
In-Reply-To: <9cef1559-43a6-4968-9b86-1077a833c7a3@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f4f88e.050a0220.396535.055e.GAE@google.com>
Subject: Re: [syzbot] [f2fs?] kernel BUG in dec_valid_block_count
From: syzbot <syzbot+8b376a77b2f364097fbe@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         ba0c5f18 f2fs: fix to do sanity check on sbi->total_va..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
console output: https://syzkaller.appspot.com/x/log.txt?x=17616d78580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=66996a2350ef05e0
dashboard link: https://syzkaller.appspot.com/bug?extid=8b376a77b2f364097fbe
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
