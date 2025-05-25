Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764804CE08
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 02:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748138585; cv=none; b=hEsKPU2HvXOlrHXoXeYhV0rRsZHfA3aMPDGONTQjS6twR3/Vpkp41ES6dDuZ+0RQdOCdwMfnLVjFD5eYsiTLNA7+IG1hgG96RZSKueozn/3ZSWWnDyJNNxMsRdCM+zPejLzvaop+psh+tcu2D35BrZaFa88x+7eVjNq1yUdbQ2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748138585; c=relaxed/simple;
	bh=mIwIq9csUCbYIa5JwR59zeSsHmN9250kQ9AODSs2xFU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=P/kiZ0n78OIpX8phRyTENLQ3kOLzbpnhOw8uRRawbeO74yl4AUe4ypazNZcD8/EJ7Bbz28CSwFgt7SopdwYGRl6aC8/IpOFirQnp5k6IsjqS68FgtFvjiyMZNabBtvTaewOKD4YkG47CV1fJP7AWzKq4plKaKYi3iiwAw2DL2i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85e310ba2f9so114932439f.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 19:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748138582; x=1748743382;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xqwBE7NrD1Kufa5s4oZy50TlLnntMQm9pBp/V84mvy8=;
        b=jH7LHUrsEyfYDp7RIRmRrytyCal0VDLYg7HbMgh7jcbzjuHgErJhcnLo0IJgKX+7SM
         s2v3P+DjumZnuPEiqEkMc0lbj+uVO7vaWh0eXrhl28gPDbPaMZRCIL8CgbP92aeSqEL1
         JUaHr3SiHaVRxuAT4O19tYgQEVQ9NQ0G0qkm0AaAws9H3uL41xiLwPx+mWV7GVpq/urM
         tfkkSMwK26xw3tFbkoaVHGHU6GRLb5i3OsMSpxZj5hB3TbPDlQsuajiHA7sv0Tph0W9t
         srEdiMyUqXkbXkkj2p2mYcqMlaRBVtKTykkRCsU1+DkPu+Z0JIXHsTm9x0qkIdh5g4aI
         ilmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg47ozeAh9/PDhahZ04x/aTOPfka9ZAh5V+/B9P24xL1MZ0CssRMgfbO0Fac8Uj54UsXeIl4T178vmeCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiAZTUGX3lydMwlaXAtoRtNGEzrWSENlDKR8+UGvQYVflUC6Ib
	jA0/mdr5ft5kiNY3x1DwTCPVcxDWXKOJJYduDYx7iuNR5qGl/PWQfi8/T8DYjfTOBX31EfuBGJn
	9F8+VLeWnvuSSOrbNbDw3qjiMAgvlAWtgXmgS78xod7oInfU1y+ROwUUmhek=
X-Google-Smtp-Source: AGHT+IGwwU+ncHev+YJC1P/NAvgpkbXzBLDQ67Y3hqwwBYDABZVgs+9V3HnLzuT63uQqOG5/uSEeL1aNAGafwsyOB4bKptXcShHT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4c85:b0:864:627a:3d85 with SMTP id
 ca18e2360f4ac-86cbb889a02mr386102239f.11.1748138582604; Sat, 24 May 2025
 19:03:02 -0700 (PDT)
Date: Sat, 24 May 2025 19:03:02 -0700
In-Reply-To: <6831b67f.a70a0220.253bc2.006f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68327a56.a70a0220.29d4a0.07fc.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Write in binder_remove_device
From: syzbot <syzbot+4af454407ec393de51d6@syzkaller.appspotmail.com>
To: aliceryhl@google.com, arve@android.com, brauner@kernel.org, 
	cmllamas@google.com, dualli@google.com, gregkh@linuxfoundation.org, 
	joel@joelfernandes.org, joelagnelf@nvidia.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, maco@android.com, stable@vger.kernel.org, 
	surenb@google.com, syzkaller-bugs@googlegroups.com, tkjos@android.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 12d909cac1e1c4147cc3417fee804ee12fc6b984
Author: Li Li <dualli@google.com>
Date:   Wed Dec 18 21:29:34 2024 +0000

    binderfs: add new binder devices to binder_devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=107228e8580000
start commit:   176e917e010c Add linux-next specific files for 20250523
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=127228e8580000
console output: https://syzkaller.appspot.com/x/log.txt?x=147228e8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e7902c752bef748
dashboard link: https://syzkaller.appspot.com/bug?extid=4af454407ec393de51d6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=108b55f4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1145e5f4580000

Reported-by: syzbot+4af454407ec393de51d6@syzkaller.appspotmail.com
Fixes: 12d909cac1e1 ("binderfs: add new binder devices to binder_devices")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
