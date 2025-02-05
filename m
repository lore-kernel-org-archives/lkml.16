Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DE8151988
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755068; cv=none; b=D04f+KFgf+ooZww2H8ZzJ8B8n3Ro3nzk63gRDTOdnPVzSY9+fYWOgtOJGv5uxf6PuR6gT2b6H7DFIP971tXbW/+IwyGsSPts6dwIIWSVPDtmhfolR6PhAvjq3TSiJmnrrwHRLUP6jHSK0OxQ099UNEbF8kQYvrmAgTaBCwbpt6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755068; c=relaxed/simple;
	bh=p9pTfNA91gQ8F24o7f+Xi8usFygXQvHP7QU7uUUdy2I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ax4wiN3iHGQLc5FmYnR0YYAbeOgGWmvQgyL43urZrv+iO0LAGUSI6xtDcNPpLJyjrYYZYFH5SfVesKYsdOJBdaxcE42o/bwjQMip/gfFSzTw69urggr/rJI64sMbl125W1PEpTcWmpPEURGgdQZMV046NkzWqLXFb24GEpsclxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ce843b51c3so129377215ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 03:31:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738755065; x=1739359865;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uM1wHvZ0CSI8x/B7c6PYIzX+1M4pMcTrH+iiZ+5/lVo=;
        b=G3ODyimU4WmZOVvWzDzRJtkZ3vYZpG2X8Fg/VlHXXlOjTzORhRwFYLqtParpqdgXNS
         2izHuFBltk+mE4sD1nQmppnGM551hTIBHk6rqsXQx/KG/X2RzuuBRaGwOi4Vp87KHMKS
         njtu53NneU3A5JZ+kFZjFKA+3ufYEGrWeb2caEuqvWf0gjBZDMfgoB8Drc1ZSgLZsDyO
         mPCX9zBaHsO7sKvTyvg5JODfOAGmdQd9wJDQaNtQLJumh6rN8CIcmvF9drKT6ewnbXEO
         9sKUtEoQvaLYnNeSOP835q8Skf4Tvtcdp3LUQstv1FNhkMHtFRUZOKsDLtUE+5Xw7g2v
         oAyA==
X-Forwarded-Encrypted: i=1; AJvYcCXBltys17qsQ2RwrWV2phs2aiFlFrOQVzH6Nw8Wtu3YGtC0YSkUgZww2QwzjdkJ1qww2jst//kgQiOg8qA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoursIO/TXsN0sOmIn0y+0HvN4VUAm4MOlkzAKm7bcm1H/xHtT
	p/cCULlZyznuBi4wgY2akeidvqP+R9+3jhM1jvCZufKXgSWxZZ4bwVQVhZ7OkwOOP/lepke8Xii
	TFuB+d/90M/+EL5C9TBTaLkyM6/dfyXDnzcIApUpyf58f81LdbxDLKC4=
X-Google-Smtp-Source: AGHT+IHNQvq62cwbIR4uNZoTWWC7erfAEIB877G+i6Cnc4j3fw48y2JvPErUbO7pyYLGszO9BW0XdMJaKksGtcD33fVKxytjJVi9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1b0c:b0:3cf:bb3e:884c with SMTP id
 e9e14a558f8ab-3d04f6e46cemr22684915ab.16.1738755065703; Wed, 05 Feb 2025
 03:31:05 -0800 (PST)
Date: Wed, 05 Feb 2025 03:31:05 -0800
In-Reply-To: <20250205110528.1938-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a34bf9.050a0220.50516.003f.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in
 skb_queue_purge_reason (2)
From: syzbot <syzbot+683f8cb11b94b1824c77@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+683f8cb11b94b1824c77@syzkaller.appspotmail.com
Tested-by: syzbot+683f8cb11b94b1824c77@syzkaller.appspotmail.com

Tested on:

commit:         ed88b8b8 Add linux-next specific files for 20250205
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=150a3eb0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2d80d4f62382148d
dashboard link: https://syzkaller.appspot.com/bug?extid=683f8cb11b94b1824c77
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1680e318580000

Note: testing is done by a robot and is best-effort only.
