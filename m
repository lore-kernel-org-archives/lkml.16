Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C11D1DA62E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744301406; cv=none; b=GQK5Nwa0fRTt0BoUth6tFEjPm6BD2OVvW52n3Ec+69n/XzkU/3YlgSMlAizYsovmY2X1NJzQd3ZRpXECWmke0vzhLGWfwHiTQomGphI4jLGcJLT/fu5ukLgwBGGARH55vt3Bnn5DW9U5Q3+ang7FnvJzcHvHlvsAXWNwJTkpWmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744301406; c=relaxed/simple;
	bh=uLCUDYBiKGmNNahQ8ulWRPQAlAHtkv26eGrpFarofys=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XV93WiT38p0mCAnjvZWRRAL4JyT4AbvTItK8koM7eT0IDQrVWKRuFOVpfCsvU1qR+9ZuB6s60gdeZlj9XXMJiVxVy0MUL3ieaIWB2gtaqUAfAfclLGekhNK1vLo96URkU1HEXFNx31Ww6476CKqtMUyA6FViYak2RC7D35vgERY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d4578fbaf4so20766895ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744301403; x=1744906203;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYNaIvH1kPvnW+M8OBqXOeFieDfcqbCw9nZalfSL0ro=;
        b=vI73CqG3uvsaqyFWYodElCzTPz2BV3Clr+TQTVLhKOjgVsBODIN8LultvVVuVPrQ8m
         0bdCmbIBr04hg/BNxD5BiGWUVAPdbixI2FChyTx28cF92lwO5EbWrg231E4vy41MhzEj
         3ul9WORVF+vlsgUlwhz7wVWNErUH5q8qKi9ZnKcvJTbkETA4X6MDsZXqQfVrJsA2Wo4h
         f2HBjNAfRD+u4GxB6zZjo3RAkV58qOVLYyXO3DJLZEUQvEVgl9zezMYGd02wjQY7S0bI
         3aCkoMUY5pi2Wt2HqLm8fnIVjfvx870g0aHicn4cUAHWBBFqaJjB6UhhOABXqVof22DG
         wHfA==
X-Forwarded-Encrypted: i=1; AJvYcCVPxU5rPTkMsdSgZDYXbeAevBMrL7KkFTUwQfUE+OuQ3kfjZ4BxoLwLkK5kWxQmx1EsBpHs5xxD48WCkEo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm/EXDqsjT/LH+HxXgFgw2Zp+s84vNTdo78RPCqiU3fO6sDzSF
	Gg75gkLL5E3F6Qx4/ZJcaRcTvz2ScycL74qYPRPSGlrZFKIoHgaptNWvIVFT/yK0pwBU+ye3vup
	ut76Td/hu+gzgj3Pp+He48bbD39E0mYSFu3cwYnEGfCGvtVv8u8EfYck=
X-Google-Smtp-Source: AGHT+IGxPINkI9sv+/7WMAqe4TkBJydLJlvsPCmCOtDcmdkoNbAAzmlrLUfhGBZJIdTaW1ZiCdXy/nGHmdGLZPfustLZQVWAXQ9L
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1908:b0:3d1:92fc:fb45 with SMTP id
 e9e14a558f8ab-3d7e5f4f5d3mr26036345ab.5.1744301403717; Thu, 10 Apr 2025
 09:10:03 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:10:03 -0700
In-Reply-To: <674083af.050a0220.3c9d61.0190.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f7ed5b.050a0220.355867.0006.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] kernel BUG in qlist_free_all
From: syzbot <syzbot+86b24455266617775c21@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, luto@kernel.org, mingo@redhat.com, 
	mmpgouride@gmail.com, peterz@infradead.org, syzkaller-bugs@googlegroups.com, 
	tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 3a04334d6282d08fbdd6201e374db17d31927ba3
Author: Alan Huang <mmpgouride@gmail.com>
Date:   Fri Mar 7 16:58:27 2025 +0000

    bcachefs: Fix b->written overflow

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=102a9d78580000
start commit:   69b8923f5003 Merge tag 'for-linus-6.14-ofs4' of git://git...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=57ab43c279fa614d
dashboard link: https://syzkaller.appspot.com/bug?extid=86b24455266617775c21
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14034b24580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: bcachefs: Fix b->written overflow

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
