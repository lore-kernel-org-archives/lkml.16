Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225BBBE67
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178465; cv=none; b=WCO1awVhg6H3C2KYsZ0XN2WfC+onFNf6SOxtYjls3ftT743d+TMYp05D/O6s1SJSHG4gzxAkKu+nE9jdqmjuNH1keceVGRZXFCy9tfLDvXVKUeNiZrSDbajG2DKL3BM8Hu1SAeW25U+BloGcHzpD1DN0sVnqGj7UmHckokajzq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178465; c=relaxed/simple;
	bh=KPJuyt4hHNJacebK0u8Uit9ckC70GsBwF3P+EluZkec=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QP+xziCeS9Z8ogdmwPmP3OQA7yyJj089zQJvO2XyDCcVvNXK/rRr2R+y+UUCF/uwyQeCIio11Ict9oFNh/JDsagKocBTAoVG2SCtg3VN+hah290KXZEhAkLuFENB3ZN6w6lahc4Dl7ellOB6ceE5cmpp5iEKKv27OqROk9pFuiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d5b3819ff9so58482855ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178463; x=1744783263;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UomhH8jkjwd6KMAzcJD0bsNYtrYgbNerm5BaPYkuM+k=;
        b=oeI1uoEjzAYbU/igzkdx+5HjMfVjadScGY44/HJVhXbj/oVm8M2pchDBoObFVRlL7u
         8f6upq/qlNPkfacmHlRiZxTRAGMO4FwP4BqT2TYRof/xM7snZNDZzN3aJNj2+93E3wrT
         lspWTOIghW219CHRcKURQmL2BzdOIn8TKu0iGV1HWA5CcYoRS0l1X1ErMcThoo0fRcvn
         NcOa+mZvcpFUelkuKBw7lwVCaDOs+xQEVTRQYFCjGepKP3Xvdjv0b+VC+0zJK5eo7h0h
         8S11jYzm8kGWkynKo34AT09i2T0xpws0x7VlURrOqKzeJI6yJSz79YZdI3vbqAyeBwRe
         NOIA==
X-Forwarded-Encrypted: i=1; AJvYcCUAYjpA3g054AyXO41+f53bAUMNvlD8fHLuou8Bpth6tfZKJgDJ29uoAQdCJM1FM3tZSvXHlf5YlUM9cEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSreEdSrTyzFrrbs3n6Wu7Q/pPmHTuCSzc3ZxOTwE/ykfruB6D
	bS0uCsHNGQZATBKk7rp57uYcmq5oqctn4ysFrpKKbZUlw6uaIlP0dfronNPW5AR0WdnbV/blpyA
	beCtLdZ36tLzq/Jdojkpx2GDyskSbK4YgJWqt/5xTxhTlntNKkSXMxwE=
X-Google-Smtp-Source: AGHT+IFN7kmJZpDBSZ8hz5zUsQ3Eu9zuYovYK1w3fHzeJoTPXHdOF4zdQIUEu/N7M9h72CPizMoHIXLxlPdbxQi54iiZ3nA1Fw0L
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f05:b0:3d2:b0f1:f5bd with SMTP id
 e9e14a558f8ab-3d7b45fcefamr12706055ab.3.1744178463234; Tue, 08 Apr 2025
 23:01:03 -0700 (PDT)
Date: Tue, 08 Apr 2025 23:01:03 -0700
In-Reply-To: <tencent_89E9E2EC86CF4C78866CA42CAD6E6095B00A@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f60d1f.050a0220.258fea.0011.GAE@google.com>
Subject: Re: [syzbot] [wireless?] general protection fault in cfg80211_mlme_deauth
From: syzbot <syzbot+00778a9a557a2a5e1a33@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         a2458824 Merge tag 'linux_kselftest-kunit-6.15-rc2' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14fa5070580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eecd7902e39d7933
dashboard link: https://syzkaller.appspot.com/bug?extid=00778a9a557a2a5e1a33
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=132f323f980000

