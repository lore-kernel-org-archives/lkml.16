Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD76E2D3230
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532305; cv=none; b=YBxIeTJM9MxW1LjgicPgs5a0ZPcTEVkLmHOj4hPaYa+BslsWH4KmFckFuVeaMClpn6PQ7FY4FRrpmmmPajNYzhWoLXzuWxbp7iqLKO8+32Cb5lxQZlb1tG/Xqqwaz9aDGWhqLIY4OAaG3DLSGtzvwhX7/5aF25hGIjk+1mZgpAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532305; c=relaxed/simple;
	bh=4PvOEaUDwvYdGrVFxFpPPGDi6dkeWygSwisN9Hkvqkc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=K07/fdh6xLlPIzg+kevzUjaM4l3HmzH8DWoTD+McJfG17/zRXUqbW3LvERvFsCJpHfn8YuJORfZpZO1m8OUveGf/gTY1JKwPcpMIvxmZ6Yn08vpuT4/yB3ykO+/lx6hLhFpUnGyqvwQFUh/KOoGBofUI17LsmPU3jtzv95vbVrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86f4e2434b6so543503839f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532303; x=1752137103;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U5LxmBhyI+wUuhge9i0Ba6Uwpj0RSi8NQ6MTlP3efYY=;
        b=D+tmEcRhA6I2xokRYE3ISPMvGrhmrpmUxcwq3y3r2OWRaLL/yB3Dur12oyERPq3+NU
         Z0q9RbezzNrOs+kJmYUTA6oVuw8BRA2hPX97aaaJGtz+MlcKcWdRCIms/9H/D/m8f1qY
         Dx5siBEOU7MohL5Tuj3l+cCWhN6ApzUza0I1zwE8yZBv8fKRfmIRWZMt8DnkuKfvl4Bi
         wZdpr6ais6kQ+5FlCcdn948Bv7lu6eyFDCkqEkT+CayZQ48Id7LQAISYnNSWVMsS9W35
         9jHM7shxx2wNZCo7hQV5br6GvHUyuGeNothwWncla/XkMxcccds3KtupvbMS47pFKog6
         U+Ow==
X-Forwarded-Encrypted: i=1; AJvYcCX9uUjc974y9aljFiR+AVHGwONBiMYVOhFxT9AWmZtYJ/nHxQNccQWE2pzZgJvpeM5EgDqhG+Y8LckmBVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzqvNGX8hvjFzzzF/ildCbzH07IK1iXmBsEHhl0xDnMhsE2hwJ
	XKBeEI0/U4Njh26ptyM47JNjjlrS5WYL7tkt7/w8T2uKHg9XcWHi/OMDJtvd3AqF5xKMRU59Kcm
	RVGdmY7mw8dsMwYhEQIbfka6N7LbHNxLWJoNVhUb3vdxwJAniiMWEgWwoIcc=
X-Google-Smtp-Source: AGHT+IEyYK0/q6EBottRiZ2Upogl2AcP3r1xBRIsuNz5gsdUD1lMsR9VR6bsu+8T6eotfxhA0Twh1R/A+Xpj3Q+EpJGw8CvjaHp7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:14cd:b0:876:8cb1:a010 with SMTP id
 ca18e2360f4ac-876d1e58868mr387970039f.7.1751532302887; Thu, 03 Jul 2025
 01:45:02 -0700 (PDT)
Date: Thu, 03 Jul 2025 01:45:02 -0700
In-Reply-To: <20250703010227.2223-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6866430e.a70a0220.5d25f.0860.GAE@google.com>
Subject: Re: [syzbot] [kernel?] general protection fault in __cpa_flush_tlb
From: syzbot <syzbot+169412e85b1803dfda81@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+169412e85b1803dfda81@syzkaller.appspotmail.com
Tested-by: syzbot+169412e85b1803dfda81@syzkaller.appspotmail.com

Tested on:

commit:         50c8770a Add linux-next specific files for 20250702
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=130ff982580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d70792332338192a
dashboard link: https://syzkaller.appspot.com/bug?extid=169412e85b1803dfda81
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15d73770580000

Note: testing is done by a robot and is best-effort only.
