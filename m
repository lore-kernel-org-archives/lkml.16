Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC0984A3E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745858104; cv=none; b=djprp+eBX8r/T2aIS6WPMG65Dy9RVO+cirXrrJ+RRpey4JcCcx2f5GiSUuRfMKc/sNBahDXN0wu5uL9+YlLJJDsUkGcJZjNZ+IHCP0HBLRxLSjwHeMm57sy2uVEqzmG6suivNZH92h39DhZ1ygICbehr7oGNNOAJjjS3vg85bFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745858104; c=relaxed/simple;
	bh=yiIgGpFMHrWrqY91W1jx/2lbWpDB9chySq79yjUzOfw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=serqm1OMAnyjLpI5XE8DlzRHudNHlow6J+tTMhpyQ8KYJ8ucOgDGPlOInwDkdxhil85SqsBRz0Drnfc9ubxpCeJ40v7367jA0BYSHo3ZdAOC8MJ6Jgt0BY5ISX+XhNnWBUarnJRKLYjF903CjatCXQPVH/+A7yp2lpEY+PjqAzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d5da4fb5e0so47782955ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858102; x=1746462902;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d/r0GpshaiTfkf3Jzhs7+blVX9kV/2/sBukHf0VpE9M=;
        b=oYQzWQoFbmzwsENxybu1SVGxIKOGCAuWnObLnbP9Vkjy8MiyiMJPF/RKuCaSM7dqlR
         8XipOcY3HwYqvLJJ4GxldsIztb+sZHvKOQZVzTTGRWljaFHv1YfwEMPD+hpEf74Elvbi
         5flNrZzjVbMkU9PCH5Jlsuiwk02Y8QQpNZLkQygNp1T6e1/70azBgB3DOaV9akyNqTSE
         b/fhuvrMOY8sH406B3w8Umuxdcds7WqhpZQNeVtrEn9vhtLBlcnpbkBF+3H3VaP4DB8B
         h+b79kSsSbaRi15DRUExsv/2JlFpCKtugd382iebYtQzfvB32zzfvOdjUgKJcKCfoWQT
         pOzg==
X-Forwarded-Encrypted: i=1; AJvYcCUdpixnFJqGgAwkbB0lAaRkNAlRGnESMz2sK6ddJ4kpH0u4DcfXeFo04dtxGJj8dqG0mndnzTsiX8IqFnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdNfP2rXCqYvY0jYWakarda8nMwpDc9SdrSQlqiEanAFK/6uEE
	bL7hjSsQm24a02dtoAd27647l3C1rOPQnCaOILWh7A4gIU3P5Z/hxE821lx4yYgJ7DGQxlvcaiu
	RBY5QnxnEkox9w9/d/CXFxGHRYhdoXMqz7hfDvg60ShPJK5nkDceCnFk=
X-Google-Smtp-Source: AGHT+IEgs1qYfXWS2ROxH3BfjLzrfX+CmIh0fNFRmiQySnncSit5H10zcDnfsSDAyjMguuYw+sYMK8bOyi6cK0c5LgqfxiKU/X9+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1689:b0:85b:538e:1fad with SMTP id
 ca18e2360f4ac-86467b1071amr1053843739f.6.1745858102043; Mon, 28 Apr 2025
 09:35:02 -0700 (PDT)
Date: Mon, 28 Apr 2025 09:35:02 -0700
In-Reply-To: <20250428160903.20110-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680fae36.a70a0220.23e4d2.0032.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] kernel BUG in __bch2_str_hash_check_key
From: syzbot <syzbot+843981bb836d699c07d1@syzkaller.appspotmail.com>
To: contact@arnaud-lcm.com, kent.overstreet@linux.dev, 
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+843981bb836d699c07d1@syzkaller.appspotmail.com
Tested-by: syzbot+843981bb836d699c07d1@syzkaller.appspotmail.com

Tested on:

commit:         b4432656 Linux 6.15-rc4
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=150dd270580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a33ce5560507649
dashboard link: https://syzkaller.appspot.com/bug?extid=843981bb836d699c07d1
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11d7e368580000

Note: testing is done by a robot and is best-effort only.
