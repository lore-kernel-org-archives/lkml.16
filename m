Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C162DCC1A
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 20:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748116864; cv=none; b=nSYlQ0XNrMBB1w6xUl0AdT1sdv4FNnPUu8L+st3c4pJz93D7yZrDoyCe10rytKfmdu1H1Y/af0OjHGVI/Rm8LDSIJoyk65zvMQvWkBY2NX96Jga4i2/zUfON2Kqd5ZYjdwSx79LdqvqMwTRTwV7otPGsKpK2cg4NC7TuLscUgtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748116864; c=relaxed/simple;
	bh=WpkEbdefTf88Zfflfd1A4zmISqE2tdGJEjFwMzXcUUk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CR+2W8wkCd0HXx7xbOcEB7gsocj6B16TRf7Xiv45Vm7I5FaAaaLh+5wp8y9PgxlMOvMKms9AM2YjTZDg0V88Oebdpxq6U3i0SO3C7FBIKROipjCXuFjG/OPU14TXP/dhqd0Ze9x8fTzzdkdPKi2Lseyv6LIfVWExp0UYztLmjjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b5e46a526so81952739f.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 13:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748116862; x=1748721662;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWHpknBTvhEqzClw1olgFVybxg3QOCdv9i4kYfUVySo=;
        b=fFUznh1DFoXOIW+9LX91WaAvu90gJMXlGhDwkilAid0eakDLp1BzpzZ1tjhtNhD4h/
         /uluao4rxgEJ7AkVxCR9XRQX+wWWw9Rr50YdQ0TFzM6XgFtqh552xMdYdqPap49CnPXa
         VJSHO9zc6EpE50vhtVaD0mA5CkjMzrkxDXFysQT7tPu9Sj5JQblDPURrmeYXkRGvrZNx
         1KtSyBRG566WMrlXfXBcWWF+gQZvdsjb7KwGwCmmzxpEldgz1M2Pbem1eWhR/m5yjPuY
         //LZfUDdV5Jx/GEdrZezfepqsAxU27wVRjsfMxxKDzjpPoo9AzKCvbLyXeBoDj0Gc2r7
         l4yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgkV7E1bQkKame6+FHYePlZSg5TBi/44+UBzknSGpjgtvOmEnMAYDAePmxkeXBe1vrRa5ZwEUuhn48a34=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvyAE/IHqiG0+Qr96Lp0qII63uczTTDg/llF0Orj3sE0nHU+Ps
	kwXiq5wJqiSoGyrEPjgYWWFa64cc2k4kXhFToAriD8+ZlSMagxll2ptCuwltd1NikeSavIt6bDD
	2V8yerb+eA2Y3cwVaw9P5Ob1KzS25AcQMef9HmBhIO8OGCikBvspHt/97BVo=
X-Google-Smtp-Source: AGHT+IHon7o/p/rlon33R45s6/GSuqDH8upCxBPbCn/a5hKySQVq6f1BgW+kU7Rj2Rv0pDjQ2cntIB01zk7/T71mncPOMj3dxBRC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3684:b0:85e:a8db:fa10 with SMTP id
 ca18e2360f4ac-86cbb7b82bcmr364089839f.1.1748116862140; Sat, 24 May 2025
 13:01:02 -0700 (PDT)
Date: Sat, 24 May 2025 13:01:02 -0700
In-Reply-To: <aDIEqaNaLBChOlg9@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6832257e.a70a0220.253bc2.0075.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Write in binder_remove_device
From: syzbot <syzbot+4af454407ec393de51d6@syzkaller.appspotmail.com>
To: arve@android.com, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, joelagnelf@nvidia.com, 
	linux-kernel@vger.kernel.org, maco@android.com, surenb@google.com, 
	syzkaller-bugs@googlegroups.com, tkjos@android.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+4af454407ec393de51d6@syzkaller.appspotmail.com
Tested-by: syzbot+4af454407ec393de51d6@syzkaller.appspotmail.com

Tested on:

commit:         176e917e Add linux-next specific files for 20250523
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12bed5f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e7902c752bef748
dashboard link: https://syzkaller.appspot.com/bug?extid=4af454407ec393de51d6
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=120c6170580000

Note: testing is done by a robot and is best-effort only.
