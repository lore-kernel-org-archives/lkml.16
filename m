Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244A728E3F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743778865; cv=none; b=MB1UcW6oKxS10cpwfU1HA5yc3jhNz9rLYdGm9xz+hd3Tn1dozRQglT9HQpgKJmzfGJh1f3UmL66x6TYouK5BtYUBXPrs3mDN+wZQnGymmc7US5LU4FrXcsuaoSgD9UK/738SG8qfH6GHA7xWSt6g5ompG9mspGotCd+sMgc8Ccc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743778865; c=relaxed/simple;
	bh=AYko1VWOfBVHv9E1RRyYX2hPQcGc735qlsJ419fVcMg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bzN0NKJGKzBLXMiQoYfj/4dwnDoaBaIgzdimb4deMdoxTfBxaeTS9r9cfefD7OOK1yDu+f0DVHeHR0J2EnUR+KxJ0EQ87NLAVI1bIIHkgPx8a7qsGGmQ7ck1X5UjbKh0y/u8+uVFYu/jKK8D4YpTsPdBp0b5+ndW1Gvr+CS8t+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d585d76b79so20715105ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 08:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743778863; x=1744383663;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/l5DxVvZzV/XmdJEnN3NdjGY2wFy/vsojLyqFJVpr58=;
        b=rEQ0O/e1Zv0uxrmHa7grIK+4PYuDgzlyqTRz14wk9xT5+jWJX/tPLiZAWBbDpLHp8b
         b5eJDA8RRQW5/f4QZxVBXlU3dHbs1yd2Bp4Aj4PWdTMYGfy26JCqGWH1EDbWu0NAoRi1
         5sOOVyK8GMj9W+fk5kgv43hvYXbn/da25iaQtmj6zozvwwiaYi0HVBgBHMQrQSrcX6E9
         lgDePoSUp8wZDPcsNv472ZmMht7y1YzVhSwR2Ev1eCSJMAT4QqB1Xa/i8BJNXFjLJeQA
         +h6k3fEvzffY7rixLJ+WOakx4KOC+pOAwHo08EWjF48Bzx81xCCkoQtTrnJljiPIZkbR
         C3Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXDunSQ/uvcF15+TaIqPXqdiSZBYWhdg8xmYmGYmMblosMxSNOkyPVp5mwngzYE8nGeeT9DBBaYW2GvMAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/hVmC1KK/wOPkm05KQJPh0pXGcZQdYCGS24HdbY2pUCVRpVr2
	BJ3uugknmmsoMkvpWn+QW/rnBbyo0VMCVDXjx0TR8nqJwu+BYtN1FYIcCmTpzw5D2ReVzBloOpW
	/i/m63q1VSShpXa/hTMkFFyYFKoUVaiSyTpKhZvkUU9/bCmND1RCJtl8=
X-Google-Smtp-Source: AGHT+IG6eW3ypD/dyFDHuVvisZ3SglKvgxqH17m5/3K5JlVsbmlRsCifJq5LIVx1t3MJHQszTfOAcu1rYMYYpd09FqGjs10n4FyV
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c243:0:b0:3d0:235b:4810 with SMTP id
 e9e14a558f8ab-3d6e3ee191dmr43590305ab.2.1743778863169; Fri, 04 Apr 2025
 08:01:03 -0700 (PDT)
Date: Fri, 04 Apr 2025 08:01:03 -0700
In-Reply-To: <Z-_jtFYt0t0-6A7z@fedora>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eff42f.050a0220.2dd465.0214.GAE@google.com>
Subject: Re: [syzbot] [block?] possible deadlock in blk_mq_freeze_queue_nomemsave
From: syzbot <syzbot+9dd7dbb1a4b915dee638@syzkaller.appspotmail.com>
To: axboe@kernel.dk, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ming.lei@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         665c7e64 loop: replace freezing queue with quiesce & f..
git tree:       https://github.com/ming1/linux.git syzbot-test
console output: https://syzkaller.appspot.com/x/log.txt?x=12321178580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=adffebefc9feb9d6
dashboard link: https://syzkaller.appspot.com/bug?extid=9dd7dbb1a4b915dee638
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
