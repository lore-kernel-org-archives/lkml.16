Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A963281368
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 19:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751396646; cv=none; b=Z2ldAm4oKYqmUw0Wo6M5W6kJbGlqtBeiJJhhcytPHR9ZPufHhAMAcKKrbkXBf4+FjSzHSMYsqVP4bZD2s9EbdNo+Z2/4g5xccbzZerOQsLu/Alopzlr9Hgkk9Aa7iXmKPUH8Zx889PRhXdeZmj1rEwNQF+8MZFXXLu4fsdYWQRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751396646; c=relaxed/simple;
	bh=rq0nFLEoksYFkbKxdMSNVS3LLzVb66WKcnzPiXikWG0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=T+14jXY1lSDf2/s6HjBbN0mBTotNqBIa5iPkvzsfLIOxUhaQItaXkwcPlNaT3upPIuCGQKBhhSefxjvIgiIOQvp8DohlnFXlocOFEVjy9g9c+yakmSTSPZI7FYkFKBN4aa55sZ0lMw2QNt5AJfF87y7/Oq8ZL72omObTejSMwdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86d0aa2dc99so316818839f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 12:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751396643; x=1752001443;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V58wKqjwG04wvrAuA/3vleHNIlbmyRoEPp810m6Trxo=;
        b=qxyFi4Rfx/qkhmgb6m9spBo+SY76+YcHTQUm0ETftKJGPxPZkzgN0Go8Obaa0Q4uTG
         NFSIa2Rc3XLNqE8iMSLBsa8aIgfuwqZA4QO52HxUe0wP4Dk8iUc9huLrYEA7722ZK+sc
         kxOlpyaBLPDxcEFJtORVLmHl/+c1p5m1CLQONiyx1KCaTlT7Gf+rGeRsrljalUWjVlfb
         WCxfCHF9OV+iZ8iCoyYEz2x/HiDolOBnYaOE5seAQFTVCj24iGG8b2IvhGRI/5PbJRIw
         yyIhDxLu4omUty8DoN2Q1IqkM8w76FP3A2UfdqoQMm/+uH6C2BGq1DGLlV3VI7jwMKcp
         Atsg==
X-Gm-Message-State: AOJu0YyCXf1Vf0hk8Ogy5sBmRvBIzxLzEyMobyk9aUMgTuEYZo6a32nn
	nWSK5J4Gs4ZBqHxtBmVh/xDDk+1ksJ5uKR7/x+eg2kPAPWwt47xxbKxUK+7zhY/8ClHVlkF0+ee
	sVhkBLf/bYdxO+9emYMmSZjeVMVxCMGCBjIsft2ekql85oZVhbBMvqVA7C1I=
X-Google-Smtp-Source: AGHT+IGLJncz8x7YCjPHxKOeKYSKt9fsZw5Z2w2qKPGczYYgwfLqZ0pI/Mdu5xZ2BORIbb8MN/f/w9d9pe1Ha6chezx1uUBWCdJb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a6b:ee16:0:b0:86a:1fce:f1a6 with SMTP id
 ca18e2360f4ac-876c6a24a1cmr31142739f.5.1751396643486; Tue, 01 Jul 2025
 12:04:03 -0700 (PDT)
Date: Tue, 01 Jul 2025 12:04:03 -0700
In-Reply-To: <CAF3JpA5AaoPXnQ81PYoEP89kGbKype5Fcew8JWSds4xbz40s+g@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68643123.a70a0220.3b7e22.1f43.GAE@google.com>
Subject: Re: [syzbot] [wireless?] WARNING in _ieee80211_sta_cur_vht_bw
From: syzbot <syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, moonhee.lee.ca@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com
Tested-by: syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com

Tested on:

commit:         3f804361 Add linux-next specific files for 20250701
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=178c388c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=46111759e155f4cc
dashboard link: https://syzkaller.appspot.com/bug?extid=ededba317ddeca8b3f08
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=108af88c580000

Note: testing is done by a robot and is best-effort only.
